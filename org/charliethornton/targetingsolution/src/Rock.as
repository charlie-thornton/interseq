package  
{
	import org.flixel.*;
	import org.flixel.system.FlxSound;
	
	public class Rock extends FlxSprite
	{
		public static var DIM_BIG:FlxPoint = new FlxPoint(69, 75);
		
		[Embed (source = "../assets/asteroid_big.png")] private static var BigRock:Class;
		[Embed (source = "../assets/asteroid_med.png")] private static var MedRock:Class;
		[Embed (source = "../assets/asteroid_small_5x25.png")] private static var SmallRocksSheet:Class;
		
		[Embed(source = '../assets/rock-break.mp3')] private static const SFX_ROCKBREAK:Class;
		private static var SND_ROCKBREAK:FlxSound;
		
		private var _targetingImg:FlxText;
		private var _targetingSoln:String;
		
		private var _overlays:FlxGroup;
		private var _pts:uint;
		
		public function Rock(size:uint, x:Number, y:Number, targetingSoln:String, pts:uint) 
		{
			super(x, y);
			angle = Math.random() * 360;
			health = 2*pts;
			_pts = pts;
			
			switch (size)
			{
				case 1:
					loadGraphic(SmallRocksSheet, true);
					var ix:int = Math.round(Math.random() * 5) as int;
					addAnimation("play", [ix], 0, false);
					play("play");
					break;
				case 2: loadGraphic(MedRock); break;
				case 3: loadGraphic(BigRock); break;
			}
			
			var rot:Number = Math.random() * 75 + 10;
			angularVelocity = (Math.random() < 0.5)? -rot : rot;
			
			var textWid:int = 100;
			_targetingSoln = targetingSoln;
			_targetingImg = new FlxText(x + (width / 2) -(textWid / 2), y - 12, 100, _targetingSoln)
			_targetingImg.alignment = "center";
			_targetingImg.velocity = velocity;
			_targetingImg.size = 12;
			
			_overlays = new FlxGroup();
			_overlays.add(_targetingImg);
			
			if (SND_ROCKBREAK == null)
			{
				SND_ROCKBREAK = new FlxSound();
				SND_ROCKBREAK.loadEmbedded(SFX_ROCKBREAK, false);
			}
		}
		
		override public function kill(): void
		{
			SND_ROCKBREAK.play();
			super.kill();
		}
		
		public function getPoints(): uint
		{
			return _pts;
		}
		
		public function getOverlays(): FlxGroup
		{
			return _overlays;
		}
		
		public function setVel(x:Number, y:Number): Rock
		{
			velocity.x = x;
			velocity.y = y;
			return this;
		}
		
		public function isTargetingCode(code:String):Boolean
		{
			return code == _targetingSoln;
		}
	}

}