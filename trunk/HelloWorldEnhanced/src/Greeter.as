package 
{
	public class Greeter 
	{
		/**
		 * Defines the names that should receive a proper greeting.
		 */
		public static var validNames:Array = ["Sammy", "Frank", "Dean","张三","李四","王五"];

		/**
		 * Builds a greeting string using the given name.
		 */
		public function sayHello(userName:String = ""):String 
		{
			var greeting:String;
			if (userName == "") 
			{
				greeting = "你好，请输入你的名字，并且按下Enter键。";
			} 
			else if (validName(userName)) 
			{
				greeting = "你好， " + userName + "。";
			} 
			else 
			{
				greeting = "对不起" + userName + "，你的名字不在列表中";
			}
			return greeting;
		}
		
		/**
		 * Checks whether a name is in the validNames list.
		 */
		public static function validName(inputName:String = ""):Boolean 
		{
			if (validNames.indexOf(inputName) > -1) 
			{
				return true;
			} 
			else 
			{
				return false;
			}
		}
	}
}