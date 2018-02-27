package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_LOS;

	public class Layout_LOS_550x750 extends AbstractLayout_LOS
	{
		public function Layout_LOS_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры названия экрана
			_img_los_name_pos_on_x = 275;
			_img_los_name_pos_on_y = 160;
			_img_los_name_pos_out_x = 275;
			_img_los_name_pos_out_y = -200;
			_img_los_name_velo = 30;
			
			// параметры выпадающей панели
			_spr_los_ddp_pos_on_x = 275;
			_spr_los_ddp_pos_on_y = 375;
			_spr_los_ddp_pos_out_x = 800;
			_spr_los_ddp_pos_out_y = 375;
			_spr_los_ddp_velo = 30;
			
			// общие параметры текстовых полей на выпадающей панели
			_txt_los_ddp_width = 100;
			_txt_los_ddp_height = 40;
			_txt_los_ddp_font_name = "Verdana";
			_txt_los_ddp_font_size = 14;
			_txt_los_ddp_font_color = 0x000000;
			_txt_los_ddp_font_bold = true;
			
			// параметры текстового поля суперцели
			_txt_goal_super_x = 85;
			_txt_goal_super_y = -100;
			
			// параметры текстового поля главной рцели
			_txt_goal_primary_x = 85;
			_txt_goal_primary_y = 0;
			
			// параметры текстового поля дополнительной цели
			_txt_goal_secondary_x = 85;
			_txt_goal_secondary_y = 100;
			
			// параметры изображения суперцели
			_img_goal_super_x = -35;
			_img_goal_super_y = -100;
			
			// параметры изображения главной рцели
			_img_goal_primary_x = -35;
			_img_goal_primary_y = 0;
			
			// параметры изображения дополнительной цели
			_img_goal_secondary_x = -35;
			_img_goal_secondary_y = 100;
			
			
			// параметры изображения золотого кубка
			_img_cup_super_x = -120;
			_img_cup_super_y = -100;
			
			// параметры изображения серебрянного кубка
			_img_cup_primary_x = -120;
			_img_cup_primary_y = 0;
			
			// параметры изображения бронзового кубка
			_img_cup_secondary_x = -120;
			_img_cup_secondary_y = 100;
			
			// параметры кнопки продолжения
			_btn_next_pos_on_x = 275;
			_btn_next_pos_on_y = 585;
			_btn_next_pos_out_x = 275;
			_btn_next_pos_out_y = 785;
			_btn_next_velo = 30;
			
			// параметры кнопки глваного меню
			_btn_main_menu_pos_on_x = 275;
			_btn_main_menu_pos_on_y = 660;
			_btn_main_menu_pos_out_x = 275;
			_btn_main_menu_pos_out_y = 860;
			_btn_main_menu_velo = 30;
		}
	}
}