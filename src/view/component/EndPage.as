package view.component {
	import flash.events.Event;
	
	import fl.controls.Button;
	import fl.events.ComponentEvent;

	public class EndPage extends FlashScene {
		public static const NAME:String = "EndPage";
		public static const BUTTON_END_CLICK:String = NAME + "ButtonEndClick";
		public function EndPage() {
			super();
		}
		
		override protected function init(e:Event):void{
			super.init(e);
			var $button:Button = new Button();
			$button.label = "Back";
			$button.x = (Application.STAGE_WIDTH >> 1) - ($button.width >> 1);
			$button.y = Application.STAGE_HEIGHT >> 1;
			addChild($button);
			$button.addEventListener(ComponentEvent.BUTTON_DOWN, onEndHandler);
		}
		
		private function onEndHandler(e:Event):void {
			this.dispatchEvent(new Event(BUTTON_END_CLICK));
		}

	}
}
