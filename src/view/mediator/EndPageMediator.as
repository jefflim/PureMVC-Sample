package view.mediator {
	import flash.events.Event;
	
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.EndPage;

	public class EndPageMediator extends Mediator {
		public static const NAME:String = "EndPageMediator";
		public function EndPageMediator(viewComponent:EndPage) {
			super(NAME, viewComponent);
		}
		
		override public function onRegister():void{
			endPage.addEventListener(EndPage.BUTTON_END_CLICK, onEndPageHandler);
		}
		
		private function onEndPageHandler(e:Event):void{
			sendNotification(ApplicationNotification.SHOW_STARTPAGE);
		}
		
		public function get endPage():EndPage{
			return viewComponent as EndPage;
		}
	}
}
