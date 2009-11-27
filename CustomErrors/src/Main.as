package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import myLables;
	import fl.controls.TextArea;
	import fl.controls.Button;
	import com.example.programmingas3.errors.*;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var noButton:Button;
		private var validateBtn:Button;
		private var yesButton:Button;
		
		private var xmlText:TextArea;
		private var statusText:TextArea;
		
		private var employeeXML:XML; 	
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			buju();
			employeeXML =  <employee id="12345">
				   <firstName>John</firstName>
				   <lastName>Doe</lastName>
				   <costCenter>12345</costCenter>
				   <costCenter>67890</costCenter>
				</employee>;

			statusText.text = "点击[验证]按钮来验证XML";	
			validateBtn.addEventListener(MouseEvent.CLICK,validateData);
			xmlText.text = employeeXML;

			yesButton.addEventListener(MouseEvent.CLICK,closeHandler);
			noButton.addEventListener(MouseEvent.CLICK,closeHandler);
			hideButtons();
		}
		
		private function buju():void 
		{
			addChild(myLables.getALable("程序错误例子", 14, 11, 511.9, 25.9, "center", true, 18, 0x0));
			addChild(myLables.getALable("ActionScript 3.0: 处理错误", 15, 38, 511.9, 18.5, "center"));
			
			xmlText = new TextArea();
			xmlText.x = 48.3;
			xmlText.y = 69.3;
			xmlText.width = 200;
			xmlText.height = 200;
			addChild(xmlText);
			
			statusText = new TextArea();
			statusText.x = 264.3;
			statusText.y = 69.3;
			statusText.width = 200;
			statusText.height = 200;
			addChild(statusText);
			
			validateBtn = new Button();
			validateBtn.x = 105.3;
			validateBtn.y = 276.4;
			validateBtn.width = 100;
			validateBtn.height = 22;
			validateBtn.label = "验证";
			addChild(validateBtn);
			
			yesButton = new Button();
			yesButton.x = 288.3;
			yesButton.y = 276.4;
			yesButton.width = 67;
			yesButton.height = 22;
			yesButton.label = "是";
			addChild(yesButton);
			
			noButton = new Button();
			noButton.x = 368.3;
			noButton.y = 276.4;
			noButton.width = 67;
			noButton.height = 22;
			noButton.label = "否";
			addChild(noButton);
		}
		
		private function validateData(e:MouseEvent):void
		{
			try
			{
				var tempXML:XML = XML(xmlText.text);
				
				Validator.validateEmployeeXML(tempXML);
				
				statusText.text = "XML是正确的.";
			}
			catch (error:FatalError)
			{
				showFatalError(error);
			}
			catch (error:WarningError)
			{
				showWarningError(error);
			}
			catch (error:Error)
			{
				showGenericError(error);
			}
		}

		private function showFatalError(error:FatalError):void
		{
			var message:String = error.message + "\n\n";
			var title:String = error.getTitle();
			statusText.text = message + " " + title + "\n\n程序已经结束.";
			this.xmlText.enabled = false;
			this.validateBtn.enabled = false;
			hideButtons();
		}

		private function showWarningError(error:WarningError):void
		{
			var message:String = error.message + "\n\n" + "是否退出程序?";
			showButtons();
			var title:String = error.getTitle();
			statusText.text = message;
		}

		private function showGenericError(error:Error):void
		{
			statusText.text = error.message + "\n\n遇到未知错误: " + error.name;
		}

		private function showButtons():void
		{
			yesButton.visible = true;
			noButton.visible = true;
		}

		private function hideButtons():void
		{
			yesButton.visible = false;
			noButton.visible = false;
		}

		private function closeHandler(event:MouseEvent):void 
		{
			switch (event.target)
			{
				case yesButton:
					showFatalError(new FatalError(9999));
					hideButtons();
					break;
				case noButton:
					statusText.text = "";
					hideButtons();
					break;
			}
		}
		
	}
	
}