package  
{
	import fl.controls.Button;
	import fl.controls.CheckBox;
	import fl.controls.Label;
	import fl.controls.ProgressBar;
	import fl.controls.TextInput;
	import flash.display.MovieClip;
	import myLables;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	
	import flash.media.Sound;
	import flash.media.SoundMixer;
	
	import flash.utils.Timer;
	import com.example.programmingas3.podcastplayer.SoundFacade;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class SoundPlayer extends MovieClip
	{
		private var urlLbl:Label;
		private var titleLbl:Label;
		private var loadingLbl:Label;
		private var playingLbl:Label;
		
		public var titleTxt:Label;
		
		public var urlTxt:TextInput;
		
		public var playBtn:Button;
		public var pauseBtn:Button;
		public var resumeBtn:Button;
		public var stopBtn:Button;
		
		public var autoPlayCb:CheckBox;
		
		public var loadingPb:ProgressBar;
		public var playingPb:ProgressBar;
		
		public var s:SoundFacade;
		
		public var positionTimer:Timer;
		
		[Embed(source = 'pauseIcon.png')]
		private var pauseIcon:Class;
		[Embed(source = 'playIcon.png')]
		private var playIcon:Class;
		[Embed(source = 'resumeIcon.png')]
		private var resumeIcon:Class;
		[Embed(source = 'stopIcon.png')]
		private var stopIcon:Class;
		
		public function SoundPlayer():void
		{
			super();
			this.graphics.beginFill(0xffffff);
			this.graphics.drawRoundRect(0.5, -4, 560, 250, 8, 8);
			this.graphics.beginFill(0xE8E8E8);
			this.graphics.drawRoundRect(20, 5, 520, 29, 4, 4);
			this.graphics.drawRoundRect(20, 40, 520, 70, 4, 4);
			this.graphics.drawRoundRect(20, 116, 520, 44, 4, 4);
			this.graphics.drawRoundRect(20, 166, 520, 70, 4, 4);
			
			addChild(myLables.getALable("声音播放器", 208, 5, 104.2, 28.3, "center", false, 20, 0x6699cc));
			urlLbl = new Label();
			urlLbl.x = 17.8;
			urlLbl.y = 49.3;
			urlLbl.width = 80;
			urlLbl.height = 22;
			urlLbl.autoSize = "right";
			urlLbl.text = "现在播放:";
			addChild(urlLbl);
			
			urlTxt = new TextInput();
			urlTxt.x = 102;
			urlTxt.y = 50;
			urlTxt.width = 420.1;
			urlTxt.height = 22;
			addChild(urlTxt);
			
			titleLbl = new Label();
			titleLbl.x = 16.8;
			titleLbl.y = 82.5
			titleLbl.width = 80;
			titleLbl.height = 22;
			titleLbl.autoSize = "right";
			titleLbl.text = "标题:";
			addChild(titleLbl);
			
			titleTxt = new Label();
			titleTxt.x = 102.8;
			titleTxt.y = 83.2
			titleTxt.width = 420.1;
			titleTxt.height = 22;
			titleTxt.text = "标题:";
			addChild(titleTxt);
			
			playBtn = new Button();
			playBtn.x = 80;
			playBtn.y = 123;
			playBtn.width = 80;
			playBtn.height = 30;
			playBtn.label = "播放";
			playBtn.setStyle("icon", playIcon);
			addChild(playBtn);
			
			pauseBtn = new Button();
			pauseBtn.x = 167.1;
			pauseBtn.y = 123;
			pauseBtn.width = 80;
			pauseBtn.height = 30;
			pauseBtn.label = "暂停";
			pauseBtn.setStyle("icon", pauseIcon);
			addChild(pauseBtn);
			
			resumeBtn = new Button();
			resumeBtn.x = 253.1;
			resumeBtn.y = 123;
			resumeBtn.width = 80;
			resumeBtn.height = 30;
			resumeBtn.label = "继续";
			resumeBtn.setStyle("icon", resumeIcon);
			addChild(resumeBtn);
			
			stopBtn = new Button();
			stopBtn.x = 339.1;
			stopBtn.y = 123;
			stopBtn.width = 80;
			stopBtn.height = 30;
			stopBtn.label = "停止";
			stopBtn.setStyle("icon", stopIcon);
			addChild(stopBtn);
			
			autoPlayCb = new CheckBox();
			autoPlayCb.x = 429.3;
			autoPlayCb.y = 127;
			autoPlayCb.width = 100;
			autoPlayCb.height = 22;
			autoPlayCb.label = "自动播放";
			autoPlayCb.selected = true;
			autoPlayCb.labelPlacement = "right";
			addChild(autoPlayCb);
			
			loadingLbl = new Label();
			loadingLbl.x = 11.9;
			loadingLbl.y = 178;
			loadingLbl.width = 80;
			loadingLbl.height = 22;
			loadingLbl.autoSize = "right";
			loadingLbl.text = "加载";
			addChild(loadingLbl);
			
			loadingPb = new ProgressBar();
			loadingPb.x = 102;
			loadingPb.y = 182;
			loadingPb.width = 420;
			loadingPb.height = 12;
			loadingPb.direction = "right";
			loadingPb.mode = "manual";
			addChild(loadingPb);
			
			playingLbl = new Label();
			playingLbl.x = 11.9;
			playingLbl.y = 208
			playingLbl.width = 80;
			playingLbl.height = 22;
			playingLbl.autoSize = "right";
			playingLbl.text = "播放中";
			addChild(playingLbl);
			
			playingPb = new ProgressBar();
			playingPb.x = 102;
			playingPb.y = 211;
			playingPb.width = 420;
			playingPb.height = 12;
			playingPb.direction = "right";
			playingPb.mode = "manual";
			addChild(playingPb);
			
			SoundMixer.bufferTime = 5000;
			
			playBtn.addEventListener(MouseEvent.CLICK, onPlayBtn);
			pauseBtn.addEventListener(MouseEvent.CLICK, onPauseBtn);
			resumeBtn.addEventListener(MouseEvent.CLICK, onResumeBtn);
			stopBtn.addEventListener(MouseEvent.CLICK, onStopBtn);
			
			//playBtn.enabled = false;
			resumeBtn.enabled = false;
			pauseBtn.enabled = false;
			stopBtn.enabled = false;
			
			urlTxt.addEventListener("enter", onUrlChange);
		}
		
		public function load(url:String, title:String = ""):void
		{
			if (url != null)
			{
				this.loadingPb.setProgress(0, 1);
				this.playingPb.setProgress(0, 1);
				
				if (this.s != null && this.s.isPlaying)
				{
					this.s.stop();
				}
				
				this.s = new SoundFacade(url, true, this.autoPlayCb.selected, true, 100000);
				
				this.s.addEventListener(flash.events.ProgressEvent.PROGRESS, onLoadProgress);
				this.s.addEventListener(flash.events.Event.OPEN, onLoadOpen);
				this.s.addEventListener(flash.events.Event.COMPLETE, onLoadComplete);
				this.s.addEventListener("playProgress", onPlayProgress);
				this.s.addEventListener(flash.events.Event.SOUND_COMPLETE, onPlayComplete);

				this.urlTxt.text = url;
				this.titleTxt.text = title;
				
				if (this.autoPlayCb.selected)
				{
					playBtn.enabled = false;
				}
				else
				{
					playBtn.enabled = true;
				}

				this.pauseBtn.enabled = false;
				this.resumeBtn.enabled = false;
				this.stopBtn.enabled = true;
			}
		}
		
		public function onLoadOpen(evt:Event):void
		{
			// none of the properties are available when the open event arrives
			trace("onLoadOpen");
			
			if (!this.autoPlayCb.selected)
			{
				playBtn.enabled = true;
			}
		}
					
		public function onLoadProgress(evt:ProgressEvent):void
		{
			this.loadingPb.setProgress(evt.bytesLoaded, evt.bytesTotal);
		}
		
		public function onLoadComplete(evt:Event):void
		{
			// all of the properties are available when the complete event arrives
			trace("onLoadComplete");
			if (this.s.isPlaying)
			{
				// can't pause until the file is fully loaded
				pauseBtn.enabled = true;
			}
		}
		
		public function onPlayProgress(evt:ProgressEvent):void
		{
			this.playingPb.setProgress(evt.bytesLoaded, evt.bytesTotal);
		}
		
		public function onPlayComplete(evt:Event):void
		{
			trace("onPlayComplete");
			
			this.playBtn.enabled = true;
			this.stopBtn.enabled = false;
		}
			
		public function onPlayBtn(evt:Event):void
		{
			if (this.s != null)
			{
				this.s.play(); 
				this.stopBtn.enabled = true;
				if (this.s.isLoaded)
				{
					this.pauseBtn.enabled = true;
					this.resumeBtn.enabled = false;
				}
			}
		}

		public function onPauseBtn(evt:Event):void
		{
			this.s.pause();
			
			this.playBtn.enabled = true;
			this.pauseBtn.enabled = false;
			this.resumeBtn.enabled = true;
		}
		
		public function onResumeBtn(evt:Event):void
		{
			this.s.resume();
			
			this.pauseBtn.enabled = true;
			this.resumeBtn.enabled = false;
		}
		
		public function onStopBtn(evt:Event):void
		{
			this.s.stop();
			this.playingPb.setProgress(0, 1);
			
			this.playBtn.enabled = true;
			this.pauseBtn.enabled = false;
			this.resumeBtn.enabled = false;
			this.stopBtn.enabled = false;
		}
		
		public function onUrlChange(evt:Event):void
		{
			if (urlTxt.text != "")
			{
				if (this.s != null)
				{
					this.s.stop();
					this.playingPb.setProgress(0, 1);
				}
				load(urlTxt.text);
			}
		}
	}

}