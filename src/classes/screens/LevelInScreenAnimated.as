package classes.screens
{
	import cc.wgd.framework_on_starling.BasicScreenExtended;
	
	import classes.game.constants.Constants;
	import classes.factories.ScreenObjectId;
	import assets.layout.abstract.AbstractLayout_LIS;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	public class LevelInScreenAnimated extends AnimatedScreen
	{
		// ссылки на изображения заданий
		private var _superGoalImage:Image;
		private var _primaryGoalImage:Image;
		private var _secondaryGoalImage:Image;
		
		// сообщает об окночании завершении работы метода finalizeScreen()
		// и возможности перехода в другое состояние игры
		// Перед началом каждого уровня необходимо установить значение false
		private var _done:Boolean;
		
		private var _layout:AbstractLayout_LIS;
		
		public function LevelInScreenAnimated()
		{
			super();
		}
		
		public function set layout(playout:AbstractLayout_LIS):void{
			_layout = playout;
		}
		
		override public function updateScreenData(key:String, value:String):void{
			
			switch(key){
				
				case ScreenObjectId.TXT_GOAL_SUPER:
					// немного не к месту - но выделять для переустановки этого флага отдельный
					// метод было бы расточительно
					_done = false;
					getTextFieldById(key).text = value;
					break;
				
				case ScreenObjectId.TXT_GOAL_PRIMARY:
					getTextFieldById(key).text = value;
					break;
				
				case ScreenObjectId.TXT_GOAL_SECONDARY:
					getTextFieldById(key).text = value;
					break;
				
				case Constants.SCORE_BOARD_SUPER:
					updateSuperGoal(value);
					break;
				case Constants.SCORE_BOARD_PRIMARY:
					updatePrimaryGoal(value);
					break;
				case Constants.SCORE_BOARD_SECONDARY:
					updateSecondaryGoal(value);
					break;
			}
		}
		
		public function disappear():void{
			defineDisappearMovement();
		}
		
		public function get done():Boolean{
			return _done;
		}
		
		private function updateSuperGoal(pStrId:String):void{
			if(_superGoalImage){
				_superGoalImage.parent.removeChild(_superGoalImage);
			}
			_superGoalImage = this.getImageById(pStrId);
			centrifyObject(_superGoalImage, _layout.img_super_goal_x, _layout.img_super_goal_y);
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LIS_DDP);
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
			this.centrifyObject(_primaryGoalImage, _layout.img_primary_goal_x, _layout.img_primary_goal_y);
			// добавляем его в список отображения спрайта выпадающей панели
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LIS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);
			
		}
		
		private function updateSecondaryGoal(pStrId:String):void{
			trace("levelInScreen updating... pStrId = " + pStrId);
			if(_secondaryGoalImage){
				_secondaryGoalImage.parent.removeChild(_secondaryGoalImage);
			}
			_secondaryGoalImage = this.getImageById(pStrId);
			this.centrifyObject(_secondaryGoalImage, _layout.img_secondary_goal_x, _layout.img_secondary_goal_y);
			
			var ps:Sprite = this.getSpriteById(ScreenObjectId.SPR_LIS_DDP);
			this.addAnimatedImageToDisplayList(pStrId, ps);	
		}
		
		override protected function prepareScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			
			if(done){
				trace("appear ready - all has appeared..");
				switchScreenState(BasicScreenExtended.STATE_EXECUTE);
			}
		}

		
		override protected function finalizeScreen():void{
			var done:Boolean = true;
			for(var i:int = 0; i < _movers.length; i++){
				_movers[i].move();
				if(_movers[i].isMoving) done = false;
			}
			
			if(done){
				defineAppearMovement();
				_done = true;
				trace("levelInScreen completed.............");
			}
		}
		
		private function defineAppearMovement():void{
			defineAnimatedMovement(ScreenObjectId.IMG_LIS_NAME, 
				new Point(_layout.img_lis_name_pos_out_x, _layout.img_lis_name_pos_out_y), 
				new Point(_layout.img_lis_name_pos_on_x, _layout.img_lis_name_pos_on_y), _layout.img_lis_name_velo);
			defineAnimatedMovement(ScreenObjectId.SPR_LIS_DDP, 
				new Point(_layout.spr_lis_ddp_pos_out_x, _layout.spr_lis_ddp_pos_out_y), 
				new Point(_layout.spr_lis_ddp_pos_on_x, _layout.spr_lis_ddp_pos_on_y), _layout.spr_lis_ddp_velo);
			switchScreenState(BasicScreenExtended.STATE_PREPARE);
		}
		
		private function defineDisappearMovement():void{
			_done = false;
			defineAnimatedMovement(ScreenObjectId.IMG_LIS_NAME, 
				new Point(_layout.img_lis_name_pos_on_x, _layout.img_lis_name_pos_on_y), 
				new Point(_layout.img_lis_name_pos_out_x, _layout.img_lis_name_pos_out_y), _layout.img_lis_name_velo);
			defineAnimatedMovement(ScreenObjectId.SPR_LIS_DDP, 
				new Point(_layout.spr_lis_ddp_pos_on_x, _layout.spr_lis_ddp_pos_on_y), 
				new Point(_layout.spr_lis_ddp_pos_out_x, _layout.spr_lis_ddp_pos_out_y), _layout.spr_lis_ddp_velo);
			switchScreenState(BasicScreenExtended.STATE_FINALIZE);
		}
		
	}
}