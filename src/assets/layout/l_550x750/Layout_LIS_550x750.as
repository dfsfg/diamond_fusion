package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_LIS;

	public class Layout_LIS_550x750 extends AbstractLayout_LIS
	{
		public function Layout_LIS_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры названия экрана
			_img_lis_name_pos_on_x = 275;
			_img_lis_name_pos_on_y = 160;
			_img_lis_name_pos_out_x = 275;
			_img_lis_name_pos_out_y = -200;
			_img_lis_name_velo = 30;
			
			// параметры выпадающей панели
			_spr_lis_ddp_pos_on_x = 275;
			_spr_lis_ddp_pos_on_y = 375;
			_spr_lis_ddp_pos_out_x = 275;
			_spr_lis_ddp_pos_out_y = 1025;
			_spr_lis_ddp_velo = 30;
			
			// общие параметры текстовых полей на выпадающей панели
			_txt_lis_ddp_width = 100;
			_txt_lis_ddp_height = 40;
			_txt_lis_ddp_font_name = "Verdana";
			_txt_lis_ddp_font_size = 14;
			_txt_lis_ddp_font_color = 0x000000;
			_txt_lis_ddp_font_bold = true;
			
			// параметры текстового поля суперцели
			_txt_goal_super_x = 50;
			_txt_goal_super_y = -65;
			
			// параметры текстового поля главной рцели
			_txt_goal_primary_x = 50;
			_txt_goal_primary_y = 15;
			
			// параметры текстового поля дополнительной цели
			_txt_goal_secondary_x = 50;
			_txt_goal_secondary_y = 75;
			
			// параметры изображения суперцели
			_img_goal_super_x = -65;
			_img_goal_super_y = -65;
			
			// параметры изображения главной рцели
			_img_goal_primary_x = -75;
			_img_goal_primary_y = 15;
			
			// параметры изображения дополнительной цели
			_img_goal_secondary_x = -75;
			_img_goal_secondary_y = 75;
			
		}
	}
}