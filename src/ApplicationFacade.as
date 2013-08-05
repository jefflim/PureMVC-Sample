package {
	import controller.StartupCommand;

	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;

	public class ApplicationFacade extends Facade implements IFacade {

		private static var _instance:ApplicationFacade;

		public function ApplicationFacade() {
			super();
		}

		public static function getInstance():ApplicationFacade {
			if (_instance == null)
				_instance = new ApplicationFacade();
			return _instance;
		}

		override protected function initializeController():void {
			super.initializeController();
			registerCommand(ApplicationNotification.STARTUP, StartupCommand);
		}

		public function startup($app:SimplePureMVC):void {
			sendNotification(ApplicationNotification.STARTUP, $app);
		}
	}
}
