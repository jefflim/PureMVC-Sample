package {
	import flash.events.Event;

	public class SimplePureMVC extends Application {
		public function SimplePureMVC() {
			super();
		}
		
		override protected function init(e:Event):void{
			super.init(e);
			ApplicationFacade.getInstance().startup(this);
		}
	}
}
