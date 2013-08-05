package view.mediator {
	import flash.events.Event;
	
	import model.StageSpriteProxy;
	import model.TimerProxy;
	
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	import view.component.StageSprite;
	import view.event.FlashEvent;

	/**
	 * Add a new Sprite in the stage
	 */
	public class StageSpriteMediator extends Mediator {
		public static const NAME:String = "StageSpriteMediator";
		private var _stageSpriteProxy:StageSpriteProxy;
		private var _timerProxy:TimerProxy;

		public function StageSpriteMediator(viewComponent:StageSprite) {
			super(NAME, viewComponent);

		}

		override public function onRegister():void {
			stageSprite.addEventListener(StageSprite.MOUSE_CLICK, onMouseClickHandler);

			_stageSpriteProxy = facade.retrieveProxy(StageSpriteProxy.NAME) as StageSpriteProxy;
			stageSprite.showRect(_stageSpriteProxy.currentColor);

			_timerProxy = facade.retrieveProxy(TimerProxy.NAME) as TimerProxy;
			_timerProxy.initStageTimer();
		}

		override public function onRemove():void {

		}

		private function onMouseClickHandler(e:FlashEvent):void {
			if (e.params == "back") {
				_timerProxy.stopTimer();
				sendNotification(ApplicationNotification.SHOW_STARTPAGE);
				
			} else if (e.params == "change") {
				stageSprite.showRect(_stageSpriteProxy.getNextColor());
				sendNotification(ApplicationNotification.COLOR_CHANGE, _stageSpriteProxy.currentColor);
				_timerProxy.resetStageTimer();
				
			} else if (e.params == "start") {
				_timerProxy.startTimer();
				
			} else if (e.params == "pause") {
				_timerProxy.pauseTimer();
				
			} else if (e.params == "resume") {
				_timerProxy.resumeTimer();
				
			}
		}

		public function get stageSprite():StageSprite {
			return viewComponent as StageSprite;
		}

		override public function listNotificationInterests():Array {
			return [
				ApplicationNotification.TIMER_UPDATE,
				ApplicationNotification.TIMER_OUT
			];
		}

		override public function handleNotification($note:INotification):void {
			switch ($note.getName()) {
				case ApplicationNotification.TIMER_UPDATE:
					stageSprite.showRect(_stageSpriteProxy.getNextColor());
					break;
				
				case ApplicationNotification.TIMER_OUT:
					stageSprite.disable();
					break;
			}
		}
	}
}
