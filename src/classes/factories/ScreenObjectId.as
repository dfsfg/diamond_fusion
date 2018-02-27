package classes.factories
{

	/**
	 * <h1>Идентификаторы объектов на экранах.</h1>
	 * <p>Класс задает идентификаторы, присваиваемые объектам, находящимся на экранах,
	 * таким, как кнопки, изображения, текстовые поля, спрайты, для упрощения управления этими объектами.</p>
	 * <p>
	 * Каждый идентификатор может содержаться в трех массивах:
	 * <ul>
	 * <li>в массиве идентификаторов объектов, совпадая с номером объекта в массиве объектов;</li>
	 * <li>в массиве идентификаторов движителей, совпадая с номером движителя, управляющего движением данного объекта, в массиве движителей;</li>
	 * <li>в массиве идентификаторов растворителей, совпадая с номером растворителя, управляющего прозрачностью данного объекта, в массиве растворителей.</li>
	 * </ul>
	 * </p>
	 * <p>Таким образом, указанные идентификаторы являются связующим звеном между объектами на экране и управляющими ими движителями и растоворителями.</p>
	 * */
	public class ScreenObjectId
	{
		public static const BTN_PLAY:String = "btn_play";
		public static const BTN_HELP:String = "btn_help";
		public static const BTN_HOME:String = "btn_home";
		public static const BTN_MAIN_MENU:String = "btn_main_menu";
		public static const BTN_MODE:String = "btn_mode";
		public static const BTN_MODE_STRICT:String = "btn_mode_string";
		public static const BTN_MODE_ZEN:String = "btn_mode_zen";
		public static const BTN_HL:String = "btn_hl";
		public static const BTN_SHOW_BUTTON_PANEL:String = "btn_show_buttons_panel";
		public static const BTN_HIDE_BUTTON_PANEL:String = "btn_hide_buttons_panel";
		public static const BTN_SHOW_MODE_PANEL:String = "btn_show_mode_panel";
		public static const BTN_HIDE_MODE_PANEL:String = "btn_hide_mode_panel";
		public static const BTN_LEVEL_0:String = "btn_level_0";
		public static const BTN_LEVEL_1:String = "btn_level_1";
		public static const BTN_LEVEL_2:String = "btn_level_2";
		public static const BTN_LEVEL_3:String = "btn_level_3";
		public static const BTN_LEVEL_4:String = "btn_level_4";
		public static const BTN_LEVEL_5:String = "btn_level_5";
		public static const BTN_LEVEL_6:String = "btn_level_6";
		public static const BTN_LEVEL_7:String = "btn_level_7";
		public static const BTN_LEVEL_8:String = "btn_level_8";
		public static const BTN_LEVEL_9:String = "btn_level_9";
		public static const BTN_LEVEL_10:String = "btn_level_10";
		public static const BTN_LEVEL_11:String = "btn_level_11";
		public static const BTN_LEVEL_12:String = "btn_level_12";
		public static const BTN_LEVEL_13:String = "btn_level_13";
		public static const BTN_LEVEL_14:String = "btn_level_14";
		public static const BTN_LEVEL_15:String = "btn_level_15";
		public static const BTN_LEVEL_16:String = "btn_level_16";
		public static const BTN_LEVEL_17:String = "btn_level_17";
		public static const BTN_LEVEL_18:String = "btn_level_18";
		public static const BTN_LEVEL_19:String = "btn_level_19";
		public static const BTN_LEVEL_20:String = "btn_level_20";
		public static const BTN_LEVEL_21:String = "btn_level_21";
		public static const BTN_LEVEL_22:String = "btn_level_22";
		public static const BTN_LEVEL_23:String = "btn_level_23";
		public static const BTN_LEVEL_24:String = "btn_level_24";
		public static const BTN_LEVEL_25:String = "btn_level_25";
		public static const BTN_LEVEL_26:String = "btn_level_26";
		public static const BTN_LEVEL_27:String = "btn_level_27";
		public static const BTN_LEVEL_28:String = "btn_level_28";
		public static const BTN_LEVEL_29:String = "btn_level_29";
		
		public static const BTN_RETRY_LEVEL:String = "btn_retry_level";
		public static const BTN_CONTINUE:String = "btn_continue";
		
		public static const IMG_TITLE_NAME:String = "img_title_screen_name";
		public static const IMG_DIAMOND_BIG:String = "img_diamond_big";
		public static const IMG_DROPDOWN_PANEL:String = "img_dropdown_panel";
		
		public static const IMG_MAIN_MENU_NAME:String = "img_main_menu_name";
		public static const IMG_DIAMOND_SMALL:String = "img_diamond_small";
		
		//public static const IMG_LEVEL_IN_NAME:String = "img_level_in_name";
		
		public static const SPR_DROPDOWN_PANEL:String = "spr_dropdown_panel";
		
		public static const IMG_MODE_PANEL:String = "img_mode_panel";
		public static const SPR_MODE_PANEL:String = "spr_mode_panel";
		
		// diamonds
		public static const IMG_DIAM_0:String = "img_diam_0";
		public static const IMG_DIAM_1:String = "img_diam_1";
		public static const IMG_DIAM_2:String = "img_diam_2";
		public static const IMG_DIAM_3:String = "img_diam_3";
		public static const IMG_DIAM_4:String = "img_diam_4";
		public static const IMG_DIAM_5:String = "img_diam_5";
		public static const IMG_DIAM_6:String = "img_diam_6";
		public static const IMG_DIAM_7:String = "img_diam_7";
		public static const IMG_DIAM_8:String = "img_diam_8";
		
		public static const OBSTACLE_GLASS:String = "obstacle_glass";
		public static const OBSTACLE_STONE:String = "obstacle_stone";
		public static const OBSTACLE_FULL:String = "obstacle_full";
		
		// instructions screen
		public static const IMG_IS_NAME:String = "img_is_name";
		public static const IMG_IS_DDP:String = "img_is_ddp";
		public static const SPR_IS_DDP:String = "spr_is_ddp";
		
		// level in screen
		public static const IMG_LIS_NAME:String = "img_lis_name";
		public static const IMG_LIS_DDP:String = "img_lis_ddp";
		public static const SPR_LIS_DDP:String = "spr_lis_ddp";
		// common for levelInScreen and levelOverScreen
		public static const TXT_GOAL_SUPER:String = "txt_goal_super";
		public static const TXT_GOAL_PRIMARY:String = "txt_goal_primary";
		public static const TXT_GOAL_SECONDARY:String = "txt_goal_secondary";
		public static const IMG_SCORE_ICON:String = "img_score_icon";
		
		// levelOverScreen
		// заголовок - key
		public static const IMG_LOS_NAME:String = "img_los_name";
		// заголовки - value
		public static const IMG_LOS_COMPLETED:String = "img_los_completed";
		public static const IMG_LOS_PASSED:String = "img_los_passed";
		public static const IMG_LOS_FAILED:String = "img_los_failed";
		
		// sprite-container
		public static const SPR_LOS_DDP:String = "spr_los_ddp";
		// drop-down panel
		public static const IMG_LOS_DDP:String = "img_los_ddp";
		// cups:keys
		public static const IMG_LOS_CUP_GOLD:String = "img_los_cup_gold";
		public static const IMG_LOS_CUP_SILVER:String = "img_los_cup_silver";
		public static const IMG_LOS_CUP_BRONZE:String = "img_los_cup_bronze";
		// cups: values
		public static const IMG_LOS_CUP_COMPLETED_GOLD:String = "img_los_cup_completed_gold";
		public static const IMG_LOS_CUP_COMPLETED_SILVER:String = "img_los_cup_completed_silver";
		public static const IMG_LOS_CUP_COMPLETED_BRONZE:String = "img_los_cup_completed_bronze";
		public static const IMG_LOS_CUP_FAILED_GOLD:String = "img_los_cup_failed_gold";
		public static const IMG_LOS_CUP_FAILED_SILVER:String = "img_los_cup_failed_silver";
		public static const IMG_LOS_CUP_FAILED_BRONZE:String = "img_los_cup_failed_bronze";
		
		// button: key
		public static const BTN_WHAT_NEXT:String = "btn_what_next";
		
		// button glowing animation
		public static const IMG_GLOW_0:String = "img_glow_0";
		public static const IMG_GLOW_1:String = "img_glow_1";
		public static const IMG_GLOW_2:String = "img_glow_2";
		public static const IMG_GLOW_3:String = "img_glow_3";
		public static const IMG_GLOW_4:String = "img_glow_4";
	}
}