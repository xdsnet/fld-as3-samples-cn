package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import mylables;
	import com.example.programmingas3.clock.*;
	import flash.events.MouseEvent;
	import fl.controls.NumericStepper;
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.Label;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		var hourNs:NumericStepper;
		var minuteNs:NumericStepper;
		var setAlarmBtn:Button;
		var messageTxt:TextInput;
		var alarmTimeTxt:Label;
		var clock:AlarmClock;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			addChild(mylables.TopLable());
			addChild(mylables.TopLable2());
			addChild(mylables.bcLable());
			
			hourNs = new NumericStepper();
			minuteNs = new NumericStepper();
			setAlarmBtn = new Button();
			messageTxt = new TextInput();
			alarmTimeTxt = new Label();
			
			hourNs.x = 181.3;
			hourNs.y = 72.3;
			hourNs.width = 52;
			hourNs.height = 22;
			hourNs.maximum = 23;
			hourNs.minimum = 0;
			hourNs.stepSize = 1;
			hourNs.value = 1;
			
			minuteNs.x = 243.3;
			minuteNs.y = 72.3;
			minuteNs.width = 72;
			minuteNs.height = 22;
			minuteNs.maximum = 59;
			minuteNs.minimum = 0;
			minuteNs.stepSize = 1;
			minuteNs.value = 1;
			
			setAlarmBtn.x = 323.9;
			setAlarmBtn.y = 72.3;
			setAlarmBtn.width = 76;
			setAlarmBtn.height = 22;
			setAlarmBtn.label = "设置警报";
			
			messageTxt.x = 241.3;
			messageTxt.y = 100.3;
			messageTxt.width = 103.3;
			messageTxt.height = 22;
			messageTxt.text = "起床";
			
			alarmTimeTxt.x = 240.2;
			alarmTimeTxt.y = 125.3;
			alarmTimeTxt.width = 156;
			alarmTimeTxt.height = 22;
			alarmTimeTxt.text = "警报时间:未设置";
			
			addChild(hourNs);
			addChild(minuteNs);
			addChild(setAlarmBtn );
			addChild(messageTxt );
			addChild(alarmTimeTxt);
			
			clock = new AlarmClock();
			clock.initClock();
			clock.x = 190;
			clock.y = 160;
			clock.addEventListener(AlarmEvent.ALARM, onAlarm);
			addChild(clock);
			
			var alarmTime:Date = new Date();
			alarmTime.setTime(alarmTime.time + 60000);
			hourNs.value = alarmTime.hours;
			minuteNs.value = alarmTime.minutes;
			
			setAlarmBtn.addEventListener(MouseEvent.CLICK,setAlarm);
		}
		function setAlarm(evt:MouseEvent):void
		{
			var alarmTime:Date = clock.setAlarm(hourNs.value, minuteNs.value, messageTxt.text);
			alarmTimeTxt.text = "报警时间:" + alarmTime.hours + ":" + padZeroes(alarmTime.minutes.toString());
		}
		function onAlarm(evt:AlarmEvent):void
		{
			alarmTimeTxt.text = evt.message;
		}

		function padZeroes(numStr:String, desiredLength:uint = 2):String
		{
			if (numStr.length < desiredLength)
			{
				for (var i:uint = 0; i < (desiredLength - numStr.length); i++)
				{
					numStr = "0" + numStr;
				}
			}
			return numStr;
		}
	}
	
}