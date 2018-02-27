package classes.factories
{
	import classes.screens.AnimatedScreen;

	/**
	 * <h1>Создатель экрана</h1>
	 * <p>Общий интерфейс, реализуемый всеми конкретными классами - создателями конкретных экранов.</p>
	 * <p>Содержит сигнатуру единственного метода:
	 * <ul>
	 * <li><b><i>createScreen():AnimatedScreen</i></b> - создает и возвращает экземпляр класса экрана</li>
	 * </ul></p>
	 * */
	public interface IScreenFactory
	{
		/**
		 * <h1>Создание и возвращение экземпляра класса экрана</h1>
		 * <p>Метод создает и возвращает экземпляр класса <i>AnimatedScreen</i> или его наследника.
		 * При создании класса происходит инициализация всех переменных экземпляра, для чего используются
		 * открытые методы класса <i>AnimatedScreen</i>.</p>
		 * <p>В качестве визуальных переменных экземпляр класса <i>AnimatedScreen</i> содержит объекты четырех видов:
		 * <ul>
		 * <li><b><i>_buttons:Vector.&lt;SimpleButton&gt;</i></b> - кнопки перехода между состояниями экрана и состояниями игры;</li>
		 * <li><b><i>_images:Vector.&lt;Image&gt;</i></b> - рисунки, отображаемые на экране;</li>
		 * <li><b><i>_texts:Vector.&lt;TextField&gt;</i></b> - текстовые поля;</li>
		 * <li><b><i>_sprites:Vector.&ltSprite&gt;</i></b> - спрайты, служащие, как правило, для группировки вышеназванных элементов экрана.</li>
		 * </ul>
		 * Для управления состоянием визуальных элементов служат следующие переменные:
		 * <ul>
		 * <li><b><i>_movers:Vector.&lt;IScreenObjectMover&gt;</i></b> - управление движением;</li>
		 * <li><b><i>_solvents:Vector.&lt;IScreenObjectSolvent&gt;</i></b> - управление прозрачностью.</li>
		 * </ul>
		 * </p>
		 * 
		 * <h1>Порядок создания экземпляра класса <i>AnimatedScreen</i></h1>
		 * 
		 * <p>Для создания экземпляра класса необходимо выполнить следующие действия:
		 * <ol>
		 * <li>Объявить новую переменную класса <i>AnimatedScreen</i>:
		 * <ul><li><i>var screen:AnimatedScreen = new AnimatedScreen();</i></li></ul>
		 * При этом переменная <i>screen</i> может быть экземпляром как самого класса  <i>AnimatedScreen</i>,
		 * так и его наследника.</li>
		 * 
		 * <li>Создать объекты, управляющие движением и прозрачностью визуальных элементов экрана:
		 * <ul><li><i>screen.createObjectMovers();</i></li>
		 * <li><i>screen.createObjectSolvents();</i></li></ul>
		 * <b>NB!</b> Эти методы необходиом вызывать <b><i>перед</i></b> созданием каких-либо визуальных объектов!
		 * </li>
		 * 
		 * <li>Создать и передать создаваемому экрану объект, задающий расположение элементов:
		 * <ul><li><i>_layout = new Layout<b>Some</b>Screen_???x???();</i></li>
		 * <li><i>screen.layout = _layout</i></li></ul>
		 * Объект <i>_layout</i> является экземпляром класса, наследующего некий абстрактный класс 
		 * <ul><li><i>Layout<b>Some</b>Screen</i></li></ul>,
		 * например, <ul><li><i>class <b>LayoutTitleScreen_540x950</b> extends <b>LayoutTitleScreen</b></i></li></ul>
		 * </li>
		 * 
		 * <li>Вызвать метод подготовки создания визуальных объектов определенного типа (например, кнопок):
		 * <ul><li><i>screen.prepareButtonCreation()</i></li></ul></li>
		 * <li>Создать конкретный объект (в данном случае рассматривается создание кнопки):
		 * <ul><li><i>screen.createAnimatedButton(stringId, id,xPosOn, yPosOn, xPosOut, yPosOut, upState, text, downState);</i></li></ul>
		 * Все переменные, передаваемые как параметры, могут быть созданы непосредственно перед созданием кнопки.</li>
		 * <li>Если необходимо на данном этапе, добавить кнопку в список отображения:
		 * <ul><li><i>screen.addAnimatedButtonToDisplayList(pStrId, po);</i></li></ul>
		 * Здесь в качестве параметра <i>po</i> передается ссылка на родительский объект, в список отображения которого добавляется данная кнопка. Таким объектом может быть сам экран,
		 * и тогда передается переменная <i>screen</i>, или один из спрайтов массива <i>_sprites</i>. Во втором случае ссылку на нужнынй спрайт можно найти с помощью метода 
		 * <ul></li><i>po = screen.getSpriteById(pStrId);</i></li></ul></li>
		 * <li>Если необходимо, чтобы кнопка могла двигаться, создать для нее объект-движитель:
		 * <ul><li><i>screen.setupAnimatedButtonMover(pStrId);</i></li></ul></li>
		 * <li>Если необходимо, чтобы кнопка могла изменять прозрачность, создать для нее объект-растворитель:
		 * <ul><li><i>screen.setupAnimatedButtonSolvent(pStrId)</i></li></ul></li>
		 * <li>Если необходимо, задать начальные парамеры движения и (или) растворения:
		 * <ul><li><i>screen.defineAnimatedMovement(pStrId:String, psp:Point, pep:Point, pv:Number)</i></li>
		 * <li><i>screen.defineAnimatedSolvence(pStrId:String, pst:Number, pet:Number, ps:Number)</i></li></ul></li>
		 * <li>Повторить шаги 4 - 8 необходимое количество раз для создания необходимого количества кнопок.</li>
		 * <li>Перейти к созданию визуальных объектов другого типа, для чего вызвать один из следующих методов:
		 * <ul><li><i>screen.prepareImageCreation();</i></li>
		 * <li><i>screen.prepareTextCreation();</i></li>
		 * <li><i>screen.prepareSpriteCreation()</i></li>
		 * </ul></li>
		 * <li>Повторить шаги 5 - 10 для каждого типа создаваемых объетов, вызвывя соответствующие методы:
		 * <li>создания объетов:
		 * <ul><li><i>screen.createAnimatedImage(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number, texture:Texture, transparent:Boolean = false);</i></li>
		 * <li><i>screen.createAnimatedText(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number, width:Number, height:Number,
										   text:String = "", fontName:String = "Verdana", fontSize:int = 12, 
										   color:uint = 0x000000, bold:Boolean = false);</i></li>
		 * <li><i>screen.createAnimatedSprite(pStrId:String, xPosOn:Number, yPosOn:Number, xPosOut:Number, yPosOut:Number);</i></li></ul>
		 * </li>
		 * <li>добавления объектов в список отображения:
		 * <ul><li><i>screen.addAnimatedImageToDisplayList(pStrId:String, po:DisplayObjectContainer);</i></li>
		 * <li><i>screen.addAnimatedTextToDisplayList(pStrId:String, po:DisplayObjectContainer);</i></li>
		 * <li><i>screen.addAnimatedSpriteToDisplayList(pStrId:String, po:DisplayObjectContainer)</i></li></ul>
		 * </li>
		 * <li>создания объекта-движителя:
		 * <ul><li><i>screen.setupAnimatedImageMover(pStrId:String)</i></li>
		 * <li><i>screen.setupAnimatedTextMover(pStrId:String);</i></li>
		 * <li><i>screen.setupAnimatedSpriteMover(pStrId:String)</i></li></ul>
		 * </li>
		 * <li>создания объекта-растворителя:
		 * <ul><li><i>screen.setupAnimatedImageSolvent(pStrId:String);</i></li>
		 * <li><i>screen.setupAnimatedTextSolvent(pStrId:String);</i></li>
		 * <li><i>screen.setupAnimatedSpriteSolvent(pStrId:String)</i></li></ul>
		 * </li>
		 * <li>установки начальных параметров движения:
		 * <ul><li><i>screen.defineAnimatedMovement(pStrId:String, psp:Point, pep:Point, pv:Number)</i></li></ul>
		 * Это единый, общий для всех типов объектов метод.
		 * </li>
		 * <li>установки начальных пареметров растворения:
		 * <ul><li><i>screen.defineAnimatedSolvence(pStrId:String, pst:Number, pet:Number, ps:Number)</i></li></ul>
		 * Это единый, общий для всех типов объектов метод.
		 * </li>
		 * <li>для доступа к конкретным экземплярам объектов предназначены методы:
		 * <ul><li><i>screen.getButtonById(pStrId:String):SimpleButton;</i></li>
		 * <li><i>screen.function getImageById(pStrId:String):Image;</i></li>
		 * <li><i>screen.getTextFieldById(pStrId:String):TextField;</i></li>
		 * <li><i>screen.getSpriteById(pStrId:String):Sprite;</i></li></ul>
		 * </li>
		 * </li>
		 * </ol></p>
		 * <h1>Замечания</h1>
		 * <p>Порядок использования методов для создания визуальных объектов на экране может меняться. Важно
		 * лишь соблюдение следующих условий:
		 * <ul><li>Перед созданием объектов определенного типа необходимо <u><i>один раз</i></u> вызвать подготовительный метод:
		 * <i>screen.prepare<b>ObjectName</b>Creation().
		 * </i> Это может быть один из следующих методов:
		 * <ul>
		 * <li><i>screen.prepareButtonCreation();</i></li>
		 * <li><i>screen.prepareImageCreation();</i></li>
		 * <li><i>screen.prepareTextCreation();</i></li>
		 * <li><i>screen.prepareSpriteCreation();</i></li>
		 * </ul>
		 * </li>
		 * <li>Поскольку все визуальные объеты экрана могут быть добавлены в списки отображения других визуальных объетов (за исключением объектов класса <i>Image</i>, не имеющих
		 * собственного списка отображения), необходимо убедиться, что созданы оба объекта - и родительский, и дочерний, и только после этого вызывть соответствующие методы:
		 * <ul>
		 * <li><i>screen.addAnimatedButtonToDisplayList(pStrId:String, po:DisplayObjectContainer);</i></li>
		 * <li><i>screen.addAnimatedImageToDisplayList(pStrId:String, po:DisplayObjectContainer);</i></li>
		 * <li><i>screen.addAnimatedTextToDisplayList(pStrId:String, po:DisplayObjectContainer);</i></li>
		 * <li><i>screen.addAnimatedSpriteToDisplayList(pStrId:String, po:DisplayObjectContainer)</i></li>
		 * </ul></li><ul>
		 * </p>
		 * */
		function createScreen():AnimatedScreen;
	}
}