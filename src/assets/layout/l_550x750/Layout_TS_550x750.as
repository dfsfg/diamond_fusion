package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_TS;

	public class Layout_TS_550x750 extends AbstractLayout_TS
	{
		public function Layout_TS_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры названия экрана
			_img_ts_name_pos_on_x = 275;
			_img_ts_name_pos_on_y = 200;
			_img_ts_name_pos_out_x = 275;
			_img_ts_name_pos_out_y = -100;
			_img_ts_name_velo = 30;
			
			// параметры кнопки "START"
			_btn_main_menu_pos_on_x = 275;
			_btn_main_menu_pos_on_y = 600;
			_btn_main_menu_pos_out_x = 275;
			_btn_main_menu_pos_out_y = 800;
			_btn_main_menu_velo = 30;
			
			// параметры бриллианты
			_img_diamond_big_pos_on_x = 275;
			_img_diamond_big_pos_on_y = 400;
			_img_diamond_big_transparency_start = 0;
			_img_diamond_big_transparency_end = 100;
			_img_diamond_big_transparency_step = 1;
		}
	}
}