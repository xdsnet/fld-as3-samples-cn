package  
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author xdsnet
	 */
	public class myLables
	{
		
		public function myLables() 
		{
			
		}
		public static  function getALable(
			text:String = "", //标签文本内容
			x:Number = 10, // 标签x坐标
			y:Number = 11, // 标签y坐标
			w:Number = 511.9,// 标签宽
			h:Number = 22,// 标签高
			FMTalign:String = "left",// 标签对齐方式
			FMTbold:Boolean = false,// 标签字体是否加粗
			FMTsiz:Number = 12,// 标签字体大小
			FMTcolor:Number = 0x0 // 标签字体颜色
			):TextField
		{			
			var btFmt:TextFormat = new TextFormat();
			btFmt.align = FMTalign ;
			btFmt.bold = FMTbold;
			btFmt.color = FMTcolor;
			btFmt.size = FMTsiz;
			var _btLable:TextField  = new TextField();
			_btLable.text = text;
			_btLable.setTextFormat(btFmt);
			_btLable.x = x;
			_btLable.y = y;
			_btLable.width = w;
			_btLable.height = h;
			return _btLable;
		}		
	}

}