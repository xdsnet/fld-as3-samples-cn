package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class btLable
	{
		public function btLable() 
		{

		}
		public static  function TopLable():TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = "center";
			btFmt.bold = true;
			btFmt.color = 0xEE00EE;
			btFmt.size = 18;
			var _btLable:TextField  = new TextField();
			_btLable.text = "GeometricShapes 例子";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 14;
			_btLable.y = 11;
			_btLable.width = 511.9;
			_btLable.height = 25.9;
			return _btLable;
		}		
		public static  function TopLable2():TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = "center";
			btFmt.bold = true;
			btFmt.color = 0x0;
			btFmt.size = 12;
			var _btLable:TextField  = new TextField();
			_btLable.text = "GeometricShapes ActionScript 3.0例子：面向对象编程";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 15;
			_btLable.y = 38;
			_btLable.width = 511.9;
			_btLable.height = 18.5;
			return _btLable;
		}
		public static  function xtLable():TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = "right";
			btFmt.bold = true;
			btFmt.color = 0x665566;
			btFmt.size = 11;
			var _btLable:TextField  = new TextField();
			_btLable.text = "选择图形类型:";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 76;
			_btLable.y = 77;
			_btLable.width = 265.1;
			_btLable.height = 17.3;
			return _btLable;
		}
		public static  function bcLable():TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = "right";
			btFmt.bold = true;
			btFmt.color = 0x665566;
			btFmt.size = 11;
			var _btLable:TextField  = new TextField();
			_btLable.text = "输入边长或者直径:";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 112.8;
			_btLable.y = 112.1;
			_btLable.width = 228.3;
			_btLable.height = 17.3;
			return _btLable;
		}
		public static  function jgLable():TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = "left";
			btFmt.bold = true;
			btFmt.color = 0x665566;
			btFmt.size = 11;
			var _btLable:TextField  = new TextField();
			_btLable.text = "结果:";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 72.5;
			_btLable.y = 162.1;
			_btLable.width = 49.2;
			_btLable.height = 17.3;
			return _btLable;
		}
		
	}

}