package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class mylables
	{
		
		public function mylables() 
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
			_btLable.text = "AlarmClock 例子";
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
			_btLable.text = "AlarmClock ActionScript 3.0例子：处理行为";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 15;
			_btLable.y = 38;
			_btLable.width = 511.9;
			_btLable.height = 18.5;
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
			_btLable.text = "消息:";
			_btLable.setTextFormat(btFmt);
			_btLable.x = 205.3;
			_btLable.y = 100.3;
			_btLable.width = 30;
			_btLable.height = 22;
			return _btLable;
		}
	}

}