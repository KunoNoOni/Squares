package
{
	import org.flixel.*;
	
	public class SaveBestTime
	{
		private static var save:FlxSave; 
		private static var temp:int = 0; 
		private static var isLoaded:Boolean = false;
		
		public static function get bestTime():int
		{
			if (isLoaded)
			{
				return save.data.bestTime;
			}
			else
			{
				return temp;
			}
		}

		public static function set bestTime(value:int):void
		{
			if (isLoaded)
			{
				save.data.bestTime = value;
			}
			else
			{
				temp = value;
			}
		}

		public static function load():void
		{
			save = new FlxSave();
			isLoaded = save.bind("bestTime");
			if (isLoaded && save.data.bestTime == null) 
			{
				save.data.bestTime = 0;
			}
		}
	}
}