package  
{
	import org.flixel.*;
	
	public class ClickToPlay extends FlxState
	{
		[Embed (source = "../assets/space_img2-intro.jpg")] public static var BgImage:Class;
		
		override public function create(): void
		{
			add(new FlxSprite(0, 0, BgImage));
			
			var playBtn:FlxButton = new FlxButton(400, 300, gotoPlay, "Play");
			
			add(playBtn);
		}
		
		public function gotoPlay(): void
		{
			FlxG.switchState(new SportPlayState());
		}
	}

}