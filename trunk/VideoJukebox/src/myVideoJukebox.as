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
	/*
	import BackButton;
	import ForwardButton;
	import PauseButton;
	import PlayButton;
	import StopButton;
	//*/
	

	
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class myVideoJukebox extends Sprite 
	{
		
		public function myVideoJukebox():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}