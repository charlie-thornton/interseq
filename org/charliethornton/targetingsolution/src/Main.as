package 
{
	import flash.display.LoaderInfo;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.net.URLRequest;
	import flash.system.Security;
	import org.flixel.*;
	import flash.events.*;
	import flash.ui.Mouse;
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	//[Frame(factoryClass="Preloader")] 
	
	public class Main extends FlxGame 
	{
		public static var keyBuffer:Array = [];
		public static var kongregate:*;
		
		public function Main():void 
		{	
			super(640, 480, ClickToPlay, 1, 60, 30);
			Mouse.show();
		
			// LOAD THE KONGREGATE API
			var paramObj:Object = LoaderInfo(root.loaderInfo).parameters;
 
			var apiPath:String = paramObj.kongregate_api_path || 
								 "http://www.kongregate.com/flash/API_AS3_Local.swf";
			
			Security.allowDomain(apiPath);
			
			var request:URLRequest = new URLRequest(apiPath);
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			loader.load(request);
			this.addChild(loader);
			// END: LOAD THE KONGREGATE API
			
			useSoundHotKeys = false;
		}
		
		private function onLoadComplete(event:Event): void
		{
			kongregate = event.target.content;
			kongregate.services.connect();
		}
		
		override protected function onKeyDown(event:KeyboardEvent):void
		{
			super.onKeyDown(event);
			keyBuffer.push(event.keyCode);
		}
		
		override protected function onKeyUp(event:KeyboardEvent):void
		{
			super.onKeyUp(event);
			Mouse.show();
		}
		
		override protected function onFocus(E:Event = null):void
		{
			super.onFocus(E);
			Mouse.show();
		}
		
	}
	
}