package com.thedevstop.asguard 
{
	import asunit.framework.TestCase;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class AssertionsTests extends TestCase
	{
		public static const TEST:String = "test";
		
		public function AssertionsTests(testMethod:String = null) 
		{
			super(testMethod);
		}
		
		public function test_isTrue_does_not_throw_when_passes():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = true;
			
			asserter.isTrue(value);
		}
		
		public function test_isTrue_throws_when_fails():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = false;
			
			assertThrows(ContractViolatedError, function():* { asserter.isTrue(value); });
		}
		
		public function test_isFalse_does_not_throw_when_false():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = false;
			
			asserter.isFalse(value);
		}
		
		public function test_isFalse_throws_when_true():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = true;
			
			assertThrows(ContractViolatedError, function():* { asserter.isFalse(value); });
		}
		
		public function test_isEqual_does_not_throw_when_both_are_null():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = null;
			var value2:Object = null;
			
			asserter.isEqual(value1, value2);
		}
		
		public function test_isEqual_throws_when_one_null():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = 1;
			var value2:Object = null;
			
			assertThrows(ContractViolatedError, function():* { asserter.isEqual(value1, value2); });
		}
		
		public function test_isEqual_throws_when_different_values():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = 1;
			var value2:Object = 2;
			
			assertThrows(ContractViolatedError, function():* { asserter.isEqual(value1, value2); });
		}
		
		public function test_isEqual_uses_equals_method_when_available():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = { equals:function(o:Object):Boolean { return true; } };
			var value2:Object = 2;
			
			// Two objects do not equals but equals function will be evaluated first
			asserter.isEqual(value1, value2);
		}
		
		public function test_isSame_does_not_throw_when_same():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = { };
			
			asserter.isSame(value, value);
		}
		
		public function test_isSame_throws_when_not_same():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = { };
			var value2:Object = { };
			
			assertThrows(ContractViolatedError, function():* { asserter.isSame(value1, value2); });
		}
		
		public function test_isNotSame_does_not_throw_when_not_same():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value1:Object = { };
			var value2:Object = { };
			
			asserter.isNotSame(value1, value2);
		}
		
		public function test_isNotSame_throws_when_same():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = { };
			
			assertThrows(ContractViolatedError, function():* { asserter.isNotSame(value, value); });
		}
		
		public function test_isNull_does_not_throw_when_null():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = null;
			
			asserter.isNull(value);
		}
		
		public function test_isNull_throws_when_value():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = { };
			
			assertThrows(ContractViolatedError, function():* { asserter.isNull(value); });
		}
		
		public function test_isNotNull_does_not_throw_when_value():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = { };
			
			asserter.isNotNull(value);
		}
		
		public function test_isNotNull_throws_when_null():void
		{
			var eventDispatcher:IEventDispatcher = new EventDispatcher();
			var asserter:Assertions = new Assertions(TEST, eventDispatcher);
			
			var value:Object = null;
			
			assertThrows(ContractViolatedError, function():* { asserter.isNotNull(value); });
		}
	}
}