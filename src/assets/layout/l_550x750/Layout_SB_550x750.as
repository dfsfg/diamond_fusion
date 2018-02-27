package assets.layout.l_550x750
{
	import assets.layout.abstract.AbstractLayout_SB;

	public class Layout_SB_550x750 extends AbstractLayout_SB
	{
		public function Layout_SB_550x750()
		{
			super();
		}
		
		override protected function init():void{
			// параметры расположения панели на экране
			_score_board_pos_on_x = 0;
			_score_board_pos_on_y = 0;
			_score_board_pos_out_x = 0;
			_score_board_pos_out_y = -200;
			_score_board_velo = 10;
			
			// параметры расположения элемента счета
			_el_score_pos_on_x = 7;
			_el_score_pos_on_y = 14;
			_el_score_label_width = 65;
			_el_score_label_height = 25;
			_el_score_buffer_width = 230;
			
			// параметры кнопки "music on/off"
			_btn_music_pos_x = 507;
			_btn_music_pos_y = 9;
			
			// параметры кнопки "sound volume"
			_btn_sound_pos_left_x = 367;
			_btn_sound_pos_right_x = 457;
			_btn_sound_pos_x = 457;
			_btn_sound_pos_y = 9;
			
			// параметкры progress bar
			_progress_bar_pos_x = 77;
			_progress_bar_pos_y = 9;
			
			// параметры графического элемента суперцели
			_el_goal_super_pos_x = 10;
			_el_goal_super_pos_y = 76;
			_el_goal_super_buffer_width = 10;
			_el_goal_super_content_width = 110;
			_el_goal_super_content_height = 25;
			
			// параметры графического элемента главной цели
			_el_goal_primary_pos_x = 228;
			_el_goal_primary_pos_y = 76;
			_el_goal_primary_buffer_width = 10;
			_el_goal_primary_content_width = 70;
			_el_goal_primary_content_height = 25;
			
			// параметры графического элемента дополнительной цели
			_el_goal_secondary_pos_x = 395;
			_el_goal_secondary_pos_y = 76;
			_el_goal_secondary_buffer_width = 10;
			_el_goal_secondary_content_width = 70;
			_el_goal_secondary_content_height = 25;
		}
	}
}