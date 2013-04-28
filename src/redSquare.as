package
{
	import org.flixel.*;
		
	public class redSquare extends FlxSprite
	{
		public function redSquare()
		{
			super();
			loadGraphic(Registry.rSquare,false,false,16,16);
			exists = false;
		}
		
		public function launch():void
		{
			x = FlxU.floor((FlxG.random()*400)+16);
			y = -16
			if(this.x > 384)
			{
				this.x = 384;
			}
			velocity.y = Registry.redSquareVelocity;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (y > FlxG.width+16)
			{
				exists = false;
			}
		}
	}
}