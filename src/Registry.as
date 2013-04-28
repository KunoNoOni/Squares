package
{
	import org.flixel.*;

	public class Registry
	{
		public static var blueSquareVelocity:Number;
		public static var blueSquares:BlueSquareManager;
		public static var blueSquareInitalVelocity:Number = 50;
		public static var redSquareVelocity:Number;
		public static var redSquares:RedSquareManager;
		public static var redSquareInitalVelocity:Number = 50;
		public static var yellowSquareVelocity:Number;
		public static var yellowSquares:YellowSquareManager;
		public static var yellowSquareInitalVelocity:Number = -50;
		public static var secondsReached10:Boolean = false;
		public static var secondsReached30:Boolean = false;
		public static var secondsReached60:Boolean = false;
		public static var secondsReached120:Boolean = false;
		public static var theBestTime:Number=0;
		public static var yourCurrentBest:Number = 0;
		public static var highScoreAchieved:Boolean = false;
		public static var muteMusic:Boolean = false;

		[Embed(source = 'Sprites/blackSquare.png')] static public var player:Class;
		[Embed(source = 'Sprites/yellowSquare.png')] static public var ySquare:Class;
		[Embed(source = 'Sprites/redSquare.png')] static public var rSquare:Class;
		[Embed(source = 'Sprites/blueSquare.png')] static public var bSquare:Class;
		[Embed(source = 'Sprites/bits.png')] static public var bits:Class;
		
		[Embed(source = 'sounds/title.mp3')] static public var ching:Class;
		[Embed(source = 'sounds/squares2.mp3')] static public var speech:Class;
		[Embed(source = 'sounds/playerDead.mp3')] static public var playerDead:Class;
		[Embed(source = 'sounds/gameplaya.mp3')] static public var gameplay:Class;
		[Embed(source = 'sounds/gameplay1a.mp3')] static public var gameplay1:Class;
		[Embed(source = 'sounds/gameplay2a.mp3')] static public var gameplay2:Class;
		[Embed(source = 'sounds/gameplay3a.mp3')] static public var gameplay3:Class;
		[Embed(source = 'sounds/gameplay4a.mp3')] static public var gameplay4:Class;
		[Embed(source = 'sounds/highscore.mp3')] static public var highScore:Class;
		
		
		
		public function Registry()
		{
		}
		
		public static function init():void
		{
			blueSquares = new BlueSquareManager();
			redSquares = new RedSquareManager();
			yellowSquares = new YellowSquareManager();
		}
	}
}