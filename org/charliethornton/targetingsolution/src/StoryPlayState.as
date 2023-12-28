package  
{
	/**
	 * ...
	 * @author Charlie Thornton
	 */
	public class StoryPlayState extends PlayState
	{
		private var _wave:Wave;
				
		override public function create(): void
		{
			super.create();
			
			_wave = new Wave();
			_wave.add(0, 2);
			_wave.add(2, 10);
			_wave.add(3, 10);
			_wave.add(4, 10);
			_wave.add(5, 10);
		}
		
		override public function update(): void
		{
			super.update();
			
			if (_wave.isExhausted())
			{
				FlxG.switchState(new EndWave());
			}
			else
			{
				_wave.update(this);
			}
		}
	}

}