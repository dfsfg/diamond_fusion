package assets.layout.abstract
{
	public class AbstractLayout_Game extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ СЦЕНЫ
		///
		//////////////////////////////////////////////////////////
		/** ширина экрана */
		protected var _stage_width:Number;
		
		/** высота экрана */
		protected var _stage_height:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ЭЛЕМЕНТОВ
		///
		//////////////////////////////////////////////////////////
		/** высота расположения новых элементов над центром гексагона */
		protected var _created_element_height:Number
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ГЕКСАГОНА
		///
		//////////////////////////////////////////////////////////
		/** сторона элемента-бриллианта */
		protected var _element_side:Number;
		
		/** X-координата гексагона на экране */
		protected var _hex_pos_on_x:Number;
		
		/** Y-координата гексагона на экране */
		protected var _hex_pos_on_y:Number;
		
		/** X-координата гексагона вне экрана */
		protected var _hex_pos_out_x:Number;
		
		/** Y-координата гексагона вне экрана */
		protected var _hex_pos_out_y:Number;
		
		/** скорость гексагона */
		protected var _hex_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ НИЖНЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата панели на экране */
		protected var _panel_pos_on_x:Number;
		
		/** Y-координата панели на экране */
		protected var _panel_pos_on_y:Number;
		
		/** X-координата панели вне экрана */
		protected var _panel_pos_out_x:Number;
		
		/** Y-координата панели на экране */
		protected var _panel_pos_out_y:Number;
		
		/** скорость движения панели */
		protected var _panel_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ПАНЕЛИ ВЫХОДА ИЗ УРОВНЯ
		///
		//////////////////////////////////////////////////////////
		/** X-координата панели на экране */
		protected var _panel_drop_down_pos_on_x:Number;
		
		/** Y-координата панели на экране */
		protected var _panel_drop_down_pos_on_y:Number;
		
		/** X-координата панели вне экрана */
		protected var _panel_drop_down_pos_out_x:Number;
		
		/** Y-координата панели на экране */
		protected var _panel_drop_down_pos_out_y:Number;
		
		/** X-координата кнопки <i>OK</i> на панели */
		protected var _btn_ok_pos_on_x:Number;
		
		/** Y-координата кнопки <i>OK</i> на панели */
		protected var _btn_ok_pos_on_y:Number;
		
		/** X-координата кнопки <i>YES</i> на панели */
		protected var _btn_yes_pos_on_x:Number;
		
		/** Y-координата кнопки <i>YES</i> на панели */
		protected var _btn_yes_pos_on_y:Number;
		
		/** X-координата кнопки <i>NO</i> на панели */
		protected var _btn_no_pos_on_x:Number;
		
		/** Y-координата кнопки <i>NO</i> на панели */
		protected var _btn_no_pos_on_y:Number;
		
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПОК НА НИЖНЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки выхода в главное меню на панели */
		protected var _btn_main_menu_pos_on_x:Number;
		
		/** Y-координата кнопки выхода в главное меню на панели */
		protected var _btn_main_menu_pos_on_y:Number;
		
		/** X-координата кнопки завершения уровня на панели */
		protected var _btn_next_pos_on_x:Number;
		
		/** Y-координата кнопки завершения уровня на панели */
		protected var _btn_next_pos_on_y:Number;
		
		/** Y-координата кнопки завершения уровня за пределами панели */
		protected var _btn_next_pos_out_y:Number;
		
		/** скорость появления кнопки на панели */
		protected var _btn_next_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ДВИЖЕНИЯ
		///
		//////////////////////////////////////////////////////////
		/** скорость падения элементов */
		protected var _falling_velo:Number;
		
		/** скорость движения элементов */
		protected var _moving_velo:Number;
		
		/** скорость распространения взрывной волны */
		protected var _wave_velo:Number;
		
		/** величина погрешности при вычислении координат вершин решетки */
		protected var _position_inaccuracy:Number;
		
		/** предел точности вычисления позиции элемента при движении */
		protected var _epsilon_velo:Number;
		
		public function AbstractLayout_Game()
		{
			init();
		}
		
		override protected function init():void{
			trace("*-----------------------ERROR!---------------------------*");
			trace("Class AbstractLayoutGame can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*--------------------------------------------------------*");
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ СЦЕНЫ
		///
		//////////////////////////////////////////////////////////
		/** возвращает ширину экрана */
		public function get stage_width():Number{
			return _stage_width * _scale;
		}
		
		/** возвращает высоту экрана */
		public function get stage_height():Number{
			return _stage_height;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ЭЛЕМЕНТОВ
		///
		//////////////////////////////////////////////////////////
		/** возвращает высоту созданных элементов над центром гексагона */
		public function get created_element_height():Number{
			return _created_element_height * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ГЕКСАГОНА
		///
		//////////////////////////////////////////////////////////	
		/** возвращает сторону элемента-бриллианта */
		public function get element_side():Number{
			return _element_side * _scale;
		}
		/** возвращает X-координату гексагона на экране */
		public function get hex_pos_on_x():Number{
			return super.scale_short_displacement_x(_hex_pos_on_x);
		}
		
		/** возвращает Y-координату гексагона на экране */
		public function get hex_pos_on_y():Number{
			return super.scale_short_displacement_y(_hex_pos_on_y);
		}
		
		/** возвращает X-координату гексагона вне экрана */
		public function get hex_pos_out_x():Number{
			return super.scale_long_displacement_x(_hex_pos_out_x);
		}
		
		/** возвращает Y-координату гексагона вне экрана */
		public function get hex_pos_out_y():Number{
			return super.scale_short_displacement_y(_hex_pos_out_y);
		}
		
		/** возвращает скорость гексагона */
		public function get hex_velo():Number{
			return _hex_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ПАНЕЛИ КНОПОК
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату нижней панели на экране */
		public function get panel_pos_on_x():Number{
			return super.scale_short_displacement_x(_panel_pos_on_x);
		}
		
		/**  возвращает Y-координату нижней панели на экране */
		public function get panel_pos_on_y():Number{
			return super.scale_short_displacement_y(_panel_pos_on_y);
		}
		
		/**  возвращает X-координату нижней панели вне экрана */
		public function get panel_pos_out_x():Number{
			return super.scale_short_displacement_x(_panel_pos_out_x);
		}
		
		/** возвращает Y-координату нижней панели вне экрана */
		public function get panel_pos_out_y():Number{
			return super.scale_long_displacement_y(_panel_pos_out_y);
		}
		
		/** возвращает скорость движения панели */
		public function get panel_velo():Number{
			return _panel_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПОК
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки выхода в главное меню */
		public function get btn_main_menu_pos_on_x():Number{
			return _scale * _btn_main_menu_pos_on_x;
		}
		
		/** возвращает Y-координату кнопки выхода в главное меню */
		public function get btn_main_menu_pos_on_y():Number{
			return _scale * _btn_main_menu_pos_on_y;
		}
		
		/** возвращает X-координату кнопки завершения уровня */
		public function get btn_next_pos_on_x():Number{
			return _scale * _btn_next_pos_on_x;
		}
		
		/** возвращает Y-координату кнопки завершения уровня на панели */
		public function get btn_next_pos_on_y():Number{
			return _scale * _btn_next_pos_on_y;
		}
		
		/** возвращает Y-координату кнопки завершения уровня за пределами панели */
		public function get btn_next_pos_out_y():Number{
			return _scale * _btn_next_pos_out_y;
		}
		
		/** возвращает скорость появления кнопки на экране */
		public function get btn_next_velo():Number{
			return _scale * _btn_next_velo;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ПАНЕЛИ ВЫХОДА ИЗ УРОВНЯ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату выпадающей панели на экране */
		public function get panel_drop_down_pos_on_x():Number{
			return _scale * _panel_drop_down_pos_on_x;
		}
		
		/** возвращает Y-координату выпадающей панели на экране */
		public function get panel_drop_down_pos_on_y():Number{
			return _scale * _panel_drop_down_pos_on_y;
		}
		
		/** возвращает X-координату выпадающей панели вне экрана */
		public function get panel_drop_down_pos_out_x():Number{
			return _scale * _panel_drop_down_pos_out_x;
		}
		
		/** возвращает Y-координату выпадающей панели на экране */
		public function get panel_drop_down_pos_out_y():Number{
			return _scale * _panel_drop_down_pos_out_y;
		}
		
		/** возвращает X-координату кнопки <i>OK</i> на выпадающей панели */
		public function get btn_ok_pos_on_x():Number{
			return _scale * _btn_ok_pos_on_x;
		}
		
		/** возвращает Y-координату кнопки <i>OK</i> на выпадающей панели */
		public function get btn_ok_pos_on_y():Number{
			return _scale * _btn_ok_pos_on_y;
		}
		
		/** возвращает X-координату кнопки <i>YES</i> на выпадающей панели */
		public function get btn_yes_pos_on_x():Number{
			return _scale * _btn_yes_pos_on_x;
		}
		
		/** возвращает Y-координату кнопки <i>YES</i> на выпадающей панели */
		public function get btn_yes_pos_on_y():Number{
			return _scale * _btn_yes_pos_on_y;
		}
		
		/** возвращает X-координату кнопки <i>NO</i> на выпадающей панели */
		public function get btn_no_pos_on_x():Number{
			return _scale * _btn_no_pos_on_x;
		}
		
		/** возвращает Y-координату кнопки <i>NO</i> на выпадающей панели */
		public function get btn_no_pos_on_y():Number{
			return _scale * _btn_no_pos_on_y;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		ДОСТУП К ПАРАМЕТРАМ ДВИЖЕНИЯ
		///
		//////////////////////////////////////////////////////////
		/** возвращает скорость падения элемента */
		public function get falling_velo():Number{
			return _falling_velo * _scale;
		}
		
		/** возвращает скорость движения элемента */
		public function get moving_velo():Number{
			return _moving_velo * _scale;
		}
		
		/** возвращает скорость распространения взрывной волны */
		public function get wave_velo():Number{
			return _wave_velo * _scale;
		}
		
		/** возвращает величину погрешности при вычислении координат вершин решетки */
		public function get position_inaccuracy():Number{
			return _position_inaccuracy;
		}
		
		/** возвращает предел точности вычисления позиции элемента при движении */
		public function get epsilon_velo():Number{
			return _epsilon_velo;
		}
		
	}
}