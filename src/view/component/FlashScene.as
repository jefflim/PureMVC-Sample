package view.component {
	import flash.display.Sprite;
	import flash.events.Event;

	public class FlashScene extends Sprite {
		public function FlashScene() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event):void {
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			this.addEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
		
		protected function destroy(e:Event):void{
			this.removeEventListener(Event.REMOVED_FROM_STAGE, destroy);
		}
	}
}
