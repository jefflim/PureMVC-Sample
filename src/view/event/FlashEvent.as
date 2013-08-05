package view.event {
	import flash.events.Event;

	public class FlashEvent extends Event {
		private var _params:Object;

		public function FlashEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false, $params:Object = null) {
			super(type, bubbles, cancelable);
			if($params)
				params = $params;
		}

		public function get params():Object {
			return _params;
		}

		public function set params(value:Object):void {
			_params = value;
		}

	}
}
