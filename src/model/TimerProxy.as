package model {
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.utils.getTimer;

	import org.puremvc.as3.patterns.proxy.Proxy;

	public class TimerProxy extends Proxy {
		public static const NAME:String = "TimerProxy";

		private var _stageTimer:Timer;
		private var _delay:uint = 1000;
		private var _currentTimer:uint;
		private var _startTimer:uint;
		private var _pauseTimer:uint;
		private var _diffTimer:uint;

		public function TimerProxy(proxyName:String = null, data:Object = null) {
			super(NAME, data);
			_stageTimer = new Timer(20);
			_stageTimer.addEventListener(TimerEvent.TIMER, onStageTimerHandler);

		}

		public function get delay():uint {
			return _delay;
		}

		public function set delay(value:uint):void {
			_delay = value;
		}

		public function initStageTimer():void {
			_pauseTimer = 0;
			_diffTimer = 0;
			_stageTimer.stop();
		}
		
		public function startTimer():void{
			_stageTimer.start();
			_startTimer = getTimer();
			_currentTimer = getTimer();
		}
		
		public function stopTimer():void{
			_stageTimer.stop();
		}

		private function onStageTimerHandler(e:TimerEvent):void {
			if (_diffTimer == 0){
				if (getTimer() - _currentTimer >= _delay) {
					_currentTimer = getTimer();
					sendNotification(ApplicationNotification.TIMER_UPDATE);
				}
				
				sendNotification(ApplicationNotification.TIMER_CURRENT, getTimer() - _startTimer - _pauseTimer);
			}
		}

		public function resetStageTimer():void {
			_currentTimer = getTimer();
		}

		public function pauseTimer():void {
			_diffTimer = getTimer();
		}

		public function resumeTimer():void {
			_pauseTimer += getTimer() - _diffTimer;
			_diffTimer = 0;
			resetStageTimer();
		}

	}
}
