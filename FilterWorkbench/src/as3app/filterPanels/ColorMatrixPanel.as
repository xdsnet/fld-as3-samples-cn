package as3app.filterPanels
{
	import com.adobe.examples.flash.ComboSlider;
	import com.example.programmingas3.filterWorkbench.ColorMatrixFactory;
	import com.example.programmingas3.filterWorkbench.IFilterFactory;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	
	import fl.controls.Button;
	import fl.controls.TextInput;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import myLables;
	
	public class ColorMatrixPanel extends Sprite implements IFilterPanel
	{
		// ------- Private vars -------
		private var _filterFactory:ColorMatrixFactory;
		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var brightnessValue:ComboSlider=new ComboSlider();
		public var contrastValue:ComboSlider=new ComboSlider();
		public var saturationValue:ComboSlider=new ComboSlider();
		public var hueValue:ComboSlider=new ComboSlider();
		public var m0:TextInput=new TextInput();
		public var m1:TextInput=new TextInput();
		public var m2:TextInput=new TextInput();
		public var m3:TextInput=new TextInput();
		public var m4:TextInput=new TextInput();
		public var m5:TextInput=new TextInput();
		public var m6:TextInput=new TextInput();
		public var m7:TextInput=new TextInput();
		public var m8:TextInput=new TextInput();
		public var m9:TextInput=new TextInput();
		public var m10:TextInput=new TextInput();
		public var m11:TextInput=new TextInput();
		public var m12:TextInput=new TextInput();
		public var m13:TextInput=new TextInput();
		public var m14:TextInput=new TextInput();
		public var m15:TextInput=new TextInput();
		public var m16:TextInput=new TextInput();
		public var m17:TextInput=new TextInput();
		public var m18:TextInput=new TextInput();
		public var m19:TextInput=new TextInput();
		public var resetButton:Button=new Button();
		
		
		// ------- Constructor -------
		public function ColorMatrixPanel()
		{
			initshow();
			addEventListener(Event.ADDED, setupChildren);
		}
		
		private function initshow():void
		{
			//初始化显示组件
			addChild(myLables.getALable("亮度:", 156, 3, 65, 22, "right"));
			addChild(myLables.getALable("对比度:", 156, 31, 65, 22, "right"));
			addChild(myLables.getALable("饱和度:", 156, 59, 65, 22, "right"));
			addChild(myLables.getALable("色度:", 156, 87, 65, 22, "right"));
			
			addChild(myLables.getALable("输出:", 299, 62, 75, 22, "right"));
			
			addChild(myLables.getALable("红:", 366, 16, 50, 22, "right"));
			addChild(myLables.getALable("绿:", 366, 46, 50, 22, "right"));
			addChild(myLables.getALable("蓝:", 366, 76, 50, 22, "right"));
			addChild(myLables.getALable("透明:", 366, 106, 50, 22, "right"));
			
			addChild(myLables.getALable("源混合", 450, -25, 100, 22, "right"));
			addChild(myLables.getALable("红:", 421, -6, 40, 22, "right"));
			addChild(myLables.getALable("绿:", 468, -6, 40, 22, "right"));
			addChild(myLables.getALable("蓝:", 515, -6, 40, 22, "right"));
			addChild(myLables.getALable("透明:", 562.1, -6, 40, 22, "right"));
			addChild(myLables.getALable("抵消:", 609, -6, 40, 22, "right"));
			
			resetButton.x = 47;
			resetButton.y = 31;
			resetButton.width = 60;
			resetButton.height = 22;
			resetButton.label = "复位";
			addChild(resetButton);
			
			brightnessValue.x = 231;
			brightnessValue.y = 3;
			brightnessValue.width = 55;
			brightnessValue.height = 22;
			brightnessValue.maximum = 100;
			brightnessValue.minimum = -100;
			addChild(brightnessValue);
			
			contrastValue.x = 231;
			contrastValue.y = 31;
			contrastValue.width = 55;
			contrastValue.height = 22;
			contrastValue.maximum = 100;
			contrastValue.minimum = -100;
			addChild(contrastValue);
			
			saturationValue.x = 231;
			saturationValue.y = 59;
			saturationValue.width = 55;
			saturationValue.height = 22;
			saturationValue.maximum = 100;
			saturationValue.minimum = -100;
			addChild(saturationValue);
			
			hueValue.x = 231;
			hueValue.y = 87;
			hueValue.width = 55;
			hueValue.height = 22;
			hueValue.maximum = 180;
			hueValue.minimum = -180;
			addChild(hueValue);
			
			m0.x = 421;
			m0.y = 16;
			m0.width = 40;
			m0.height = 22;
			m0.restrict = "0-9\-\.";
			m0.text = "1";
			addChild(m0);
			
			m5.x = 421;
			m5.y = 46;
			m5.width = 40;
			m5.height = 22;
			m5.restrict = "0-9\-\.";
			m5.text = "0";
			addChild(m5);
			
			m10.x = 421;
			m10.y = 76;
			m10.width = 40;
			m10.height = 22;
			m10.restrict = "0-9\-\.";
			m10.text = "0";
			addChild(m10);
			
			m15.x = 421;
			m15.y = 106;
			m15.width = 40;
			m15.height = 22;
			m15.restrict = "0-9\-\.";
			m15.text = "0";
			addChild(m15);
			
			m1.x = 468;
			m1.y = 16;
			m1.width = 40;
			m1.height = 22;
			m1.restrict = "0-9\-\.";
			m1.text = "0";
			addChild(m1);
			
			m6.x = 468;
			m6.y = 46;
			m6.width = 40;
			m6.height = 22;
			m6.restrict = "0-9\-\.";
			m6.text = "1";
			addChild(m6);
			
			m11.x = 468;
			m11.y = 76;
			m11.width = 40;
			m11.height = 22;
			m11.restrict = "0-9\-\.";
			m11.text = "0";
			addChild(m11);
			
			m16.x = 468;
			m16.y = 106;
			m16.width = 40;
			m16.height = 22;
			m16.restrict = "0-9\-\.";
			m16.text = "0";
			addChild(m16);
			
			m2.x = 515;
			m2.y = 16;
			m2.width = 40;
			m2.height = 22;
			m2.restrict = "0-9\-\.";
			m2.text = "0";
			addChild(m2);
			
			m7.x = 515;
			m7.y = 46;
			m7.width = 40;
			m7.height = 22;
			m7.restrict = "0-9\-\.";
			m7.text = "0";
			addChild(m7);
			
			m12.x = 515;
			m12.y = 76;
			m12.width = 40;
			m12.height = 22;
			m12.restrict = "0-9\-\.";
			m12.text = "1";
			addChild(m12);
			
			m17.x = 515;
			m17.y = 106;
			m17.width = 40;
			m17.height = 22;
			m17.restrict = "0-9\-\.";
			m17.text = "0";
			addChild(m17);
			
			m3.x = 562;
			m3.y = 16;
			m3.width = 40;
			m3.height = 22;
			m3.restrict = "0-9\-\.";
			m3.text = "0";
			addChild(m3);
			
			m8.x = 562;
			m8.y = 46;
			m8.width = 40;
			m8.height = 22;
			m8.restrict = "0-9\-\.";
			m8.text = "0";
			addChild(m8);
			
			m13.x = 562;
			m13.y = 76;
			m13.width = 40;
			m13.height = 22;
			m13.restrict = "0-9\-\.";
			m13.text = "0";
			addChild(m13);
			
			m18.x = 562;
			m18.y = 106;
			m18.width = 40;
			m18.height = 22;
			m18.restrict = "0-9\-\.";
			m18.text = "1";
			addChild(m18);
			
			m4.x = 609;
			m4.y = 16;
			m4.width = 40;
			m4.height = 22;
			m4.restrict = "0-9\-\.";
			m4.text = "0";
			addChild(m4);
			
			m9.x = 609;
			m9.y = 46;
			m9.width = 40;
			m9.height = 22;
			m9.restrict = "0-9\-\.";
			m9.text = "0";
			addChild(m9);
			
			m14.x = 609;
			m14.y = 76;
			m14.width = 40;
			m14.height = 22;
			m14.restrict = "0-9\-\.";
			m14.text = "0";
			addChild(m14);
			
			m19.x = 609;
			m19.y = 106;
			m19.width = 40;
			m19.height = 22;
			m19.restrict = "0-9\-\.";
			m19.text = "0";
			addChild(m19);
		}
		// ------- Public Properties -------
		public function get filterFactory():IFilterFactory
		{
			return _filterFactory;
		}
		
		
		// ------- Public methods -------
		public function resetForm():void
		{
			setMatrixForm([1, 0, 0, 0, 0,
						   0, 1, 0, 0, 0,
						   0, 0, 1, 0, 0,
						   0, 0, 0, 1, 0]);
			
			brightnessValue.value = 0;
			contrastValue.value = 0;
			saturationValue.value = 0;
			hueValue.value = 0;
			
			if (_filterFactory != null)
			{
				_filterFactory.modifyFilterCustom();
			}
		}
		
		
		// ------- Event Handling -------
		private function setupChildren(event:Event):void
		{
			removeEventListener(Event.ADDED, setupChildren);
			
			// create the filter factory
			_filterFactory = new ColorMatrixFactory();
			
			// add event listeners for child controls
			brightnessValue.addEventListener(Event.CHANGE, changePreset);
			contrastValue.addEventListener(Event.CHANGE, changePreset);
			saturationValue.addEventListener(Event.CHANGE, changePreset);
			hueValue.addEventListener(Event.CHANGE, changePreset);
			
			m0.addEventListener(Event.CHANGE, changeFilterValue);
			m1.addEventListener(Event.CHANGE, changeFilterValue);
			m2.addEventListener(Event.CHANGE, changeFilterValue);
			m3.addEventListener(Event.CHANGE, changeFilterValue);
			m4.addEventListener(Event.CHANGE, changeFilterValue);
			m5.addEventListener(Event.CHANGE, changeFilterValue);
			m6.addEventListener(Event.CHANGE, changeFilterValue);
			m7.addEventListener(Event.CHANGE, changeFilterValue);
			m8.addEventListener(Event.CHANGE, changeFilterValue);
			m9.addEventListener(Event.CHANGE, changeFilterValue);
			m10.addEventListener(Event.CHANGE, changeFilterValue);
			m11.addEventListener(Event.CHANGE, changeFilterValue);
			m12.addEventListener(Event.CHANGE, changeFilterValue);
			m13.addEventListener(Event.CHANGE, changeFilterValue);
			m14.addEventListener(Event.CHANGE, changeFilterValue);
			m15.addEventListener(Event.CHANGE, changeFilterValue);
			m16.addEventListener(Event.CHANGE, changeFilterValue);
			m17.addEventListener(Event.CHANGE, changeFilterValue);
			m18.addEventListener(Event.CHANGE, changeFilterValue);
			m19.addEventListener(Event.CHANGE, changeFilterValue);
			
			resetButton.addEventListener(MouseEvent.CLICK, resetClick);
		}
		
		
		private function changePreset(event:Event):void
		{
			// update the filter
			_filterFactory.modifyFilterBasic(brightnessValue.value, contrastValue.value, saturationValue.value, hueValue.value);
			
			// populate the form values with the new matrix
			setMatrixForm(_filterFactory.matrix);
		}
		
		
		private function changeFilterValue(event:Event):void
		{
			// verify that the values are valid
			if (m0.text.length <= 0) { return; }
			if (m1.text.length <= 0) { return; }
			if (m2.text.length <= 0) { return; }
			if (m3.text.length <= 0) { return; }
			if (m4.text.length <= 0) { return; }
			if (m5.text.length <= 0) { return; }
			if (m6.text.length <= 0) { return; }
			if (m7.text.length <= 0) { return; }
			if (m8.text.length <= 0) { return; }
			if (m9.text.length <= 0) { return; }
			if (m10.text.length <= 0) { return; }
			if (m11.text.length <= 0) { return; }
			if (m12.text.length <= 0) { return; }
			if (m13.text.length <= 0) { return; }
			if (m14.text.length <= 0) { return; }
			if (m15.text.length <= 0) { return; }
			if (m16.text.length <= 0) { return; }
			if (m17.text.length <= 0) { return; }
			if (m18.text.length <= 0) { return; }
			if (m19.text.length <= 0) { return; }
			
			// reset the brightness/contrast/saturation/hue controls
			brightnessValue.value = 0;
			contrastValue.value = 0;
			saturationValue.value = 0;
			hueValue.value = 0;
			
			// update the filter
			var matrix:Array = [Number(m0.text), Number(m1.text), Number(m2.text), Number(m3.text), Number(m4.text),
								 Number(m5.text), Number(m6.text), Number(m7.text), Number(m8.text), Number(m9.text),
								 Number(m10.text), Number(m11.text), Number(m12.text), Number(m13.text), Number(m14.text),
								 Number(m15.text), Number(m16.text), Number(m17.text), Number(m18.text), Number(m19.text)];
			
			_filterFactory.modifyFilterCustom(matrix);
		}
		
		
		private function resetClick(event:MouseEvent):void
		{
			resetForm();
		}
		
		
		// ------- Utility methods -------
		private function setMatrixForm(matrix:Array):void
		{
			m0.text = matrix[0].toString();
			m1.text = matrix[1].toString();
			m2.text = matrix[2].toString();
			m3.text = matrix[3].toString();
			m4.text = matrix[4].toString();
			m5.text = matrix[5].toString();
			m6.text = matrix[6].toString();
			m7.text = matrix[7].toString();
			m8.text = matrix[8].toString();
			m9.text = matrix[9].toString();
			m10.text = matrix[10].toString();
			m11.text = matrix[11].toString();
			m12.text = matrix[12].toString();
			m13.text = matrix[13].toString();
			m14.text = matrix[14].toString();
			m15.text = matrix[15].toString();
			m16.text = matrix[16].toString();
			m17.text = matrix[17].toString();
			m18.text = matrix[18].toString();
			m19.text = matrix[19].toString();
		}
	}
}