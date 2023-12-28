package  
{
	import org.flixel.*;
	public class Wave 
	{
		/*
		private var _i:uint;
		private var _dt:Number;
		private var _ships:Array;
		private var _timeToNext:Array;
		
		public function Wave() 
		{
			_i = 0;
			_dt = 0.0;
			_ships = new Array();
			_timeToNext = new Array();
		}
		
		public function add(ships:uint, timeToNext:Number): void
		{
			_ships.push(ships);
			_timeToNext.push(timeToNext);
		}
		
		public function isExhausted(): Boolean
		{
			return _ships.length <= (_i + 1);
		}
		
		private function startWave(ps:PlayState, i:uint): void
		{
			_dt = 0.0;
			_i = i;
			for (var i:uint = 0; i < _ships[_i]; ++i) { ps.addShip(); }
		}
		
		public function update(ps:PlayState): void
		{
			_dt += FlxG.elapsed;
			
			if (_timeToNext[_i] <= _dt && !isExhausted())
			{
				startWave(ps, _i + 1);
			}
		}
		*/
	}

}