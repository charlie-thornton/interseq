package  
{
	import org.flixel.*;
	import org.flixel.system.FlxSound;
	
	public class Turret
	{
		private static var N:uint = 20;
		private static var COOLDOWN:Number = 0.15;
		private static var VEL_BULLET:Number = 1000;
		
		[Embed(source = '../assets/blast.png')] private const IMG_BLAST:Class;
		[Embed(source = '../assets/shoot_0-15s.mp3')] private const SFX_SHOOT:Class;
		
		private var _origin:FlxPoint;
		private var _bullets:FlxGroup;
		
		private var _target:FlxSprite;
		private var _cooldown:Number;
		private var _tmpPoint:FlxPoint;
		
		private var _sfxShoot:FlxSound;
		
		public function Turret(x:Number, y:Number) 
		{
			_origin = new FlxPoint(x, y);
			
			_bullets = new FlxGroup(N);
			for (var i:uint = 0; i < N; ++i)
			{
				var bullet:FlxSprite = new FlxSprite( -100, -100, IMG_BLAST);
				bullet.exists = false;
				_bullets.add(bullet);
			}
			
			_cooldown = 0.0;
			_target = null;
			
			_tmpPoint = new FlxPoint();
			
			_sfxShoot = new FlxSound();
			_sfxShoot.loadEmbedded(SFX_SHOOT, true);
		}
		
		public function getBullets(): FlxGroup
		{
			return _bullets;
		}
		
		public function setTarget(target:FlxSprite): void
		{
			_target = target;
			
		}
		
		public function update(): void
		{
			// reclaim any stray bullets
			for each (var b:FlxSprite in _bullets.members)
			{
				if (b.exists && !b.onScreen()) { b.kill(); }
			}
			
			// if we have a target, lets see if we can fire
			_cooldown -= FlxG.elapsed;
			if (_target != null && _target.alive && _cooldown <= 0.0)
			{
				FlxG.play(SFX_SHOOT, 0.8, false);
				var bullet:FlxSprite = _bullets.getFirstAvail(FlxSprite) as FlxSprite;
				if (bullet != null)
				{
					bullet.exists = true;
					bullet.x = _origin.x - (bullet.width / 2);
					bullet.y = _origin.y - (bullet.width / 2);
					
					var aimDeg:Number = getAimAngleDeg(bullet, _target);
					var aimRad:Number = aimDeg * (Math.PI / 180.0);
					bullet.angle = aimDeg + 90;
					bullet.velocity.x = Math.cos(aimRad) * VEL_BULLET;
					bullet.velocity.y = Math.sin(aimRad) * VEL_BULLET;
					
					_cooldown = COOLDOWN;
				}
			}
		}
		
		private function getAimAngleDeg(bulletStart:FlxSprite, target:FlxSprite):Number
		{	
			var aimPt:FlxPoint = target.getMidpoint(_tmpPoint);
			var x:Number = aimPt.x - bulletStart.x + (bulletStart.width / 2);
			var y:Number = aimPt.y - bulletStart.y;
			
			if (x == 0.0 || y === 0.0) { return 0.0; }
			else
			{
				return Math.atan2(y, x) * (180.0 / Math.PI);
			}
			
		}
	}

}