package {
	import flash.display.Sprite;
	import flash.events.Event;

	public class Application extends Sprite {
		public static var STAGE_WIDTH:Number;
		public static var STAGE_HEIGHT:Number;
		public function Application() {
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		protected function init(e:Event):void{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			STAGE_WIDTH = this.stage.stageWidth;
			STAGE_HEIGHT = this.stage.stageHeight;
		}
	}
}
