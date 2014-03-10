package
{
	import asunit.textui.TestRunner;
	import com.thedevstop.asguard.AsGuardTests;
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main():void
		{
			var testRunner:TestRunner = new TestRunner();
			stage.addChild(testRunner);
			testRunner.start(AsGuardTests, null, TestRunner.SHOW_TRACE);
		}
	}
}