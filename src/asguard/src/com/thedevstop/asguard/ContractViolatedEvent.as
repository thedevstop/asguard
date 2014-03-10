package com.thedevstop.asguard 
{
	import flash.events.Event;
	
	/**
	 * Dispatched when a contract is violated in Release builds.
	 */
	public class ContractViolatedEvent extends Event
	{
		private var _message:String;
		
		public function ContractViolatedEvent(type:String, message:String) 
		{
			super(type);
			
			_message = message;
		}
		
		public function get message():String
		{
			return _message;
		}
		
		override public function clone():Event 
		{
			return new ContractViolatedEvent(type, message);
		}
		
		override public function toString():String 
		{
			return this.formatToString("ContractViolatedEvent", "type", "message");
		}
	}
}