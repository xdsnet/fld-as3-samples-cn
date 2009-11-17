package com.example.programmingas3.geometricshapes 
{

	public class Circle implements IGeometricShape 
	{
		public var diameter:Number;
		
		public function Circle(diam:Number = 100):void
		{
			this.diameter = diam;
		}
		
		public function getArea():Number
		{
		    // the formula is Pi * radius * radius
			var radius:Number = diameter / 2;
		    return Math.PI * radius * radius;
		}
		
		public function getCircumference():Number
		{
		    // the formula is Pi * diameter
		    return Math.PI * diameter;
		}
		
		public function describe():String
		{
		    var desc:String = "这个图形是圆形。\n";
            desc += "它的直径是：" + diameter + " 像素.\n";
            desc += "它的面积是：" + getArea() + "像素平方.\n";;
            desc += "它的周长是：" + getCircumference() + "像素.\n"; 
            
            return desc;  
		}
	}
}