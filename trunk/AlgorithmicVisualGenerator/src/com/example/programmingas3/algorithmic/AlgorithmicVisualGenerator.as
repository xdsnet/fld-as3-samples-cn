﻿package com.example.programmingas3.algorithmic
{
	import fl.controls.Button;
	import flash.display.Sprite;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import com.example.programmingas3.algorithmic.Satellite;
	import com.example.programmingas3.algorithmic.ControlPanel;
	
	public class AlgorithmicVisualGenerator extends Sprite {
		private var satellites:Array;
		private var container:Sprite;
		private var bg:Shape;

		public function AlgorithmicVisualGenerator() {
			controlPanel.addEventListener("rebuild",build);
			addEventListener(Event.ADDED_TO_STAGE, setStageListener);
			addEventListener(Event.ENTER_FRAME, doEveryFrame);			
			
			build();
		}
		private function setStageListener(e:Event):void {
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.RESIZE,build);
		}
		
		private function clear():void{
			satellites = new Array()

			if(container) {
				swapChildren(controlPanel,container); // send control panel back to previous depth
				removeChild(container);
			}
		}
		private function build(e:Event = null):void {
			clear();

			container = new Sprite();
			container.y = 120;
			addChild(container);
			swapChildren(controlPanel,container); // always place controls above animation;
			
			bg = new Shape();
			bg.graphics.beginFill(0xEEEEEE);
			bg.graphics.drawRect(0,0,stage.stageWidth,stage.stageHeight);
			container.addChild(bg);

			var i:uint;
			for(i=0; i<controlPanel.totalSatellites; i++) {
				var satelliteContainer:Sprite = new Sprite();
				satelliteContainer.x = Math.random()*stage.stageWidth;
				satelliteContainer.y = Math.random()*stage.stageHeight;
				container.addChild(satelliteContainer);
				var position:Number = Math.random() * 360;
				var color:uint = getRandomColor();
				var satellite:Satellite = new Satellite(position,color);
				satelliteContainer.addChild(satellite);
				satellites.push(satellite);
			}
		}
		private function doEveryFrame(e:Event):void {
			var i:uint;
			for(i=0; i<controlPanel.visibleSatellites; i++) {
				var satellite:Satellite = satellites[i];
				if(satellite) {
					satellite.position += 4;
					satellite.radius = controlPanel.satelliteRadius;
					satellite.orbitRadius = controlPanel.radius;
					satellite.draw(controlPanel.useAlphaEffect);
					satellite.visible = true;
				}
			}
			while(i < controlPanel.totalSatellites) {
				var satelliteToHide:Satellite = satellites[i];
		//		satellite.visible = true; // doesn't hide them, but they stop
				satelliteToHide.visible = false;
				i++
			}
		}
		private function getRandomColor():uint {
			var ct:ColorTransform = new ColorTransform(1,1,1,1,Math.random()*controlPanel.redBias,Math.random()*controlPanel.greenBias,Math.random()*controlPanel.blueBias);
			return ct.color;
		}
	}
}