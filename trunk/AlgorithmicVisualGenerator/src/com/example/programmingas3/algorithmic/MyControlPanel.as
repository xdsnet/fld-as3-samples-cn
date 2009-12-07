package com.example.programmingas3.algorithmic 
{
	import flash.display.MovieClip;
	import fl.events.SliderEvent;
	import fl.controls.Slider;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import flash.display.StageDisplayState;
	import fl.controls.Button;
	import fl.controls.Slider;
	import myLables;
	import flash.display.Shape;


	
	/**
	 * ...
	 * @author xdsnet
	 */
	public class MyControlPanel extends MovieClip
	{
		private var radiusSlider:Slider=new Slider();
		private var satelliteRadiusSlider:Slider=new Slider();
		private var visibleSatellitesSlider:Slider=new Slider();
		private var redSlider:Slider=new Slider();
		private var greenSlider:Slider=new Slider();
		private var blueSlider:Slider=new Slider();
		private var alphaShadingBtn:Button=new Button();
		private var fullScreenBtn:Button = new Button();
		
		public var radius:Number = 50;
		public var satelliteRadius:Number = 6;
		public var totalSatellites:Number = 600;		
		public var visibleSatellites:Number = 100;
		public var redBias:Number = 0xFF;
		public var greenBias:Number = 0xFF;
		public var blueBias:Number = 0xFF;
		public var useAlphaEffect:Boolean = false;
		
		public function MyControlPanel() 
		{
			this.width = 550;
			this.height = 120;
			
			graphics.clear();
			graphics.beginFill(0xffffff);
			graphics.drawRect(0, 0, 550, 120);
			addChild(myLables.getALable("Algorithmic Visual Generator 例子", 20, 5.2, 511.9, 25.9, "center", true, 18, 0x0));
			addChild(myLables.getALable("ActionScript 3.0:使用绘画API", 21, 32.3, 511.9, 18.5, "center", false, 12, 0x0));
			addChild(myLables.getALable("轨道半径", 7, 54.3, 91, 16.1, "right", false, 10, 0x0));
			addChild(myLables.getALable("卫星半径", 7, 75.3, 93, 16.1, "right", false, 10, 0x0));
			addChild(myLables.getALable("卫星数量", 7, 95, 93, 16.1, "right", false, 10, 0x0));
			addChild(myLables.getALable("红色饱和度", 363, 54.3, 63, 16.1, "left", false, 10, 0x0));
			addChild(myLables.getALable("绿色饱和度", 363, 75.3, 63, 16.1, "left", false, 10, 0x0));
			addChild(myLables.getALable("蓝色饱和度", 363, 95, 63, 16.1, "left", false, 10, 0x0));
			
			radiusSlider.x = 101.5;
			radiusSlider.y = 59.3;
			radiusSlider.width = 121.5;
			radiusSlider.height = 5.7;
			radiusSlider.maximum = 200;
			radiusSlider.minimum = 2;
			radiusSlider.value = 40;
			addChild(radiusSlider);
			
			satelliteRadiusSlider.x = 101.5;
			satelliteRadiusSlider.y = 79.3;
			satelliteRadiusSlider.width = 121.5;
			satelliteRadiusSlider.height = 5.7;
			satelliteRadiusSlider.maximum = 40;
			satelliteRadiusSlider.minimum = 2;
			satelliteRadiusSlider.value = 6;
			addChild(satelliteRadiusSlider);
			
			visibleSatellitesSlider.x = 101.5;
			visibleSatellitesSlider.y = 100.3;
			visibleSatellitesSlider.width = 121.5;
			visibleSatellitesSlider.height = 5.7;
			visibleSatellitesSlider.maximum = 600;
			visibleSatellitesSlider.minimum = 0;
			visibleSatellitesSlider.value = 100;
			addChild(visibleSatellitesSlider);
			
			redSlider.x = 229.5;
			redSlider.y = 59.3;
			redSlider.width = 121.5;
			redSlider.height = 5.7;
			redSlider.maximum = 255;
			redSlider.minimum = 0;
			redSlider.value = 255;
			redSlider.liveDragging = false;
			addChild(redSlider);
			
			greenSlider.x = 229.5;
			greenSlider.y = 79.3;
			greenSlider.width = 121.5;
			greenSlider.height = 5.7;
			greenSlider.maximum = 255;
			greenSlider.minimum = 0;
			greenSlider.value = 255;
			greenSlider.liveDragging = false;
			addChild(greenSlider);
			
			blueSlider.x = 229.5;
			blueSlider.y = 99.3;
			blueSlider.width = 121.5;
			blueSlider.height = 5.7;
			blueSlider.maximum = 255;
			blueSlider.minimum = 0;
			blueSlider.value = 255;
			blueSlider.liveDragging = false;
			addChild(blueSlider);
			
			alphaShadingBtn.x = 432.3;
			alphaShadingBtn.y = 60.3;
			alphaShadingBtn.width = 109.8;
			alphaShadingBtn.height = 20;
			alphaShadingBtn.label = "透明阴影";
			addChild(alphaShadingBtn);
			
			fullScreenBtn.x = 432.2;
			fullScreenBtn.y = 83.3;
			fullScreenBtn.width = 109.8;
			fullScreenBtn.height = 20;
			fullScreenBtn.label = "全屏幕";
			addChild(fullScreenBtn);
			
			radiusSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			satelliteRadiusSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			visibleSatellitesSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			redSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			greenSlider.addEventListener(SliderEvent.CHANGE,changeSetting);
			blueSlider.addEventListener(SliderEvent.CHANGE,changeSetting);

			radiusSlider.minimum = 2;
			radiusSlider.maximum = 200;
			radiusSlider.value = radius;
			satelliteRadiusSlider.minimum = 2;
			satelliteRadiusSlider.maximum = 40
			satelliteRadiusSlider.value = satelliteRadius;
			visibleSatellitesSlider.minimum = 0;
			visibleSatellitesSlider.maximum = totalSatellites;
			visibleSatellitesSlider.value = visibleSatellites;
			redSlider.minimum = 
			greenSlider.minimum = 
			blueSlider.minimum = 0;
			redSlider.maximum = 
			greenSlider.maximum = 
			blueSlider.maximum = 0xFF;
			redSlider.value = redBias;
			greenSlider.value = greenBias;
			blueSlider.value = blueBias;
			
			fullScreenBtn.addEventListener(MouseEvent.CLICK, toggleFullScreen);
			alphaShadingBtn.addEventListener(MouseEvent.CLICK, toggleAlphaShading);
			
		}
		protected function changeSetting(e:SliderEvent):void {
			switch(e.target) {
				case radiusSlider:
					radius = e.target.value;
					break;
				case satelliteRadiusSlider:
					satelliteRadius = e.target.value;
					break;
				case visibleSatellitesSlider:
					visibleSatellites = e.target.value;
					break;
				case redSlider:
					redBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				case greenSlider:
					greenBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				case blueSlider:
					blueBias = e.target.value;
					dispatchEvent(new Event("rebuild"));
					break;
				default:
					break;
			}
		}
		protected function toggleFullScreen(e:MouseEvent):void {
			stage.displayState = stage.displayState == StageDisplayState.FULL_SCREEN ? StageDisplayState.NORMAL : StageDisplayState.FULL_SCREEN;
		}
		protected function toggleAlphaShading(e:MouseEvent):void {
			useAlphaEffect = useAlphaEffect == true ? false : true;
		}
		
	}

}