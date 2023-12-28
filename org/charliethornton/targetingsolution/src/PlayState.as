package  
{
	import org.flixel.*;
	import flash.events.*;
	import org.flixel.system.FlxSound;
	
	public class PlayState extends FlxState
	{
		[Embed (source = "../assets/space_img2.jpg")] public static var BgImage:Class;
		
		[Embed(source = '../assets/doop.mp3')] private const SFX_Doop:Class;
		
		[Embed(source = '../assets/explode_14at36x33.png')] private const ANIM_EXPLODE:Class;
		private var _explosions:FlxGroup;
		
		private var _solnLab:FlxText;
		private var _solnFld:FlxText;
		
		private var _typedIx:uint;
		private var _typed:Array;
		
		private var _rocks:FlxGroup;
		private var _rockOverlays:FlxGroup;
		
		private var _turrets:Array;
		private var _bullets:FlxGroup;
		
		private var _scoreTxt:FlxText;
		private var _gameOver:Boolean;
		
		override public function create(): void
		{
			FlxG.score = 0; 	// score
			FlxG.scores[1] = 0; // asteroids destroyed
			FlxG.scores[2] = 0; // mistypes
			
			var yLow:uint = FlxG.height - 20;
			
			var bgImg:FlxSprite = new FlxSprite(0, 0, BgImage);
			
			_solnLab = new FlxText(200, yLow, 200, ">");
			_solnLab.size = 16;
			
			_solnFld = new FlxText(220, yLow, FlxG.width, "");
			_solnFld.size = 16;
			_solnFld.color = 0xFF00FF00;
			
			_typedIx = 0;
			_typed = new Array();
			
			_rocks = new FlxGroup();
			_rockOverlays = new FlxGroup();
			
			_turrets = new Array();
			_turrets.push(new Turret(640 * 0.2, 480));
			_turrets.push(new Turret(640 * 0.8, 480));
			
			_bullets = new FlxGroup();
			for each (var turret:Turret in _turrets)
			{
				_bullets.add(turret.getBullets());
			}
			
			_explosions = new FlxGroup(40);
			for (var i:uint = 0; i < 40; ++i)
			{
				var explode:FlxSprite = new FlxSprite( -100, -100);
				explode.loadGraphic(ANIM_EXPLODE, true, false, 36, 33);
				explode.addAnimation("explode", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0], 30, false);
				_explosions.add(explode);
			}
			
			_scoreTxt = new FlxText(0, 10, FlxG.width, "0");
			_scoreTxt.alignment = "center";
			_scoreTxt.size = 24;
			
			add(bgImg);
			
			add(_rocks);
			add(_rockOverlays);
			
			add(_bullets);
			add(_explosions);
			
			add(new FlxSprite(0, yLow).makeGraphic(FlxG.width, 20, 0xFF000000));
			
			add(_solnLab);
			add(_solnFld);
			add(_scoreTxt);
			
			Main.keyBuffer.splice(0); // delete all elements
			
			_gameOver = false;
		}
		
		public function addRock(): void
		{
			var x_top:int = Math.random() * (FlxG.width - Rock.DIM_BIG.x);
			var x_bot:int = Math.random() * (FlxG.width - Rock.DIM_BIG.x);
			var y:int = -30;
			
			var howHard:uint = Math.round(Math.random() * 6 + 1) as uint;
			var rockType:uint;
			var wordLen:uint;
			switch (howHard)
			{
				case 1: rockType = 1; wordLen = 3; break;
				case 2: rockType = 1; wordLen = 4; break;
				case 3: rockType = 2; wordLen = 4; break;
				case 4: rockType = 2; wordLen = 5; break;
				case 5: rockType = 3; wordLen = 5; break;
				case 6: rockType = 3; wordLen = 6; break;
				case 7: rockType = 3; wordLen = 7; break;
				default:
						rockType = 3; wordLen = 7; break;
			}
			
			var targetId:String = Words.getRandomWord(wordLen).toUpperCase();
			var rock:Rock = new Rock(rockType, x_top, -30, targetId, howHard);
			rock.velocity.y = 50;
			
			_rocks.add(rock);
			_rockOverlays.add(rock.getOverlays());
			
		}
		
		public function aquireTarget(targetId:String): Boolean
		{
			for each (var rock:Rock in _rocks.members)
			{
				if (rock == null) { continue; }
				if (rock.isTargetingCode(targetId))
				{
					for each (var turret:Turret in _turrets)
					{
						turret.setTarget(rock);
					}
					return true;
				}
			}
			return false;
		}
		
		override public function update(): void
		{	
			if (_gameOver) { return; }
			
			while (0 < Main.keyBuffer.length)
			{
				var keyCode:int = Main.keyBuffer.pop();
				var isEnter:Boolean = (keyCode == 13);
				var isBackspace:Boolean = (keyCode == 8);
				var isSpace:Boolean = (keyCode == 32);
				var isValidKey:Boolean = (48 <= keyCode && keyCode <= 122);
				if (isEnter)
				{
					var locked:Boolean = aquireTarget(_solnFld.text);
					if (!locked)
					{
						FlxG.play(SFX_Doop);
						++FlxG.scores[2];
					}
					_solnFld.text = "";
				}
				else if (isBackspace)
				{
					_solnFld.text = _solnFld.text.substring(0, _solnFld.text.length - 1);
				}
				else if (isValidKey || isSpace)
				{
					_solnFld.text += String.fromCharCode(keyCode);
				}
			}
			
			FlxG.overlap(_bullets, _rocks, null, bulletHit);
			
			for each (var turret:Turret in _turrets)
			{
				turret.update();
			}
			
			for each (var rock:Rock in _rocks.members)
			{
				if (rock == null) { continue; }
				if (FlxG.height < rock.y)
				{
					_gameOver = true;
					FlxG.shake(0.05, 1);
					FlxG.fade(0xFFffffff, 0.5, gotoGameOver);
				}
			}
			
			_scoreTxt.text = "" + FlxG.score;
			
			super.update();
		}
		
		private function gotoGameOver(): void
		{
			FlxG.switchState(new GameOverState());
		}
		
		private function bulletHit(bullet:FlxSprite, rock:Rock): void
		{
			--rock.health;
			if (rock.health <= 0)
			{
				rock.kill();
				_rocks.remove(rock);
				_rockOverlays.remove(rock.getOverlays());
				
				if (!_gameOver)
				{
					FlxG.score += rock.getPoints();
					++FlxG.scores[1];
				}
			}
			
			var explode:FlxSprite = _explosions.getRandom() as FlxSprite;
			if (explode != null)
			{
				explode.x = bullet.x;
				explode.y = bullet.y;
				explode.velocity.x = bullet.velocity.x / 10;
				explode.velocity.y = bullet.velocity.y / 10;
				explode.play("explode");
			}
			bullet.kill();
			
			trace("hit");
		}
	}

}