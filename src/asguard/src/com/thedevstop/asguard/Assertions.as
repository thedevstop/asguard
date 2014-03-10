package com.thedevstop.asguard 
{
	import flash.events.IEventDispatcher;
	
	/**
	 * Contract assertions.
	 */
	public class Assertions 
	{
		private var _type:String;
		private var _eventDispatcher:IEventDispatcher;
		
		public function Assertions(type:String, eventDispatcher:IEventDispatcher) 
		{
			isNotNull(type);
			isNotNull(eventDispatcher);
			
			_type = type;
			_eventDispatcher = eventDispatcher;
		}
		
		/**
		 * Build up a set validations that can be run all at once.
		 */
		public function createConditions():Conditions
		{
			return new Conditions(this);
		}
		
		/**
		 * Check for true.
		 */
		public function isTrue(condition:Boolean, message:String = null):Boolean
		{
			if (condition)
				return true;
			
			message = message || "Expected condition to evaluate to true.";
			conditionCheckFailed(message);
			return false;
		}
		
		/**
		 * Check for false.
		 */
		public function isFalse(condition:Boolean, message:String = null):Boolean
		{
			message = message || "Expected condition to evaluate to false.";
			return isTrue(!condition, message);
		}
		
		/**
		 * Check for equality.
		 */
		public function isEqual(expected:Object, actual:Object, message:String = null):Boolean
		{
			message = message || "Expected value: <" + expected + "> but was: <" + actual + ">.";
			return isTrue((expected == null && actual == null) ||
				   (expected != null && expected.hasOwnProperty("equals") && expected.equals && expected.equals is Function && expected.equals(actual)) ||
				   (expected == actual), message);
		}
		
		/**
		 * Check for same instance.
		 */
		public function isSame(expected:Object, actual:Object, message:String = null):Boolean
		{
			message = message || "Expected same: <" + expected + "> but was: <" + actual + ">.";
			return isTrue(expected === actual, message);
		}
		
		/**
		 * Check for different instances.
		 */
		public function isNotSame(expected:Object, actual:Object, message:String = null):Boolean
		{
			message = message || "Expected not same.";
			return isTrue(expected !== actual, message);
		}
		
		/**
		 * Check for null.
		 */
		public function isNull(object:Object, message:String = null):Boolean
		{
			message = message || "Expected null value.";
			return isTrue(object === null, message);
		}
		
		/**
		 * Check for value.
		 */
		public function isNotNull(object:Object, message:String = null):Boolean
		{
			message = message || "Expected non-null value.";
			return isTrue(object !== null, message);
		}
		
		private function conditionCheckFailed(message:String):void
		{
			CONFIG::debug
			{
				throw new ContractViolatedError(_type, message);
			}
			
			CONFIG::release
			{
				_eventDispatcher.dispatchEvent(new ContractViolatedEvent(_type, message));
			}
		}
	}
}