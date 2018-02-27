package assets.layout.abstract
{

	/**
	 * <h1>Расположение элементов на экране Главного меню</h1>
	 * <p>Класс объявляет, но не задает параметры расположения элементов на экране главного меню, а так же
	 * методы доступа к этим параметрам.</p>
	 * <p>Является абстрактным базовым классом, который должен быть наследован конкретными классами,
	 * определяющими расположение элементов на экране с заданным разрешением.</p>
	 * */
	public class AbstractLayout_MMS extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** X-координата названия экрана на экране */
		protected var _img_main_menu_name_pos_on_x:Number;
		
		/** Y-координата названия экрана на экране */
		protected var _img_main_menu_name_pos_on_y:Number;
		
		/** начальная прозрачность названия экрана */
		protected var _img_main_menu_name_transparency_start:Number;
		
		/** конечная прозрачность названия экрана */
		protected var _img_main_menu_name_transparency_end:Number;
		
		/** шаг изменения прозрачности экрана */
		protected var _img_main_menu_name_transparency_step:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "START"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"START"</i> на экране */
		protected var _btn_show_panel_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"START"</i> на экране */
		protected var _btn_show_panel_pos_on_y:Number;
		
		/** X-координата кнопки <i>"START"</i> вне экрана */
		protected var _btn_show_panel_pos_out_x:Number;
		
		/** Y-координата кнопки <i>"START"</i> вне экрана */
		protected var _btn_show_panel_pos_out_y:Number;
		
		/** скорость кнопки <i>"START"</i> */
		protected var _btn_show_panel_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "MODE"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"MODE"</i> на экране */
		protected var _btn_mode_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"MODE"</i> на экране */
		protected var _btn_mode_pos_on_y:Number;
		
		/** X-координата кнопки <i>"MODE"</i> вне экрана */
		protected var _btn_mode_pos_out_x:Number;
		
		/** Y-координата кнопки <i>"MODE"</i> вне экрана */
		protected var _btn_mode_pos_out_y:Number;
		
		/** скорость кнопки <i>"MODE"</i> */
		protected var _btn_mode_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "HELP"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"HELP"</i> на экране */
		protected var _btn_help_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"HELP"</i> на экране */
		protected var _btn_help_pos_on_y:Number;
		
		/** X-координата кнопки <i>"HELP"</i> вне экрана */
		protected var _btn_help_pos_out_x:Number;
		
		/** Y-координата кнопки <i>"HELP"</i> вне экрана */
		protected var _btn_help_pos_out_y:Number;
		
		/** скорость кнопки <i>"HELP"</i> */
		protected var _btn_help_velo:Number;		
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "HOME"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"HOME"</i> на экране */
		protected var _btn_home_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"HOME"</i> на экране */
		protected var _btn_home_pos_on_y:Number;
		
		/** X-координата кнопки <i>"HOME"</i> вне экрана */
		protected var _btn_home_pos_out_x:Number;
		
		/** Y-координата кнопки <i>"HOME"</i> вне экрана */
		protected var _btn_home_pos_out_y:Number;
		
		/** скорость кнопки <i>"HOME"</i> */
		protected var _btn_home_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ БРИЛЛИАНТА, ОПУСКАЮЩЕГОСЯ СВЕРХУ
		///
		//////////////////////////////////////////////////////////
		/** X-координата бриллианта на экране */
		protected var _img_diamond_small_pos_on_x:Number;
		
		/** Y-координата бриллианта на экране */
		protected var _img_diamond_small_pos_on_y:Number;
		
		/** X-координата бриллианта вне экрана */
		protected var _img_diamond_small_pos_out_x:Number;
		
		/** Y-координата бриллианта вне экрана */
		protected var _img_diamond_small_pos_out_y:Number;
		
		/** скорость бриллианта */
		protected var _img_diamond_small_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ПАНЕЛИ С КНОПКАМИ УРОВНЕЙ
		///
		//////////////////////////////////////////////////////////
		/** X-координата панели с кнопками уровней на экране */
		protected var _spr_dropdown_panel_pos_on_x:Number;
		
		/** Y-координата панели с кнопками уровней на экране */
		protected var _spr_dropdown_panel_pos_on_y:Number;
		
		/** X-координата панели с кнопками уровней вне экрана */
		protected var _spr_dropdown_panel_pos_out_x:Number;
		
		/** Y-координата панели с кнопками уровней вне экрана */
		protected var _spr_dropdown_panel_pos_out_y:Number;
		
		/** скорость панели с кнопками уровней */
		protected var _spr_dropdown_panel_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ПАНЕЛИ ВЫБОРА РЕЖИМА ИГРЫ
		///
		//////////////////////////////////////////////////////////
		/** X-координата панели выбора режима игры на экране */
		protected var _spr_mode_panel_pos_on_x:Number;
		
		/** Y-координата панели выбора режима игры на экране */
		protected var _spr_mode_panel_pos_on_y:Number;
		
		/** X-координата панели выбора режима игры вне экрана */
		protected var _spr_mode_panel_pos_out_x:Number;
		
		/** Y-координата панели выбора режима игры вне экрана */
		protected var _spr_mode_panel_pos_out_y:Number;
		
		/** скорость панели выбора режима игры */
		protected var _spr_mode_panel_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "BACK"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"BACK"</i> на панели кнопок уровней */
		protected var _btn_hide_panel_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"BACK"</i> на панели кнопок уровней */
		protected var _btn_hide_panel_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "PLAY"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"PLAY"</i> на панели кнопок уровней */
		protected var _btn_play_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"PLAY"</i> на панели кнопок уровней */
		protected var _btn_play_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "STRICT MODE"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"STRICT MODE"</i> на панели кнопок уровней */
		protected var _btn_strict_mode_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"STRICT MODE"</i> на панели кнопок уровней */
		protected var _btn_strict_mode_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "ZEN MODE"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"ZEN MODE"</i> на панели кнопок уровней */
		protected var _btn_zen_mode_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"ZEN MODE"</i> на панели кнопок уровней */
		protected var _btn_zen_mode_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//	ПАРАМЕТРЫ КУБКОВ ВЫПОЛНЕНИЯ ЗАДАНИЙ НА КНОПКАХ УРОВНЕЙ
		///
		//////////////////////////////////////////////////////////
		/** X-координата кубка <i>"GOLD"</i> на кнопке уровня */
		protected var _cup_gold_pos_on_btn_x:Number;
		
		/** X-координата кубка <i>"GOLD"</i> на кнопке уровня */
		protected var _cup_silver_pos_on_btn_x:Number;
		
		/** X-координата кубка <i>"GOLD"</i> на кнопке уровня */
		protected var _cup_bronze_pos_on_btn_x:Number;
		
		/** Y-координата любого кубка на кнопке уровня */
		protected var _cup_pos_on_btn_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_0"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_0"</i> на панели кнопок уровней */
		protected var _btn_level_0_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_0"</i> на панели кнопок уровней */
		protected var _btn_level_0_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_1"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_1"</i> на панели кнопок уровней */
		protected var _btn_level_1_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_1"</i> на панели кнопок уровней */
		protected var _btn_level_1_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_2"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_2"</i> на панели кнопок уровней */
		protected var _btn_level_2_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_2"</i> на панели кнопок уровней */
		protected var _btn_level_2_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_3"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_3"</i> на панели кнопок уровней */
		protected var _btn_level_3_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_3"</i> на панели кнопок уровней */
		protected var _btn_level_3_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_4"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_4"</i> на панели кнопок уровней */
		protected var _btn_level_4_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_4"</i> на панели кнопок уровней */
		protected var _btn_level_4_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_5"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_5"</i> на панели кнопок уровней */
		protected var _btn_level_5_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_5"</i> на панели кнопок уровней */
		protected var _btn_level_5_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_6"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_6"</i> на панели кнопок уровней */
		protected var _btn_level_6_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_0"</i> на панели кнопок уровней */
		protected var _btn_level_6_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_7"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_7"</i> на панели кнопок уровней */
		protected var _btn_level_7_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_7"</i> на панели кнопок уровней */
		protected var _btn_level_7_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_8"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_8"</i> на панели кнопок уровней */
		protected var _btn_level_8_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_8"</i> на панели кнопок уровней */
		protected var _btn_level_8_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_9"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_9"</i> на панели кнопок уровней */
		protected var _btn_level_9_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_9"</i> на панели кнопок уровней */
		protected var _btn_level_9_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_10"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_10"</i> на панели кнопок уровней */
		protected var _btn_level_10_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_10"</i> на панели кнопок уровней */
		protected var _btn_level_10_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_11"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_11"</i> на панели кнопок уровней */
		protected var _btn_level_11_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_11"</i> на панели кнопок уровней */
		protected var _btn_level_11_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_12"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_12"</i> на панели кнопок уровней */
		protected var _btn_level_12_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_12"</i> на панели кнопок уровней */
		protected var _btn_level_12_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_13"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_13"</i> на панели кнопок уровней */
		protected var _btn_level_13_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_13"</i> на панели кнопок уровней */
		protected var _btn_level_13_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_14"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_14"</i> на панели кнопок уровней */
		protected var _btn_level_14_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_14"</i> на панели кнопок уровней */
		protected var _btn_level_14_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_15"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_15"</i> на панели кнопок уровней */
		protected var _btn_level_15_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_15"</i> на панели кнопок уровней */
		protected var _btn_level_15_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_16"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_16"</i> на панели кнопок уровней */
		protected var _btn_level_16_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_16"</i> на панели кнопок уровней */
		protected var _btn_level_16_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_17"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_17"</i> на панели кнопок уровней */
		protected var _btn_level_17_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_17"</i> на панели кнопок уровней */
		protected var _btn_level_17_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_18"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_18"</i> на панели кнопок уровней */
		protected var _btn_level_18_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_18"</i> на панели кнопок уровней */
		protected var _btn_level_18_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_19"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_19"</i> на панели кнопок уровней */
		protected var _btn_level_19_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_19"</i> на панели кнопок уровней */
		protected var _btn_level_19_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_20"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_20"</i> на панели кнопок уровней */
		protected var _btn_level_20_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_20"</i> на панели кнопок уровней */
		protected var _btn_level_20_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_21"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_21"</i> на панели кнопок уровней */
		protected var _btn_level_21_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_21"</i> на панели кнопок уровней */
		protected var _btn_level_21_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_22"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_22"</i> на панели кнопок уровней */
		protected var _btn_level_22_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_22"</i> на панели кнопок уровней */
		protected var _btn_level_22_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_23"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_23"</i> на панели кнопок уровней */
		protected var _btn_level_23_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_23"</i> на панели кнопок уровней */
		protected var _btn_level_23_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_24"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_24"</i> на панели кнопок уровней */
		protected var _btn_level_24_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_24"</i> на панели кнопок уровней */
		protected var _btn_level_24_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_25"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_25"</i> на панели кнопок уровней */
		protected var _btn_level_25_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_25"</i> на панели кнопок уровней */
		protected var _btn_level_25_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_26"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_26"</i> на панели кнопок уровней */
		protected var _btn_level_26_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_26"</i> на панели кнопок уровней */
		protected var _btn_level_26_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_27"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_27"</i> на панели кнопок уровней */
		protected var _btn_level_27_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_27"</i> на панели кнопок уровней */
		protected var _btn_level_27_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_28"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_28"</i> на панели кнопок уровней */
		protected var _btn_level_28_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_28"</i> на панели кнопок уровней */
		protected var _btn_level_28_pos_on_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ "LEVEL_29"
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки <i>"LEVEL_29"</i> на панели кнопок уровней */
		protected var _btn_level_29_pos_on_x:Number;
		
		/** Y-координата кнопки <i>"LEVEL_29"</i> на панели кнопок уровней */
		protected var _btn_level_29_pos_on_y:Number;
		
		
		/** Конструктор */
		public function AbstractLayout_MMS()
		{
			super();
		}
		
		override protected function init():void{
			trace("*-----------------------ERROR!-------------------------------*");
			trace("Class AbstractLayoutMainMenu can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*------------------------------------------------------------*");
		}
		
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату названия экрана на экране */
		public function get img_main_menu_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_main_menu_name_pos_on_x);
		}
		
		/** возвращает Y-координату названия экрана на экране */
		public function get img_main_menu_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_main_menu_name_pos_on_y);
		}
		
		/** возвращает начальную прозрачность названия экрана */
		public function get img_main_menu_name_transparency_start():Number{
			return _img_main_menu_name_transparency_start;
		}
		
		/** возвращает конечную прозрачность названия экрана */
		public function get img_main_menu_name_transparency_end():Number{
			return _img_main_menu_name_transparency_end;
		}
		
		/** возвращает шаг изменения прозрачности экрана */
		public function get img_main_menu_name_transparency_step():Number{
			return _img_main_menu_name_transparency_step;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "START"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"START"</i> на экране */
		public function get btn_show_panel_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_show_panel_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки <i>"START"</i> на экране */
		public function get btn_show_panel_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_show_panel_pos_on_y);
		}
		
		/** возвращает X-координату кнопки <i>"START"</i> вне экрана */
		public function get btn_show_panel_pos_out_x():Number{
			return super.scale_long_displacement_x(_btn_show_panel_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки <i>"START"</i> вне экрана */
		public function get btn_show_panel_pos_out_y():Number{
			return super.scale_short_displacement_y(_btn_show_panel_pos_out_y);
		}
		
		/** возвращает скорость кнопки <i>"START"</i> */
		public function get btn_show_panel_velo():Number{
			return _btn_show_panel_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "MODE"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"MODE"</i> на экране */
		public function get btn_mode_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_mode_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки <i>"MODE"</i> на экране */
		public function get btn_mode_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_mode_pos_on_y);
		}
		
		/** возвращает X-координату кнопки <i>"MODE"</i> вне экрана */
		public function get btn_mode_pos_out_x():Number{
			return super.scale_long_displacement_x(_btn_mode_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки <i>"MODE"</i> вне экрана */
		public function get btn_mode_pos_out_y():Number{
			return super.scale_short_displacement_y(_btn_mode_pos_out_y);
		}
		
		/** возвращает скорость кнопки <i>"MODE"</i> */
		public function get btn_mode_velo():Number{
			return _btn_mode_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "HELP"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"HELP"</i> на экране */
		public function get btn_help_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_help_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки <i>"HELP"</i> на экране */
		public function get btn_help_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_help_pos_on_y);
		}
		
		/** возвращает X-координату кнопки <i>"HELP"</i> вне экрана */
		public function get btn_help_pos_out_x():Number{
			return super.scale_long_displacement_x(_btn_help_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки <i>"HELP"</i> вне экрана */
		public function get btn_help_pos_out_y():Number{
			return super.scale_short_displacement_y(_btn_help_pos_out_y);
		}
		
		/** возвращает скорость кнопки <i>"HELP"</i> */
		public function get btn_help_velo():Number{
			return _btn_help_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "HOME"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"HOME"</i> на экране */
		public function get btn_home_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_home_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки <i>"HOME"</i> на экране */
		public function get btn_home_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_home_pos_on_y);
		}
		
		/** возвращает X-координату кнопки <i>"HOME"</i> вне экрана */
		public function get btn_home_pos_out_x():Number{
			return super.scale_short_displacement_x(_btn_home_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки <i>"HOME"</i> вне экрана */
		public function get btn_home_pos_out_y():Number{
			return super.scale_long_displacement_y(_btn_home_pos_out_y);
		}
		
		/** возвращает скорость кнопки <i>"HOME"</i> */
		public function get btn_home_velo():Number{
			return _btn_home_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ БРИЛЛИАНТА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату бриллианта на экране */
		public function get img_diamond_small_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_diamond_small_pos_on_x);
		}
		
		/** возвращает Y-координату бриллианта на экране */
		public function get img_diamond_small_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_diamond_small_pos_on_y);
		}
		
		/** возвращает X-координату бриллианта вне экрана */
		public function get img_diamond_small_pos_out_x():Number{
			return super.scale_short_displacement_x(_img_diamond_small_pos_out_x);
		}
		
		/** возвращает Y-координату бриллианта вне экрана */
		public function get img_diamond_small_pos_out_y():Number{
			return super.scale_long_displacement_y(_img_diamond_small_pos_out_y);
		}
		
		/** возвращает скорость бриллианта */
		public function get img_diamond_small_velo():Number{
			return _img_diamond_small_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ПАНЕЛИ КНОПОК УРОВНЕЙ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату панели с кнопками уровней на экране */
		public function get spr_dropdown_panel_pos_on_x():Number{
			return super.scale_short_displacement_x(_spr_dropdown_panel_pos_on_x);
		}
		
		/** возвращает Y-координату панели с кнопками уровней на экране */
		public function get spr_dropdown_panel_pos_on_y():Number{
			return super.scale_short_displacement_y(_spr_dropdown_panel_pos_on_y);
		}
		
		/** возвращает X-координату панели с кнопками уровней вне экрана */
		public function get spr_dropdown_panel_pos_out_x():Number{
			return super.scale_short_displacement_x(_spr_dropdown_panel_pos_out_x);
		}
		
		/** возвращает Y-координату панели с кнопками уровней вне экрана */
		public function get spr_dropdown_panel_pos_out_y():Number{
			return super.scale_long_displacement_y(_spr_dropdown_panel_pos_out_y);
		}
		
		/** возвращает скорость панели с кнопками уровней */
		public function get spr_dropdown_panel_velo():Number{
			return _spr_dropdown_panel_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ПАНЕЛИ РЕЖИМА ИГРЫ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату панели выбора режима игры на экране */
		public function get spr_mode_panel_pos_on_x():Number{
			return super.scale_short_displacement_x(_spr_mode_panel_pos_on_x);
		}
		
		/** возвращает Y-координату панели выбора режима игры на экране */
		public function get spr_mode_panel_pos_on_y():Number{
			return super.scale_short_displacement_y(_spr_mode_panel_pos_on_y);
		}
		
		/** возвращает X-координату панели выбора режима игры вне экрана */
		public function get spr_mode_panel_pos_out_x():Number{
			return super.scale_short_displacement_x(_spr_mode_panel_pos_out_x);
		}
		
		/** возвращает Y-координату панели выбора режима игры вне экрана */
		public function get spr_mode_panel_pos_out_y():Number{
			return super.scale_long_displacement_y(_spr_mode_panel_pos_out_y);
		}
		
		/** возвращает скорость панели выбора режима игры */
		public function get spr_mode_panel_velo():Number{
			return _spr_mode_panel_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "BACK"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"BACK"</i> на экране */
		public function get btn_hide_panel_pos_on_x():Number{
			return _btn_hide_panel_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"BACK"</i> на экране */
		public function get btn_hide_panel_pos_on_y():Number{
			return _btn_hide_panel_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "PLAY"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"PLAY"</i> на экране */
		public function get btn_play_pos_on_x():Number{
			return _btn_play_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"PLAY"</i> на экране */
		public function get btn_play_pos_on_y():Number{
			return _btn_play_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "MODE STRICT"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"MODE STRICT"</i> на экране */
		public function get btn_strict_mode_pos_on_x():Number{
			return _btn_strict_mode_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"MODE STRICT"</i> на экране */
		public function get btn_strict_mode_pos_on_y():Number{
			return _btn_strict_mode_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "MODE ZEN"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"MODE ZEN"</i> на экране */
		public function get btn_zen_mode_pos_on_x():Number{
			return _btn_zen_mode_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"MODE ZEN"</i> на экране */
		public function get btn_zen_mode_pos_on_y():Number{
			return _btn_zen_mode_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КУБКОВ ВЫПОЛНЕНИЯ ЗАДАНИЙ НА КНОПКАХ УРОВНЕЙ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кубка <i>"GOLD"</i> на кнопке уровня */
		public function get cup_gold_pos_on_btn_x():Number{
			return _cup_gold_pos_on_btn_x * _scale;
		}
		
		/** возвращает X-координату кубка <i>"GOLD"</i> на кнопке уровня */
		public function get cup_silver_pos_on_btn_x():Number{
			return _cup_silver_pos_on_btn_x * _scale;
		}
		
		/** возвращает X-координату кубка <i>"GOLD"</i> на кнопке уровня */
		public function get cup_bronze_pos_on_btn_x():Number{
			return _cup_bronze_pos_on_btn_x * _scale;
		}
		
		/** возвращает Y-координату любого кубка на кнопке уровня */
		public function get cup_pos_on_btn_y():Number{
			return _cup_pos_on_btn_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_0"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_0"</i> на экране */
		public function get btn_level_0_pos_on_x():Number{
			return _btn_level_0_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_0"</i> на экране */
		public function get btn_level_0_pos_on_y():Number{
			return _btn_level_0_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_1"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_1"</i> на экране */
		public function get btn_level_1_pos_on_x():Number{
			return _btn_level_1_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_1"</i> на экране */
		public function get btn_level_1_pos_on_y():Number{
			return _btn_level_1_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_2"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_2"</i> на экране */
		public function get btn_level_2_pos_on_x():Number{
			return _btn_level_2_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_2"</i> на экране */
		public function get btn_level_2_pos_on_y():Number{
			return _btn_level_2_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_3"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_3"</i> на экране */
		public function get btn_level_3_pos_on_x():Number{
			return _btn_level_3_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_3"</i> на экране */
		public function get btn_level_3_pos_on_y():Number{
			return _btn_level_3_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_4"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_4"</i> на экране */
		public function get btn_level_4_pos_on_x():Number{
			return _btn_level_4_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_4"</i> на экране */
		public function get btn_level_4_pos_on_y():Number{
			return _btn_level_4_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_5"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_5"</i> на экране */
		public function get btn_level_5_pos_on_x():Number{
			return _btn_level_5_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_5"</i> на экране */
		public function get btn_level_5_pos_on_y():Number{
			return _btn_level_5_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_6"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_6"</i> на экране */
		public function get btn_level_6_pos_on_x():Number{
			return _btn_level_6_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_6"</i> на экране */
		public function get btn_level_6_pos_on_y():Number{
			return _btn_level_6_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_7"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_7"</i> на экране */
		public function get btn_level_7_pos_on_x():Number{
			return _btn_level_7_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_7"</i> на экране */
		public function get btn_level_7_pos_on_y():Number{
			return _btn_level_7_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_8"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_8"</i> на экране */
		public function get btn_level_8_pos_on_x():Number{
			return _btn_level_8_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_8"</i> на экране */
		public function get btn_level_8_pos_on_y():Number{
			return _btn_level_8_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_9"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_9"</i> на экране */
		public function get btn_level_9_pos_on_x():Number{
			return _btn_level_9_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_9"</i> на экране */
		public function get btn_level_9_pos_on_y():Number{
			return _btn_level_9_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_10"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_10"</i> на экране */
		public function get btn_level_10_pos_on_x():Number{
			return _btn_level_10_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_10"</i> на экране */
		public function get btn_level_10_pos_on_y():Number{
			return _btn_level_10_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_11"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_11"</i> на экране */
		public function get btn_level_11_pos_on_x():Number{
			return _btn_level_11_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_11"</i> на экране */
		public function get btn_level_11_pos_on_y():Number{
			return _btn_level_11_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_12"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_12"</i> на экране */
		public function get btn_level_12_pos_on_x():Number{
			return _btn_level_12_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_12"</i> на экране */
		public function get btn_level_12_pos_on_y():Number{
			return _btn_level_12_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_13"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_13"</i> на экране */
		public function get btn_level_13_pos_on_x():Number{
			return _btn_level_13_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_13"</i> на экране */
		public function get btn_level_13_pos_on_y():Number{
			return _btn_level_13_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_14"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_14"</i> на экране */
		public function get btn_level_14_pos_on_x():Number{
			return _btn_level_14_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_14"</i> на экране */
		public function get btn_level_14_pos_on_y():Number{
			return _btn_level_14_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_15"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_15"</i> на экране */
		public function get btn_level_15_pos_on_x():Number{
			return _btn_level_15_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_15"</i> на экране */
		public function get btn_level_15_pos_on_y():Number{
			return _btn_level_15_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_16"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_16"</i> на экране */
		public function get btn_level_16_pos_on_x():Number{
			return _btn_level_16_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_16"</i> на экране */
		public function get btn_level_16_pos_on_y():Number{
			return _btn_level_16_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_17"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_17"</i> на экране */
		public function get btn_level_17_pos_on_x():Number{
			return _btn_level_17_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_17"</i> на экране */
		public function get btn_level_17_pos_on_y():Number{
			return _btn_level_17_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_18"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_18"</i> на экране */
		public function get btn_level_18_pos_on_x():Number{
			return _btn_level_18_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_18"</i> на экране */
		public function get btn_level_18_pos_on_y():Number{
			return _btn_level_18_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_19"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_19"</i> на экране */
		public function get btn_level_19_pos_on_x():Number{
			return _btn_level_19_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_19"</i> на экране */
		public function get btn_level_19_pos_on_y():Number{
			return _btn_level_19_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_20"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_20"</i> на экране */
		public function get btn_level_20_pos_on_x():Number{
			return _btn_level_20_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_20"</i> на экране */
		public function get btn_level_20_pos_on_y():Number{
			return _btn_level_20_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_21"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_21"</i> на экране */
		public function get btn_level_21_pos_on_x():Number{
			return _btn_level_21_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_21"</i> на экране */
		public function get btn_level_21_pos_on_y():Number{
			return _btn_level_21_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_22"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_22"</i> на экране */
		public function get btn_level_22_pos_on_x():Number{
			return _btn_level_22_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_22"</i> на экране */
		public function get btn_level_22_pos_on_y():Number{
			return _btn_level_22_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_23"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_23"</i> на экране */
		public function get btn_level_23_pos_on_x():Number{
			return _btn_level_23_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_23"</i> на экране */
		public function get btn_level_23_pos_on_y():Number{
			return _btn_level_23_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_24"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_24"</i> на экране */
		public function get btn_level_24_pos_on_x():Number{
			return _btn_level_24_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_24"</i> на экране */
		public function get btn_level_24_pos_on_y():Number{
			return _btn_level_24_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_25"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_25"</i> на экране */
		public function get btn_level_25_pos_on_x():Number{
			return _btn_level_25_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_25"</i> на экране */
		public function get btn_level_25_pos_on_y():Number{
			return _btn_level_25_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_26"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_26"</i> на экране */
		public function get btn_level_26_pos_on_x():Number{
			return _btn_level_26_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_26"</i> на экране */
		public function get btn_level_26_pos_on_y():Number{
			return _btn_level_26_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_27"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_27"</i> на экране */
		public function get btn_level_27_pos_on_x():Number{
			return _btn_level_27_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_27"</i> на экране */
		public function get btn_level_27_pos_on_y():Number{
			return _btn_level_27_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_28"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_28"</i> на экране */
		public function get btn_level_28_pos_on_x():Number{
			return _btn_level_28_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_28"</i> на экране */
		public function get btn_level_28_pos_on_y():Number{
			return _btn_level_28_pos_on_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ "LEVEL_29"
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки <i>"LEVEL_29"</i> на экране */
		public function get btn_level_29_pos_on_x():Number{
			return _btn_level_29_pos_on_x * _scale;
		}
		
		/** возвращает Y-координату кнопки <i>"LEVEL_29"</i> на экране */
		public function get btn_level_29_pos_on_y():Number{
			return _btn_level_29_pos_on_y * _scale;
		}
	}
}