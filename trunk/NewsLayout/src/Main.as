package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import com.example.programmingas3.newslayout.StoryLayout;
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
			var fmt:TextFormat = new TextFormat();
			fmt.size = 18;
			fmt.align = "center";
			fmt.bold = true;
			var topal:TextField = new TextField();
			topal.text = "新的布局例子";
			topal.x = 135;
			topal.y = 18;
			topal.width = 511.9;
			topal.height = 25.9;
			topal.setTextFormat(fmt);
			addChild(topal);
			
			fmt.size = 12;
			fmt.bold = false;
			var topal1:TextField = new TextField();
			topal1.text = "ActionScript 3.0: 关于文本的工作";
			topal1.x = 135;
			topal1.y = 45;
			topal1.width = 511.9;
			topal1.height = 18.5;
			topal1.setTextFormat(fmt);
			addChild(topal1);
			
			var story:StoryLayout = new StoryLayout(720, 550, 3, 10);
			story.x = 20;
			story.y = 80;
			addChild(story);

			}
		
	}
	
}