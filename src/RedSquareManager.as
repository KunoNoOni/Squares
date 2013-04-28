package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class RedSquareManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function RedSquareManager() 
		{
			super();
			
			for (var i:int = 0; i < 50; i++)
			{
				add(new redSquare);
			}
		}
		
		public function release():void
		{
			var rS:redSquare = redSquare(getFirstAvailable());
			if (rS)
			{
				rS.launch();
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