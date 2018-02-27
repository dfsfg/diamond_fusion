package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_Game;
	
	public class Layout_Game_550x750 extends AbstractLayout_Game
	{
		public function Layout_Game_550x750()
		{
			super();
		}
		
		override protected function init():void{
			_stage_width = 550;
			_stage_height = 750;
			
			_created_element_height = 700;
			
			_element_side = 27;
			
			_hex_pos_on_x = 275;
			_hex_pos_on_y = 400;
			_hex_pos_out_x = 875;
			_hex_pos_out_y = 400;
			_hex_velo = 30;
			
			_panel_pos_on_x = 5;
			_panel_pos_on_y = 696;
			_panel_pos_out_x = 5;
			_panel_pos_out_y = 800;
			_panel_velo = 10;
			
			_btn_main_menu_pos_on_x = 46;
			_btn_main_menu_pos_on_y = 27;
			
			_btn_next_pos_on_x = 496;
			_btn_next_pos_on_y = 27;
			_btn_next_pos_out_y = 100;
			_btn_next_velo = 10;
			
			_falling_velo = 30;
			_moving_velo = 5;
			_wave_velo = 10;
			_position_inaccuracy = 3;
			_epsilon_velo = 20;
			
			_panel_drop_down_pos_on_x = 275;
			_panel_drop_down_pos_on_y = 400;
			
			_panel_drop_down_pos_out_x = 275;
			_panel_drop_down_pos_out_y = - 400;
			
			_btn_ok_pos_on_x = 0;
			_btn_ok_pos_on_y = 150;
			
			_btn_yes_pos_on_x = -100;
			_btn_yes_pos_on_y = 125;
			
			_btn_no_pos_on_x = 100;
			_btn_no_pos_on_y = 125;
		}
	}
}