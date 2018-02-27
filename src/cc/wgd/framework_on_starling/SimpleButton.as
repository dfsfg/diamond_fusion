package cc.wgd.framework_on_starling
{
	import starling.display.Button;
	import starling.textures.Texture;
	
	public class SimpleButton extends Button
	{
		/**
		 * Идентификатор кнопки. Служит для распознавания нажатой кнопки, если на экране находится
		 * несколько кнопок. Соответствует состоянию игры, в которое переходит игра по нажатию
		 * данной кнопки.
		 * */
		private var _id:int;
		
		public function SimpleButton(id:int, upState:Texture, text:String="", downState:Texture=null)
		{
			super(upState, text, downState);
			this._id = id;
		}
		
		/**
		 * Возвращает идентификатор кнопки.
		 * */
		public function get id():int{
			return _id;
		}
	}
}