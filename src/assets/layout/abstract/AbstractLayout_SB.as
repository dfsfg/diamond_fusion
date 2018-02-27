package assets.layout.abstract
{

	public class AbstractLayout_SB extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ РАСПОЛОЖЕНИЯ SCOREBOARD НА ЭКРАНЕ
		///
		//////////////////////////////////////////////////////////
		/** X-координата табло на экране */
		protected var _score_board_pos_on_x:Number;
		
		/** Y-координата табло на экране */
		protected var _score_board_pos_on_y:Number;
		
		/** X-координата табло вне экрана */
		protected var _score_board_pos_out_x:Number;
		
		/** Y-координата табло вне экрана */
		protected var _score_board_pos_out_y:Number;
		
		/** скорость движения табло */
		protected var _score_board_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ scoreElementScore
		///
		//////////////////////////////////////////////////////////
		/** X-координата элемента scoreElementScore на табло */
		protected var _el_score_pos_on_x:Number;
		
		/** Y-координата элемента scoreElementScore на табло */
		protected var _el_score_pos_on_y:Number;
		
		/** ширина метки элемента scoreElementScor */
		protected var _el_score_label_width:Number;
		
		/** высота метки элемента scoreElementScor */
		protected var _el_score_label_height:Number;
		
		/** расстояние между меткой и отображаемым текстом элемента scoreElementScor */
		protected var _el_score_buffer_width:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "MUSIC ON/OFF"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>MUSIC ON/OFF</i> */
		protected var _btn_music_pos_x:Number;
		
		/** Y-координата кнопки <i>MUSIC ON/OFF</i> */
		protected var _btn_music_pos_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "SOUND VOLUME"
		///
		//////////////////////////////////////////////////////////
		/** крайняя левая X-координата кнопки <i>SOUND VOLUME</i> */
		protected var _btn_sound_pos_left_x:Number;
		
		/** крайняя правая X-координата кнопки <i>SOUND VOLUME</i> */
		protected var _btn_sound_pos_right_x:Number;
		
		/** X-координата кнопки <i>SOUND VOLUME</i> */
		protected var _btn_sound_pos_x:Number;
		
		/** Y-координата кнопки <i>SOUND VOLUME</i> */
		protected var _btn_sound_pos_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ PROGRESS BAR
		///
		//////////////////////////////////////////////////////////
		/** X-координата PROGRESS BAR */
		protected var _progress_bar_pos_x:Number;
		
		/** Y-координата PROGRESS BAR */
		protected var _progress_bar_pos_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ГРАФИЧЕСКОГО ЭЛЕМЕНТА СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента суперцели */
		protected var _el_goal_super_pos_x:Number;
		
		/** Y-координата графического элемента суперцели */
		protected var _el_goal_super_pos_y:Number;
		
		/** расстояние между изображением суперцели и текстовым содержимым
		 * графического элемента суперцели */
		protected var _el_goal_super_buffer_width:Number;
		
		/** ширина тестового содержимого графического элемента суперцели */
		protected var _el_goal_super_content_width:Number;
		
		/** высота текстового содержимого графического элемента суперцели */
		protected var _el_goal_super_content_height:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ГРАФИЧЕСКОГО ЭЛЕМЕНТА ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента главной цели */
		protected var _el_goal_primary_pos_x:Number;
		
		/** Y-координата графического элемента главной цели */
		protected var _el_goal_primary_pos_y:Number;
		
		/** расстояние между изображением главной цели и текстовым содержимым
		 * графического элемента главной цели */
		protected var _el_goal_primary_buffer_width:Number;
		
		/** ширина тестового содержимого графического элемента главной цели */
		protected var _el_goal_primary_content_width:Number;
		
		/** высота текстового содержимого графического элемента главной цели */
		protected var _el_goal_primary_content_height:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ГРАФИЧЕСКОГО ЭЛЕМЕНТА ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента суперцели */
		protected var _el_goal_secondary_pos_x:Number;
		
		/** Y-координата графического элемента суперцели */
		protected var _el_goal_secondary_pos_y:Number;
		
		/** расстояние между изображением суперцели и текстовым содержимым
		 * графического элемента суперцели */
		protected var _el_goal_secondary_buffer_width:Number;
		
		/** ширина тестового содержимого графического элемента суперцели */
		protected var _el_goal_secondary_content_width:Number;
		
		/** высота текстового содержимого графического элемента суперцели */
		protected var _el_goal_secondary_content_height:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ЭЛЕМЕНТА ScoreElement
		///
		//////////////////////////////////////////////////////////
		/** X-координата элемента счета на табло */
		protected var _score_el_pos_x:Number;
		
		/** Y-координата элемента счета на табло */
		protected var _score_el_pos_y:Number;
		
		/** ширина метки */
		protected var _score_el_label_width:Number;
		
		/** высота метки */
		protected var _score_el_label_height:Number;
		
		/** расстояние между меткой и контентом */
		protected var _score_el_buffer_width:Number;
		
		/** ширина контентк */
		protected var _score_el_content_width:Number;
		
		/** размер шрифта */
		protected var _score_el_font_size:Number;
				
		
		public function AbstractLayout_SB()
		{
			super();
		}
		
		override protected function init():void{
			trace("*-----------------------ERROR!-------------------------*");
			trace("Class AbstractLayoutSB can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*-------------------------------------------------------*");
		}
		
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ РАСПОЛОЖЕНИЯ SCOREBOARD
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату табло на экране */
		public function get score_board_pos_on_x():Number{
			return super.scale_short_displacement_x(_score_board_pos_on_x);
		}
		
		/** возвращает X-координату табло на экране */
		public function get score_board_pos_on_y():Number{
			return super.scale_short_displacement_y(_score_board_pos_on_y);
		}
		
		/** возвращает X-координату табло на экране */
		public function get score_board_pos_out_x():Number{
			return super.scale_short_displacement_x(_score_board_pos_out_x);
		}
		
		/** возвращает X-координату табло на экране */
		public function get score_board_pos_out_y():Number{
			return super.scale_long_displacement_y(_score_board_pos_out_y);
		}
		
		/** возвращает X-координату табло на экране */
		public function get score_board_velo():Number{
			return _score_board_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ scoreElementScore
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату элемента счета на табло */
		public function get el_score_pos_on_x():Number{
			return _el_score_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату элемента счета на табло */
		public function get el_score_pos_on_y():Number{
			return _el_score_pos_on_y * _scale;
		}
		
		/** возвращает ширину метки элемента */
		public function get el_score_label_width():Number{
			return _el_score_label_width * _scale;
		}
		
		/** возвращает высоту метки элемента */
		public function get el_score_label_height():Number{
			return _el_score_label_height * _scale;
		}
		
		/** возвращает ширину между меткой элемента и отображаемым текстом */
		public function get el_score_buffer_width():Number{
			return _el_score_buffer_width * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "MUSIC ON/OFF"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>MUSIC ON/OFF</i> */
		public function get btn_music_pos_x():Number{
			return _btn_music_pos_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>MUSIC ON/OFF</i> */
		public function get btn_music_pos_y():Number{
			return _btn_music_pos_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "SOUND VOLUME"
		///
		//////////////////////////////////////////////////////////
		/** возвращает крайнюю левую X-координату кнопки <i>SOUND VOLUME</i> */
		public function get btn_sound_pos_left_x():Number{
			return _btn_sound_pos_left_x * _scale;
		}
		
		/** возвращает крайнюю правую X-координату кнопки <i>SOUND VOLUME</i> */
		
		public function get btn_sound_pos_right_x():Number{
			return _btn_sound_pos_right_x * _scale;
		}
		
		/** возвращает X-координату кнопки <i>SOUND VOLUME</i> */
		public function get btn_sound_pos_x():Number{
			return _btn_sound_pos_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>SOUND VOLUME</i> */
		public function get btn_sound_pos_y():Number{
			return _btn_sound_pos_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ PROGRESS BAR
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату PROGRESS BAR */
		public function get progress_bar_pos_x():Number{
			return _progress_bar_pos_x * _scale;
		}
		
		/** возвращает Y-координата PROGRESS BAR */
		public function get progress_bar_pos_y():Number{
			return _progress_bar_pos_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ГРАФИЧЕСКОГО ЭЛЕМЕНТА СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента суперцели */
		public function get el_goal_super_pos_x():Number{
			return _el_goal_super_pos_x * _scale;
		}
		
		/** Y-координата графического элемента суперцели */
		public function get el_goal_super_pos_y():Number{
			return _el_goal_super_pos_y * _scale;
		}
		
		/** расстояние между изображением суперцели и текстовым содержимым
		 * графического элемента суперцели */
		public function get el_goal_super_buffer_width():Number{
			return _el_goal_super_buffer_width * _scale;
		}
		
		/** ширина тестового содержимого графического элемента суперцели */
		public function get el_goal_super_content_width():Number{
			return _el_goal_super_content_width * _scale;
		}
		
		/** высота текстового содержимого графического элемента суперцели */
		public function get el_goal_super_content_height():Number{
			return _el_goal_super_content_height * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ГРАФИЧЕСКОГО ЭЛЕМЕНТА ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента главной цели */
		public function get el_goal_primary_pos_x():Number{
			return _el_goal_primary_pos_x * _scale;
		}
		
		/** Y-координата графического элемента главной цели */
		public function get el_goal_primary_pos_y():Number{
			return _el_goal_primary_pos_y * _scale;
		}
		
		/** расстояние между изображением главной цели и текстовым содержимым
		 * графического элемента главной цели */
		public function get el_goal_primary_buffer_width():Number{
			return _el_goal_primary_buffer_width * _scale;
		}
		
		/** ширина тестового содержимого графического элемента главной цели */
		public function get el_goal_primary_content_width():Number{
			return _el_goal_primary_content_width * _scale;
		}
		
		/** высота текстового содержимого графического элемента главной цели */
		public function get el_goal_primary_content_height():Number{
			return _el_goal_primary_content_height * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ГРАФИЧЕСКОГО ЭЛЕМЕНТА ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата графического элемента суперцели */
		public function get el_goal_secondary_pos_x():Number{
			return _el_goal_secondary_pos_x * _scale;
		}
		
		/** Y-координата графического элемента суперцели */
		public function get el_goal_secondary_pos_y():Number{
			return _el_goal_secondary_pos_y * _scale;
		}
		
		/** расстояние между изображением суперцели и текстовым содержимым
		 * графического элемента суперцели */
		public function get el_goal_secondary_buffer_width():Number{
			return _el_goal_secondary_buffer_width * _scale;
		}
		
		/** ширина тестового содержимого графического элемента суперцели */
		public function get el_goal_secondary_content_width():Number{
			return _el_goal_secondary_content_width * _scale;
		}
		
		/** высота текстового содержимого графического элемента суперцели */
		public function get el_goal_secondary_content_height():Number{
			return _el_goal_secondary_content_height * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ЭЛЕМЕНТА ScoreElement
		///
		//////////////////////////////////////////////////////////
		/** X-координата элемента счета на табло */
		public function get score_el_pos_x():Number{
			return _score_el_pos_x * _scale;
		}
		
		/** Y-координата элемента счета на табло */
		public function get score_el_pos_y():Number{
			return _score_el_pos_y * _scale;
		}
		
		/** ширина метки */
		public function get score_el_label_width():Number{
			return _score_el_label_width * _scale;
		}
		
		/** высота метки */
		public function get score_el_label_height():Number{
			return _score_el_label_height * _scale;
		}
		
		/** расстояние между меткой и контентом */
		public function get score_el_buffer_width():Number{
			return _score_el_buffer_width * _scale;
		}
		
		/** ширина контентк */
		public function get score_el_content_width():Number{
			return _score_el_content_width * _scale;
		}
		
		/** размер шрифта */
		public function get score_el_font_size():int{
			return new int(_score_el_font_size * _scale);
		}
	}
}