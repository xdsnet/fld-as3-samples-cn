package as3app.filterPanels
{
	import com.adobe.examples.flash.ComboDial;
	import com.adobe.examples.flash.ComboSlider;
	import com.example.programmingas3.filterWorkbench.ColorStringFormatter;
	import com.example.programmingas3.filterWorkbench.GradientBevelFactory;
	import com.example.programmingas3.filterWorkbench.GradientColor;
	import com.example.programmingas3.filterWorkbench.IFilterFactory;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	
	import fl.controls.Button;
	import fl.controls.ComboBox;
	import fl.controls.CheckBox;
	import fl.controls.ColorPicker;
	import fl.controls.DataGrid;
	import fl.controls.dataGridClasses.DataGridColumn;
	import fl.data.DataProvider;
	import fl.events.DataGridEvent;
	import fl.events.DataGridEventReason;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.display.Sprite;
	
	import as3app.BGColorCellRenderer;
	import as3app.ButtonCellRenderer;
	import myLables;
	
	public class GradientBevelPanel extends Sprite implements IFilterPanel
	{
		// ------- Private vars -------
		private var _filterFactory:GradientBevelFactory;
		
		private var _editValue:Number;
		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var blurXValue:ComboSlider = new ComboSlider();
		public var blurYValue:ComboSlider = new ComboSlider();
		public var strengthValue:ComboSlider = new ComboSlider();
		public var qualityValue:ComboBox = new ComboBox();
		public var angleValue:ComboDial = new ComboDial();
		public var distanceValue:ComboSlider = new ComboSlider();
		public var knockoutValue:CheckBox = new CheckBox();
		public var typeValue:ComboBox = new ComboBox();
		public var gradientValues:DataGrid = new DataGrid();
		public var addColorValue:ColorPicker = new ColorPicker();
		public var addAlphaValue:ComboSlider = new ComboSlider();
		public var addRatioValue:ComboSlider = new ComboSlider();
		public var addGradientBtn:Button = new Button();
		
		
		// ------- Constructor -------
		public function GradientBevelPanel()
		{
			initshow();
			addEventListener(Event.ADDED, setupChildren);
		}
		private function initshow():void
		{
			//初始化显示组件
			addChild(myLables.getALable("X轴模糊:", 20, 6, 50, 22, "right"));
			addChild(myLables.getALable("Y轴模糊:", 20, 34, 50, 22, "right"));
			addChild(myLables.getALable("强度:", 20, 62, 50, 22, "right"));
			addChild(myLables.getALable("品质:", 20, 90, 50, 22, "right"));
			
			addChild(myLables.getALable("倾斜率:", 203, -20, 75, 22, "right"));
			
			addChild(myLables.getALable("角度:", 505, 6, 50, 22,"right"));
			addChild(myLables.getALable("距离:", 505, 34, 50, 22,"right"));
			addChild(myLables.getALable("类型:", 505, 90, 50, 22, "right"));
			
			
			blurXValue.x = 80;
			blurXValue.y = 6;
			blurXValue.width = 47;
			blurXValue.height = 22;
			blurXValue.maximum = 255;
			blurXValue.value = 4;
			addChild(blurXValue);
			
			blurYValue.x = 80;
			blurYValue.y = 34;
			blurYValue.width = 47;
			blurYValue.height = 22;
			blurYValue.maximum = 255;
			blurYValue.value = 4;
			addChild(blurYValue);
			
			strengthValue.x = 80;
			strengthValue.y = 62;
			strengthValue.width = 47;
			strengthValue.height = 22;
			strengthValue.maximum = 255;
			strengthValue.value = 1;
			addChild(strengthValue);
			
			qualityValue.x = 80;
			qualityValue.y = 90;
			qualityValue.width = 75;
			qualityValue.height = 22;
			addChild(qualityValue);
			
			gradientValues.x = 203;
			gradientValues.y = 0;
			gradientValues.width = 250;
			gradientValues.headerHeight = 98;
			gradientValues.editable = true;
			gradientValues.headerHeight = 22;
			gradientValues.rowHeight = 24;
			gradientValues.verticalScrollPolicy = "auto";
			addChild(gradientValues);
			
			addColorValue.x = 213;
			addColorValue.y = 104;
			addColorValue.width = 47;
			addColorValue.height = 22;
			addColorValue.selectedColor = 0x000000;
			addChild(addColorValue);
			
			addAlphaValue.x = 275;
			addAlphaValue.y = 104;
			addAlphaValue.width = 47;
			addAlphaValue.height = 22;
			addAlphaValue.interval = 0.05;
			addAlphaValue.maximum = 1;
			addAlphaValue.value = 1;
			addChild(addAlphaValue);
			
			addRatioValue.x = 332;
			addRatioValue.y = 104;
			addRatioValue.width = 47;
			addRatioValue.height = 22;
			addRatioValue.maximum = 255;
			addRatioValue.value = 128;
			addChild(addRatioValue);
			
			addGradientBtn.x = 386;
			addGradientBtn.y = 104;
			addGradientBtn.width = 60;
			addGradientBtn.height = 22;
			addGradientBtn.label = "添加";
			addChild(addGradientBtn);
			
			angleValue.x = 565;
			angleValue.y = 6;
			angleValue.width = 55;
			angleValue.height = 22;
			angleValue.maximum = 359;
			angleValue.value = 45;
			addChild(angleValue);
			
			distanceValue.x = 565;
			distanceValue.y = 34;
			distanceValue.width = 47;
			distanceValue.height = 22;
			distanceValue.maximum = 8;
			distanceValue.value = 4;
			addChild(distanceValue);
			
			knockoutValue.x = 480;
			knockoutValue.y = 62;
			knockoutValue.width = 100;
			knockoutValue.height = 22;
			knockoutValue.label = "强烈:";
			addChild(knockoutValue);
			
			typeValue.x = 565;
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
			angleValue.value = 45;
			distanceValue.value = 4;
			knockoutValue.selected = false;
			typeValue.selectedIndex = 0;
			gradientValues.dataProvider = getDefaultGradientValues();
			addColorValue.selectedColor = 0x000000;
			addAlphaValue.value = 1;
			addRatioValue.value = 128;
			
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
			_filterFactory = new GradientBevelFactory();
			
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
						
			// populate the gradient colors grid
			gradientValues.dataProvider = getDefaultGradientValues();
			var colorColumn:DataGridColumn = new DataGridColumn("Colors");
			colorColumn.cellRenderer = BGColorCellRenderer;
			colorColumn.dataField = "color";
			colorColumn.labelFunction = colorFormatter;
			colorColumn.resizable = false;
			colorColumn.width = 70;
			gradientValues.addColumn(colorColumn);
			var alphaColumn:DataGridColumn = new DataGridColumn("Alphas");
			alphaColumn.cellRenderer = BGColorCellRenderer;
			alphaColumn.dataField = "alpha";
			alphaColumn.resizable = false;
			alphaColumn.width = 55;
			gradientValues.addColumn(alphaColumn);
			var ratioColumn:DataGridColumn = new DataGridColumn("Ratios");
			ratioColumn.cellRenderer = BGColorCellRenderer;
			ratioColumn.dataField = "ratio";
			ratioColumn.resizable = false;
			ratioColumn.sortOptions = Array.NUMERIC;
			ratioColumn.width = 55;
			gradientValues.addColumn(ratioColumn);
			var deleteColumn:DataGridColumn = new DataGridColumn(" ");
			deleteColumn.cellRenderer = ButtonCellRenderer;
			deleteColumn.labelFunction = deleteButtonLabelFunction;
			deleteColumn.editable = false;
			gradientValues.addColumn(deleteColumn);
			
			
			// add event listeners for child controls
			blurXValue.addEventListener(Event.CHANGE, changeFilterValue);
			blurYValue.addEventListener(Event.CHANGE, changeFilterValue);
			strengthValue.addEventListener(Event.CHANGE, changeFilterValue);
			qualityValue.addEventListener(Event.CHANGE, changeFilterValue);
			angleValue.addEventListener(Event.CHANGE, changeFilterValue);
			distanceValue.addEventListener(Event.CHANGE, changeFilterValue);
			knockoutValue.addEventListener(MouseEvent.CLICK, changeFilterValue);
			typeValue.addEventListener(Event.CHANGE, changeFilterValue);
			
			addGradientBtn.addEventListener(MouseEvent.CLICK, addNewGradient);
			
			// This one gets called before the datagrid updates the dataprovider (which happens in this same
			// event, with priority -20).
			gradientValues.addEventListener(DataGridEvent.ITEM_EDIT_END, editPreEnd, false, 100);
			// This one gets called after the datagrid updates the dataprovider.
			gradientValues.addEventListener(DataGridEvent.ITEM_EDIT_END, editPostEnd, false, -100);
			
			// Click handler for datagrid, to detect when the delete button is pressed
			gradientValues.addEventListener(MouseEvent.CLICK, checkForItemDelete);
		}
		
		
		// Called after editing ends in a datagrid cell, but before the dataprovider is updated.
		private function editPreEnd(event:DataGridEvent):void
		{
			if (event.reason == DataGridEventReason.CANCELLED)
			{
				return;
			}
			// save a snapshot of the pre-change data
			_editValue = gradientValues.dataProvider.getItemAt(Number(event.rowIndex))[event.dataField];
		}
		
		
		// Called after editing ends in a datagrid cell, and after the dataprovider is updated.
		private function editPostEnd(event:DataGridEvent):void
		{
			if (event.reason == DataGridEventReason.CANCELLED)
			{
				return;
			}
			
			var index:Number = Number(event.rowIndex);
			var data:GradientColor = gradientValues.dataProvider.getItemAt(index) as GradientColor;
			var newValue:Number = data[event.dataField];
			if (newValue == _editValue)
			{
				return;
			}
			// validate the changed data
			var needToRevert:Boolean = false;
			
			if (isNaN(newValue))
			{
				needToRevert = true;
			}
			else
			{
				switch (event.dataField)
				{
					case "color":
						if (newValue < 0) { needToRevert = true; }
						break;
					case "alpha":
						if (newValue > 1 || newValue < 0) { needToRevert = true; }
						break;
					case "ratio":
						if (newValue > 255 || newValue < 0) { needToRevert = true; }
						break;
				}
			}
			
			if (needToRevert)
			{
				data[event.dataField] = _editValue;
				gradientValues.dataProvider.replaceItemAt(data, index);
				return;
			}
			
			// resort the data if the ratio changed
			if (event.dataField == "ratio")
			{
				gradientValues.dataProvider.sortOn("ratio", Array.NUMERIC);
			}
			
			// update the filter
			updateFilter();
		}
		
		
		private function checkForItemDelete(event:MouseEvent):void
		{
			var cell:ButtonCellRenderer = event.target as ButtonCellRenderer;
			if (cell != null)
			{
				gradientValues.dataProvider.removeItem(cell.data);
				updateFilter();
			}
		}
		
		
		private function changeFilterValue(event:Event):void
		{
			// update the filter
			updateFilter();
		}
		
		
		private function addNewGradient(event:MouseEvent):void
		{
			var gradient:GradientColor = new GradientColor(addColorValue.selectedColor, addAlphaValue.value, addRatioValue.value);
			gradientValues.dataProvider.addItem(gradient);
			gradientValues.dataProvider.sortOn("ratio", Array.NUMERIC);
			updateFilter();
		}
		
		
		// ------- DataGrid utility methods -------
		private function colorFormatter(data:Object):String
		{
			var c:GradientColor = data as GradientColor;
			if (c != null)
			{
				return ColorStringFormatter.formatColorHex24(c.color);
			}
			else
			{
				return "";
			}
		}
		
		
		private function deleteButtonLabelFunction(data:Object):String
		{
			return "Delete";
		}
		
		
		// ------- Private methods -------
		private function updateFilter():void
		{
			var blurX:Number = blurXValue.value;
			var blurY:Number = blurYValue.value;
			var strength:Number = strengthValue.value;
			var quality:int = qualityValue.selectedItem.data;
			var angle:Number = angleValue.value;
			var distance:Number = distanceValue.value;
			var knockout:Boolean = knockoutValue.selected;
			var type:String = typeValue.selectedItem.data;
			var colors:Array = gradientValues.dataProvider.toArray();
			
			_filterFactory.modifyFilter(distance, angle, colors, blurX, blurY, strength, quality, type, knockout);
		}
		
		
		private static function getDefaultGradientValues():DataProvider
		{
			return new DataProvider([new GradientColor(0xFFFFFF, 1, 0),
									  new GradientColor(0xFF0000, .25, 128),
									  new GradientColor(0x000000, 1, 255)]);
		}
	}
}