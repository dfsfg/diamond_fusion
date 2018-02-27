package classes
{
	import cc.wgd.framework_on_starling.SoundManager;
	
	import flash.media.*;
	import flash.media.SoundMixer;
	
	public class SoundManagerModHF extends SoundManager
	{
		/**
		 * уровень громкости саундтрека, сопровождающего игру,
		 * по отношению к громкости всех остальных звуков
		 * */
		public static const GAME_PLAY_VOLUME_RATE:Number = 0.5; //0.10;
		
		public function SoundManagerModHF()
		{
			super();
		}
		
		/**
		 * Метод перегружен для того, чтобы регулировать громкость музыки на уровне,
		 * в несколько раз меньшем громкости звуков игры.
		 * */
		override public function adjustSound(volume:Number):void{
			// регулируем громкость всех звуков, включая музыку
			super.adjustSound(volume);
			// подстраиваем громкость музыки до нужного уровня
			tempSoundTransform.volume = volume * SoundManagerModHF.GAME_PLAY_VOLUME_RATE;
			soundTrackChannel.soundTransform = tempSoundTransform;
				
		}
	}
}