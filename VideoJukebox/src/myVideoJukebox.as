package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import fl.controls.*;
	import fl.events.SliderEvent;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.NetStatusEvent;
	import flash.events.TimerEvent;
	import flash.media.SoundTransform;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Timer;
	import myLables;

	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class myVideoJukebox extends Sprite 
	{
		/**
		 * The amount of time between calls to update the playhead timer, in 
		 * milliseconds.
		 */
		private const PLAYHEAD_UPDATE_INTERVAL_MS:uint = 10;

		/**
		 * The path to the XML file containing the video playlist.
		 */
		private const PLAYLIST_XML_URL:String = "playlist.xml";

		/**
		 * The client object to use for the NetStream object.
		 */
		private var client:Object;

		/**
		 * The index of the currently playing video.
		 */
		private var idx:uint = 0;

		/**
		 * A copy of the current video's metadata object.
		 */
		private var meta:Object;
		private var nc:NetConnection;
		private var ns:NetStream;
		private var playlist:XML;
		private var t:Timer;
		private var uldr:URLLoader;
		private var vid:Video;
		private var videosXML:XMLList;
		
		/**
		 * The SoundTransform object used to set the volume for the NetStream.
		 */
		private var volumeTransform:SoundTransform;
		
		private var positionBar:ProgressBar;
		private var volumeSlider:Slider;
		private var positionLabel:Label;
		private var playButton:Button;
		private var pauseButton:Button;
		private var stopButton:Button;
		private var backButton:Button;
		private var forwardButton:Button;
		
		
		public function myVideoJukebox():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			showInit();
			
			uldr = new URLLoader();
			uldr.addEventListener(Event.COMPLETE, xmlCompleteHandler);
			uldr.load(new URLRequest(PLAYLIST_XML_URL));
		}
		
		private function showInit():void
		{
			addChild(myLables.getALable("Video Jukebox 例子", 14, 11, 511.9, 26, "center", true, 18));
			addChild(myLables.getALable("ActionScript 3.0:关于视频", 15, 38, 511.9, 19, "center"));
			
			playButton = new Button();
			playButton.x = 51.8;
			playButton.y = 327.9;
			playButton.width = 23;
			playButton.height = 23;
			playButton.label = ">";
			addChild(playButton);
			
			pauseButton = new Button();
			pauseButton.x = 84.8;
			pauseButton.y = 327.9;
			pauseButton.width = 23;
			pauseButton.height = 23;
			pauseButton.label = "| |";
			addChild(pauseButton);
			
			stopButton = new Button();
			stopButton.x = 117.8;
			stopButton.y = 327.9;
			stopButton.width = 23;
			stopButton.height = 23;
			stopButton.label = "[ ]";
			addChild(stopButton);
			
			backButton = new Button();
			backButton.x = 149.8;
			backButton.y = 325.9;
			backButton.width = 19;
			backButton.height = 19;
			backButton.label = "<<";
			addChild(backButton);
			
			forwardButton = new Button();
			forwardButton.x = 168.8;
			forwardButton.y = 325.9;
			forwardButton.width = 19;
			forwardButton.height = 19;
			forwardButton.label = ">>";
			addChild(forwardButton);
			
			positionBar = new ProgressBar();
			positionBar.x = 51.8;
			positionBar.y = 311.4;
			positionBar.width = 150;
			positionBar.height = 4;
			addChild(positionBar);
			
			volumeSlider = new Slider();
			volumeSlider.x = 51.8;
			volumeSlider.y = 362.9;
			volumeSlider.width = 79;
			volumeSlider.height = 3;
			addChild(volumeSlider);
			
			positionLabel = new Label();
			positionLabel.x = 140.7;
			positionLabel.y = 362.9;
			positionLabel.width = 120;
			positionLabel.height = 22;
			addChild(positionLabel);
			
		}
		
		/**
		 * Once the XML file has loaded, parse the file contents into an XML object, 
		 * and create an XMList for the video nodes in the XML.
		 */
		private function xmlCompleteHandler(event:Event):void 
		{
			playlist = XML(event.target.data);
			videosXML = playlist.video;
			main();
		}

		/**
		 * The main application.
		 */
		private function main():void 
		{
			volumeTransform = new SoundTransform();

			// Create the client object for the NetStream, and set up a callback
			// handler for the onMetaData event.
			client = new Object();
			client.onMetaData = metadataHandler;

			nc = new NetConnection();
			nc.connect(null);

			// Initialize the NetSteam object, add a listener for the netStatus 
			// event, and set the client for the NetStream.
			ns = new NetStream(nc);
			ns.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			ns.client = client;

			// Initialize the Video object, attach the NetStram, and add the Video
			// object to the display list.
			vid = new Video();
            vid.x = 20;
            vid.y = 75;
			vid.attachNetStream(ns);
			addChild(vid);

			// Begin playback of the first video.
			playVideo();

			// Initialize the Timer object and set the delay to
			// PLAYHEAD_UPDATE_INTERVAL_MS milliseconds. 
			t = new Timer(PLAYHEAD_UPDATE_INTERVAL_MS);
			t.addEventListener(TimerEvent.TIMER, timerHandler);

			// Configure the positionBar ProgressBar instance and set the mode to
			// MANUAL. Progress  bar values will be explicitly set using the
			// setProgress() method.
			positionBar.mode = ProgressBarMode.MANUAL;

			// Configure the volumeSlider Slider component instance. The maximum 
			// value is set to 1 because the volume in the SoundTransform object 
			// is set to a number between 0 and 1. The snapInterval and tickInterval 
			// properties are set to 0.1 which allows users to set the volume to 
			// 0, 0.1 - 0.9, 1.0 which allows users to increment or decrement the 
			// volume by 10%.
			volumeSlider.value = volumeTransform.volume;
			volumeSlider.minimum = 0;
			volumeSlider.maximum = 1;
			volumeSlider.snapInterval = 0.1;
			volumeSlider.tickInterval = volumeSlider.snapInterval;

			// Setting the liveDragging property to true causes the Slider 
			// instance's change event to be dispatched whenever the slider is 
			// moved, rather than when the user releases the slider thumb.
			volumeSlider.liveDragging = true;
			volumeSlider.addEventListener(SliderEvent.CHANGE, volumeChangeHandler);

			// Configure the various Button instances. Each Button instance uses 
			// the same click handler.
			playButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			pauseButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			stopButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			backButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
			forwardButton.addEventListener(MouseEvent.CLICK, buttonClickHandler);
		}

		/**
		 * Event listener for the volumeSlider instance. Called when the user 
		 * changes the value of the volume slider.
		 */
		private function volumeChangeHandler(event:SliderEvent):void 
		{
			// Set the volumeTransform's volume property to the current value of the 
			// Slider and set the NetStream object's soundTransform property.
			volumeTransform.volume = event.value;
			ns.soundTransform = volumeTransform;
		}

		/**
		 * Event listener for the ns object. Called when the net stream's status 
		 * changes.
		 */
		private function netStatusHandler(event:NetStatusEvent):void 
		{
			try {
				switch (event.info.code) {
					case "NetStream.Play.Start" :
						// If the current code is Start, start the timer object.
						t.start();
						break;
					case "NetStream.Play.StreamNotFound" :
					case "NetStream.Play.Stop" :
						// If the current code is Stop or StreamNotFound, stop 
						// the timer object and play the next video in the playlist.
						t.stop();
						playNextVideo();
						break;
				}
			} catch (error:TypeError) {
				// Ignore any errors.
			}
		}

		/**
		 * Event listener for the ns object's client property. This method is called 
		 * when the net stream object receives metadata information for a video.
		 */
		private function metadataHandler(metadataObj:Object):void 
		{
			// Store the metadata information in the meta object.
			meta = metadataObj;
			// Resize the Video instance on the display list with the video's width 
			// and height from the metadata object.
			vid.width = meta.width;
			vid.height = meta.height;
			// Reposition and resize the positionBar progress bar based on the 
			// current video's dimensions.
			positionBar.move(vid.x, vid.y + vid.height);
			positionBar.width = vid.width;
		}

		/**
		 * Retrieve the current video from the playlist XML object.
		 */
		private function getVideo():String 
		{
			return videosXML[idx].@url;
		}

		/**
		 * Play the currently selected video.
		 */
		private function playVideo():void 
		{
			var url:String = getVideo();
			ns.play(url);
		}

		/**
		 * Decrease the current video index and begin playback of the video.
		 */
		private function playPreviousVideo():void 
		{
			if (idx > 0) {
				idx--;
				playVideo();
				// Make sure the positionBar progress bar is visible.
				positionBar.visible = true;
			}
		}

		/**
		 * Increase the current video index and begin playback of the video.
		 */
		private function playNextVideo():void 
		{
			if (idx < (videosXML.length() - 1)) {
				// If this is not the last video in the playlist increase the 
				// video index and play the next video.
				idx++;
				playVideo();
				// Make sure the positionBar progress bar is visible.
				positionBar.visible = true;
			} else {
				// If this is the last video in the playlist increase the video
				// index, clear the contents of the Video object and hide the 
				// positionBar progress bar. The video index is increased so that 
				// when the video ends, clicking the backButton will play the 
				// correct video.
				idx++;
				vid.clear();
				positionBar.visible = false;
			}
		}

		/**
		 * Click handler for each of the video playback buttons.
		 */
		private function buttonClickHandler(event:MouseEvent):void 
		{
			// Use a switch statement to determine which button was clicked.
			switch (event.currentTarget) {
				case playButton :
					// If the play button was clicked, resume the video playback. 
					// If the video was already playing, this has no effect.
					ns.resume();
					break;
				case pauseButton :
					// If the pause button was clicked, pause the video playback. 
					// If the video was already playing, the video will be paused. 
					// If the video was already paused, the video will be resumed.
					ns.togglePause();
					break;
				case stopButton :
					// If the stop button was clicked, pause the video playback 
					// and reset the playhead back to the beginning of the video.
					ns.pause();
					ns.seek(0);
					break;
				case backButton :
					// If the back button was clicked, play the previous video in 
					// the playlist.
					playPreviousVideo();
					break;
				case forwardButton :
					// If the forward button was clicked, play the next video in 
					// the playlist.
					playNextVideo();
					break;
			}
		}

		/**
		 * Event handler for the timer object. This method is called every 
		 * PLAYHEAD_UPDATE_INTERVAL_MS milliseconds as long as the timer is running.
		 */
		private function timerHandler(event:TimerEvent):void {
			try {
				// Update the progress bar and label based on the amount of video
				// that has played back.
				positionBar.setProgress(ns.time, meta.duration);
				positionLabel.text = ns.time.toFixed(1) + " of " + meta.duration.toFixed(1) + " seconds";
			} catch (error:Error) {
				// Ignore this error.
			}
		}
		
	}
	
}