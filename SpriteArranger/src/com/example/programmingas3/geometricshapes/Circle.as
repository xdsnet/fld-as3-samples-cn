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
		    // the formula is Pi * radius^2
		    return Math.PI * ((diameter / 2)^2);
		}
		
		public function getCircumference():Number
		{
		    // the formula is Pi * radius * 2
		    return Math.PI * diameter;
		}
		
		public function describe():String
		{
            var desc:String = "这是圆形.\n";
            desc += "直径是" + diameter + " 像素.\n";
            desc += "面积是 " + getArea() + ".\n";
            desc += "周长是 " + getCircumference() + ".\n";    
            return desc;
		}
	}
}