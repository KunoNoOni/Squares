package
{
	import org.flixel.*;
		
	public class Player extends FlxSprite
	{
		public function Player()
		{
			super();
			loadGraphic(Registry.player,false,false,16,16);
		}
		
		override public function update():void
		{
			this.velocity.x = this.velocity.y = 0;
			
			super.update();
			if(FlxG.keys.LEFT)
			{
				this.velocity.x = -50;
			}
			if(FlxG.keys.RIGHT)
			{
				this.velocity.x = 50;
			}
			if(FlxG.keys.UP)
			{
				this.velocity.y = -50;
			}
			if(FlxG.keys.DOWN)
			{
				this.velocity.y = 50;
			}
		}
	}
}