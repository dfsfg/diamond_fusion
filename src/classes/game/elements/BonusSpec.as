package classes.game.elements
{
	/**
	 * <h1>Спецификация бонусного элемента</h1>
	 * <p>Класс содержит переменные, характеризующие бонусный элемент, возникающий при уничтожении
	 * группы, содержащей более 3х элементов. Свойства, приобретенные бонусным элементом, проявляются
	 * при уничтожении вновь образовавшейся группы из трех или более элементов, содержащей этот бонусный элемент.</p>
	 * <p>Бонусный элемент может быть:
	 * <ul>
	 * <li>бомбой, уничтожающей все ближайшие элементы вокруг;</li>
	 * <li>молнией, уничтожающей весь ряд, в котором находилась создавшая этот элемент группа;</li>
	 * <li>а так же их комбинацией.</li>
	 * </ul>
	 * <p>
	 * */
	public class BonusSpec
	{
		public static const VOICE_ACTIVE:Boolean = true;
		public static const VOICE_PASSIVE:Boolean = false;
		
		private var _isBomb:Boolean;
		private var _isLines:Vector.<Boolean>;
		private var _voice:Boolean;
		private var _pow:int;
		
		// показывает, создан ли бонусный элемент только что (_aged = false)
		// или уже существует некоторое время (_aged = true);
		// используется при уничтожении группы из одинаковых элементов, чтобы отличить только что созданный
		// бонус, который остается для последующего использования, от уже существующего, который должен взрываться
		// вместе с остальными элементами группы
		private var _aged:Boolean;
		
		public function BonusSpec()
		{
			init();
		}
		
		private function init():void{
			_aged = false;
			_isBomb = false;
			_voice = false;
			_isLines = new Vector.<Boolean>;
			for(var i:int = 0; i < 3; i ++){
				_isLines.push(false);
			}
		}
		
		public function activateLine(pnum:int):void{
			_isLines[pnum] = true;
		}
		
		/**
		 * <h1>Группы рядов гексагона</h1>
		 * <p>Возвращает массив групп рядов гексагона, содержащих удаляемые группы элементов. </p>
		 * */
		public function get lines():Vector.<Boolean>{
			return _isLines;
		}
		
		public function set bomb(pbomb:Boolean):void{
			_isBomb = pbomb;
		}
		
		public function get bomb():Boolean{
			return _isBomb;
		}
		
		/**
		 * <h1>Активация элемента</h1>
		 * <p>Когда бонусный элемент создается, его переменная <i>_voice</i> равна <b><i>VOICE_PASSIVE</i></b>, что соответствует пассивному состоянию
		 * Находящийся в этом состоянии бонусный элемент может быть уничтожен другим бонусным элементом, как обычный элемент.
		 * Если бонусный элемент обнаруживается в одной из уничтожаемых групп, данный метод активирует его, устанавливая
		 * значение переменной <i>_voice</i> равным <b><i>VOICE_ACTIVE</i></b>. Теперь этот элемент при взрыве уничтожает другие элементы, среди которых
		 * так же могут находиться бонусные неактивированные элементы.</p>
		 * <p>P.S. Название переменной и ее значения выбраны по аналогии с грамматическим термином <i>"активный залог" ("active voice")</i> 
		 * и <i>"пассивный залог" ("passive voice")</i>.</p>
		 * */
		public function activate():void{
			_voice = BonusSpec.VOICE_ACTIVE;
		}
		
		public function get aged():Boolean{
			return _aged;
		}
		
		public function growAged():void{
			_aged = true;
		}
		
		public function copy(pspec:BonusSpec):void{
			this._isBomb = pspec.bomb;
			this._aged = pspec.aged;
			for(var i:int = 0; i < _isLines.length; i++){
				this._isLines[i] = pspec.lines[i];
			}
		}
		

	}
}