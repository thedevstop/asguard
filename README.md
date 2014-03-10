asguard
=======

Simple code contracts for ActionScript.  

**Contracts**

Contracts provides ways to `require` pre-conditions are met and to `ensure` that post-conditions are satisfied.  

``` actionscript
public function foo(bar:String):String
{
	// pre-condition checking
	Contracts.require.isNotNull(bar);
	
	var upperBar:String = bar.toUpperCase();
	
	// post-condition checking
	Contracts.ensure.isNotNull(upperBar);
	Contracts.ensure.isEqual(bar.length, upperBar.length);
	
	return upperBar;
}
```

***

**Conditions**

It is often better to define pre- and post-conditions together in your code. To facilitate this scenario you can define a set of conditions with which to validate against later. The `validate` method of the `Conditions` class returns the value being validated so that it can be immediately returned.  

``` actionscript
public function foo(bar:String):String
{
	// pre-condition checking
	Contracts.require.isNotNull(bar);
	// post-condition checking
	var postConditions:Conditions = Contract.ensure.createConditions();
	postConditions.isNotNull();
	postConditions.isTrue(function(result:String):Boolean {
		return bar.length == result.length;
	});
	
	var upperBar:String = bar.toUpperCase();
	
	return postConditions.validate(upperBar);
}
```

Also, the other methods on the `Conditions` class are self-returning so that checks can be chained together.  

``` actionscript
public function foo(bar:String):String
{
	// pre-condition checking
	Contracts.require.isNotNull(bar);
	// post-condition checking
	var postConditions:Conditions = Contract.ensure.createConditions()
									.isNotNull()
									.isTrue(function(result:String):Boolean {
										return bar.length == result.length;
									});
	
	var upperBar:String = bar.toUpperCase();
	
	return postConditions.validate(upperBar);
}
```

***

**Contract Violations**

Behavior is different depending on Debug and Release builds. When built in Debug mode, contract voilations will throw a `ContractViolatedError`. When built in Release mode, a `ContractViolatedEvent` will be dispatched on `Contracts.eventDispatcher`.  

***

**License**

This content is released under the MIT License (See LICENSE).
