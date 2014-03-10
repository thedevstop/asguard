package com.thedevstop.asguard 
{
	import asunit.framework.TestSuite;
	
	public class AsGuardTests extends TestSuite
	{
		public function AsGuardTests() 
		{
			super();
			
			addTest(new AssertionsTests());
			addTest(new ConditionsTests());
		}
	}
}