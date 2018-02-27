package classes.screens
{
	import cc.wgd.framework_on_starling.BasicScreenExtended;
	import cc.wgd.framework_on_starling.SimpleButton;
	
	import classes.game.constants.Constants;
	import classes.factories.ScreenObjectId;
	import assets.layout.abstract.AbstractLayout_LOS;
	
	import flash.geom.Point;
	
	import starling.display.Image;
	import starling.display.Sprite;

	public class LevelOverScreenAnimated extends AnimatedScreen
	{
		// ссылка на изображение-название экрана и его идентификатор
		private var _nameImage:Image;
		private var _nameId:String;
		
		// ссылка на кнопку продолжения или повторения и ее идентификатор
		private var _buttonAfterLevel:SimpleButton;
		private var _buttonId:String;
		
		// ссылки на изображения заданий
		private var _superGoalImage:Image;
		private var _primaryGoalImage:Image;
		private var _secondaryGoalImage:Image;
		
		// ссылки на изображения кубков
		private var _superCupImage:Image;
		private var _primaryCupImage:Image;
		private var _secondaryCupImage:Image;
		
		// ссылки на изображения антикубков
		private var _superFailImage:Image;
		private var _primaryFailImage:Image;
		private var _secondaryFailImage:Image;
		
		private var _layout:AbstractLayout_LOS;
		
		public function LevelOverScreenAnimated()
		{
			super();
		}
		
		public function set layout(playout:AbstractLayout_LOS):void{
			_layout = playout;
		}
		
		override public function updateScreenData(key:String, value:String):void{
			switch(key){
				// значения результатов - тексты
				case ScreenObjectId.TXT_GOAL_SUPER:
					this.getTextFieldById(key).text = value;
					break;
				case ScreenObjectId.TXT_GOAL_PRIMARY:
					this.getTextFieldById(key).text = value;
					break;
				case ScreenObjectId.TXT_GOAL_SECONDARY:
					this.getTextFieldById(key).text = value;
					break;
				// изображения кубков
				case ScreenObjectId.IMG_LOS_CUP_GOLD:
					updateSuperCup(value);
					break;
				case ScreenObjectId.IMG_LOS_CUP_SILVER:
					updatePrimaryCup(value);
					break;
				case ScreenObjectId.IMG_LOS_CUP_BRONZE:
					updateSecondaryCup(value);
					break;
				// изображения целей
				case Constants.SCORE_BOARD_SUPER:
					updateSuperGoal(value);
					break;
				case Constants.SCORE_BOARD_PRIMARY:
					updatePrimaryGoal(value);
					break;
				case Constants.SCORE_BOARD_SECONDARY:
					updateSecondaryGoal(value);
					break;
				// изображения названий
				case ScreenObjectId.IMG_LOS_NAME:
					updateNameData(value);
					break;
				// кнопка "далее" или "повторить"
				case ScreenObjectId.BTN_WHAT_NEXT:
					updateButton(value);
					break;
			}
		}
		
		override protected function prepareScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			
			if(done){
				trace("appear ready - all has appeared..");
				defineDisappearMovement();
				switchScreenState(BasicScreenExtended.STATE_EXECUTE);
			}
		}
		
		override protected function executeScreen():void{
			super.executeScreen();
		}
		
		override protected function finalizeScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			
			if(done){
				trace("appear ready - all has appeared..");
				switchScreenState(BasicScreenExtended.STATE_PREPARE);
				super.finalizeScreen();
			}
		}
		
		private function updateSuperCup(pStrId:String):void{
			if(_superCupImage){
				_superCupImage.parent.removeChild(_superCupImage);
			}
			_superCupImage = this.getImageById(pStrId);
			centrifyObject(_superCupImage, _layout.img_super_cup_x, _layout.img_super_cup_y);
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
		}
		
		private function updatePrimaryCup(pStrId:String):void{
			if(_primaryCupImage){
				_primaryCupImage.parent.removeChild(_primaryCupImage);
			}
			_primaryCupImage = this.getImageById(pStrId);
			centrifyObject(_primaryCupImage, _layout.img_primary_cup_x, _layout.img_primary_cup_y);
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
		}
		
		private function updateSecondaryCup(pStrId:String):void{
			if(_secondaryCupImage){
				_secondaryCupImage.parent.removeChild(_secondaryCupImage);
			}
			_secondaryCupImage = this.getImageById(pStrId);
			centrifyObject(_secondaryCupImage, _layout.img_secondary_cup_x, _layout.img_secondary_cup_y);
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
		}
		
		private function updateSuperGoal(pStrId:String):void{
			if(_superGoalImage){
				_superGoalImage.parent.removeChild(_superGoalImage);
			}
			_superGoalImage = this.getImageById(pStrId);
			centrifyObject(_superGoalImage, _layout.img_super_goal_x, _layout.img_super_goal_y);
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
		}
		
		private function updatePrimaryGoal(pStrId:String):void{
			// удаляем из списка отображения изображение цели предыдущего уровня, если есть
			if(_primaryGoalImage){
				_primaryGoalImage.parent.removeChild(_primaryGoalImage);
			}
			// находим в списке рисунков нужный рисунок
			_primaryGoalImage = this.getImageById(pStrId);
			// задаем координаты главной цели на выпадающей панели
			trace("_primaryGoalImage = " + _primaryGoalImage);
			trace("_layout.img_primary_goal_x = " + _layout.img_primary_goal_x);
			trace("_layout.img_primary_goal_y = " + _layout.img_primary_goal_y);
			this.centrifyObject(_primaryGoalImage, _layout.img_primary_goal_x, _layout.img_primary_goal_y);
			// добавляем его в список отображения спрайта выпадающей панели
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
			
		}
		
		private function updateSecondaryGoal(pStrId:String):void{
			if(_secondaryGoalImage){
				_secondaryGoalImage.parent.removeChild(_secondaryGoalImage);
			}
			_secondaryGoalImage = this.getImageById(pStrId);
			this.centrifyObject(_secondaryGoalImage, _layout.img_secondary_goal_x, _layout.img_secondary_goal_y);
			
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LOS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);	
		}
		
		private function updateNameData(pStrId:String):void{
			if(_nameImage){
				_nameImage.parent.removeChild(_nameImage);
			}
			_nameImage = this.getImageById(pStrId);
			// запоминаем идентификатор,чтобы определить параметры удаления с экрана
			_nameId = pStrId;
			this.addAnimatedImageToDisplayList(pStrId, this);
			this.defineAnimatedMovement(pStrId, new Point(_layout.img_los_name_pos_out_x, _layout.img_los_name_pos_out_y), 
				new Point(_layout.img_los_name_pos_on_x, _layout.img_los_name_pos_on_y), _layout.img_los_name_velo);
			// и задаем параметры движения выпадающей панели
			defineAnimatedMovement(ScreenObjectId.SPR_LOS_DDP, new Point(_layout.spr_los_ddp_pos_out_x, _layout.spr_los_ddp_pos_out_y), 
				new Point(_layout.spr_los_ddp_pos_on_x, _layout.spr_los_ddp_pos_on_y), _layout.spr_los_ddp_velo);
		}
		
		private function updateButton(pStrId:String):void{
			_buttonId = pStrId;
			if(_buttonAfterLevel){
				_buttonAfterLevel.parent.removeChild(_buttonAfterLevel);
			}
			_buttonAfterLevel = this.getButtonById(pStrId);
			this.addAnimatedButtonToDisplayList(pStrId, this);
			this.defineAnimatedMovement(pStrId,  new Point(_layout.btn_next_pos_out_x, _layout.btn_next_pos_out_y), 
				new Point(_layout.btn_next_pos_on_x, _layout.btn_next_pos_on_y), _layout.btn_next_velo);
			// и задаем параметры движения кнопки MAIN_MENU
			defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU, new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y), 
				new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y), _layout.btn_main_menu_velo);
		}
		
		
		private function defineDisappearMovement():void{
			this.defineAnimatedMovement(_nameId, new Point(_layout.img_los_name_pos_on_x, _layout.img_los_name_pos_on_y), 
				new Point(_layout.img_los_name_pos_out_x, _layout.img_los_name_pos_out_y), _layout.img_los_name_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.SPR_LOS_DDP, new Point(_layout.spr_los_ddp_pos_on_x, _layout.spr_los_ddp_pos_on_y), 
				new Point(_layout.spr_los_ddp_pos_out_x, _layout.spr_los_ddp_pos_out_y), _layout.spr_los_ddp_velo);
			
			this.defineAnimatedMovement(_buttonId, new Point(_layout.btn_next_pos_on_x, _layout.btn_next_pos_on_y), 
				new Point(_layout.btn_next_pos_out_x, _layout.btn_next_pos_out_y), _layout.btn_next_velo);
			
			this.defineAnimatedMovement(ScreenObjectId.BTN_MAIN_MENU, new Point(_layout.btn_main_menu_pos_on_x, _layout.btn_main_menu_pos_on_y),
				new Point(_layout.btn_main_menu_pos_out_x, _layout.btn_main_menu_pos_out_y), _layout.btn_main_menu_velo);
		}
	}
}