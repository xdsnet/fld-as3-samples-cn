package com.example.programmingas3.errors {
    
	public class WarningError extends ApplicationError {
	    
		public function WarningError(errorID:int) 
		{
		    id = errorID;
			severity = ApplicationError.WARNING
			message = super.getMessageText(errorID);
		}
		
		public override function getTitle():String {
			return "错误#" + id + " -- 警告"
		}
		
		public override function toString():String {
			return "[警告类错误 #" + id + "] " + message;
		}

	}
}
