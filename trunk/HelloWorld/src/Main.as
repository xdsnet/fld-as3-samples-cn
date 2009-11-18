package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import Greeter;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var mainText:TextField = new TextField();
			mainText.x = 23;
			mainText.y = 11.3;
			mainText.width = 300.1;
			mainText.height = 99;
			var myGreeter:Greeter  = new Greeter();
			mainText.text = myGreeter.sayHello();
			addChild(mainText);
		}
		
	}
	
}