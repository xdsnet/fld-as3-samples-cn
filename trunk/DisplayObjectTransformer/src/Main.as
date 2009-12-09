package 
{
	import fl.controls.Button;
	import fl.controls.RadioButton;
	import fl.controls.Slider;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.display.Shape;
	import flash.display.Loader;
	import myLables;
	import flash.events.MouseEvent;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import fl.events.SliderEvent;
	import com.example.programmingas3.geometry.MatrixTransformer;
	import flash.geom.Matrix;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var xScaleSlider:Slider = new Slider();
		private var yScaleSlider:Slider = new Slider();
		private var dxSlider:Slider = new Slider();
		private var dySlider:Slider = new Slider();
		private var rotationSlider:Slider = new Slider();
		private var skewSlider:Slider = new Slider();
		private var skewRight:RadioButton = new RadioButton();
		private var skewBottom:RadioButton = new RadioButton();
		private var transformBtn:Button = new Button();
		private var resetTransformBtn:Button = new Button();
		private var img:Loader = new Loader();
		private var imagePanel:Sprite = new Sprite();
		private var tf:TextFormat = new TextFormat();
		private var toolTip:TextField = new TextField();
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			myinit();
			resetFields();

			
			imagePanel.x = 350;
			imagePanel.y = 95;
			addChild(imagePanel);
			
			img.load(new URLRequest("img/Banana.jpg"));
			imagePanel.addChild(img);

			img.contentLoaderInfo.addEventListener(Event.COMPLETE, setImageMask);

			transformBtn.addEventListener(MouseEvent.CLICK, transformDisplayObject);
			resetTransformBtn.addEventListener(MouseEvent.CLICK, resetTransform);
			xScaleSlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			xScaleSlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);
			yScaleSlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			yScaleSlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);
			dxSlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			dxSlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);
			dySlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			dySlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);
			rotationSlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			rotationSlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);
			skewSlider.addEventListener(SliderEvent.THUMB_DRAG,sliderChange);
			skewSlider.addEventListener(SliderEvent.THUMB_RELEASE,sliderRelease);

			
			tf.font = "Verdana";
			tf.size = 10;
			tf.bold = true;
			
			toolTip.background = true;
			toolTip.backgroundColor = 0xFFCC66;
			toolTip.border = true;
			toolTip.borderColor = 0x000000;
			toolTip.multiline = false;
			toolTip.autoSize = "center";
			toolTip.visible = false;
			addChild(toolTip);
		}
		
		private function myinit():void 
		{
			//初始化各个组件及显示标签
			addChild(myLables.getALable("显示对象转换示例", 14, 11, 748, 25.9, "center", true, 18, 0x0));
			addChild(myLables.getALable("ActionScript 3.0:处理几何结构", 15, 38, 746, 18.5, "center"));
			addChild(myLables.getALable("　　Scale（放缩）, Move（移动）, Rotate（旋转）和Skew（斜向变形）", 14, 65, 328.9, 32.5, "left", true, 11));
			addChild(myLables.getALable("　　设置下面的值后点击“转换”按钮，就可在右边观看到图形组合转换效果啦！", 14, 95, 309.9, 32.5, "left", false, 11));
			addChild(myLables.getALable("水平放缩X (%):", 6, 144, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("垂直放缩Y (%):", 6, 178, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("水平位移X (像素):", 6, 212, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("垂直位移 Y (像素):", 6, 246, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("旋转角度 (°):", 6, 280, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("斜向变形模式:", 6, 316, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("斜向变形角度 (°):", 6, 371, 121, 17.3, "right", false, 11));
			addChild(myLables.getALable("图形", 361, 77.8, 207.9, 17.3, "right", false, 11));
			
			xScaleSlider.x = 148.4;
			xScaleSlider.y = 148.9;
			xScaleSlider.width = 172.2;
			xScaleSlider.height = 3;
			xScaleSlider.minimum = 0;
			xScaleSlider.maximum = 200;
			xScaleSlider.value = 100;
			addChild(xScaleSlider);
			
			yScaleSlider.x = 148.4;
			yScaleSlider.y = 184.9;
			yScaleSlider.width = 172.2;
			yScaleSlider.height = 3;
			yScaleSlider.minimum = 0;
			yScaleSlider.maximum = 200;
			yScaleSlider.value = 100;
			addChild(yScaleSlider);
			
			dxSlider.x = 148.4;
			dxSlider.y = 218.9;
			dxSlider.width = 172.2;
			dxSlider.height = 3;
			dxSlider.minimum = -100;
			dxSlider.maximum = 100;
			dxSlider.value = 0;
			addChild(dxSlider);
			
			dySlider.x = 148.4;
			dySlider.y = 252.9;
			dySlider.width = 172.2;
			dySlider.height = 3;
			dySlider.minimum = -100;
			dySlider.maximum = 100;
			dySlider.value = 0;
			addChild(dySlider);
			
			rotationSlider.x = 148.4;
			rotationSlider.y = 289.9;
			rotationSlider.width = 172.2;
			rotationSlider.height = 3;
			rotationSlider.minimum = -360;
			rotationSlider.maximum = 360;
			rotationSlider.value = 0;
			addChild(rotationSlider);
			
			skewSlider.x = 148.4;
			skewSlider.y = 377.3;
			skewSlider.width = 172.2;
			skewSlider.height = 3;
			skewSlider.minimum = -90;
			skewSlider.maximum = 90;
			skewSlider.value = 0;
			addChild(skewSlider);
			
			skewRight.x = 136.9;
			skewRight.y = 315;
			skewRight.width = 181;
			skewRight.height = 22;
			skewRight.label = "右边向下变形";
			skewRight.selected = true;
			addChild(skewRight);
			
			skewBottom.x = 136.9;
			skewBottom.y = 338;
			skewBottom.width = 181;
			skewBottom.height = 22;
			skewBottom.label = "底边向右变形";
			skewBottom.selected = false;
			addChild(skewBottom);
			
			transformBtn.x = 71.3;
			transformBtn.y = 420.4;
			transformBtn.width = 100;
			transformBtn.height = 22;
			transformBtn.label = "转换";
			addChild(transformBtn);
			
			resetTransformBtn.x = 181.3;
			resetTransformBtn.y = 420.4;
			resetTransformBtn.width = 100;
			resetTransformBtn.height = 22;
			resetTransformBtn.label = "复位";
			addChild(resetTransformBtn);
			
		}
		
		function setImageMask(e:Event):void
		{
			// create a rectangluar mask shape
			var maskImage:Shape = new Shape();

			maskImage.graphics.beginFill(0x666666);
			maskImage.graphics.drawRect(0,0,img.content.width,img.content.height);
			maskImage.graphics.endFill();

			var border:Sprite = new Sprite();
			border.graphics.lineStyle(1,0,1);
			border.graphics.drawRect(imagePanel.x,imagePanel.y,img.content.width,img.content.height);
			border.graphics.endFill();
			addChild(border);

			imagePanel.addChild(maskImage);
			imagePanel.mask = maskImage;
		}

		/**
		 * Resets all of the input controls.
		 */
		function resetFields():void 
		{
			xScaleSlider.value = 100;
			yScaleSlider.value = 100;
			dxSlider.value = 0;
			dySlider.value = 0;
			rotationSlider.value = 0;
			skewSlider.value = 0;
		}

		/**
		 * Resets the matrix transformation of the display object, 
		 * and then resets the text input fields.
		 */
		function resetTransform(e:MouseEvent):void {
			img.content.transform.matrix = new Matrix();
			resetFields();
		}

		/**
		* Transforms the matrix and then applies the matrix to the image.
		*
		* Runs the same transformation matrix through successive transformations and then applies
		* the matrix to the image at the very end, which is more efficient than applying after
		* each individual transformation.
		*/
		function transformDisplayObject(e:MouseEvent):void 
		{
			var tempMatrix:Matrix = img.content.transform.matrix;
			
			// defines the skew type code
			var skewSide:String = new String;
			if (skewRight.selected) 
			{
				skewSide = "right"; 
			} 
			else 
			{
				skewSide = "bottom";
			}

			tempMatrix = MatrixTransformer.transform(tempMatrix, 
													 xScaleSlider.value, 
													 yScaleSlider.value,
													 dxSlider.value, 
													 dySlider.value,
													 rotationSlider.value,
													 skewSlider.value, 
													 skewSide );
			
			img.content.transform.matrix = tempMatrix;
		}
		function sliderChange(e:SliderEvent):void {
			var slider:Slider = e.target as Slider;
			var totalSlideRange = slider.maximum - slider.minimum;
			var valueWithinRange = slider.value - slider.minimum;
			var relativePosition = valueWithinRange / totalSlideRange;
			
			toolTip.text = slider.value.toString();
			toolTip.x = slider.x + (slider.width * relativePosition) - (toolTip.width / 2);
			toolTip.y = slider.y - 20;
			toolTip.visible = true;
			toolTip.setTextFormat(tf);
		}
		function sliderRelease(e:SliderEvent):void {
			toolTip.visible = false;	
		}

		
		
	}
	
}