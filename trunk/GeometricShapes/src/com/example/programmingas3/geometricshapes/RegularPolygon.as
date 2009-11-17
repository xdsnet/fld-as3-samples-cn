﻿package com.example.programmingas3.geometricshapes 
{

    /**
     * A regular polygon is equilateral (all sides are the same length)
     * and equiangular (all interior angles are the same).
     */ 
	public class RegularPolygon implements IPolygon 
	{ 
	    public var numSides:Number
		public var sideLength:Number;
		
		public function RegularPolygon(len:Number = 100, sides:Number = 3):void
		{
			this.sideLength = len;
			this.numSides = sides;
		}
		
		public function getArea():Number
		{
		    // this method should be overridden in subclasses
		    return 0;
		}
		
		public function getPerimeter():Number
		{
		    return sideLength * numSides;
		}
		
		public function getSumOfAngles():Number
		{
		    if (numSides >= 3)
		    {
		        return ((numSides - 2) * 180);
		    }
		    else
		    {
		        return 0;
		    }
		}
		
		public function describe():String
		{
		    var desc:String = "每边长：" + sideLength + " 像素.\n";
            desc += "面积是：" + getArea() + " 像素平方.\n";
            desc += "周长是：" + getPerimeter() + "像素.\n"; 
            desc += "内角和是：" + getSumOfAngles() + " 度.\n"; 
            
            return desc;  
		}
    }
}