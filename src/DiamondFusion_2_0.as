package
{
	import classes.GameFrame_DFSW_4_1_2;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import starling.core.Starling;
	
	[SWF(frameRate = "60", width = "550", height="750", backgroundColor="0x333333")]
	
	public class DiamondFusion_2_0 extends Sprite
	{
		private var _starling:Starling;
		
		public function DiamondFusion_2_0()
		{
			if(stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			if(this.hasEventListener(Event.ADDED_TO_STAGE)) removeEventListener(Event.ADDED_TO_STAGE, init);
			_starling = new Starling(GameFrame_DFSW_4_1_2, stage, null, null, "auto", "baseline");
			_starling.antiAliasing = 1;
			_starling.start();
		}
	}
}