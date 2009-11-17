package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import myLables;
	import com.example.programmingas3.simpleclock.*;
	
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
			addChild(myLables.getALable("SimpleClock 例子", 14, 11, 511.9, 25.9, "center", true, 18, 0xee00ee));
			addChild(myLables.getALable("ActionScript 3.0例子: 日期与时间的任务", 14, 38, 511.9, 18.5, "center", false, 12,0x0));
			var sc:SimpleClock = new SimpleClock()
			sc.x = 165;
			sc.y = 100;
			addChild(sc);
			sc.initClock();
		}
		
	}
	
}