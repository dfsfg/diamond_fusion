package classes.screens
{
	import cc.wgd.framework_on_starling.BasicScreenExtended;
	import cc.wgd.framework_on_starling.EventType;
	import cc.wgd.framework_on_starling.SimpleButton;
	import cc.wgd.framework_on_starling.SoundEventData;
	
	import classes.factories.ScreenObjectId;
	import classes.game.constants.SoundNames;
	import classes.managers.IScreenObjectMover;
	import classes.managers.IScreenObjectSolvent;
	import classes.managers.SteadyMover;
	import classes.managers.SteadySolvent;
	
	import flash.geom.Point;
	
	import starling.display.DisplayObjectContainer;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class AnimatedScreen extends BasicScreenExtended
	{
		private const SOUT:Boolean = false;
		private const SOVER:Boolean = true;
		
		// переменные для управления движением и прозрачностью кнопок
		protected var _buttonPosOn:Vector.<Point>;
		protected var _buttonPosOut:Vector.<Point>;
		protected var _buttonIds:Vector.<String>;
		
		// переменные для управления движением и прозрачностью изображений
		protected var _imagePosOn:Vector.<Point>;
		protected var _imagePosOut:Vector.<Point>;
		protected var _imageIds:Vector.<String>;
		
		// переменные для управления движением и прозрачностью текстовых полей
		protected var _textPosOn:Vector.<Point>;
		protected var _textPosOut:Vector.<Point>;
		protected var _textIds:Vector.<String>;
		
		// переменная, отсутствующая в базовом классе - массив спрайтов
		protected var _sprites:Vector.<Sprite>;
		// переменные для управления движением и прозрачностью спрайтов
		protected var _spritePosOn:Vector.<Point>;
		protected var _spritePosOut:Vector.<Point>;
		protected var _spriteIds:Vector.<String>;
		
		// переменые, управляющие движением
		protected var _movers:Vector.<IScreenObjectMover>;
		protected var _movedObjIds:Vector.<String>;
		
		// переменные, управляющие прозрачностью
		protected var _solvents:Vector.<IScreenObjectSolvent>;
		protected var _solvObjIds:Vector.<String>;
		
		// переменные для эффекта сияния кнопки
		protected var _cs:Boolean;
		protected var _ws:Boolean;
		
		protected var _btnEffectImages:Vector.<Image>;
		protected var _numOfEffectImage:Number = 0;
		protected var _glowBtnCurrent:SimpleButton;
		protected var _glowBtnPrevious:SimpleButton;
		
		protected var _globalTouchX:Number;
		protected var _globalTouchY:Number;
		
		
		public function AnimatedScreen()
		{
			super();
			addEventListener(TouchEvent.TOUCH, onGlobalTouch);
		}
		
		override public function runScreen():void{
			super.runScreen();
			watchButtons();
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//	ИНИЦИАЛИЗАЦИЯ ДВИЖИТЕЛЕЙ И РАСТВОРИТЕЛЕЙ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Инициализация массива объектов, управляющих движением объектов на экране.</h1>
		 * <b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания каких-либо объектов экрана,
		 * если объекты экрана будут двигаться.</p>
		 * <p>Объекты, управляющие движением объектов на экране, объявлены экземплярами интерфейса<i>IScreenObjectMover</i>,
		 * но инициализируются как объекты класса <i>SteadyMover</i>, имплементирующего данный интерфейс,
		 * и обеспечивающего равномерное движение управляемых объектов.</p>
		 * */
		public function createObjectMovers():void{
			//_imageMovers = new Vector.<SteadyMover>;
			_movers = new Vector.<IScreenObjectMover>;
			_movedObjIds = new Vector.<String>;
		}
		
		/**
		 * <h1>Инициализация массива объектов, управляющих изменением прозрачности объектов на экране</h1>
		 * <b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания каких-либо объектов экрана,
		 * если объекты экрана будут изменять свою прозрачность.</p>
		 * <p>Объекты, управляющие изменением прозрачности объектов на экране, объявлены экземплярами интерфейся <i>IScreenObjectSolvent</i>
		 * но инициализируются как объекты класса <i>SteadySolvent</i>, имплементирующего данный интерфейс,
		 * и обеспечивающего равномерное растворение управляемых объектов.</p>
		 * */
		public function createObjectSolvents():void{
			//_imageSolvents = new Vector.<SteadySolvent>;
			_solvents = new Vector.<IScreenObjectSolvent>;
			_solvObjIds = new Vector.<String>;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ УПРАВЛЕНИЯ КНОПКАМИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Подготовка создания кнопок</h1>
		 * <p><b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания кнопок.</p>
		 * <p>Метод выполняет необходимую подготовительную работу, инициализируя переменные, которые используют
		 * другие методы класса, работающие с кнопками. Выделение этого метода, а так же подобных ему методов, работающих
		 * с другими объектами экрана, в отдельный общедоступный метод вызвано тем, что при создании экземпляра класса
		 * <i>AnimatedScreen</i>, возможно, будут создаваться не все возможные объекты экрана.</p>
		 * */
		public function prepareButtonCreation():void{
			_buttonIds = new Vector.<String>;
			_buttonPosOn = new Vector.<Point>;
			_buttonPosOut = new Vector.<Point>;
		}
		
		/**
		 * <h1>Создание анимируемой кнопки</h1>
		 * <p>Метод создает кнопку и ее идентификатор, связывающий кнопку в массиве с объектами в сопоставленных кнопкам массивах<p>
		 * */
		public function createAnimatedButton(stringId:String, id:int,xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number, upState:Texture, text:String="", downState:Texture=null):void{
			// запоминаем идентификатор кнопки
			_buttonIds.push(stringId);
			// запоминаем положение кнопки на экране
			var posOn:Point = new Point(xPosOn, yPosOn);
			_buttonPosOn.push(posOn);
			// запоминаем положение кнопки за пределами экрана
			var posOut:Point = new Point(xPosOut, yPosOut);
			_buttonPosOut.push(posOut);
			// создаем кнопку, располагая ее ЗА ПРЕДЕЛАМИ экрана
			super.createButton(id, xPosOut, yPosOut, upState, text, downState);
		}
		/*
		override public function createButton(id:int, xPos:int, yPos:int, upState:Texture, text:String="", downState:Texture=null):void{
			var tempButton:SimpleButton = new SimpleButton(id, upState, text, downState);
			tempButton.x = xPos - tempButton.width / 2;
			tempButton.y = yPos - tempButton.height / 2;
			_buttons.push(tempButton);
			//trace("this is from overridden createButton function...");
			tempButton.addEventListener(TouchEvent.TOUCH, onTouchEvent);
		}
		*/
		/**
		 * <h1>Добавление кнопки в список отображения</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор кнопки <i>pStrId</i>, находит ее по указанному идентификатору и добавляет
		 * ее в список отображения объекта, передаваемого как параметр <i>po (parent object)</i></p>
		 * <p>Параметр <i>po</i> используется, поскольку заранее невозможно предсказать, куда будет добавлена та или иная кнопка - непосредственно на экран
		 * или на один из объектов, находящийся в списке отображения экрана. Таким объектом может быть, например, панель с кнопками уровней, появляющаяся
		 * из-за пределов экрана, и  исчезающая за пределы экрана.</p>
		 * */
		public function addAnimatedButtonToDisplayList(pStrId:String, po:DisplayObjectContainer):void{
			var tempButton:SimpleButton = getButtonById(pStrId);
			tempButton.addEventListener(Event.TRIGGERED, buttonClickListener);
			po.addChild(tempButton);
		}
		
		/**
		 * <h1>Удаление кнопки из списка отображения</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор кнопки, находит ее по указанному идентификатору и удаляет
		 * ее из списка отображения объекта.</p>
		 * */
		public function removeAnimatedButtonFromDisplayList(pStrId:String):void{
			var tempButton:SimpleButton = getButtonById(pStrId);
			// если кнопка находится в списке отображения, получаем ссылку на содержащий ее объект
			if(tempButton.parent){
				tempButton.removeEventListener(Event.TRIGGERED, buttonClickListener);
				// кнопка может находиться не только в непосредственно списке отображения самого экрана, но в списке отображения
				// некоторого другого экрана, который в свою очередь, сам находится в списке отображения экрана.
				// Поэтому сначала нужно получить доступ к объекту, содержащему эту кнопку, и лишь затем удалить ее
				// из списка отображения этого объекта. Таким объектом может быть, например, панель кнопок уровней
				// на экране главного меню.
				tempButton.parent.removeChild(tempButton);
			}
			
		}
		
		/**
		 * <h1>Установка объекта, управляющего кнопкой с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор кнопки, находит ее по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему ее движением</p>
		 * */
		public function setupAnimatedButtonMover(pStrId:String):void{
			var tempButton:SimpleButton = getButtonById(pStrId);
			var tempMover:IScreenObjectMover = new SteadyMover(tempButton);
			_movers.push(tempMover);
			_movedObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Установка объекта, управляющего изменением прозрачности кнопки</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор кнопки, находит ее по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему ее прозрачностью</p>
		 * */
		public function setupAnimatedButtonSolvent(pStrId:String):void{
			var tempButton:SimpleButton = getButtonById(pStrId);
			var tempSolvent:IScreenObjectSolvent = new SteadySolvent(tempButton);
			_solvents.push(tempSolvent);
			_solvObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Поиск кнопки по ее идентификатору</h1>
		 * <p>принимает в качестве параметра строковый идентификатор кнопки и возвращает кнопку</p>
		 * */
		public function getButtonById(pStrId:String):SimpleButton{
			var tempButton:SimpleButton;
			for(var i:int = 0; i < _buttonIds.length; i++){
				if(_buttonIds[i] == pStrId){
					tempButton = _buttons[i];
					break;
				}
			}
			return tempButton;
		}
		
		

		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ УПРАВЛЕНИЯ ИЗОБРАЖЕНИЯМИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////

		/**
		 * <h1>Подготовка создания изображений</h1>
		 * <p><b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания изображений.</p>
		 * <p>Метод выполняет необходимую подготовительную работу, инициализируя переменные, которые используют
		 * другие методы класса, работающие с изображениями. Выделение этого метода, а так же подобных ему методов, работающих
		 * с другими объектами экрана, в отдельный общедоступный метод вызвано тем, что при создании экземпляра класса
		 * <i>AnimatedScreen</i>, возможно, будут создаваться не все возможные объекты экрана.</p>
		 * */
		public function prepareImageCreation():void{
			_imageIds = new Vector.<String>;
			_imagePosOn = new Vector.<Point>;
			_imagePosOut = new Vector.<Point>;
		}
		
		/**
		 * <h1>Создание анимируемого изображения</h1>
		 * <p>Метод создает изображение и его идентификатор, связывающий изображение в массиве с объектами в сопоставленных изображениям массивах<p>
		 * */
		public function createAnimatedImage(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number, texture:Texture, transparent:Boolean = false):void{
			// запоминаем идентификатор изображения
			_imageIds.push(pStrId);
			// запоминаем положение изображения на экране
			var posOn:Point = new Point(xPosOn, yPosOn);
			_imagePosOn.push(posOn);
			// запоминаем положение изобаражения за пределами экрана
			var posOut:Point = new Point(xPosOut, yPosOut);
			_imagePosOut.push(posOut);
			// создаем изображение и располагаем его ЗА ПРЕДЕЛАМИ экрана
			super.createImage(xPosOut, yPosOut, texture, transparent);
		}
		
		/**
		 * <h1>Добавление изображения в список отображения</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор изображения <i>pStrId</i>, находит его по указанному идентификатору и добавляет
		 * его в список отображения объекта, передаваемого как параметр <i>po (parent object)</i></p>
		 * <p>Параметр <i>po</i> используется, поскольку заранее невозможно предсказать, куда будет добавлено то или иное изображение - непосредственно на экран
		 * или на один из объектов, находящийся в списке отображения экрана. Таким объектом может быть, например, панель с результатами уровней, появляющаяся
		 * из-за пределов экрана завершения уровня, и  исчезающая за пределы экрана.</p>
		 * */
		public function addAnimatedImageToDisplayList(pStrId:String, po:DisplayObjectContainer):void{
			// находим номер идентификатора изображения в массиве идентификаторов,
			// значение которого равно передаваемому параметру
			var tempImage:Image = getImageById(pStrId);
			po.addChild(tempImage);
		}
		
		/**
		 * <h1>Удаление объекта из списка отображения</h1>
		 * <p>Метод принимает в качестве параметра идентификатор <i>pStrId</i> интересующего нас изображения,
		 * находит это изображение и удаляет его из списка отображения содержащего его объекта.</p>
		 * */
		public function removeAnimatedImageFromDisplayList(pStrId:String):void{
			// находим номер идентификатора изображения в массиве идентификаторов,
			// значение которого равно передаваемому параметру
			var tempImage:Image = getImageById(pStrId);
			// номер идентификатора в массиве идентификаторов изображений
			// совпадает с номером изображения в массиве изображений.
			// Но поскольку мы не знаем заранее, в списке оторбажения какого объекта
			// находится интересующее нас изображение, сначала получаем доступ к этому объекту,
			// а затем удаляем изображение
			tempImage.parent.removeChild(tempImage);
		}
		
		/**
		 * <h1>Установка объекта, управляющего движением изображения с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор изображения, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его движением</p>
		 * */
		public function setupAnimatedImageMover(pStrId:String):void{
			var tempImage:Image = getImageById(pStrId);
			// создаем новый экземпляр класса SteadyMover
			var tempMover:IScreenObjectMover = new SteadyMover(tempImage);
			_movers.push(tempMover);
			// и создаем для него идентификатор управляемого им объекта
			_movedObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Установка объекта, управляющего прозрачностью изображения с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор изображения, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его прозрачностью</p>
		 * */
		public function setupAnimatedImageSolvent(pStrId:String):void{
			var tempImage:Image = getImageById(pStrId);
			// создаем новый экземпляр класса SteadySolvent
			var tempSolvent:IScreenObjectSolvent = new SteadySolvent(tempImage);
			_solvents.push(tempSolvent);
			// и создаем для него идентификатор управляемого им объекта
			_solvObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Поиск изображения по его идентификатору</h1>
		 * <p>принимает в качестве параметра идентификатор изображения и возвращает само изображение</p>
		 * */
		public function getImageById(pStrId:String):Image{			
			var tempImage:Image;
			// находим изображение в массиве изображений
			// по заданному идентификатору изображения
			for(var i:int = 0; i < _imageIds.length; i++){
				if(_imageIds[i] == pStrId){
					// номер идентификатора в массве идентификаторов изображений
					// совпадает с номеров изображения в массиве изображений
					tempImage = _images[i];
					break;
				}
			}
			return tempImage;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ УПРАВЛЕНИЯ ТЕКСТОВЫМИ ПОЛЯМИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Подготовка создания текстовых полей</h1>
		 * <p><b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания текстовых полей.</p>
		 * <p>Метод выполняет необходимую подготовительную работу, инициализируя переменные, которые используют
		 * другие методы класса, работающие с текстовыми полями. Выделение этого метода, а так же подобных ему методов, работающих
		 * с другими объектами экрана, в отдельный общедоступный метод вызвано тем, что при создании экземпляра класса
		 * <i>AnimatedScreen</i>, возможно, будут создаваться не все возможные объекты экрана.</p>
		 * */
		public function prepareTextCreation():void{
			_textIds = new Vector.<String>;
			_textPosOn = new Vector.<Point>;
			_textPosOut = new Vector.<Point>;
		}
		
		/**
		 * <h1>Создание анимируемого текста</h1>
		 * <p>Метод создает текст и его идентификатор, связывающий текст в массиве с объектами в сопоставленных изображениям массивах<p>
		 * */
		public function createAnimatedText(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number, width:Number, height:Number,
										   text:String = "", fontName:String = "Verdana", fontSize:int = 12, 
										   color:uint = 0x000000, bold:Boolean = false):void{
			// запоминаем идентификатор текста
			_textIds.push(pStrId);
			// запоминаем расположение текста на экране
			var posOn:Point = new Point(xPosOn, yPosOn);
			_textPosOn.push(posOn);
			// запоминаем расположение текста за прелелами экрана
			var posOut:Point = new Point(xPosOut, yPosOut);
			_textPosOut.push(posOut);
			// создаем изображение и располагаем его ЗА ПРЕДЕЛАМИ экрана
			super.createDisplayText(xPosOut, yPosOut, width, height, text, fontName, fontSize, color, bold);
		}
		
		/**
		 * <h1>Добавление текста в список отображения</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор текста <i>pStrId</i>, находит его по указанному идентификатору и добавляет
		 * его в список отображения объекта, передаваемого как параметр <i>po (parent object)</i></p>
		 * <p>Параметр <i>po</i> используется, поскольку заранее невозможно предсказать, куда будет добавлено то или иное текстовое поле - непосредственно на экран
		 * или на один из объектов, находящийся в списке отображения экрана. Таким объектом может быть, например, панель с результатами уровней, появляющаяся
		 * из-за пределов экрана завершения уровня, и  исчезающая за пределы экрана, или панель на экране инструкций с инструкциями, обновляемыми
		 * по мере прохождения пользователем игры.</p>
		 * */
		public function addAnimatedTextToDisplayList(pStrId:String, po:DisplayObjectContainer):void{
			var tempTextField:TextField = getTextFieldById(pStrId);
			po.addChild(tempTextField);
		}
		
		/**
		 * <h1>Удаление текстового поля из списка отображения</h1>
		 * <p>Метод принимает в качестве параметра идентификатор текстового поля, находит его в массиве текстовых полей
		 * и удаляет из списка отображения содержащего его объекта.</p>
		 * */
		public function removeAnimatedTextFromDisplayList(pStrId:String):void{
			var tempTextField:TextField = getTextFieldById(pStrId);
			// поскольку объект, содержащий данное текстовое поле, заранее неизвестен,
			// сначала получаем доступ к нему, а затем удаляем тектовое поле.
			tempTextField.parent.removeChild(tempTextField);
		}
		
		/**
		 * <h1>Установка объекта, управляющего движением текстового поля с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор текстового поля, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его движением</p>
		 * */
		public function setupAnimatedTextMover(pStrId:String):void{
			var tempText:TextField = getTextFieldById(pStrId);
			//
			var tempMover:IScreenObjectMover = new SteadyMover(tempText);
			_movers.push(tempMover);
			_movedObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Установка объекта, управляющего прозрачностью текстового поля с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор текстового поля, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его прозрачностью</p>
		 * */
		public function setupAnimatedTextSolvent(pStrId:String):void{
			var tempText:TextField = getTextFieldById(pStrId);
			//
			var tempSolvent:IScreenObjectSolvent = new SteadySolvent(tempText);
			_solvents.push(tempSolvent);
			_solvObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Поиск текстового поля по его идентификатору</h1>
		 * <p>принимает в качестве параметра строковый идентификатор текстового поля, находит и возвращает текстовое поле
		 * с соответствующим идентификатором из массива <i>_texts</i> текстовых полей.</p>
		 * */
		public function getTextFieldById(pStrId:String):TextField{
			var tempText:TextField;
			// находим номер идентификатора текстового поля в массиве идентификаторов,
			// значение которого совпадает со значением передаваемого параметра
			for(var i:int = 0; i < _textIds.length; i++){
				if(_textIds[i] == pStrId){
					// номер идентификатора в массве идентификаторов текстовых полей
					// совпадает с номером текстового поля в массиве текстовых полей
					tempText = _texts[i];
					break;
				}
			}
			return tempText;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ УПРАВЛЕНИЯ СПРАЙТАМИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Подготовка создания спрайтов</h1>
		 * <p><b>IMPORTANT!</b> Этот метод необходимо вызывать <i>перед</i> вызовом методов создания спрайтов.</p>
		 * <p>Метод выполняет необходимую подготовительную работу, инициализируя переменные, которые используют
		 * другие методы класса, работающие со спрайтами. Выделение этого метода, а так же подобных ему методов, работающих
		 * с другими объектами экрана, в отдельный общедоступный метод вызвано тем, что при создании экземпляра класса
		 * <i>AnimatedScreen</i>, возможно, будут создаваться не все возможные объекты экрана.</p>
		 * */
		public function prepareSpriteCreation():void{
			_sprites = new Vector.<Sprite>;
			_spriteIds = new Vector.<String>;
			_spritePosOn = new Vector.<Point>;
			_spritePosOut = new Vector.<Point>;
		}
		
		/**
		 * <h1>Создание анимированного спрайта</h1>
		 * <p>Метод создает спрайт, сохраняет его в массиве спрайтов и связывает с ним передаваемый строковый идентификатор</p>
		 * */
		public function createAnimatedSprite(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number):void{
			// запоминаем идентификатор спрайта
			_spriteIds.push(pStrId);
			// запоминаем положение спрайта на экране
			var posOn:Point = new Point(xPosOn, yPosOn);
			_spritePosOn.push(posOn);
			// запоминаем положение спрайта за пределами экрана
			var posOut:Point = new Point(xPosOut, yPosOut);
			_spritePosOut.push(posOut);
			// создаем спрайт и располагаем его ЗА ПРЕДЕЛАМИ экрана
			var tempSprite:Sprite = new Sprite();
			tempSprite.x = xPosOut;
			tempSprite.y = yPosOut;
			_sprites.push(tempSprite);
		}
		
		/**
		 * <h1>Добавление спрайта в список отображения</h1>
		 * <p>Метод принимает идентификатор спрайта <i>pStrId</i>, находит его в массиве спрайтов и добавляет в список отображения
		 * объекта, передаваемого как параметр <i>po</i></p>
		 * */
		public function addAnimatedSpriteToDisplayList(pStrId:String, po:DisplayObjectContainer):void{
			var tempSprite:Sprite = getSpriteById(pStrId);
			po.addChild(tempSprite);
		}
		
		/**
		 * <h1>Удаление спрайта из списка отображения</h1>
		 * */
		public function removeAnimatedSpriteFromDisplayList(pStrId:String):void{
			var tempSprite:Sprite = getSpriteById(pStrId);
			// поскольку объект, содержащий данный спрайт, заранее неизвестен,
			// сначала получаем доступ к нему, а затем удаляем спрайт.
			tempSprite.parent.removeChild(tempSprite);
		}
		
		/**
		 * <h1>Установка объекта, управляющего движением спрайта с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор спрайта, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его движением</p>
		 * */
		public function setupAnimatedSpriteMover(pStrId:String):void{
			var tempSprite:Sprite = getSpriteById(pStrId);
			var tempMover:IScreenObjectMover = new SteadyMover(tempSprite);
			_movers.push(tempMover);
			_movedObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Установка объекта, управляющего прозрачностью спрайта с заданным идентификатором</h1>
		 * <p>Метод принимает в качестве параметра строковый идентификатор спрайта, находит его по указанному идентификатору и
		 * и передает в качестве параметра создаваемому объекту, управляющему его прозрачностью</p>
		 * */
		public function setupAnimatedSpriteSolvent(pStrId:String):void{
			var tempSprite:Sprite = getSpriteById(pStrId);
			var tempSolvent:IScreenObjectSolvent = new SteadySolvent(tempSprite);
			_solvents.push(tempSolvent);
			_solvObjIds.push(pStrId);
		}
		
		/**
		 * <h1>Поиск спрайта по его идентификатору</h1>
		 * <p>принимает в качестве параметра идентификатор спрайта и возвращает соответствующий ему спрайт.</p>
		 * */
		public function getSpriteById(pStrId:String):Sprite{
			var tempSprite:Sprite;
			// находим номер идентификатора спрайта в массиве идентификаторов,
			// значение которого совпадает со значением передаваемого параметра
			for(var i:int = 0; i < _spriteIds.length; i++){
				if(_spriteIds[i] == pStrId){
					// номер идентификатора в массиве идентификаторов спрайтов
					// совпадает с номером спрайта в массиве спрайтов
					tempSprite = _sprites[i];
					break;
				}
			}
			return tempSprite;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ УПРАВЛЕНИЯ ДВИЖЕНИЕМ И РАСТВОРЕНИЕМ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Задание параметров движения объекта на экране</h1>
		 * <p>Метод задает параметры движения для объекта с указанным идентификатором</p>
		 * <p><b>NB!</b> Поиск идентификатора ведется по массиву идентификаторов движителей!</p>
		 * */
		public function defineAnimatedMovement(pStrId:String, psp:Point, pep:Point, pv:Number):void{
			var mover:IScreenObjectMover;
			// Объект mover, управляющий движением нужного нам объекта, находим по идентификатору объекта
			// в массиве идентификаторов движителей _movedObjIds, а не самих объектов!
			
			for(var i:int = 0; i < _movedObjIds.length; i++){
				//trace("i = " + i + ", moved object id = " + _movedObjIds[i] + ", mover = " + _movers[i]);
				if(_movedObjIds[i] == pStrId){
					mover = _movers[i];
					break;
				}
			}
			mover.defineMovement(psp, pep, pv);
		}
		
		/**
		 * <h1>Управление движением объектов</h1>
		 * <p>Метод перемещает объекты на экране, на каждом шаге проверяя их движение.
		 * Если хотя бы один объект движется, возвращается значение <i>true</i>,
		 * в противном случае - <i>false</i>.</p>
		 * */
		public function moveObjects():Boolean{
			var res:Boolean = false;
			for(var i:int = 0; i < _movers.length; i++){
				if(_movers[i].isMoving){
					_movers[i].move();
					res = true;
				}
			}
			return res;
		}
				
		/**
		 * <h1>Задание параметров изменения прозрачности объектов на экране</h1>
		 * <p>Метод задает параметры движения для объекта с указанным идентификатором</p>
		 * <p><b>NB!</b> Поиск идентификатора ведется по массиву идентификаторов движителей!</p>
		 * */
		public function defineAnimatedSolvence(pStrId:String, pst:Number, pet:Number, ps:Number):void{
			var solvent:IScreenObjectSolvent;
			for(var i:int = 0; i < _solvObjIds.length; i++){
				if(_solvObjIds[i] == pStrId){
					solvent = _solvents[i];
					break;
				}
			}
			solvent.defineSolution(pst, pet, ps);
		}
		
		/**
		 * <h1>Управление изменением прозрачности объектов на экране</h1>
		 * <p></p>
		 * */
		public function solveButtons():Boolean{
			var res:Boolean = false;
			for(var i:int = 0; i < _solvents.length; i++){
				if(_solvents[i].isSolving){
					_solvents[i].solve();
					res = true;
				}
			}
			return res;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ СВЕРКАНИЯ КНОПКИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		public function createBtnEffectImages():void{
			_btnEffectImages = new Vector.<Image>;
			_btnEffectImages.push(this.getImageById(ScreenObjectId.IMG_GLOW_0));
			_btnEffectImages.push(this.getImageById(ScreenObjectId.IMG_GLOW_1));
			_btnEffectImages.push(this.getImageById(ScreenObjectId.IMG_GLOW_2));
			_btnEffectImages.push(this.getImageById(ScreenObjectId.IMG_GLOW_3));
			_btnEffectImages.push(this.getImageById(ScreenObjectId.IMG_GLOW_4));
		}
		
		private function onGlobalTouch(event:TouchEvent):void{
			var touch:Touch = event.getTouch(stage);
			if(touch){
				
				if(event.target as Image){
					if((event.target as Image).parent as Sprite){
						if(((event.target as Image).parent as Sprite).parent as SimpleButton){
							_glowBtnCurrent = ((event.target as Image).parent as Sprite).parent as SimpleButton;
						}
					}
				}
				
				if(touch.phase == TouchPhase.HOVER){
					
					
					if(_glowBtnCurrent){
						if(_glowBtnCurrent != _glowBtnPrevious){
							_glowBtnPrevious = _glowBtnCurrent;
							_cs = SOUT;
							_ws = SOUT;
							stopBtnEffects();
						}else{
							if(_cs == SOUT){
								_cs = SOVER;
								startBtnEffects();
							}
							_ws = SOVER;
						}
					}
					_globalTouchX = touch.globalX;
					_globalTouchY = touch.globalY;
				}
			}
		}
		
		private function watchButtons():void{
			if(_ws == SOVER){
				
				_ws = SOUT;
			}else{
				if(_cs == SOVER){
					if(_glowBtnCurrent){
						var topLeft:Point = _glowBtnCurrent.localToGlobal(new Point(0, 0));
						var x0:Number = topLeft.x;
						var y0:Number = topLeft.y;
						
						var xl:Number = x0;
						var xr:Number = x0 + _glowBtnCurrent.width;
						
						var yt:Number = y0;
						var yb:Number = y0 + _glowBtnCurrent.height;
					}
					if(!((_globalTouchX > xl) && (_globalTouchX < xr) && (_globalTouchY > yt) && (_globalTouchY < yb))){
						stopBtnEffects();
						_cs = SOUT;
					}else{
						runBtnEffects();
					}
					
				}
			}
		}
		
		protected function startBtnEffects():void{
			//trace("btn effects started...");
			var x0:Number = _glowBtnCurrent.x + _glowBtnCurrent.width / 2;
			var y0:Number = _glowBtnCurrent.y + _glowBtnCurrent.height / 2;
			
			for(var i:int = 0; i < _btnEffectImages.length; i++){
				_btnEffectImages[i].x = x0 - _btnEffectImages[i].width / 2;
				_btnEffectImages[i].y = y0 - _btnEffectImages[i].height / 2;
			}
			
			_numOfEffectImage = 0;
			
			var num:int = _glowBtnCurrent.parent.getChildIndex(_glowBtnCurrent);
			_glowBtnCurrent.parent.addChildAt(_btnEffectImages[0], num);
			
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.SOUND_HOVER_OVER_BUTTON);
			dispatchEvent(new Event(EventType.PLAY_SOUND, false, soundEventData));
		}
		
		protected function runBtnEffects():void{
			//trace("btn effects running...");
			var num:int = _glowBtnCurrent.parent.getChildIndex(_btnEffectImages[_numOfEffectImage]);
			//trace("num of child index = " + num);
			_glowBtnCurrent.parent.removeChild(_btnEffectImages[_numOfEffectImage]);
			_numOfEffectImage++;
			if(_numOfEffectImage == _btnEffectImages.length) _numOfEffectImage = 0;
			_glowBtnCurrent.parent.addChildAt(_btnEffectImages[_numOfEffectImage], num);
		}
		
		protected function stopBtnEffects():void{
			//trace("btn effects stopped...");
			var soundEventData:SoundEventData = new SoundEventData(SoundNames.SOUND_HOVER_OVER_BUTTON);
			dispatchEvent(new Event(EventType.STOP_SOUND, false, soundEventData));
			
			_glowBtnCurrent.parent.removeChild(_btnEffectImages[_numOfEffectImage]);
			_glowBtnCurrent = null;
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ ОСВОБОЖДЕНИЯ ПАМЯТИ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		override public function clearify():void{
			// освобождаем память, занятую массивами, хранящими информацию о кнопках
			if(_buttonPosOn){
				for(var i:int = _buttonPosOn.length - 1; i >= 0; i--){
					_buttonPosOn.splice(i, 1);
				}
				_buttonPosOn = null;
			}
			
			if(_buttonPosOut){
				for(i = _buttonPosOut.length - 1; i >= 0; i--){
					_buttonPosOut.splice(i, 1);
				}
				_buttonPosOut = null;
			}
			
			if(_buttonIds){
				for(i = _buttonIds.length - 1; i >= 0; i--){
					_buttonIds.splice(i, 1);
				}
				_buttonIds = null;
			}
			
			// освобождаем память, занятую массивами, хранящими информацию о изображениях
			if(_imagePosOn){
				for(i = _imagePosOn.length - 1; i >= 0; i--){
					_imagePosOn.splice(i, 1);
				}
				_imagePosOn = null;
			}
			
			if(_imagePosOut){
				for(i = _imagePosOut.length - 1; i >= 0; i--){
					_imagePosOut.splice(i, 1);
				}
				_imagePosOut = null;
			}
			
			if(_imageIds){
				for(i = _imageIds.length - 1; i >= 0; i--){
					_imageIds.splice(i, 1);
				}
				_imageIds = null;
			}
			
			// освобождаем память, занятую массивами, хранящими информацию о текстовых полях
			if(_textPosOn){
				for(i = _textPosOn.length - 1; i >= 0; i--){
					_textPosOn.splice(i, 1);
				}
				_textPosOn = null;
			}
			
			if(_textPosOut){
				for(i = _textPosOut.length - 1; i >= 0; i--){
					_textPosOut.splice(i, 1);
				}
				_textPosOut = null;
			}
			
			if(_textIds){
				for(i = _textIds.length - 1; i >= 0; i--){
					_textIds.splice(i, 1);
				}
				_textIds = null;
			}
			
			// освобождаем память, занятую массивами, хранящими информацию о спрайтах
			if(_spritePosOn){
				for(i = _spritePosOn.length - 1; i >= 0; i--){
					_spritePosOn.splice(i, 1);
				}
				_spritePosOn = null;
			}
			
			if(_spritePosOut){
				for(i = _spritePosOut.length - 1; i >= 0; i--){
					_spritePosOut.splice(i, 1);
				}
				_spritePosOut = null;
			}
			
			if(_spriteIds){
				for(i = _spriteIds.length - 1; i >= 0; i--){
					_spriteIds.splice(i, 1);
				}
				_spriteIds = null;
			}
			
			// освобождаем память, занятую движителями и идентификаторами движимых объектов
			if(_movers){
				for(i = _movers.length - 1; i >= 0; i--){
					_movers.splice(i, 1);
				}
				_movers = null;
			}
			
			if(_movedObjIds){
				for(i = _movedObjIds.length - 1; i >= 0; i--){
					_movedObjIds.splice(i, 1);
				}
				_movedObjIds = null;
			}
			
			// освобождаем память, занятую растворителями и идентификаторами растворяемых объектов
			if(_solvents){
				for(i = _solvents.length - 1; i >= 0; i--){
					_solvents.splice(i, 1);
				}
				_solvents = null;
			}
			
			if(_solvObjIds){
				for(i = _solvObjIds.length - 1; i >= 0; i--){
					_solvObjIds.splice(i, 1);
				}
				_solvObjIds = null;
			}
			
			// освобождаем память, занятую спрайтами
			if(_sprites){
				for(i = _sprites.length - 1; i >= 0; i--){
					if(_sprites[i].parent){
						_sprites[i].parent.removeChild(_sprites[i]);
					}
					_sprites[i].dispose();
					_sprites.splice(i, 1);
				}
				_sprites = null;
			}
			
			// вызвыаем метод суперкласса для освобождения памяти, занятыми переменными,
			// определенными в суперклассе
			super.clearify();
			
			
		}
		
		///////////////////////////////////////////////////////////////////////////////////////////
		//
		//		МЕТОДЫ ДЛЯ ПЕРЕГРУЗКИ В КЛАССАХ-НАСЛЕДНИКАХ
		//
		///////////////////////////////////////////////////////////////////////////////////////////
		
		/**
		 * <h1>Обновление информации на экране</h1>
		 * <p>Метод предназначен для обновления информации, отображаемой на экране. Информация может быть двух видов:
		 * <ul>
		 * <li><i>текстовой</i> - отображающей значение некоторой величины (например, текущего счета);</li>
		 * <li><i>графической</i> - отображающей тип задания, а так же его выполнение или невыполнение.</li>
		 * </ul>
		 * </p>
		 * <p>Для текстовой информации значение <i>key</i> соответствует строковому идентификатору <i>pStrId</i> текстового элемента, 
		 * а <i>value</i> - текстовому содержимому этого идентификатора.</p>
		 * <p>Для графической информации значение <i>key</i> соответствует <u>типу отображаемой информации</u> (например, типу задания - <i>superGoal</i>,
		 * <i>primaryGoal</i>, <i>secondaryGoal</i>, или состояния <i>выполнено</i> - <i>провалено</i>),
		 * а значение <i>value</i> - идентификатору графического элемента, который необходимо добавить в список отображения.</p>
		 * */
		public function updateScreenData(key:String, value:String):void{
			// stub to override
		}

	}
}