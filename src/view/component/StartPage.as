package view.component {
	import flash.events.Event;

	import fl.controls.Button;
	import fl.events.ComponentEvent;

	public class StartPage extends FlashScene {
		public static const NAME:String = "StartPage";
		public static var BUTTON_START_CLICK:String = NAME + "ButtonStartClick";

		public function StartPage() {
			super();

		}

		override protected function init(e:Event):void {
			super.init(e);
			var $button:Button = new Button();
			$button.label = "Start";
			$button.x = (Application.STAGE_WIDTH >> 1) - ($button.width >> 1);
			$button.y = Application.STAGE_HEIGHT >> 1;
			addChild($button);
			$button.addEventListener(ComponentEvent.BUTTON_DOWN, onStartHandler);
		}

		private function onStartHandler(e:Event):void {
			this.dispatchEvent(new Event(BUTTON_START_CLICK));
		}

	}

}
