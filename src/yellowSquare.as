package
{
	import org.flixel.*;
		
	public class yellowSquare extends FlxSprite
	{
		public function yellowSquare()
		{
			super();
			loadGraphic(Registry.ySquare,false,false,16,16);
			exists = false;
		}
		
		public function launch():void
		{
			
			x = FlxG.width + 16;
			y = FlxU.floor((FlxG.random()*400)+16);
			if(this.y > 384)
			{
				this.y = 384;
			}
			velocity.x = Registry.yellowSquareVelocity;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (x < -16)
			{
				exists = false;
			}
		}
	}
}