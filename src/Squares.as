package
{
	import org.flixel.*;
	
	[SWF(width="800", height="800", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
		
	public class Squares extends FlxGame
	{
		public function Squares()
		{
			super(400,400,TitleState,2);
			SaveBestTime.load();
			if(SaveBestTime.bestTime == 0)
			{
				SaveBestTime.bestTime = 40;
			}
			Registry.theBestTime = SaveBestTime.bestTime;
		}
	}
}
