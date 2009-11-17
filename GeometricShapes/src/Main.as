package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import btLable;
	import fl.controls.ComboBox;
	import fl.controls.NumericStepper;
	import com.example.programmingas3.geometricshapes.IGeometricShape;
	import com.example.programmingas3.geometricshapes.GeometricShapeFactory;
	import com.example.programmingas3.geometricshapes.RegularPolygon;
	import fl.data.DataProvider;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class Main extends Sprite 
	{
		
	
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
			var currentShape:IGeometricShape;
			var outputTxt:TextField ;
			var shapeNameCbo:ComboBox;
			var shapeWidthNs:NumericStepper;
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			//var mybtLable:btLable = new btLable();
			
			outputTxt= new TextField();
			shapeNameCbo = new ComboBox();
			shapeWidthNs= new NumericStepper();
			
			outputTxt.width = 407;
			outputTxt.height = 184.9;
			outputTxt.x = 73.4;
			outputTxt.y = 184.3;
			outputTxt.border = true;

			
			shapeNameCbo.x = 356.3;
			shapeNameCbo.y = 72.3;
			shapeNameCbo.width = 100;
			shapeNameCbo.height = 22;
			shapeNameCbo.dataProvider = new DataProvider(["圆形", "三角形", "方形"]);
			
			
			
			
			shapeWidthNs.x = 356.3;
			shapeWidthNs.y = 108.3;
			shapeWidthNs.width = 80;
			shapeWidthNs.height = 22;
			shapeWidthNs.maximum = 400;
			shapeWidthNs.minimum = 10;
			shapeWidthNs.stepSize = 10;
			shapeWidthNs.value = 1;
			shapeWidthNs.visible = true;
			
			
			addChild(btLable.TopLable());
			addChild(btLable.TopLable2());
			addChild(btLable.xtLable());
			addChild(btLable.bcLable());
			addChild(btLable.jgLable());
			addChild(outputTxt);
			addChild(shapeNameCbo);
			addChild(shapeWidthNs);
			shapeNameCbo.addEventListener(Event.CHANGE,describeShape);  
			shapeWidthNs.addEventListener(Event.CHANGE, describeShape);
		}
		function describeShape(e:Event):void
		{ 
			var shapeNames:Array = ["Circle", "Triangle", "Square"];
			var shapeName:String = shapeNames[shapeNameCbo.selectedIndex];
			this.currentShape = GeometricShapeFactory.createShape(shapeName, shapeWidthNs.value);
			this.outputTxt.text = this.currentShape.describe();
		}
		
	}
	
}