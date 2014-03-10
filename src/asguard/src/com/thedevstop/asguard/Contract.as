package com.thedevstop.asguard 
{
	import com.thedevstop.contracts.ContractViolatedError;
	import com.thedevstop.contracts.ContractViolatedEvent;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	[Event(name="preCondition", type="com.thedevstop.contracts.ContractViolatedEvent")]
	[Event(name = "postCondition", type = "com.thedevstop.contracts.ContractViolatedEvent")]
	/**
	 * Use for checking pre- and post- conditions in code.
	 */
	public class Contract
	{
		public static const PRE_CONDITION:String = "preCondition";
		public static const POST_CONDITION:String = "postCondition";
		
		private static var _dispatcher:EventDispatcher = null;
		
		/**
		 * The event dispatcher where contract events can be listened for in Release builds.
		 */
		public static function get eventDispatcher():IEventDispatcher
		{
			if (_dispatcher == null)
				_dispatcher = new EventDispatcher();
			
			return _dispatcher;
		}
		
		/**
		 * Pre-conditions assertions.
		 */
		public static const require:Assertions = new Assertions(PRE_CONDITION, eventDispatcher);
		
		/**
		 * Post-condition assertions.
		 */
		public static const ensure:Assertions = new Assertions(POST_CONDITION, eventDispatcher);
	}
}