package view.mediator {
	
	import flash.events.Event;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.StartPage;

	public class StartPageMediator extends Mediator {
		public static const NAME:String = "StartPageMediator";

		public function StartPageMediator(viewComponent:StartPage) {
			super(NAME, viewComponent);
			
		}
		
		override public function onRegister():void{
			startPage.addEventListener(StartPage.BUTTON_START_CLICK, onStagePageHandler);
		}
		
		private function onStagePageHandler(e:Event):void{
			sendNotification(ApplicationNotification.SHOW_SPRITEPAGE);
		}
		
		public function get startPage():StartPage{
			return viewComponent as StartPage;
		}
	}
}
