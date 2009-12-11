package as3app
{
	import com.example.programmingas3.filterWorkbench.FilterWorkbenchController;
	import com.example.programmingas3.filterWorkbench.IFilterPanel;
	import com.example.programmingas3.filterWorkbench.ImageType;
	
	import fl.controls.Button;
	import fl.controls.ComboBox;
	import fl.controls.TextArea;
	
    import flash.display.LineScaleMode;
    import flash.display.CapsStyle;
    import flash.display.JointStyle;
    import flash.display.Shape;

	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.text.Font;
	import flash.text.TextFormat;
	
	import as3app.filterPanels.BevelPanel;
	import as3app.filterPanels.BlurPanel;
	import as3app.filterPanels.ColorMatrixPanel;
	import as3app.filterPanels.ConvolutionPanel;
	import as3app.filterPanels.DropShadowPanel;
	import as3app.filterPanels.GlowPanel;
	import as3app.filterPanels.GradientBevelPanel;
	import as3app.filterPanels.GradientGlowPanel;
	
	import fl.data.DataProvider;
	
	import myLables;
	
	/**
	 * This class is the view (the main form) of the Flash version of the FilterWorkbench application
	 */
	public class FilterWorkbench extends Sprite
	{
		// ------- Constants -------
		// --- Filter types ---
		private static const BEVEL:String = "bevel";
		private static const BLUR:String = "blur";
		private static const COLOR_MATRIX:String = "colorMatrix";
		private static const CONVOLUTION:String = "convolution";
		private static const DROP_SHADOW:String = "dropShadow";
		private static const GLOW:String = "glow";
		private static const GRADIENT_BEVEL:String = "gradientBevel";
		private static const GRADIENT_GLOW:String = "gradientGlow";
		
		private static const INSTRUCTIONS_TEXT:String = "选择一个滤镜,则对应的\nActionScript代码会显示在这里.\n\n点击 \"应用并等待组合下一效果\"\n来在关联窗口观看效果.";

		
		// ------- Child Controls -------
		// Positioned and created within FilterWorkbench.fla
		public var filterPicker:ComboBox;
		public var filterTargetPicker:ComboBox;
		public var applyFilterBtn:Button;
		public var imageContainer:ImageContainer;
		public var codeDisplay:TextArea;
		
		// Created in code
		private var _filterFormContainer:Sprite;
		
		// Filter Panels
		private var _bevelPanel:BevelPanel;
		private var _blurPanel:BlurPanel;
		private var _colorMatrixPanel:ColorMatrixPanel;
		private var _convolutionPanel:ConvolutionPanel;
		private var _dropShadowPanel:DropShadowPanel;
		private var _glowPanel:GlowPanel;
		private var _gradientBevelPanel:GradientBevelPanel;
		private var _gradientGlowPanel:GradientGlowPanel;
		
		// Model-View-Controller
		private var _controller:FilterWorkbenchController;
		
		public function FilterWorkbench()
		{
			addEventListener(Event.ADDED, setupChildren);
		}
		
		// ------- Event Handling -------
		private function setupChildren(event:Event):void
		{
			removeEventListener(Event.ADDED, setupChildren);
			
			this.graphics.lineStyle(1, 0x0, 1, false, LineScaleMode.VERTICAL, CapsStyle.NONE, JointStyle.MITER, 3);
			this.graphics.moveTo(20,325);
			this.graphics.lineTo(700,325);
							  
			
			addChild(myLables.getALable("滤镜(Filter)工作台例子", 110, 0, 500, 25.9, "center", true, 18));
			addChild(myLables.getALable("ActionScript 3.0:显示对象滤镜效果", 110, 27, 500,22, "center"));
			
			addChild(myLables.getALable("图像源:", 20, 51, 75, 22, "right"));
			addChild(myLables.getALable("滤镜(Fiter):", 307.8, 51, 76.1, 22, "right"));
			
			addChild(myLables.getALable("滤镜属性", 25, 335, 60.3, 19.3, "right", false, 14));
			
			imageContainer = new ImageContainer();
			imageContainer.x = 20;
			imageContainer.y = 80;
			addChild(imageContainer);
			
			filterTargetPicker = new ComboBox();
			filterTargetPicker.x = 105;
			filterTargetPicker.y = 51;
			filterTargetPicker.width = 191.9;
			filterTargetPicker.height = 22;
			addChild(filterTargetPicker);
			
			filterPicker = new ComboBox();
			filterPicker.x = 381.9;
			filterPicker.y = 51;
			filterPicker.width = 155.2;
			filterPicker.height = 22;
			addChild(filterPicker);
			
			applyFilterBtn = new Button();
			applyFilterBtn.x = 537;
			applyFilterBtn.y = 51;
			applyFilterBtn.width = 150;
			applyFilterBtn.height = 22;
			applyFilterBtn.label = "应用并等待组合下一效果";
			addChild(applyFilterBtn);
			
			codeDisplay = new TextArea();
			codeDisplay.x = 370;
			codeDisplay.y = 80;
			codeDisplay.width = 330;
			codeDisplay.height = 230;
			addChild(codeDisplay);
			
			
			// create the filter panels
			_bevelPanel = new BevelPanel();
			_blurPanel = new BlurPanel();
			_colorMatrixPanel = new ColorMatrixPanel();
			_convolutionPanel = new ConvolutionPanel();
			_dropShadowPanel = new DropShadowPanel();
			_glowPanel  = new GlowPanel();
			_gradientBevelPanel = new GradientBevelPanel();
			_gradientGlowPanel = new GradientGlowPanel();

			// add the placeholder for the filter properties panels
			_filterFormContainer = new Sprite();
			_filterFormContainer.x = 30;
			_filterFormContainer.y = 360;
			addChild(_filterFormContainer);
			
			// set up data and events for the controls
			var filterList:DataProvider = new DataProvider();
			filterList.addItem({label:"<无>", data:null});
			filterList.addItem({label:"斜角(Bevel)", data:BEVEL});
			filterList.addItem({label:"模糊(Blur)", data:BLUR});
			filterList.addItem({label:"颜色矩阵(Color matrix)", data:COLOR_MATRIX});
			filterList.addItem({label:"卷积(Convolution)", data:CONVOLUTION});
			filterList.addItem({label:"投影(Drop shadow)", data:DROP_SHADOW});
			filterList.addItem({label:"发光(Glow)", data:GLOW});
			filterList.addItem({label:"渐变斜角(Gradient bevel)", data:GRADIENT_BEVEL});
			filterList.addItem({label:"渐变发光(Gradient glow)", data:GRADIENT_GLOW});
			filterPicker.dataProvider = filterList;
			
			filterPicker.addEventListener(Event.CHANGE, setFilter);
			
			var imageList:DataProvider = new DataProvider(ImageType.getImageTypes());
			filterTargetPicker.labelField = "name";
			filterTargetPicker.dropdown.iconField = null;
			filterTargetPicker.dataProvider = imageList;
			filterTargetPicker.selectedIndex = 0;
			
			filterTargetPicker.addEventListener(Event.CHANGE, setImage);
			
			applyFilterBtn.enabled = false;
			applyFilterBtn.addEventListener(MouseEvent.CLICK, applyFilter);
			
			var codeFont:String = getCodeFont();
			
			var codeFormat:TextFormat = new TextFormat(codeFont);
			codeDisplay.setStyle("textFormat", codeFormat);
			codeDisplay.text = INSTRUCTIONS_TEXT;
			
			// create the controller for the app
			_controller = new FilterWorkbenchController();
			_controller.addEventListener(ProgressEvent.PROGRESS, imageLoadProgress);
			_controller.addEventListener(Event.COMPLETE, imageLoadComplete);
			_controller.addEventListener(Event.CHANGE, updateCode);
			
			// load the first image
			_controller.setFilterTarget(filterTargetPicker.selectedItem as ImageType);
		}
		
		
		private function setFilter(event:Event):void
		{
			setupSelectedFilter();
		}
		
		
		private function setImage(event:Event):void
		{
			var imageType:ImageType = filterTargetPicker.selectedItem as ImageType;
			
			if (imageType == null) { return; }
			
			// remove the previous image
			if (imageContainer.hasImage)
			{
				imageContainer.removeImage();
			}
			
			// Show the progress bar in the mean time
			
			// Start the image loading
			_controller.setFilterTarget(imageType);
			
			resetForm();
		}
		
		
		private function applyFilter(event:MouseEvent):void
		{
			if (filterPicker.selectedIndex > 0 )
			{
				_controller.applyFilter();
				resetForm();
			}
		}
		
		
		private function updateCode(event:Event):void
		{
			codeDisplay.text = _controller.getCode();
		}
		
		
		private function imageLoadProgress(event:ProgressEvent):void
		{
			// Update the progress bar
		}
		
		
		private function imageLoadComplete(event:Event):void
		{
			// Clear away the progress bar and display the image
			var image:DisplayObject = _controller.getFilterTarget();
			imageContainer.addImage(image); 
		}
		
		
		// ------- Private methods -------
		private function resetForm():void
		{
			filterPicker.selectedIndex = 0;
			hideFilterForm();
			applyFilterBtn.enabled = false;
		}
		
		
		private function hideFilterForm():void
		{
			if (_filterFormContainer.numChildren > 0)
			{
				_filterFormContainer.removeChildAt(0);
			}
		}
		
		
		private function setupSelectedFilter():void
		{
			hideFilterForm();
			
			var filterPanel:IFilterPanel;
			
			if (filterPicker.selectedIndex <= 0)
			{
				applyFilterBtn.enabled = false;
				_controller.setFilter(null);
				return;
			}
			
			applyFilterBtn.enabled = true;
			
			switch (filterPicker.selectedItem.data)
			{
				case BEVEL:
					filterPanel = _bevelPanel;
					break;
				case BLUR:
					filterPanel = _blurPanel;
					break;
				case COLOR_MATRIX:
					filterPanel = _colorMatrixPanel;
					break;
				case CONVOLUTION:
					filterPanel = _convolutionPanel;
					break;
				case DROP_SHADOW:
					filterPanel = _dropShadowPanel;
					break;
				case GLOW:
					filterPanel = _glowPanel;
					break;
				case GRADIENT_BEVEL:
					filterPanel = _gradientBevelPanel;
					break;
				case GRADIENT_GLOW:
					filterPanel = _gradientGlowPanel;
					break;
			}
			
			var panelDO:DisplayObject;
			if ((panelDO = filterPanel as DisplayObject) != null)
			{
				_filterFormContainer.addChild(panelDO);
			}
			filterPanel.resetForm();
			_controller.setFilter(filterPanel.filterFactory);
		}
		
		
		private function getCodeFont():String
		{
			// set the code font based on the user's machine.
			// Priority order:
			// - Andale Mono
			// - Monaco
			// - Courier New
			// - Courier
			// - _typewriter (one of Flash's defaults, not a real font)
			var result:String;
			var allFonts:Array = Font.enumerateFonts(true);
			allFonts.sortOn("fontName", Array.CASEINSENSITIVE);
			
			for each (var font:Font in allFonts)
			{
				if (font.fontName == "Andale Mono")
				{
					result = "Andale Mono";
					break;
				}
				else if (font.fontName == "Monaco")
				{
					result = "Monaco";
					break;
				}
				else if (font.fontName == "Courier New")
				{
					result = "Courier New";
				}
				else if (result == null && font.fontName == "Courier")
				{
					result = "Courier";
				}
				else if (font.fontName.substr(0, 1) > "M")
				{
					result = "_typewriter";
					break;
				}
				result = "_typewriter";
			}
			
			return result;
		}
	}
}