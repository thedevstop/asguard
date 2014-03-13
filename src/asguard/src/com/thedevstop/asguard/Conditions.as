package com.thedevstop.asguard
{
	/**
	 * Build up a set validations that can be run all at once.
	 */
	public class Conditions
	{
		private var _checkNull:Boolean = false;
		private var _checkNotNull:Boolean = false;
		private var _conditions:Array = [];
		private var _asserter:Assertions;
		
		public function Conditions(asserter:Assertions)
		{
			_asserter = asserter;
		}
		
		/**
		 * Checks that a function returns true on the call to validate.
		 * @param	func function(result:Object):Boolean
		 */
		public function isTrue(func:Function):Conditions
		{
			_conditions.push(function(result:Object):* { _asserter.isTrue(func(result)); } );
			return this;
		}
		
		/**
		 * Checks that a function returns false on the call to validate.
		 * @param	func function(result:Object):Boolean
		 */
		public function isFalse(func:Function):Conditions
		{
			_conditions.push(function(result:Object):* { _asserter.isFalse(func(result)); } );
			return this;
		}
		
		/**
		 * Checks that this value will equals the validation value.
		 * @param	value
		 */
		public function isEqual(value:Object):Conditions
		{
			_conditions.push(function(result:Object):* { _asserter.isEqual(value, result); } );
			return this;
		}
		
		/**
		 * Checks that this value is the same as the validation value.
		 * @param	value
		 */
		public function isSame(value:Object):Conditions
		{
			_conditions.push(function(result:Object):* { _asserter.isSame(value, result); } );
			return this;
		}
		
		/**
		 * Checks that this value is not the same as the validation value.
		 * @param	value
		 */
		public function isNotSame(value:Object):Conditions
		{
			_conditions.push(function(result:Object):* { _asserter.isNotSame(value, result); } );
			return this;
		}
		
		/**
		 * Checks that the validation value is null.
		 */
		public function isNull():Conditions
		{
			_checkNull = true;
			_checkNotNull = false;
			return this;
		}
		
		/**
		 * Checks that the validation value is not null.
		 */
		public function isNotNull():Conditions
		{
			_checkNotNull = true;
			_checkNull = false;
			return this;
		}
		
		/**
		 * Checks all applied conditions against the provided value.
		 * @return The provided value is returned.
		 */
		public function validate(result:*):*
		{
			if (_checkNull)
				_asserter.isNull(result);
			else if (_checkNotNull)
				_asserter.isNotNull(result);
			
			_conditions.forEach(function(condition:Function, index:int, array:Array):void {
				condition(result);
			});
			
			return result;
		}
	}
}
