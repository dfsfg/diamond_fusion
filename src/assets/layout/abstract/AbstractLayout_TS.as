package assets.layout.abstract
{

	/**
	 * <h1>Расположение элементов на экране</h1>
	 * <p>Класс объявляет, но не задает параметры расположения элементов на главном экране, а так же
	 * методы доступа к этим параметрам.</p>
	 * <p>Является абстрактным базовым классом, который должен быть наследован конкретными классами,
	 * определяющими расположение элементов на экране с заданным разрешением.</p>
	 * */
	public class AbstractLayout_TS extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		КООРДИНАТЫ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		
		/** X-координата расположения названия экрана на экране */
		protected var _img_ts_name_pos_on_x:Number;
		
		/** Y-координата расположения названия экрана на экране */
		protected var _img_ts_name_pos_on_y:Number;
		
		/** X-координата расположения названия экрана вне экрана */
		protected var _img_ts_name_pos_out_x:Number;
		
		/** Y-координата расположения названия экрана вне экрана */
		protected var _img_ts_name_pos_out_y:Number;
		
		/** скорость движения названия экрана */
		protected var _img_ts_name_velo:Number;
		
		////////////////////////////////////////////////////////////
		///
		//		КООРДИНАТЫ КНОПКИ "START"
		///
		////////////////////////////////////////////////////////////
		
		/** X-координата кнопки <i>"START"</i> на экране */
		protected var _btn_main_menu_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"START"</i> на экране */
		protected var _btn_main_menu_pos_on_y:Number;
		
		/** X-координата кнопки <i>"START"</i> вне экрана */
		protected var _btn_main_menu_pos_out_x:Number;
		
		/** Y-координата кнопки <i>"START"</i> вне экрана */
		protected var _btn_main_menu_pos_out_y:Number;
		
		/** скорость движения кнопки <i>"START"</i> */
		protected var _btn_main_menu_velo:Number;
		
		////////////////////////////////////////////////////////////
		///
		//		КООРДИНАТЫ ИЗОБРАЖЕНИЯ БРИЛЛИАНТА
		///
		////////////////////////////////////////////////////////////
		
		/** X-координата изображения бриллианта на экране */
		protected var _img_diamond_big_pos_on_x:Number;
		
		/** Y-координата изображения бриллианта на экране */
		protected var _img_diamond_big_pos_on_y:Number;
		
		/** начальное значение прозрачности бриллианта */
		protected var _img_diamond_big_transparency_start:Number;
		
		/** конечное значение прозрачности бриллианта */
		protected var _img_diamond_big_transparency_end:Number;
		
		/** шаг изменения прозрачности бриллианта */
		protected var _img_diamond_big_transparency_step:Number;
		
		public function AbstractLayout_TS()
		{
			super();
		}
		
		override protected function init():void{
			trace("*--------------------------ERROR!-------------------------------*");
			trace("Class AbstractLayoutTitleScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*---------------------------------------------------------------*");
		}
		
		
		////////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К КООРДИНАТАМ НАЗВАНИЯ ЭКРАНА
		///
		////////////////////////////////////////////////////////////
		public function get img_ts_name_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_ts_name_pos_on_x);
		}
		
		public function get img_ts_name_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_ts_name_pos_on_y);
		}
		
		public function get img_ts_name_pos_out_x():Number{
			return super.scale_short_displacement_x(_img_ts_name_pos_out_x);
		}
		
		public function get img_ts_name_pos_out_y():Number{
			return super.scale_long_displacement_y(_img_ts_name_pos_out_y);
		}
		
		public function get img_ts_name_velo():Number{
			return _img_ts_name_velo * _scale;
		}
		
		////////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К КООРДИНАТАМ КНОПКИ "START"
		///
		////////////////////////////////////////////////////////////
		public function get btn_main_menu_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_main_menu_pos_on_x);
		}
		
		public function get btn_main_menu_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_main_menu_pos_on_y);
		}
		
		public function get btn_main_menu_pos_out_x():Number{
			return super.scale_short_displacement_x(_btn_main_menu_pos_out_x);
		}
		
		public function get btn_main_menu_pos_out_y():Number{
			return super.scale_long_displacement_y(_btn_main_menu_pos_out_y);
		}
		
		public function get btn_main_menu_velo():Number{
			return _btn_main_menu_velo * _scale;
		}
		
		
		////////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К КООРДИНАТАМ ИЗОБРАЖЕНИЯ БРИЛЛИАНТА
		///
		////////////////////////////////////////////////////////////
		public function get img_diamond_big_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_diamond_big_pos_on_x);
		}
		
		public function get img_diamond_big_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_diamond_big_pos_on_y);
		}
		
		public function get img_diamond_big_transparency_start():Number{
			return _img_diamond_big_transparency_start;
		}
		
		public function get img_diamond_big_transparency_end():Number{
			return _img_diamond_big_transparency_end;
		}
		
		public function get img_diamond_big_transparency_step():Number{
			return _img_diamond_big_transparency_step;
		}
	}
}