package
{
	import org.flixel.*;
		
	public class blueSquare extends FlxSprite
	{
		public function blueSquare()
		{
			super();
			loadGraphic(Registry.bSquare,false,false,16,16);
			exists = false;
		}

		public function launch():void
		{
			x = -16;
			y = FlxU.floor((FlxG.random()*400)+16);
			if(this.y > 384)
			{
				this.y = 384;
			}
			velocity.x = Registry.blueSquareVelocity;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();

			if (x > FlxG.width+16)
			{
				exists = false;
			}
		}
	}
}