package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_IS;

	public class Layout_IS_550x750 extends AbstractLayout_IS
	{
		public function Layout_IS_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры названия экрана
			_img_is_name_pos_on_x = 275;
			_img_is_name_pos_on_y = 40;
			_img_is_name_pos_out_x = 275;
			_img_is_name_pos_out_y = -325;
			_img_is_name_velo = 30;
			
			// параметры выпадающей панели
			_img_is_ddp_pos_on_x = 275;
			_img_is_ddp_pos_on_y = 375;
			_img_is_ddp_pos_out_x = -300;
			_img_is_ddp_pos_out_y = 375;
			_img_is_ddp_velo = 30;
			
			// параметры кнопки главного меню
			_btn_main_menu_pos_on_x = 275;
			_btn_main_menu_pos_on_y = 713;
			_btn_main_menu_pos_out_x = 275;
			_btn_main_menu_pos_out_y = 1250;
			_btn_main_menu_velo = 30;
		}
	}
}