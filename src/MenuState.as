package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
		
	public class MenuState extends FlxState
	{
		private var bg:FlxSprite = new FlxSprite();
		private var p:FlxSprite = new FlxSprite();
		private var b:FlxSprite = new FlxSprite();
		private var r:FlxSprite = new FlxSprite();
		private var y:FlxSprite = new FlxSprite();

		public function MenuState()
		{
			super();
		}
		
		override public function create():void
		{
			bg.makeGraphic(400,400);
			add(bg);

			p.makeGraphic(16,16);
			p.x = 145;
			p.y = 155;
			p.color = 0x000000;
			add(p);			

			r.makeGraphic(16,16);
			r.x = 190;
			r.y = 155;
			r.color = 0xFF0000;
			add(r);
			
			b.makeGraphic(16,16);
			b.x = 210;
			b.y = 155;
			b.color = 0x0000FF;
			add(b);

			y.makeGraphic(16,16);
			y.x = 230;
			y.y = 155;
			y.color = 0xFFFF00;
			add(y);
			
			var pl:FlxText = new FlxText(FlxG.width*0.5-198,FlxG.height*0.5-30, 300, "You");
			pl.setFormat(null,8,0x000000, "center");
			add(pl);
			
			var sq:FlxText = new FlxText(FlxG.width*0.5-135,FlxG.height*0.5-30, 300, "Colored Squares");
			sq.setFormat(null,8,0x000000, "center");
			add(sq);
			
			var logo:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height*0.5-170, 300, "Using the Arrow Keys, see how long you can avoid the colored squares.");
			logo.setFormat(null,20,0x000000, "center");
			add(logo);
						
			var bestTime:FlxText = new FlxText(FlxG.width*0.5-90,FlxG.height-120, 175, "Best Time is: "+Registry.theBestTime+" seconds");
			bestTime.setFormat(null,20,0x000000, "center");
			add(bestTime);
			
			var instruct2:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-205, 300, "To mute the music press [m] in game.");
			instruct2.setFormat(null,20,0x000000, "center");
			add(instruct2);
						
			var instruct:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-30, 300, "PRESS [x] TO PLAY");
			instruct.setFormat(null,15,0x000000, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			if(FlxG.keys.X)
				FlxG.switchState(new PlayState());
			super.update();
		}
	}
}