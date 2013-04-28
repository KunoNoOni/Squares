package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class YellowSquareManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function YellowSquareManager() 
		{
			super();
			
			for (var i:int = 0; i < 50; i++)
			{
				add(new yellowSquare);
			}
		}
		
		public function release():void
		{
			var yS:yellowSquare = yellowSquare(getFirstAvailable());
			if (yS)
			{
				yS.launch();
			}
		}
		
		override public function update():void
		{
			super.update();
			
			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();
				release();
			}
		}
	}
}