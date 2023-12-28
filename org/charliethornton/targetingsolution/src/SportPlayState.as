package  
{
	import org.flixel.*;
	
	public class SportPlayState extends PlayState
	{
		private var _tNext:Number;
		private var _dtNext:Number;
		
		override public function create(): void
		{
			super.create();
			
			_tNext = 1.0;
			_dtNext = 5.0;
		}
		
		override public function update(): void
		{
			super.update();
			
			_tNext -= FlxG.elapsed;
			if (_tNext <= 0.0)
			{
				var n:int = 1 + (Math.round(Math.random() as int));
				for (var i:uint; i < n; ++i)
				{
					super.addRock();
				}
				
				_tNext = _dtNext;
				_dtNext = (_dtNext < 1)? 0.98 * _dtNext : 0.95 * _dtNext;
				trace(_dtNext);
			}
		}
	}

}