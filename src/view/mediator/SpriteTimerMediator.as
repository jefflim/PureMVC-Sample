package view.mediator {

	import model.StageSpriteProxy;
	import model.TimerProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.SpriteTimer;

	public class SpriteTimerMediator extends Mediator {
		public static const NAME:String = "SpriteTimerMediator";
		private var _stageSpriteProxy:StageSpriteProxy;
		private var _timerProxy:TimerProxy;

		public function SpriteTimerMediator(viewComponent:SpriteTimer) {
			super(NAME, viewComponent);
		}

		override public function onRegister():void {
			_stageSpriteProxy = facade.retrieveProxy(StageSpriteProxy.NAME) as StageSpriteProxy;
			_timerProxy = facade.retrieveProxy(TimerProxy.NAME) as TimerProxy;
		}

		override public function listNotificationInterests():Array {
			return [
				ApplicationNotification.TIMER_CURRENT
				];
		}

		override public function handleNotification($note:INotification):void {
			switch ($note.getName()) {
				case ApplicationNotification.TIMER_CURRENT:
					var $currentTimer:Number = Number($note.getBody());
					spriteTimer.updateTimer($currentTimer);
					if ($currentTimer > spriteTimer.totalTimer) {
						spriteTimer.updateTimer(spriteTimer.totalTimer);
						sendNotification(ApplicationNotification.TIMER_OUT);
						sendNotification(ApplicationNotification.SHOW_ENDPAGE);
						_timerProxy.stopTimer();
					}
					break;
			}
		}

		public function get spriteTimer():SpriteTimer {
			return viewComponent as SpriteTimer;
		}
	}
}
