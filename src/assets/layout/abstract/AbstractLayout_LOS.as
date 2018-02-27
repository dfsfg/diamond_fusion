package assets.layout.abstract
{

	/**
	 * <h1>Расположение элементов на экране LevelOverScreen</h1>
	 * <p>Класс объявляет, но не задает параметры расположения элементов на экране LevelOverScreen, а так же
	 * методы доступа к этим параметрам.</p>
	 * <p>Является абстрактным базовым классом, который должен быть наследован конкретными классами,
	 * определяющими расположение элементов на экране с заданным разрешением.</p>
	 * */
	public class AbstractLayout_LOS extends AbstractLayoutScalable
	{
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** X-координата названия экрана на экране */
		protected var _img_los_name_pos_on_x:Number;
		
		/** Y-координата названия экрана на экране */
		protected var _img_los_name_pos_on_y:Number;
		
		/** X-координата названия экрана вне экрана */
		protected var _img_los_name_pos_out_x:Number;
		
		/** Y-координата названия экрана вне экрана */
		protected var _img_los_name_pos_out_y:Number;
		
		/** скорость движения названия */
		protected var _img_los_name_velo:Number;		
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ВЫПАДАЮЩЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата выпадающей панели на экране */
		protected var _spr_los_ddp_pos_on_x:Number;
		
		/** Y-координата выпадающей панели на экране */
		protected var _spr_los_ddp_pos_on_y:Number;
		
		/** X-координата выпадающей панели вне экрана */
		protected var _spr_los_ddp_pos_out_x:Number;
		
		/** Y-координата выпадающей панели вне экрана */
		protected var _spr_los_ddp_pos_out_y:Number;
		
		/** скорость движения выпадающей панели на экране */
		protected var _spr_los_ddp_velo:Number;
		
		//////////////////////////////////////////////////////////
		///
		//	ОБЩИЕ ПАРАМЕТРЫ ТЕКСТОВЫХ ПОЛЕЙ НА ВЫПАДАЮЩЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** ширина текстового поля выпадающей панели */
		protected var _txt_los_ddp_width:Number;
		
		/** высота текстового поля выпадающей панели */
		protected var _txt_los_ddp_height:Number;
		
		/** наименование шрифта текстового поля выпадающей панели */
		protected var _txt_los_ddp_font_name:String;
		
		/** размер шрифта текстового поля выпадающей панели */
		protected var _txt_los_ddp_font_size:int;
		
		/** цвет шрифта текстового поля выпадающей панели */
		protected var _txt_los_ddp_font_color:int;
		
		/** является ли шрифт текстового поля выпадающей панели жирным, или нет */
		protected var _txt_los_ddp_font_bold:Boolean;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ТЕКСТОВОГО ПОЛЯ СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата текстового поля суперцели на выпадающей панели */
		protected var _txt_goal_super_x:Number;
		
		/** Y-координата текстового поля суперцели на выпадающей панели */
		protected var _txt_goal_super_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ТЕКСТОВОГО ПОЛЯ ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата текстового поля главной цели на выпадающей панели */
		protected var _txt_goal_primary_x:Number;
		
		/** Y-координата текстового поля главной цели на выпадающей панели */
		protected var _txt_goal_primary_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ТЕКСТОВОГО ПОЛЯ ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата текстового поля дополнительной цели на выпадающей панели */
		protected var _txt_goal_secondary_x:Number;
		
		/** Y-координата текстового поля дополнительной цели на выпадающей панели */
		protected var _txt_goal_secondary_y:Number;
		
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения суперцели на выпадающей панели */
		protected var _img_goal_super_x:Number;
		
		/** Y-координата изображения суперцели на выпадающей панели */
		protected var _img_goal_super_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения главной цели на выпадающей панели */
		protected var _img_goal_primary_x:Number;
		
		/** Y-координата изображения главной цели на выпадающей панели */
		protected var _img_goal_primary_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения дополнительной цели на выпадающей панели */
		protected var _img_goal_secondary_x:Number;
		
		/** Y-координата изображения дополнительной цели на выпадающей панели */
		protected var _img_goal_secondary_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ ЗОЛОТОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения золотого кубка на выпадающей панели */
		protected var _img_cup_super_x:Number;
		
		/** Y-координата изображения золотого кубка на выпадающей панели */
		protected var _img_cup_super_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ СЕРЕБРЯННОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения серебрянного кубка на выпадающей панели */
		protected var _img_cup_primary_x:Number;
		
		/** Y-координата изображения серебрянного кубка на выпадающей панели */
		protected var _img_cup_primary_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ ИЗОБРАЖЕНИЯ БРОНЗОВОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** X-координата изображения бронзового кубка на выпадающей панели */
		protected var _img_cup_secondary_x:Number;
		
		/** Y-координата изображения бронзового кубка на выпадающей панели */
		protected var _img_cup_secondary_y:Number;
		
		//////////////////////////////////////////////////////////
		///
		//		ПАРАМЕТРЫ КНОПКИ ПРОДОЛЖЕНИЯ
		///
		//////////////////////////////////////////////////////////
		/** X-координата кнопки продолжения на экране */
		protected var _btn_next_pos_on_x:Number;
		
		/** Y-координата кнопки продолжения на экране */
		protected var _btn_next_pos_on_y:Number;
		
		/** X-координата кнопки продолжения вне экрана */
		protected var _btn_next_pos_out_x:Number;
		
		/** Y-координата кнопки продолжения вне экрана */
		protected var _btn_next_pos_out_y:Number;
		
		/** скорость движения кнопки продолжения */
		protected var _btn_next_velo:Number;
		
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
		
		public function AbstractLayout_LOS()
		{
			super();
		}
		
		override protected function init():void{
			trace("*------------------------------ERROR!-------------------------------*");
			trace("Class AbstractLayoutLevelOverScreen can not be instantiated directly.");
			trace("Instead, it must be extended by some of its subclasses");
			trace("*-------------------------------------------------------------------*");
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ НАЗВАНИЯ ЭКРАНА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату названия экрана на экране */
		public function get img_los_name_pos_on_x():Number{
			return super.scale_short_displacement_x(_img_los_name_pos_on_x);
		}
		
		/** возвращает Y-координату названия экрана на экране */
		public function get img_los_name_pos_on_y():Number{
			return super.scale_short_displacement_y(_img_los_name_pos_on_y);
		}
		
		/** возвращает X-координату названия экрана вне экрана */
		public function get img_los_name_pos_out_x():Number{
			return super.scale_short_displacement_x(_img_los_name_pos_out_x);
		}
		
		/** возвращает Y-координату названия экрана вне экрана */
		public function get img_los_name_pos_out_y():Number{
			return super.scale_long_displacement_y(_img_los_name_pos_out_y);
		}
		
		/** возвращает скорость движения названия экрана */
		public function get img_los_name_velo():Number{
			return _img_los_name_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ВЫПАДАЮЩЕЙ ПАНЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату выпадающей панели на экране */
		public function get spr_los_ddp_pos_on_x():Number{
			return super.scale_short_displacement_x(_spr_los_ddp_pos_on_x);
		}
		
		/** возвращает Y-координату выпадающей панели на экране */
		public function get spr_los_ddp_pos_on_y():Number{
			return super.scale_short_displacement_y(_spr_los_ddp_pos_on_y);
		}
		
		/** возвращает X-координату выпадающей панели вне экрана */
		public function get spr_los_ddp_pos_out_x():Number{
			return super.scale_long_displacement_x(_spr_los_ddp_pos_out_x);
		}
		
		/** возвращает Y-координату выпадающей панели вне экрана */
		public function get spr_los_ddp_pos_out_y():Number{
			return super.scale_short_displacement_y(_spr_los_ddp_pos_out_y);
		}
		
		/** возвращает скорость движения выпадающей панели вне экрана */
		public function get spr_los_ddp_velo():Number{
			return _spr_los_ddp_velo * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ОБЩИМ ПАРАМЕТРАМ ТЕКСТОВЫХ ПОЛЕЙ
		///
		//////////////////////////////////////////////////////////
		/** возвращает ширину текстового поля на выпадающей панели */
		public function get txt_los_ddp_width():Number{
			return _txt_los_ddp_width * _scale;
		}
		
		/** возвращает высоту текстового поля на выпадающей панели */
		public function get txt_los_ddp_height():Number{
			return _txt_los_ddp_height * _scale;
		}
		
		/** возвращает наименование шрифта текстового поля выпадающей панели */
		public function get txt_los_ddp_font_name():String{
			return _txt_los_ddp_font_name;
		}
		
		/** возвращает размер шрифта текстового поля выпадающей панели */
		public function get txt_los_ddp_font_size():int{
			return _txt_los_ddp_font_size * _scale;
		}
		
		/** возвращает цвет шрифта текстового поля выпадающей панели */
		public function get txt_los_ddp_font_color():int{
			return _txt_los_ddp_font_color;
		}
		
		/** возвращает значение <i>"true"</i>, если шрифт жирный, или <i>"false"</i>, если обычный */
		public function get txt_los_ddp_font_bold():Boolean{
			return _txt_los_ddp_font_bold;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ТЕКСТОВОГО ПОЛЯ СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату текстового поля суперцели на выпадающей панели */
		public function get txt_super_goal_x():Number{
			return _txt_goal_super_x * _scale;
		}
		
		/** возвращает Y-координату текстового поля суперцели на выпадающей панели */
		public function get txt_super_goal_y():Number{
			return _txt_goal_super_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ТЕКСТОВОГО ПОЛЯ ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату текстового поля главной цели на выпадающей панели */
		public function get txt_primary_goal_x():Number{
			return _txt_goal_primary_x * _scale;
		}
		
		/** возвращает Y-координату текстового поля главной цели на выпадающей панели */
		public function get txt_primary_goal_y():Number{
			return _txt_goal_primary_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ТЕКСТОВОГО ПОЛЯ ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату текстового поля дополнительной цели на выпадающей панели */
		public function get txt_secondary_goal_x():Number{
			return _txt_goal_secondary_x * _scale;
		}
		
		/** возвращает Y-координату текстового поля дополнительной цели на выпадающей панели */
		public function get txt_secondary_goal_y():Number{
			return _txt_goal_secondary_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ СУПЕРЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения суперцели на выпадающей панели */
		public function get img_super_goal_x():Number{
			return _img_goal_super_x * _scale;
		}
		
		/** возвращает Y-координату изображения суперцели на выпадающей панели */
		public function get img_super_goal_y():Number{
			return _img_goal_super_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ ГЛАВНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения главной цели на выпадающей панели */
		public function get img_primary_goal_x():Number{
			return _img_goal_primary_x * _scale;
		}
		
		/** возвращает Y-координату изображения главной цели на выпадающей панели */
		public function get img_primary_goal_y():Number{
			return _img_goal_primary_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ ДОПОЛНИТЕЛЬНОЙ ЦЕЛИ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения дополнительной цели на выпадающей панели */
		public function get img_secondary_goal_x():Number{
			return _img_goal_secondary_x * _scale;
		}
		
		/** возвращает Y-координату изображения дополнительной цели на выпадающей панели */
		public function get img_secondary_goal_y():Number{
			return _img_goal_secondary_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ ЗОЛОТОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения золотого кубка на выпадающей панели */
		public function get img_super_cup_x():Number{
			return _img_cup_super_x * _scale;
		}
		
		/** возвращает Y-координату изображения золотого кубка на выпадающей панели */
		public function get img_super_cup_y():Number{
			return _img_cup_super_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ СЕРЕБРЯННОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения серебрянного кубка на выпадающей панели */
		public function get img_primary_cup_x():Number{
			return _img_cup_primary_x * _scale;
		}
		
		/** возвращает Y-координату изображения серебрянного кубка на выпадающей панели */
		public function get img_primary_cup_y():Number{
			return _img_cup_primary_y * _scale;
		}
		
		//////////////////////////////////////////////////////////
		///
		//	МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ ИЗОБРАЖЕНИЯ БРОНЗОВОГО КУБКА
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату изображения бронзового кубка на выпадающей панели */
		public function get img_secondary_cup_x():Number{
			return _img_cup_secondary_x * _scale;
		}
		
		/** возвращает Y-координату изображения бронзового кубка на выпадающей панели */
		public function get img_secondary_cup_y():Number{
			return _img_cup_secondary_y;
		}
		
		//////////////////////////////////////////////////////////
		///
		//		МЕТОДЫ ДОСТУПА К ПАРАМЕТРАМ КНОПКИ ПРОДОЛЖЕНИЯ
		///
		//////////////////////////////////////////////////////////
		/** возвращает X-координату кнопки продолжения на экране */
		public function get btn_next_pos_on_x():Number{
			return super.scale_short_displacement_x(_btn_next_pos_on_x);
		}
		
		/** возвращает Y-координату кнопки продолжения на экране */
		public function get btn_next_pos_on_y():Number{
			return super.scale_short_displacement_y(_btn_next_pos_on_y);
		}
		
		/** возвращает X-координату кнопки продолжения вне экрана */
		public function get btn_next_pos_out_x():Number{
			return super.scale_short_displacement_x(_btn_next_pos_out_x);
		}
		
		/** возвращает Y-координату кнопки продолжения вне экрана */
		public function get btn_next_pos_out_y():Number{
			return super.scale_long_displacement_y(_btn_next_pos_out_y);
		}
		
		/** возвращает скорость движения кнопки продолжения */
		public function get btn_next_velo():Number{
			return _btn_next_velo * _scale;
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