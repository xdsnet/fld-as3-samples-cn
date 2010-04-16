package 
{
	import flash.text.TextField;
	import fl.controls.TextArea;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.example.programmingas3.rssViewer.RSSParser;
	import mylables;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var rssTitle:TextField;
		private var rssText:TextArea;
		private var rssParser:RSSParser
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			initshowAll();
			rssParser= new RSSParser();
			rssParser.addEventListener("dataWritten", myOK);
			
		}
		private function myOK(e:Event):void
		{
			rssTitle.text = "来源feed: " + rssParser.rssTitle;
			rssText.htmlText = rssParser.rssOutput;
		}
		private function initshowAll():void
		{
			addChild(mylables.TopLable());
			addChild(mylables.TopLable2());
			rssTitle = mylables.bcLable();
			addChild(rssTitle);
			rssText = new TextArea();
			rssText.x = 125.3;
			rssText.y = 95.3;
			rssText.width = 285;
			rssText.height = 286.6;
			addChild(rssText);
		}
		
	}
	
}