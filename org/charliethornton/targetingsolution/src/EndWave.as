package  
{
	import org.flixel.*;
	
	public class EndWave extends FlxState
	{
		
		override public function create(): void
		{
			var text:FlxText = new FlxText(0, 100, FlxG.width, "WAVE COMPLETE");
			text.size = 20;
			text.alignment = "center";
			
			add(text);
		}
		
	}

}