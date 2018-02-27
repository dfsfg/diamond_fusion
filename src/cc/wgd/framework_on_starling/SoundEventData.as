package cc.wgd.framework_on_starling
{
	public class SoundEventData
	{
		private var _name:String;
		private var _loops:int;
		private var _offset:Number;
		private var _volume:Number;
		private var _isSoundTrack:Boolean;
		
		public function SoundEventData(pname:String, pIsSoundTrack:Boolean = false, pLoops:int = 0, pOffset:Number = 0, pVolume:Number = 0.1)
		{
			init(pname, pIsSoundTrack, pLoops, pOffset, pVolume);
		}
		
		private function init(pname:String, pIsSoundTrack:Boolean = false, pLoops:int = 0, pOffset:Number = 0, pVolume:Number = 1):void{
			_name = pname;
			_loops = pLoops;
			_offset = pOffset;
			_volume = pVolume;
			_isSoundTrack = pIsSoundTrack;
		}
		
		public function get name():String{
			return _name;
		}
		
		public function get loops():int{
			return _loops;
		}
		
		public function get offset():Number{
			return _offset;
		}
		
		public function get volume():Number{
			return _volume;
		}
		
		public function get isSoundTrack():Boolean{
			return _isSoundTrack;
		}
	}
}