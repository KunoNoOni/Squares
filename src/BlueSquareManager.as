package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class BlueSquareManager extends FlxGroup
	{
		private var lastReleased:int;
		public static var releaseRate:int;
		
		public function BlueSquareManager() 
		{
			super();
			
			for (var i:int = 0; i < 50; i++)
			{
				add(new blueSquare);
			}
		}
		
		public function release():void
		{
			var bS:blueSquare = blueSquare(getFirstAvailable());
			if (bS)
			{
				bS.launch();
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