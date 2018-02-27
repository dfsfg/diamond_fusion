package assets.layout.abstract
{
	public class AbstractLayout_PB
	{
		//////////////////////////////////////////////////////////
		///
		//		ОБЩИЕ ПАРАМЕТРЫ
		///
		//////////////////////////////////////////////////////////
		/** полная длина progress bar */
		protected var _full_width:Number;
		
		/** полная ширина progress bar */
		protected var _full_height:Number;
		
		public function AbstractLayout_PB()
		{
			init();
		}
		
		protected function init():void{
			trace("*-----------------------ERROR!-------------------------*");
			trace("Class AbstractLayoutPB can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*-------------------------------------------------------*");
		}
		
		/** возвращает полную длину */
		public function get full_width():Number{
			return _full_width;
		}
		
		/** возвращает полную ширинуы */
		public function get full_height():Number{
			return _full_height;
		}
	}
}