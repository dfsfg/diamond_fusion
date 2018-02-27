package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_MMS;

	public class Layout_MMS_550x750 extends AbstractLayout_MMS
	{
		public function Layout_MMS_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры названия экрана на экране
			_img_main_menu_name_pos_on_x = 275;
			_img_main_menu_name_pos_on_y = 325;
			_img_main_menu_name_transparency_start = 0;
			_img_main_menu_name_transparency_end = 100;
			_img_main_menu_name_transparency_step = 2;
			
			// параметры кнопки "show_panel" на экране
			_btn_show_panel_pos_on_x = 275;
			_btn_show_panel_pos_on_y = 425;
			_btn_show_panel_pos_out_x = 700;
			_btn_show_panel_pos_out_y = 425;
			_btn_show_panel_velo = 30;
			
			// параметры кнопки "mode" на экране
			_btn_mode_pos_on_x = 275;;
			_btn_mode_pos_on_y = 500;
			_btn_mode_pos_out_x = - 150;
			_btn_mode_pos_out_y = 500;
			_btn_mode_velo = 30;
			
			// параметры кнопки "help" на экране
			_btn_help_pos_on_x = 275;
			_btn_help_pos_on_y = 575;
			_btn_help_pos_out_x = 700;
			_btn_help_pos_out_y = 575;
			_btn_help_velo = 30;
			
			// параметры кнопки "home" на экране
			_btn_home_pos_on_x = 275;
			_btn_home_pos_on_y = 650;
			_btn_home_pos_out_x = 275;
			_btn_home_pos_out_y = 1075;
			_btn_home_velo = 30;
			
			// параметры бриллианта на экране
			_img_diamond_small_pos_on_x = 275;
			_img_diamond_small_pos_on_y = 150;
			_img_diamond_small_pos_out_x = 275;
			_img_diamond_small_pos_out_y = -275;
			_img_diamond_small_velo = 30;
			
			// параметры панели с кнопками уровней на экране
			_spr_dropdown_panel_pos_on_x = 275;
			_spr_dropdown_panel_pos_on_y = 400;
			_spr_dropdown_panel_pos_out_x = 275;
			_spr_dropdown_panel_pos_out_y = -400;
			_spr_dropdown_panel_velo = 30;
			
			// параметры панели с выбора режима игры на экране
			_spr_mode_panel_pos_on_x = 275;
			_spr_mode_panel_pos_on_y = 500;
			_spr_mode_panel_pos_out_x = 275;
			_spr_mode_panel_pos_out_y = -400;
			_spr_mode_panel_velo = 30;
			
			// параметры кнопки "back" на панели кнопок уровней
			_btn_hide_panel_pos_on_x = -100;
			_btn_hide_panel_pos_on_y = 280;
			
			// параметры кнопки "play" на панели кнопок уровней
			_btn_play_pos_on_x = 100;
			_btn_play_pos_on_y = 280;
			
			// параметры кнопки "strict mode" на панели выбора режима игры
			_btn_strict_mode_pos_on_x = - 125;
			_btn_strict_mode_pos_on_y = 0;
			
			// параметры кнопки "zen mode" на панели выбора режима игры
			_btn_zen_mode_pos_on_x = -125;
			_btn_zen_mode_pos_on_y = 105;
			
			// параметры кубков выполнения заданий на кнопках уровней
			_cup_gold_pos_on_btn_x = 17;
			_cup_silver_pos_on_btn_x = 50;
			_cup_bronze_pos_on_btn_x = 67;
			_cup_pos_on_btn_y = 25;
			
			//-------------------------------------------------------
			
			// параметры кнопки "level_0" на панели кнопок уровней
			_btn_level_0_pos_on_x = -180;
			_btn_level_0_pos_on_y = -280;
			
			// параметры кнопки "level_1" на панели кнопок уровней
			_btn_level_1_pos_on_x = -60;
			_btn_level_1_pos_on_y = -280;
			
			// параметры кнопки "level_2" на панели кнопок уровней
			_btn_level_2_pos_on_x = 60;
			_btn_level_2_pos_on_y = -280;
			
			// параметры кнопки "level_3" на панели кнопок уровней
			_btn_level_3_pos_on_x = 180;
			_btn_level_3_pos_on_y = -280;
			
			//------------------------------------------------------
			
			// параметры кнопки "level_4" на панели кнопок уровней
			_btn_level_4_pos_on_x = -180;
			_btn_level_4_pos_on_y = -210;
			
			// параметры кнопки "level_5" на панели кнопок уровней
			_btn_level_5_pos_on_x = -60;
			_btn_level_5_pos_on_y = -210;
			
			// параметры кнопки "level_6" на панели кнопок уровней
			_btn_level_6_pos_on_x = 60;
			_btn_level_6_pos_on_y = -210;
			
			// параметры кнопки "level_7" на панели кнопок уровней
			_btn_level_7_pos_on_x = 180;
			_btn_level_7_pos_on_y = -210;
			
			//-----------------------------------------------------
			
			// параметры кнопки "level_8" на панели кнопок уровней
			_btn_level_8_pos_on_x = -180;
			_btn_level_8_pos_on_y = -140;
			
			// параметры кнопки "level_9" на панели кнопок уровней
			_btn_level_9_pos_on_x = -60;
			_btn_level_9_pos_on_y = -140;
						
			// параметры кнопки "level_10" на панели кнопок уровней
			_btn_level_10_pos_on_x = 60;
			_btn_level_10_pos_on_y = -140;
			
			// параметры кнопки "level_11" на панели кнопок уровней
			_btn_level_11_pos_on_x = 180;
			_btn_level_11_pos_on_y = -140;
			
			//------------------------------------------------------
			
			// параметры кнопки "level_12" на панели кнопок уровней
			_btn_level_12_pos_on_x = -180;
			_btn_level_12_pos_on_y = -70;
			
			// параметры кнопки "level_13" на панели кнопок уровней
			_btn_level_13_pos_on_x = -60;
			_btn_level_13_pos_on_y = -70;
			
			// параметры кнопки "level_14" на панели кнопок уровней
			_btn_level_14_pos_on_x = 60;
			_btn_level_14_pos_on_y = -70;
			
			// параметры кнопки "level_15" на панели кнопок уровней
			_btn_level_15_pos_on_x = 180;
			_btn_level_15_pos_on_y = -70;
			
			//-------------------------------------------------------
			
			// параметры кнопки "level_16" на панели кнопок уровней
			_btn_level_16_pos_on_x = -180;
			_btn_level_16_pos_on_y = 0;
			
			// параметры кнопки "level_17" на панели кнопок уровней
			_btn_level_17_pos_on_x = -60;
			_btn_level_17_pos_on_y = 0;
			
			// параметры кнопки "level_18" на панели кнопок уровней
			_btn_level_18_pos_on_x = 60;
			_btn_level_18_pos_on_y = 0;
			
			// параметры кнопки "level_19" на панели кнопок уровней
			_btn_level_19_pos_on_x = 180;
			_btn_level_19_pos_on_y = 0;
			
			//-------------------------------------------------------
			
			// параметры кнопки "level_20" на панели кнопок уровней
			_btn_level_20_pos_on_x = -180;
			_btn_level_20_pos_on_y = 70;
			
			// параметры кнопки "level_21" на панели кнопок уровней
			_btn_level_21_pos_on_x = -60;
			_btn_level_21_pos_on_y = 70;
			
			// параметры кнопки "level_22" на панели кнопок уровней
			_btn_level_22_pos_on_x = 60;
			_btn_level_22_pos_on_y = 70;
			
			// параметры кнопки "level_23" на панели кнопок уровней
			_btn_level_23_pos_on_x = 180;
			_btn_level_23_pos_on_y = 70;
			
			//-----------------------------------------------------
			
			// параметры кнопки "level_24" на панели кнопок уровней
			_btn_level_24_pos_on_x = -180;
			_btn_level_24_pos_on_y = 140;
			
			// параметры кнопки "level_25" на панели кнопок уровней
			_btn_level_25_pos_on_x = -60;
			_btn_level_25_pos_on_y = 140;
			
			// параметры кнопки "level_26" на панели кнопок уровней
			_btn_level_26_pos_on_x = 60;
			_btn_level_26_pos_on_y = 140;
			
			// параметры кнопки "level_27" на панели кнопок уровней
			_btn_level_27_pos_on_x = 180;
			_btn_level_27_pos_on_y = 140;
			
			//------------------------------------------------------
			
			// параметры кнопки "level_28" на панели кнопок уровней
			_btn_level_28_pos_on_x = -60;
			_btn_level_28_pos_on_y = 210;
			
			// параметры кнопки "level_29" на панели кнопок уровней
			_btn_level_29_pos_on_x = 60;
			_btn_level_29_pos_on_y = 210;
		}
	}
}