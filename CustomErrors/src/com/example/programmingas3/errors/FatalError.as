package com.example.programmingas3.errors 
{
	public class FatalError extends ApplicationError 
	{
		public function FatalError(errorID:int) 
		{
			id = errorID;
			severity = ApplicationError.FATAL
			message = getMessageText(errorID);
		}
		
		public override function getTitle():String {
			return "错误 #" + id + " -- 失败";
		}
		
		public override function toString():String {
			return "[失败 错误#" + id + "] " + message;
		}
	}
}