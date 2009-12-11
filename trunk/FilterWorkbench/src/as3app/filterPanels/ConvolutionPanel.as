package as3app.filterPanels
{
	import com.adobe.examples.flash.ComboSlider;
	import com.example.programmingas3.filterWorkbench.ConvolutionFactory;
	import com.example.programmingas3.filterWorkbench.IFilterFactory;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	
	import fl.controls.ComboBox;
	import fl.controls.Label;
	import fl.controls.TextInput;
	import fl.controls.ColorPicker;
	import fl.controls.CheckBox;
	import fl.data.DataProvider;
	import fl.events.ColorPickerEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import myLables;
	
	public class ConvolutionPanel extends Sprite implements IFilterPanel
	{
		// ------- Constants -------
		public const matrixXValue:Number = 3;
		public const matrixYValue:Number = 3;
		
		// --- Presets ---
		private static const NONE:String = "none";
		private static const SHIFT_LEFT:String = "shiftLeft";
		private static const SHIFT_UP:String = "shiftUp";
		private static const BLUR:String = "blur";
		private static const ENHANCE:String = "enhance";
		private static const SHARPEN:String = "sharpen";
		private static const CONTRAST:String = "contrast";
		private static const EMBOSS:String = "emboss";
		private static const EDGE_DETECT:String = "edge";
		private static const HORIZONTAL_EDGE:String = "hEdge";
		private static const VERTICAL_EDGE:String = "vEdge";
		
		
		// ------- Private vars -------
		private var _filterFactory:ConvolutionFactory;
		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var presetChooser:ComboBox=new ComboBox();
		public var matrixTL:TextInput=new TextInput();
		public var matrixTC:TextInput=new TextInput();
		public var matrixTR:TextInput=new TextInput();
		public var matrixML:TextInput=new TextInput();
		public var matrixMC:TextInput=new TextInput();
		public var matrixMR:TextInput=new TextInput();
		public var matrixBL:TextInput=new TextInput();
		public var matrixBC:TextInput=new TextInput();
		public var matrixBR:TextInput=new TextInput();
		public var divisorValue:TextInput=new TextInput();
		public var colorValue:ColorPicker=new ColorPicker();
		public var alphaValue:ComboSlider=new ComboSlider();
		public var biasValue:TextInput=new TextInput();
		public var clampValue:CheckBox=new CheckBox();
		public var preserveAlphaValue:CheckBox=new CheckBox();
		
		
		// ------- Constructor -------
		public function ConvolutionPanel()
		{
			initshow();
			addEventListener(Event.ADDED, setupChildren);
		}
		private function initshow():void
		{
			//初始化显示组件
			addChild(myLables.getALable("矩阵X:3", 96, 26, 75, 22));
			addChild(myLables.getALable("矩阵Y:3", 96, 55, 75, 22));
			
			addChild(myLables.getALable("矩阵:", 194, 10, 50, 22, "right"));
			addChild(myLables.getALable("乘数:", 194, 107, 50, 22, "right"));
			addChild(myLables.getALable("斜纹:", 270, 107, 50, 22, "right"));
			
			addChild(myLables.getALable("颜色:", 435, 10, 50, 22, "right"));
			addChild(myLables.getALable("透明:", 505, 10, 50, 22, "right"));
			
			initInput(matrixTL, 248, 10);
			initInput(matrixML, 248, 39);
			initInput(matrixBL, 248, 68);
			
			initInput(divisorValue, 248, 107,"1");
			
			initInput(matrixTC, 287, 10);
			initInput(matrixMC, 287, 39,"1");
			initInput(matrixBC, 287, 68);
			
			initInput(matrixTR, 326, 10);
			initInput(matrixMR, 326, 39);
			initInput(matrixBR, 326, 68);
			
			initInput(biasValue, 326, 107);
			
			colorValue.x = 489;
			colorValue.y = 10;
			colorValue.width = 24;
			colorValue.height = 24;
			colorValue.selectedColor = 0x000000;
			addChild(colorValue);
			
			alphaValue.x = 560;
			alphaValue.y = 10;
			alphaValue.width = 47;
			alphaValue.height = 22;
			alphaValue.interval = 0.05;
			alphaValue.maximum = 1;
			addChild(alphaValue);
			
			clampValue.x = 485;
			clampValue.y = 43;
			clampValue.width = 100;
			clampValue.height = 22;
			clampValue.label = "固定";
			clampValue.labelPlacement = "right";
			clampValue.selected = true;
			addChild(clampValue);
			
			preserveAlphaValue.x = 485;
			preserveAlphaValue.y = 72;
			preserveAlphaValue.width = 100;
			preserveAlphaValue.height = 22;
			preserveAlphaValue.label = "保持透明";
			preserveAlphaValue.labelPlacement = "right";
			preserveAlphaValue.selected = true;
			addChild(preserveAlphaValue);
		}
		
		private function initInput(myin:TextInput, x:Number, y:Number, text:String = "0"):void
		{
			//初始化输入框
			myin.x = x;
			myin.y = y;
			myin.restrict = "0-9\-\.";
			myin.text = text;
			myin.width = 32;
			myin.height = 22;
			addChild(myin);
		}
		
		// ------- Public Properties -------
		public function get filterFactory():IFilterFactory
		{
			return _filterFactory;
		}
		
		
		// ------- Public methods -------
		public function resetForm():void
		{
			setPreset("0", "0", "0", "0", "1", "0", "0", "0", "0", "1", "0", true);
			alphaValue.value = 0;
			clampValue.selected = true;
			colorValue.selectedColor = 0x000000;
			presetChooser.selectedIndex = -1;
			
			if (_filterFactory != null)
			{
				_filterFactory.modifyFilter();
			}
		}
		
		
		// ------- Event Handling -------
		private function setupChildren(event:Event):void
		{
			removeEventListener(Event.ADDED, setupChildren);
			
			// create the filter factory
			_filterFactory = new ConvolutionFactory();
			
			// populate the preset chooser combo box
			var presetList:DataProvider = new DataProvider();
			presetList.addItem({label:"无", data:NONE});
			presetList.addItem({label:"向左浮动", data:SHIFT_LEFT});
			presetList.addItem({label:"相似浮动", data:SHIFT_UP});
			presetList.addItem({label:"模糊", data:BLUR});
			presetList.addItem({label:"增强", data:ENHANCE});
			presetList.addItem({label:"锐化", data:SHARPEN});
			presetList.addItem({label:"增加对比", data:CONTRAST});
			presetList.addItem({label:"浮雕", data:EMBOSS});
			presetList.addItem({label:"边沿强化", data:EDGE_DETECT});
			presetList.addItem({label:"水平边沿强化", data:HORIZONTAL_EDGE});
			presetList.addItem({label:"竖直边沿强化", data:VERTICAL_EDGE});
			presetChooser.dataProvider = presetList;
			
			// add event listeners for child controls
			presetChooser.addEventListener(Event.CHANGE, choosePreset);
			
			matrixTL.addEventListener(Event.CHANGE, changeFilterValue);
			matrixTC.addEventListener(Event.CHANGE, changeFilterValue);
			matrixTR.addEventListener(Event.CHANGE, changeFilterValue);
			matrixML.addEventListener(Event.CHANGE, changeFilterValue);
			matrixMC.addEventListener(Event.CHANGE, changeFilterValue);
			matrixMR.addEventListener(Event.CHANGE, changeFilterValue);
			matrixBL.addEventListener(Event.CHANGE, changeFilterValue);
			matrixBC.addEventListener(Event.CHANGE, changeFilterValue);
			matrixBR.addEventListener(Event.CHANGE, changeFilterValue);
			divisorValue.addEventListener(Event.CHANGE, changeFilterValue);
			biasValue.addEventListener(Event.CHANGE, changeFilterValue);
			colorValue.addEventListener(ColorPickerEvent.CHANGE, changeNonPresetValue);
			alphaValue.addEventListener(Event.CHANGE, changeNonPresetValue);
			clampValue.addEventListener(MouseEvent.CLICK, changeNonPresetValue);
			preserveAlphaValue.addEventListener(MouseEvent.CLICK, changeFilterValue);
		}
		
		
		private function choosePreset(event:Event):void
		{
			// populate the form values according to the selected preset
			switch (presetChooser.selectedItem.data)
			{
				case NONE:
					setPreset("0", "0", "0", "0", "1", "0", "0", "0", "0", "1", "0", preserveAlphaValue.selected);
					break;
				case SHIFT_LEFT:
					setPreset("0", "0", "0", "0", "0", "1", "0", "0", "0", "1", "0", preserveAlphaValue.selected);
					break;
				case SHIFT_UP:
					setPreset("0", "0", "0", "0", "0", "0", "0", "1", "0", "1", "0", preserveAlphaValue.selected);
					break;
				case BLUR:
					setPreset("0", "1", "0", "1", "1", "1", "0", "1", "0", "5", "0", preserveAlphaValue.selected);
					break;
				case ENHANCE:
					setPreset("0", "-2", "0", "-2", "20", "-2", "0", "-2", "0", "10", "-40", preserveAlphaValue.selected);
					break;
				case SHARPEN:
					setPreset("0", "-1", "0", "-1", "5", "-1", "0", "-1", "0", "1", "0", preserveAlphaValue.selected);
					break;
				case CONTRAST:
					setPreset("0", "0", "0", "0", "2", "0", "0", "0", "0", "1", "-255", preserveAlphaValue.selected);
					break;
				case EMBOSS:
					setPreset("-2", "-1", "0", "-1", "1", "1", "0", "1", "2", "1", "0", preserveAlphaValue.selected);
					break;
				case EDGE_DETECT:
					setPreset("0", "-1", "0", "-1", "4", "-1", "0", "-1", "0", "1", "0", true);
					break;
				case HORIZONTAL_EDGE:
					setPreset("0", "0", "0", "-1", "1", "0", "0", "0", "0", "1", "0", true);
					break;
				case VERTICAL_EDGE:
					setPreset("0", "-1", "0", "0", "1", "0", "0", "0", "0", "1", "0", true);
					break;
			}
			
			updateFilter();
		}
		
		
		private function changeFilterValue(event:Event):void
		{
			// verify that the values are valid
			if (matrixTL.text.length <= 0) { return; }
			if (matrixTC.text.length <= 0) { return; }
			if (matrixTR.text.length <= 0) { return; }
			if (matrixML.text.length <= 0) { return; }
			if (matrixMC.text.length <= 0) { return; }
			if (matrixMR.text.length <= 0) { return; }
			if (matrixBL.text.length <= 0) { return; }
			if (matrixBC.text.length <= 0) { return; }
			if (matrixBR.text.length <= 0) { return; }
			if (divisorValue.text.length <= 0) { return; }
			if (biasValue.text.length <= 0) { return; }
			
			// clear the presets drop-down
			presetChooser.selectedIndex = -1;
			
			// update the filter
			updateFilter();
		}
		
		
		private function changeNonPresetValue(event:Event):void
		{
			// update the filter, but don't clear the preset
			updateFilter();
		}
			
			
		// ------- Private methods -------
		private function updateFilter():void
		{
			var alpha:Number = alphaValue.value;
			var bias:Number = Number(biasValue.text);
			var clamp:Boolean = clampValue.selected;
			var color:uint = colorValue.selectedColor;
			var divisor:Number = Number(divisorValue.text);
			var matrix:Array = [Number(matrixTL.text), Number(matrixTC.text), Number(matrixTR.text),
								 Number(matrixML.text), Number(matrixMC.text), Number(matrixMR.text),
								 Number(matrixBL.text), Number(matrixBC.text), Number(matrixBR.text)];
			var matrixX:Number = matrixXValue;
			var matrixY:Number = matrixYValue;
			var preserveAlpha:Boolean = preserveAlphaValue.selected;
			
			_filterFactory.modifyFilter(matrixX, matrixY, matrix, divisor, bias, preserveAlpha, clamp, color, alpha);
		}
		
		
		private function setPreset(tl:String, tc:String, tr:String,
									 ml:String, mc:String, mr:String,
									 bl:String, bc:String, br:String,
									 divisor:String,
									 bias:String,
									 preserveAlpha:Boolean):void
		{
			matrixTL.text = tl;
			matrixTC.text = tc;
			matrixTR.text = tr;
			matrixML.text = ml;
			matrixMC.text = mc;
			matrixMR.text = mr;
			matrixBL.text = bl;
			matrixBC.text = bc;
			matrixBR.text = br;
			divisorValue.text = divisor;
			biasValue.text = bias;
			preserveAlphaValue.selected = preserveAlpha;
		}
	}
}