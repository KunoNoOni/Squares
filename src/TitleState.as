package
{
	import org.flixel.*;
		
	public class TitleState extends FlxState
	{
		private var bg:FlxSprite = new FlxSprite();
		private var logo:FlxText;
		private var logo2:FlxText;
		private var logo3:FlxText;
		private var logo4:FlxText;
		private var playedSound:Boolean = false;
		
		
		public function TitleState()
		{
			super();
		}
		
		override public function create():void
		{
			
			FlxG.playMusic(Registry.gameplay,0);
			FlxG.playMusic(Registry.gameplay1,0);
			FlxG.playMusic(Registry.gameplay2,0);
			FlxG.playMusic(Registry.gameplay3,0);
			FlxG.playMusic(Registry.gameplay4,0);
			Registry.secondsReached10 = false;
			Registry.secondsReached30 = false;
			Registry.secondsReached60 = false;
			Registry.secondsReached120 = false;
			Registry.muteMusic = false;
			
			bg.makeGraphic(400,400);
			add(bg);
			
			logo = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-150, 200, "Squares");
			logo.setFormat(null,40,0x000000, "center");
			
			logo2 = new FlxText(FlxG.width*0.5-100,FlxG.height*0.5-253, 200, "Squares");
			logo2.setFormat(null,40,0xFF0000, "center");

			logo3 = new FlxText(FlxG.width*0.5-403,FlxG.height*0.5-147, 200, "Squares");
			logo3.setFormat(null,40,0x0000FF, "center");
			
			logo4 = new FlxText(FlxG.width*0.5+197,FlxG.height*0.5-147, 200, "Squares");
			logo4.setFormat(null,40,0xFFFF00, "center");
			
			add(logo2);
			add(logo3);
			add(logo4);
			
			
			var ld:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-200, 300, "A Ludum Dare #26 Game");
			ld.setFormat(null,15,0x000000, "center");
			add(ld);
			
			var ld2:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-175, 300, "Theme: Minimalism");
			ld2.setFormat(null,15,0x000000, "center");
			add(ld2);

			var instruct:FlxText = new FlxText(FlxG.width*0.5-150,FlxG.height-30, 300, "PRESS [x] TO CONTINUE");
			instruct.setFormat(null,15,0x000000, "center");
			add(instruct);
		}
		
		override public function update():void
		{
			//move Red Words
			if(FlxU.floor(logo2.y) < 47)
			{
				logo2.velocity.y = 50;
			}
			else
			{
				logo2.velocity.y = 0;
			}
			
			//move Blue Words
			if(FlxU.floor(logo3.x) < 97)
			{
				logo3.velocity.x = 150;
			}
			else
			{
				logo3.velocity.x = 0;
			}
			
			//move Yellow Words
			if(FlxU.floor(logo4.x) > 103)
			{
				logo4.velocity.x = -150;
			}
			else
			{
				logo4.velocity.x = 0;
				add(logo);
				if(!playedSound)
				{
					playedSound = true;
					FlxG.play(Registry.ching,.8);
					FlxG.play(Registry.speech,1);
				}
			}
			
			if(FlxG.keys.X)
				FlxG.switchState(new MenuState());		
			super.update();
		}
	}
}