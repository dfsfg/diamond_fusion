package assets.layout.abstract
{

	public class AbstractLayout_IS extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** X-координата названия экрана на экране */
		protected var _img_is_name_pos_on_x:Number;
		
		/** Y-координата названия экрана на экране */
		protected var _img_is_name_pos_on_y:Number;
		
		/** X-координата названия экрана вне экрана */
		protected var _img_is_name_pos_out_x:Number;
		
		/** Y-координата названия экрана вне экрана */
		protected var _img_is_name_pos_out_y:Number;
		
		/** скорость движения названия */
		protected var _img_is_name_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ВЫПАДАЮЩЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата выпадающей панели на экране */
		protected var _img_is_ddp_pos_on_x:Number;
		
		/** Y-координата выпадающей панели на экране */
		protected var _img_is_ddp_pos_on_y:Number;
		
		/** X-координата выпадающей панели вне экрана */
		protected var _img_is_ddp_pos_out_x:Number;
		
		/** Y-координата выпадающей панели вне экрана */
		protected var _img_is_ddp_pos_out_y:Number;
		
		/** скорость движения выпадающей панели */
		protected var _img_is_ddp_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ ГЛАВНОГО МЕНЮ
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки главного меню на экране */
		protected var _btn_main_menu_pos_on_x:Number;
		
		/** Y-координата кнопки главного меню на экране */
		protected var _btn_main_menu_pos_on_y:Number;
		
		/** X-координата кнопки главного меню вне экрана */
		protected var _btn_main_menu_pos_out_x:Number;
		
		/** Y-координата кнопки главного меню вне экрана */
		protected var _btn_main_menu_pos_out_y:Number;
		
		/** скорость движения кнопки главного меню */
		protected var _btn_main_menu_velo:Number;
		
		
		public function AbstractLayout_IS()
		{
			super();
		}
		
		override protected function init():void{
			trace("*-------------------------------ERROR!---------------------------------*");
			trace("Class AbstractLayoutInstructionsScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*----------------------------------------------------------------------*");
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату названия экрана на экране */
		public function get img_is_name_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_is_name_pos_on_x);
		}
		
		/** возвращает Y-координату названия экрана на экране */
		public function get img_is_name_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_is_name_pos_on_y);
		}
		
		/** возвращает X-координату названия экрана вне экрана */
		public function get img_is_name_pos_out_x():Number{
			return super.scale_short_displacement_x(_img_is_name_pos_out_x);
		}
		
		/** возвращает Y-координату названия экрана вне экрана */
		public function get img_is_name_pos_out_y():Number{
			return super.scale_long_displacement_y(_img_is_name_pos_out_y);
		}
		
		/** возвращает скорость движения названия экрана */
		public function get img_is_name_velo():Number{
			return _img_is_name_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ВЫПАДАЮЩЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату выпадающей панели на экране */
		public function get img_is_ddp_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_is_ddp_pos_on_x);
		}
		
		/** возвращает Y-координату выпадающей панели на экране */
		public function get img_is_ddp_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_is_ddp_pos_on_y);
		}
		
		/** возвращает X-координату выпадающей панели вне экрана */
		public function get img_is_ddp_pos_out_x():Number{
			return super.scale_long_displacement_x(_img_is_ddp_pos_out_x);
		}
		
		/** возвращает Y-координату выпадающей панели вне экрана */
		public function get img_is_ddp_pos_out_y():Number{
			return super.scale_short_displacement_y(_img_is_ddp_pos_out_y);
		}
		
		/** возвращает скорость движения выпадающей панели */
		public function get img_is_ddp_velo():Number{
			return _img_is_ddp_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ ГЛАВНОГО МЕНЮ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки главного меню на экране */
		public function get btn_main_menu_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_main_menu_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки главного меню на экране */
		public function get btn_main_menu_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_main_menu_pos_on_y);
		}
		
		/** возвращает X-координату кнопки главного меню вне экрана */
		public function get btn_main_menu_pos_out_x():Number{
			return super.scale_short_displacement_x(_btn_main_menu_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки главного меню вне экрана */
		public function get btn_main_menu_pos_out_y():Number{
			return super.scale_long_displacement_y(_btn_main_menu_pos_out_y);
		}
		
		/** возвращает скорость движения кнопки главного меню */
		public function get btn_main_menu_velo():Number{
			return _btn_main_menu_velo * _scale;
		}
	}
}