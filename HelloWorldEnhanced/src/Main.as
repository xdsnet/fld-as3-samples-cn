package 
{
	import fl.controls.TextInput;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		var mainText:TextField;
		var textIn:TextInput;
		var myGreeter:Greeter;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var aLable:TextField = new TextField();
			aLable.x = 32;
			aLable.y = 127.3;
			aLable.width = 53;
			aLable.height = 17.4;
			aLable.text = "用户名：";
			
			mainText = new TextField();
			mainText.x = 23;
			mainText.y = 11.3;
			mainText.width = 300.1;
			mainText.height = 99;
			
			textIn = new TextInput();
			textIn.x = 90;
			textIn.y = 127;
			textIn.width = 233;
			textIn.height = 21;
			
			
			myGreeter = new Greeter();
			mainText.text = myGreeter.sayHello("");

			mainText.border = true;
			
			//textIn.border = true;
			
			addChild(aLable);
			addChild(textIn);
			addChild(mainText);

			textIn.addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
			
		}
		function keyPressed(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.ENTER)
			{
				mainText.text = myGreeter.sayHello(textIn.text);
			}
		}
		
	}
	
}