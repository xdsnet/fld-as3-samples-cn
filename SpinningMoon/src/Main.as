package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.example.programmingas3.moon.MoonSphere;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;


	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var moon:MoonSphere = new MoonSphere();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			moon.addEventListener(Event.COMPLETE, showMoon);

		}
		private function showMoon(event:Event):void
		{
			addChild(moon);
		}		
		
	}
	
}