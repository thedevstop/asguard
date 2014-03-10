package com.thedevstop.asguard 
{
	/**
	 * Thrown when a contract is violated in Debug builds.
	 */
	public class ContractViolatedError extends Error
	{	
		private var _type:String;
		
		public function ContractViolatedError(type:String, message:String) 
		{
			super(message);
			
			_type = type;
		}
		
		public function get type():String
		{
			return _type;
		}
	}
}