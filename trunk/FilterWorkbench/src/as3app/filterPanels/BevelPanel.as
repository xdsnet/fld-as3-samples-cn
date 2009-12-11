package as3app.filterPanels
{
	import com.adobe.examples.flash.ComboDial;
	import com.adobe.examples.flash.ComboSlider;
	import com.example.programmingas3.filterWorkbench.BevelFactory;
	import com.example.programmingas3.filterWorkbench.IFilterFactory;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	
	import fl.controls.ColorPicker;
	import fl.controls.ComboBox;
	import fl.controls.TextInput;
	import fl.controls.CheckBox;
	import fl.data.DataProvider;
	import fl.events.ColorPickerEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.display.Sprite;
	import myLables;
	
	public class BevelPanel extends Sprite implements IFilterPanel
	{
		// ------- Private vars -------
		private var _filterFactory:BevelFactory;
		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var blurXValue:ComboSlider=new ComboSlider();
		public var blurYValue:ComboSlider = new ComboSlider();
		public var strengthValue:ComboSlider=new ComboSlider();
		public var qualityValue:ComboBox=new ComboBox();
		public var shadowColorValue:ColorPicker=new ColorPicker();
		public var shadowAlphaValue:ComboSlider=new ComboSlider();
		public var highlightColorValue:ColorPicker=new ColorPicker();
		public var highlightAlphaValue:ComboSlider=new ComboSlider();
		public var angleValue:ComboDial=new ComboDial();
		public var distanceValue:TextInput=new TextInput();
		public var knockoutValue:CheckBox=new CheckBox();
		public var typeValue:ComboBox=new ComboBox();
		
		
		// ------- Constructor -------
		public function BevelPanel()
		{
			initshow();
			addEventListener(Event.ADDED, setupChildren);
		}
		
		private function initshow():void
		{
			//初始化显示组件
			addChild(myLables.getALable("X轴模糊:", 120, 6, 50, 22,"right"));
			addChild(myLables.getALable("Y轴模糊:", 120, 34, 50, 22,"right"));
			addChild(myLables.getALable("强度:", 120, 62, 50, 22,"right"));
			addChild(myLables.getALable("品质:", 120, 90, 550, 22, "right"));
			
			addChild(myLables.getALable("高亮颜色:", 302, 6, 75, 22,"right"));
			addChild(myLables.getALable("高亮透明度:", 302, 34, 75, 22,"right"));
			addChild(myLables.getALable("阴影颜色:", 302, 62, 75, 22,"right"));
			addChild(myLables.getALable("阴影透明度:", 302, 90, 75, 22, "right"));
			
			addChild(myLables.getALable("角度:", 490, 6, 50, 22,"right"));
			addChild(myLables.getALable("距离:", 490, 34, 50, 22,"right"));
			addChild(myLables.getALable("类型:", 490, 90, 50, 22, "right"));
			
			blurXValue.x = 180.1;
			blurXValue.y = 6;
			blurXValue.width = 47;
			blurXValue.height = 22;
			blurXValue.maximum = 255;
			blurXValue.value = 4;
			addChild(blurXValue);
			
			blurYValue.x = 180.1;
			blurYValue.y = 34;
			blurYValue.width = 47;
			blurYValue.height = 22;
			blurYValue.maximum = 255;
			blurYValue.value = 4;
			addChild(blurYValue);
			
			strengthValue.x = 180.1;
			strengthValue.y = 62;
			strengthValue.width = 47;
			strengthValue.height = 22;
			strengthValue.maximum = 255;
			strengthValue.value = 1;
			addChild(strengthValue);
			
			qualityValue.x = 180.1;
			qualityValue.y = 90;
			qualityValue.width = 75;
			qualityValue.height = 22;
			qualityValue.rowCount = 5;
			addChild(qualityValue);
			
			highlightColorValue.x = 387;
			highlightColorValue.y = 6;
			highlightColorValue.width = 24;
			highlightColorValue.height = 24;
			highlightColorValue.selectedColor = 0xFFFFFF;
			addChild(highlightColorValue);
			
			highlightAlphaValue.x = 387;
			highlightAlphaValue.y = 34;
			highlightAlphaValue.width = 47;
			highlightAlphaValue.height = 22;
			highlightAlphaValue.interval = 0.05;
			highlightAlphaValue.maximum = 1;
			highlightAlphaValue.minimum = 0;
			highlightAlphaValue.value = 1;
			addChild(highlightAlphaValue);
			
			shadowColorValue.x = 387;
			shadowColorValue.y = 62;
			shadowColorValue.width = 24;
			shadowColorValue.height = 24;
			shadowColorValue.selectedColor = 0x000000;
			addChild(shadowColorValue);
			
			shadowAlphaValue.x = 387;
			shadowAlphaValue.y = 90;
			shadowAlphaValue.width = 47;
			shadowAlphaValue.height = 22;
			shadowAlphaValue.interval = 0.05;
			shadowAlphaValue.maximum = 1;
			shadowAlphaValue.minimum = 0;
			shadowAlphaValue.value = 1;
			addChild(shadowAlphaValue);
			
			angleValue.x = 550;
			angleValue.y = 6;
			angleValue.width = 55;
			angleValue.height = 22;
			angleValue.maximum = 359;
			angleValue.value = 45;
			addChild(angleValue);
			
			distanceValue.x = 550;
			distanceValue.y = 34;
			distanceValue.width = 40;
			distanceValue.height = 22;
			distanceValue.restrict = "0-9\-\.";
			distanceValue.text = "4";
			addChild(distanceValue);
			
			knockoutValue.x = 465;
			knockoutValue.y = 62;
			knockoutValue.width = 100;
			knockoutValue.height = 22;
			knockoutValue.label = "强烈:";
			addChild(knockoutValue);
			
			typeValue.x = 550;
			typeValue.y = 90;
			typeValue.width = 68;
			typeValue.height = 22;
			typeValue.rowCount = 5;
			addChild(typeValue);
			
		}
		
		// ------- Public Properties -------
		public function get filterFactory():IFilterFactory
		{
			return _filterFactory;
		}
		
		
		// ------- Public methods -------
		public function resetForm():void
		{
			blurXValue.value = 4;
			blurYValue.value = 4;
			strengthValue.value = 1;
			qualityValue.selectedIndex = 0;
			shadowColorValue.selectedColor = 0x000000;
			shadowAlphaValue.value = 1;
			highlightColorValue.selectedColor = 0xFFFFFF;
			highlightAlphaValue.value = 1;
			angleValue.value = 45;
			distanceValue.text = "4";
			knockoutValue.selected = false;
			typeValue.selectedIndex = 0;
			
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
			_filterFactory = new BevelFactory();
			
			// populate the quality combo box
			var qualityList:DataProvider = new DataProvider();
			qualityList.addItem({label:"低", data:BitmapFilterQuality.LOW});
			qualityList.addItem({label:"中", data:BitmapFilterQuality.MEDIUM});
			qualityList.addItem({label:"高", data:BitmapFilterQuality.HIGH});
			qualityValue.dataProvider = qualityList;
			
			// populate the type combo box
			var typeList:DataProvider = new DataProvider();
			typeList.addItem({label:"内部", data:BitmapFilterType.INNER});
			typeList.addItem({label:"外部", data:BitmapFilterType.OUTER});
			typeList.addItem({label:"内外", data:BitmapFilterType.FULL});
			typeValue.dataProvider = typeList;
						
			// add event listeners for child controls
			blurXValue.addEventListener(Event.CHANGE, changeFilterValue);
			blurYValue.addEventListener(Event.CHANGE, changeFilterValue);
			strengthValue.addEventListener(Event.CHANGE, changeFilterValue);
			qualityValue.addEventListener(Event.CHANGE, changeFilterValue);
			shadowColorValue.addEventListener(ColorPickerEvent.CHANGE, changeFilterValue);
			shadowAlphaValue.addEventListener(Event.CHANGE, changeFilterValue);
			highlightColorValue.addEventListener(ColorPickerEvent.CHANGE, changeFilterValue);
			highlightAlphaValue.addEventListener(Event.CHANGE, changeFilterValue);
			angleValue.addEventListener(Event.CHANGE, changeFilterValue);
			distanceValue.addEventListener(Event.CHANGE, changeFilterValue);
			knockoutValue.addEventListener(MouseEvent.CLICK, changeFilterValue);
			typeValue.addEventListener(Event.CHANGE, changeFilterValue);
		}
		
		
		private function changeFilterValue(event:Event):void
		{
			// verify that the values are valid
			if (distanceValue.text.length <= 0) { return; }
			
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
			var shadowColor:uint = shadowColorValue.selectedColor;
			var shadowAlpha:Number = shadowAlphaValue.value;
			var highlightColor:uint = highlightColorValue.selectedColor;
			var highlightAlpha:Number = highlightAlphaValue.value;
			var angle:Number = angleValue.value;
			var distance:Number = Number(distanceValue.text);
			var knockout:Boolean = knockoutValue.selected;
			var type:String = typeValue.selectedItem.data;
			
			_filterFactory.modifyFilter(distance, angle, highlightColor, highlightAlpha, shadowColor, shadowAlpha, blurX, blurY, strength, quality, type, knockout);
		}
	}
}