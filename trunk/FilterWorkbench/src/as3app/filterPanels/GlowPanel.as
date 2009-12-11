package as3app.filterPanels
{
	import com.adobe.examples.flash.ComboSlider;
	import com.example.programmingas3.filterWorkbench.GlowFactory;
	import com.example.programmingas3.filterWorkbench.IFilterFactory;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	
	import fl.controls.ColorPicker;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
	import fl.controls.CheckBox;
	import fl.data.DataProvider;
	import fl.events.ColorPickerEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.display.Sprite;
	import myLables;
	
	public class GlowPanel extends Sprite implements IFilterPanel
	{
		// ------- Private vars -------
		private var _filterFactory:GlowFactory;
		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var blurXValue:ComboSlider = new ComboSlider();
		public var blurYValue:ComboSlider = new ComboSlider();
		public var strengthValue:ComboSlider = new ComboSlider();
		public var qualityValue:ComboBox = new ComboBox();
		public var colorValue:ColorPicker = new ColorPicker();
		public var alphaValue:ComboSlider = new ComboSlider();
		public var knockoutValue:CheckBox = new CheckBox();
		public var innerValue:CheckBox = new CheckBox();
		
		
		// ------- Constructor -------
		public function GlowPanel()
		{
			initshow();
			addEventListener(Event.ADDED, setupChildren);
		}
		private function initshow():void
		{
			//初始化显示组件
			addChild(myLables.getALable("X轴模糊:", 120, 6, 50, 22, "right"));
			addChild(myLables.getALable("Y轴模糊:", 120, 34, 50, 22, "right"));
			addChild(myLables.getALable("强度:", 120, 62, 50, 22, "right"));
			addChild(myLables.getALable("品质:", 120, 90, 50, 22, "right"));
			
			addChild(myLables.getALable("颜色:", 307, 6, 50, 22, "right"));
			addChild(myLables.getALable("透明:", 307, 34, 50, 22, "right"));
			
			blurXValue.x = 180;
			blurXValue.y = 6;
			blurXValue.width = 47;
			blurXValue.height = 22;
			blurXValue.maximum = 255;
			blurXValue.value = 4;
			addChild(blurXValue);
			
			blurYValue.x = 180;
			blurYValue.y = 34;
			blurYValue.width = 47;
			blurYValue.height = 22;
			blurYValue.maximum = 255;
			blurYValue.value = 4;
			addChild(blurYValue);
			
			strengthValue.x = 180;
			strengthValue.y = 62;
			strengthValue.width = 47;
			strengthValue.height = 22;
			strengthValue.maximum = 255;
			strengthValue.value = 1;
			addChild(strengthValue);
			
			qualityValue.x = 180;
			qualityValue.y = 90;
			qualityValue.width = 75;
			qualityValue.height = 22;
			addChild(qualityValue);
			
			colorValue.x = 367;
			colorValue.y = 6;
			colorValue.width = 24;
			colorValue.height = 24;
			colorValue.selectedColor = 0xFF0000;
			addChild(colorValue);
			
			alphaValue.x = 367;
			alphaValue.y = 34;
			alphaValue.width = 47;
			alphaValue.height = 22;
			alphaValue.interval = 0.05;
			alphaValue.maximum = 1;
			alphaValue.value = 1;
			addChild(alphaValue);
			
			knockoutValue.x = 470;
			knockoutValue.y = 6;
			knockoutValue.width = 110;
			knockoutValue.height = 22;
			knockoutValue.label = "强烈";
			addChild(knockoutValue);
			
			
			innerValue.x = 470;
			innerValue.y = 34;
			innerValue.width = 110;
			innerValue.height = 22;
			innerValue.label = "内发光";
			addChild(innerValue);
		}
		
		// ------- Public Properties -------
		public function get filterFactory():IFilterFactory
		{
			return _filterFactory;
		}
		
		
		// ------- Public methods -------
		public function resetForm():void
		{
			blurXValue.value = 6;
			blurYValue.value = 6;
			strengthValue.value = 2;
			qualityValue.selectedIndex = 0;
			colorValue.selectedColor = 0xFF0000;
			alphaValue.value = 1;
			knockoutValue.selected = false;
			innerValue.selected = false;
			
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
			_filterFactory = new GlowFactory();
			
			// populate the quality combo box
			var qualityList:DataProvider = new DataProvider();
			qualityList.addItem({label:"低", data:BitmapFilterQuality.LOW});
			qualityList.addItem({label:"中", data:BitmapFilterQuality.MEDIUM});
			qualityList.addItem({label:"高", data:BitmapFilterQuality.HIGH});
			qualityValue.dataProvider = qualityList;
			
			// add event listeners for child controls
			blurXValue.addEventListener(Event.CHANGE, changeFilterValue);
			blurYValue.addEventListener(Event.CHANGE, changeFilterValue);
			strengthValue.addEventListener(Event.CHANGE, changeFilterValue);
			qualityValue.addEventListener(Event.CHANGE, changeFilterValue);
			colorValue.addEventListener(ColorPickerEvent.CHANGE, changeFilterValue);
			alphaValue.addEventListener(Event.CHANGE, changeFilterValue);
			knockoutValue.addEventListener(MouseEvent.CLICK, changeFilterValue);
			innerValue.addEventListener(MouseEvent.CLICK, changeFilterValue);
		}
		
		
		private function changeFilterValue(event:Event):void
		{
			// update the filter
			updateFilter();
		}
		
		
		// ------- Private methods -------
		private function updateFilter():void
		{
			var blurX:Number = blurXValue.value;
			var blurY:Number = blurYValue.value;
			var strength:Number = strengthValue.value;
			var quality:int = qualityValue.selectedItem.data;
			var color:uint = colorValue.selectedColor;
			var alpha:Number = alphaValue.value;
			var knockout:Boolean = knockoutValue.selected;
			var inner:Boolean = innerValue.selected;
			
			_filterFactory.modifyFilter(color, alpha, blurX, blurY, strength, quality, inner, knockout);
		}
	}
}