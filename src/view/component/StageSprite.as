package view.component {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import fl.controls.Button;
	import fl.events.ComponentEvent;
	
	import view.event.FlashEvent;

	public class StageSprite extends FlashScene {
		public static const NAME:String = "StageSprite";
		public static const MOUSE_CLICK:String = NAME + "MouseClick";
		private var _rectSp:Sprite;
		private var _buttonBack:Button;
		private var _buttonTimer:Button;
		private var _active:Boolean;
		
		public function StageSprite() {
			super();
		}

		override protected function init(e:Event):void {
			super.init(e);
			_buttonBack = new Button();
			_buttonBack.label = "back";
			_buttonBack.addEventListener(ComponentEvent.BUTTON_DOWN, onBackHandler);
			_buttonBack.x = 55;
			_buttonBack.y = 250;
			addChild(_buttonBack);
			
			_buttonTimer = new Button();
			_buttonTimer.label = "start";
			_buttonTimer.x = 55;
			_buttonTimer.y = 220;
			_buttonTimer.addEventListener(ComponentEvent.BUTTON_DOWN, onTimerClickHandler);
			addChild(_buttonTimer);

			
			_rectSp = new Sprite();
			addChild(_rectSp);
			_rectSp.addEventListener(MouseEvent.CLICK, onMouseClickHandler);
		}
		
		override protected function destroy(e:Event):void {
			super.destroy(e);
			_buttonBack.removeEventListener(ComponentEvent.BUTTON_DOWN, onBackHandler);
			_rectSp.removeEventListener(MouseEvent.CLICK, onMouseClickHandler);
			_buttonTimer.removeEventListener(ComponentEvent.BUTTON_DOWN, onTimerClickHandler);
		}
		
		public function disable():void{
			_rectSp.removeEventListener(MouseEvent.CLICK, onMouseClickHandler);
			_buttonTimer.removeEventListener(ComponentEvent.BUTTON_DOWN, onTimerClickHandler);
		}
		
		private function onBackHandler(e:Event):void{
			this.dispatchEvent(new FlashEvent(MOUSE_CLICK, false, false, "back"));
		}
		
		private function onTimerClickHandler(e:Event):void{
			this.dispatchEvent(new FlashEvent(MOUSE_CLICK, false, false, _buttonTimer.label));
			if(_buttonTimer.label == "pause"){
				_buttonTimer.label = "resume";
			}else{
				_buttonTimer.label = "pause";
			}
		}

		public function showRect($color:uint):void {
			_rectSp.graphics.clear();
			_rectSp.graphics.beginFill($color, 1);
			_rectSp.graphics.drawRect(10, 10, 200, 200);

		}

		private function onMouseClickHandler(e:MouseEvent):void {
			this.dispatchEvent(new FlashEvent(StageSprite.MOUSE_CLICK, false, false, "change"));
		}
	}
}
