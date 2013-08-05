package view.mediator {
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.EndPage;
	import view.component.SpriteTimer;
	import view.component.StageSprite;
	import view.component.StartPage;

	public class StageMediator extends Mediator implements IMediator {
		public static const NAME:String = "StageMediator";
		
		public function StageMediator(viewComponent:Stage) {
			super(NAME, viewComponent);
		}
		
		override public function listNotificationInterests():Array{
			return [
				ApplicationNotification.SHOW_STARTPAGE,
				ApplicationNotification.SHOW_SPRITEPAGE,
				ApplicationNotification.SHOW_ENDPAGE,
				ApplicationNotification.COLOR_CHANGE
			];
		}
		
		override public function handleNotification($note:INotification):void{
			switch($note.getName()){
				case ApplicationNotification.SHOW_STARTPAGE:
					removePage(StageSpriteMediator.NAME);
					removePage(SpriteTimerMediator.NAME);
					removePage(EndPageMediator.NAME);
					
					var $startPage:StartPage = new StartPage();
					stage.addChild($startPage);
					
					facade.registerMediator(new StartPageMediator($startPage));
					break;
				
				case ApplicationNotification.SHOW_ENDPAGE:
					var $endPage:EndPage = new EndPage();
					stage.addChild($endPage);
					
					facade.registerMediator(new EndPageMediator($endPage));
					break;
				
				case ApplicationNotification.SHOW_SPRITEPAGE:
					removePage(StartPageMediator.NAME);
					var $stageSprite:StageSprite = new StageSprite();
					stage.addChild($stageSprite);
					facade.registerMediator(new StageSpriteMediator($stageSprite));
					
					var $spriteTimer:SpriteTimer = new SpriteTimer();
					stage.addChild($spriteTimer);
					facade.registerMediator(new SpriteTimerMediator($spriteTimer));
					break;
				
				case ApplicationNotification.COLOR_CHANGE:
					trace("colorChange", $note.getBody());
					break;
				

			}
		}
		
		private function removePage($mediator:String):void{
			if(facade.hasMediator($mediator)){
				stage.removeChild(facade.retrieveMediator($mediator).getViewComponent() as Sprite);
				facade.removeMediator($mediator);
			}
		}
		
		public function get stage():Stage{
			return viewComponent as Stage;
		}
		
	}
}
