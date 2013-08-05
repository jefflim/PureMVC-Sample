package controller {
	import flash.display.Stage;
	
	import model.StageSpriteProxy;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	import view.mediator.StageMediator;
	import model.TimerProxy;

	public class StartupCommand extends SimpleCommand implements ICommand {
		override public function execute($note:INotification):void {
			prepareModel($note);
			prepareView($note);
			
			sendNotification(ApplicationNotification.SHOW_STARTPAGE);
		}
		
		private function prepareModel($note:INotification):void{
			facade.registerProxy(new StageSpriteProxy());
			facade.registerProxy(new TimerProxy());
		}
		
		private function prepareView($note:INotification):void{
			var $stage:Stage = $note.getBody().stage as Stage;
			facade.registerMediator(new StageMediator($stage));
		}

	}
}
