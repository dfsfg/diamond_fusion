package cc.wgd.framework_on_starling
{
	/**
	 * This class is used to pass the data in pairs of "key - value" to update ScoreElement class instance value.
	 * */
	public class ScoreBoardUpdateData
	{
		private var _key:String;
		private var _value:String;
		
		public function ScoreBoardUpdateData(key:String, value:String)
		{
			init(key, value);
		}
		
		private function init(key:String, value:String):void{
			this._key = key;
			this._value = value;
		}
		
		public function get key():String{
			return _key;
		}
		
		public function get value():String{
			return _value;
		}
	}
}