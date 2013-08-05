package model {
	
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class StageSpriteProxy extends Proxy {
		public static const NAME:String = "StageSpriteProxy";
		private var _currentColor:uint;
		private var _colorVec:Vector.<uint> = Vector.<uint>([0x000000, 0x0000FF, 0x00FFFF, 0xFF00FF, 0xFF0000, 0xFFFF00]);

		public function StageSpriteProxy(data:Object = null) {
			super(NAME, data);
			_currentColor = _colorVec[0];
		}

		public function get currentColor():uint {
			return _currentColor;
		}

		public function set currentColor(value:uint):void {
			_currentColor = value;
		}

		public function getNextColor():uint {
			var i:uint = _colorVec.indexOf(_currentColor) + 1;
			if (i == _colorVec.length)
				i = 0;

			_currentColor = _colorVec[i];
			return _currentColor;
		}

	}
}
