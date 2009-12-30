package 
{
	import fl.containers.UILoader;
	import fl.controls.DataGrid;
	import fl.controls.List;
	import fl.controls.TextArea;
	import flash.display.Sprite;
	import flash.events.Event;
	import myLables;
	import SoundPlayer;
	
	import com.example.programmingas3.podcastplayer.RSSItem;
	import com.example.programmingas3.utils.DateUtil;
	import com.example.programmingas3.podcastplayer.URLService;
	import com.example.programmingas3.podcastplayer.RSSChannel;
	import com.example.programmingas3.podcastplayer.PlayButtonRenderer;
	
	import fl.controls.dataGridClasses.DataGridColumn;
	import fl.data.DataProvider;
	import fl.events.DataGridEvent;
	import fl.events.ListEvent;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.DataEvent;
	import flash.events.ErrorEvent;	
	import flash.events.IOErrorEvent;	
	import flash.events.SecurityErrorEvent;	
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var player:SoundPlayer;
		private var feedList:List;
		private var feedImg:UILoader;
		private var feedDescriptionTxt:TextArea;
		private var articleGrid:DataGrid;
		
		public var service:URLService;
		
		public var feeds:XMLList;
		public var feedArray:Array;
		public var articles:XMLList;
		
		public var currentFeed:RSSChannel;
		
		public const PLAY_COLUMN:int = 2;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(myLables.getALable("播客播放例子", 43.5, 18, 511.9, 25.9, "center", false , 18));
			addChild(myLables.getALable("ActionScript 3.0: 处理声音", 43.5, 45, 511.9, 18.5, "center"));
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRoundRect(20, 73.3, 560, 352, 8, 8);
			addChild(myLables.getALable("选择一个播客：", 31.3, 82.3, 100, 22));
			
			feedList = new List();
			feedList.x = 31;
			feedList.y = 104;
			feedList.width = 200;
			feedList.height = 120;
			addChild(feedList);
			
			this.graphics.lineStyle(1, 0xcccccc);
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRect(238, 84, 334, 140);
			
			feedImg = new UILoader();
			feedImg.x = 244;
			feedImg.y = 90;
			feedImg.width = 130;
			feedImg.height = 130;
			feedImg.autoLoad = true;
			feedImg.maintainAspectRatio = true;
			feedImg.scaleContent = true;
			feedImg.visible = true;
			addChild(feedImg);
			
			feedDescriptionTxt = new TextArea();
			feedDescriptionTxt.x = 381;
			feedDescriptionTxt.y = 90;
			feedDescriptionTxt.width = 186;
			feedDescriptionTxt.height = 130;
			addChild(feedDescriptionTxt);
			
			articleGrid = new DataGrid();
			articleGrid.x = 31;
			articleGrid.y = 234.3;
			articleGrid.width = 540;
			articleGrid.height = 180;
			addChild(articleGrid);
			
			player = new SoundPlayer();
			player.x = 20;
			player.y = 435;
			addChild(player);
			
			var col1:DataGridColumn = new DataGridColumn("publishDate");
			//col1.headerText = "date";
			col1.headerText = "日期";
			col1.sortOptions = Array.NUMERIC;
			col1.labelFunction = formatDateColumn;
			col1.width = 90;
			
			var col2:DataGridColumn = new DataGridColumn("title");
			//col2.headerText = "Title";
			col2.headerText = "标题";
			col2.width = 220;
			
			var col3:DataGridColumn = new DataGridColumn("Play");
			col3.headerText = "播放";
			col3.cellRenderer = PlayButtonRenderer;
			col3.width = 70;
			
			this.articleGrid.addColumn(col1);
			this.articleGrid.addColumn(col2);
			this.articleGrid.addColumn(col3);
			
			this.articleGrid.addEventListener(fl.events.ListEvent.ITEM_CLICK , onGridPlay);
			this.feedList.addEventListener(Event.CHANGE, onFeedSelected); 
			
			var configService:URLService = new URLService("playerconfig.xml");
			configService.addEventListener(DataEvent.DATA, onConfigReceived);
			configService.addEventListener(IOErrorEvent.IO_ERROR, onFeedError);
			configService.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onFeedError);
			configService.send();
		}
		
		public function onConfigReceived(event:DataEvent):void
		{
			var result:XML = new XML(event.data);
			this.feeds = result.feed;
			trace("feeds.length()=" + this.feeds.length());
			
			// convert the XMLList to an array of objects
			var feedObj:Object;
			this.feedArray = new Array();
			for each (var feed:XML in this.feeds)
			{
				feedObj = { label:feed.label, url:feed.url };
				this.feedArray.push(feedObj);
			}

			this.feedList.dataProvider = new DataProvider(this.feedArray);
			this.feedList.selectedIndex = 0;
			this.feedList.dispatchEvent(new Event(Event.CHANGE));
		}
		
		public function onFeedSelected(event:Event):void
		{
			var url:String = feedList.selectedItem.url.toString();
			if (url != null)
			{
				service = new URLService(url);
				service.addEventListener(DataEvent.DATA, onFeedReceived);
				service.addEventListener(IOErrorEvent.IO_ERROR, onFeedError);
				service.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onFeedError);
				service.send();
			}
		}
		
		public function onFeedReceived(event:DataEvent):void
		{
			var result:XML = new XML(event.data);
			
			var channelXML:XMLList = result.child("channel");
			if (channelXML != null)
			{
				this.currentFeed = RSSChannel.parseFeed(channelXML[0]);
				
				// massage the data so the DataGrid is happy
				for each (var item:RSSItem in this.currentFeed.items)
				{
					item["Play"] = "Play";
					//item["Play"] = "播放";
					if (item.duration == "null")
					{
						item.duration = "";
					}
				}
			   
				if (this.currentFeed != null)
				{
					this.articleGrid.dataProvider = new DataProvider(this.currentFeed.items);
					this.feedImg.source = this.currentFeed.imageUrl;
				
					this.feedDescriptionTxt.htmlText = this.currentFeed.getDescriptionHTML();
				}
			}
		}
		
		public function onFeedError(event:ErrorEvent):void
		{
			showError(new Error(event.text));
		}
		
		/**
		 * A common method for displaying error messages.
		 * Should be enhanced to show a dialog box with an error message.
		 */		
		public function showError(e:Error):void
		{
			trace("Error: " + e.message);
		}
		
		/**
		 * Called when the Play button is clicked inside a row of the grid.
		 */
		public function onGridPlay(evt:ListEvent):void
		{
			trace("onGridPlay col=" + evt.columnIndex + ", url=" + evt.item.soundUrl);
			if (evt.columnIndex == PLAY_COLUMN)
			{
				var item:Object = evt.item;
				var title:String = item.title;
				if (item.soundUrl != null)
				{
					this.player.load(item.soundUrl, title);
				}
			}
		}
		
		public function formatDateColumn(data:Object):String
		{
			// remove milliseconds
			var dateStr:String = DateUtil.formatShort(data.publishDate);
			return dateStr;
		}
		
		public function formatDurationColumn(data:Object):String
		{
			var durStr:String = data.duration;
			return durStr as String;
		}
		
	}
	
}