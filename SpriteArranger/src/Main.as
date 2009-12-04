package 
{
	import adobe.utils.CustomActions;
	import fl.controls.Button;
	import fl.controls.Label;
	import fl.controls.NumericStepper;
	import fl.controls.TextArea;
	import fl.data.DataProvider;
	import flash.display.Sprite;
	import flash.events.Event;
	import myLables;
	import fl.controls.ComboBox;
	import com.example.programmingas3.SpriteArranger.DrawingCanvas;
	import com.example.programmingas3.geometricshapes.IGeometricShape;
	import com.example.programmingas3.geometricshapes.GeometricShapeFactory;
	import com.example.programmingas3.geometricshapes.RegularPolygon;
	import com.example.programmingas3.SpriteArranger.GeometricSprite;
	import com.example.programmingas3.geometricshapes.Circle;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		private var shapeNameCbo:ComboBox;
		private var canvas:DrawingCanvas;
		private var shapeSizeNs:NumericStepper;
		private var addBtn:Button;
		private var moveToBackBtn:Button;
		private var moveToFrontBtn:Button;
		private var moveUpBtn:Button;
		private var moveDownBtn:Button;
		private var outputTxt:TextArea;
		private var selectedSpriteTxt:Label;
		
		private function addShape(e:MouseEvent):void
		{
			var shapeName:String = shapeNameCbo.selectedItem.data;
			this.canvas.addShape(shapeName, shapeSizeNs.value);
			
			describeShapes(null);
		}

		private function describeShapes(e:MouseEvent):void
		{
			if (GeometricSprite.selectedSprite != null)
			{
				this.selectedSpriteTxt.text = GeometricSprite.selectedSprite.toString();
			}
			this.outputTxt.text = this.canvas.describeChildren();
		} 

		private function moveToBack(e:MouseEvent):void
		{
			if (GeometricSprite.selectedSprite != null)
			{
				this.canvas.moveToBack(GeometricSprite.selectedSprite);
				this.outputTxt.text = this.canvas.describeChildren();
			}
		}

		private function moveDown(e:MouseEvent):void
		{
			if (GeometricSprite.selectedSprite != null)
			{
				this.canvas.moveDown(GeometricSprite.selectedSprite);
				this.outputTxt.text = this.canvas.describeChildren();
			}
		}

		private function moveUp(e:MouseEvent):void
		{
			if (GeometricSprite.selectedSprite != null)
			{
				this.canvas.moveUp(GeometricSprite.selectedSprite);
				this.outputTxt.text = this.canvas.describeChildren();
			}
		}
				
		private function moveToFront(e:MouseEvent):void
		{
			if (GeometricSprite.selectedSprite != null)
			{
				this.canvas.moveToFront(GeometricSprite.selectedSprite);
				this.outputTxt.text = this.canvas.describeChildren();
			}
		}
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			showLabel();
			showOhter();
			
			
			addBtn.addEventListener(MouseEvent.CLICK, addShape);
			moveToBackBtn.addEventListener(MouseEvent.CLICK, moveToBack);
			moveDownBtn.addEventListener(MouseEvent.CLICK, moveDown);
			moveUpBtn.addEventListener(MouseEvent.CLICK, moveUp);
			moveToFrontBtn.addEventListener(MouseEvent.CLICK, moveToFront);
			canvas.addEventListener(MouseEvent.MOUSE_DOWN, describeShapes);
			canvas.addEventListener(MouseEvent.MOUSE_UP, describeShapes);
			canvas.initCanvas(0xFFFFFF, 0xCCCCCC);
			
		}
		
		private function showLabel():void
		{
			addChild(myLables.getALable("精灵对象组织者例子", 14, 11, 511.9, 22, "center", true, 18, 0x0));
			addChild(myLables.getALable("ActionScript 3.0:关于显示的编程", 15, 38, 511.9, 18.5, "center", false, 12, 0x0));
			addChild(myLables.getALable("添加图形:", 40.2, 64.3, 60, 22, "left", false, 11, 0x0));
			addChild(myLables.getALable("尺寸(像素)", 210.3, 64.3, 74, 22, "left", false, 11, 0x0));
			addChild(myLables.getALable("绘制范围:", 37.3, 98.3, 60, 22, "left", false, 11, 0x0));
			addChild(myLables.getALable("子显示对象:", 28.2, 340, 67.1, 22, "left", false, 11, 0x0));
			addChild(myLables.getALable("选择的图形:",42.3,490,66, 22, "left", false, 11, 0x0));
		}

		private function showOhter():void
		{
			shapeNameCbo = new ComboBox();
			shapeNameCbo.x = 102.3;
			shapeNameCbo.y = 62.4;
			shapeNameCbo.width = 100;
			shapeNameCbo.height = 22;
			shapeNameCbo.dataProvider = new DataProvider([ { label:"圆形", data:"Circle"}, { label:"三角形", data:"Triangle"}, { label:"方形", data:"Square"} ]);
			addChild(shapeNameCbo);
			
			shapeSizeNs = new NumericStepper();
			shapeSizeNs.x = 287.3;
			shapeSizeNs.y = 64.3;
			shapeSizeNs.width = 80;
			shapeSizeNs.height = 22;
			shapeSizeNs.maximum = 100;
			shapeSizeNs.value = 50;
			shapeSizeNs.minimum = 10;
			shapeSizeNs.stepSize = 1;
			addChild(shapeSizeNs);
			
			addBtn = new Button();
			addBtn.x = 380.3;
			addBtn.y = 64.3;
			addBtn.width = 100;
			addBtn.height = 22;
			addBtn.label = "添加图形";
			addChild(addBtn);
			
			moveToBackBtn = new Button();
			moveToBackBtn.x = 101.3;
			moveToBackBtn.y = 96.3;
			moveToBackBtn.width = 100;
			moveToBackBtn.height = 22;
			moveToBackBtn.label = "移到最后";
			addChild(moveToBackBtn);
			
			moveToFrontBtn = new Button();
			moveToFrontBtn.x = 206.3;
			moveToFrontBtn.y = 96.3;
			moveToFrontBtn.width = 100;
			moveToFrontBtn.height = 22;
			moveToFrontBtn.label = "移到最前";
			addChild(moveToFrontBtn);
			
			moveUpBtn = new Button();
			moveUpBtn.x = 310.3;
			moveUpBtn.y = 96.3;
			moveUpBtn.width = 100;
			moveUpBtn.height = 22;
			moveUpBtn.label = "向前移";
			addChild(moveUpBtn);
			
			moveDownBtn = new Button();
			moveDownBtn.x = 413.3;
			moveDownBtn.y = 96.3;
			moveDownBtn.width = 100;
			moveDownBtn.height = 22;
			moveDownBtn.label = "向后移";
			addChild(moveDownBtn);
			
			canvas = new DrawingCanvas();
			canvas.x = 19.4;
			canvas.y = 130;
			canvas.width = 1;
			canvas.height = 130;
			addChild(canvas);
			
			outputTxt = new TextArea();
			outputTxt.x = 24.4;
			outputTxt.y = 362.1;
			outputTxt.width = 494;
			outputTxt.height = 70; 
			addChild(outputTxt);
			
			selectedSpriteTxt = new Label();
			selectedSpriteTxt.x = 119.9;
			selectedSpriteTxt.y = 490;
			selectedSpriteTxt.width = 388.1;
			selectedSpriteTxt.height = 22;
			addChild(selectedSpriteTxt);
			
			canvas = new DrawingCanvas();
			canvas.x = 19.4;
			canvas.y = 130;
			addChild(canvas);
		}
		
	}
	
}