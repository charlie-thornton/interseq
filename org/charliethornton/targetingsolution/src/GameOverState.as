package  
{
	import org.flixel.*;
	public class GameOverState extends FlxState
	{
		override public function create(): void
		{
			super.create();
			
			addCenteredText(100, 32, "GAME OVER");
			addCenteredText(250, 24, "Destroyed: " + FlxG.scores[1]);
			addCenteredText(300, 24, "Invalid Codes: " + FlxG.scores[2]);
			addCenteredText(350, 24, "Final Score: " + FlxG.score);
			
			var playBtn:FlxButton = new FlxButton(0, 400, gotoPlay, "Play Again");
			playBtn.x = (FlxG.width / 2) - (playBtn.width / 2);
			
			add(playBtn);
			
			Main.kongregate.stats.submit("HighScore",FlxG.score);
		}
		
		public function gotoPlay(): void
		{
			FlxG.switchState(new SportPlayState());
		}
		
		private function addCenteredText(y:int, sz:int, str:String):void
		{
			var txt:FlxText = new FlxText(0, y, FlxG.width, str);
			txt.alignment = "center";
			txt.size = sz;
			add(txt);
		}
	}

}