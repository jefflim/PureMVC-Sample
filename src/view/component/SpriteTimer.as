package view.component {
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * show timer on the stage
	 */
	public class SpriteTimer extends FlashScene {
		public static const NAME:String = "SpriteTimer";
		public static const BUTTON_CLICK:String = NAME + "ButtonClick";
		private var _txtTimer:TextField;
		public var totalTimer:Number = 5000;

		public function SpriteTimer() {
			super();
		}

		override protected function init(e:Event):void {
			super.init(e);
			_txtTimer = new TextField();
			_txtTimer.defaultTextFormat = new TextFormat("Arial", 18, 0xFF0000);
			_txtTimer.x = (Application.STAGE_WIDTH >> 1) - (_txtTimer.width >> 1);
			_txtTimer.y = Application.STAGE_HEIGHT - 100;
			_txtTimer.text = "0";
			addChild(_txtTimer);
			
		}

		public function updateTimer($txt:Number):void {
			_txtTimer.text = String($txt);
		}
		
	}
}
