package
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//Variables go here
		private var player:Player;
		private var bg:FlxSprite;
		private var timer:Number=0;
		private var t:FlxTimer = new FlxTimer();
		private var timerSet:Boolean = false;
		private var timerTxt:FlxText;
		private var hudTimerTxt:FlxText;
		private var hudCurrentBest:FlxText;
		private var hudCurrentBestScore:FlxText;
		private var hudYourCurrentBest:FlxText;
		private var hudYourCurrentBestScore:FlxText;
		private var emit:FlxEmitter;
		private var GameOver:Boolean = false;
				
		override public function create():void
		{	
			Registry.init();
	
			bg = new FlxSprite;
			bg.makeGraphic(400,400);
			add(bg);
			
			player = new Player();
			player.x = 200;
			player.y = 200;
			add(player);

			add(Registry.blueSquares);
			add(Registry.redSquares);
			add(Registry.yellowSquares);
			
			Registry.blueSquareVelocity = Registry.blueSquareInitalVelocity;
			BlueSquareManager.releaseRate = 800;
			Registry.redSquareVelocity = Registry.redSquareInitalVelocity;
			RedSquareManager.releaseRate = 800;
			Registry.yellowSquareVelocity = Registry.yellowSquareInitalVelocity;
			YellowSquareManager.releaseRate = 800;
			
			hudTimerTxt = new FlxText(160,5,75,"Timer");
			hudTimerTxt.setFormat(null,18,0x000000);
			add(hudTimerTxt);
			
			timerTxt = new FlxText(100,25,200,"")
			timerTxt.setFormat(null,12,0x000000,"center");
			add(timerTxt);
			
			hudCurrentBest = new FlxText(305,5,100,"Overall");
			hudCurrentBest.setFormat(null,18,0x000000);
			add(hudCurrentBest);
			
			hudCurrentBestScore = new FlxText(325,25,100,""+Registry.theBestTime+" sec");
			hudCurrentBestScore.setFormat(null,12,0x000000);
			add(hudCurrentBestScore);
			
			hudYourCurrentBest = new FlxText(10,5,100,"Session");
			hudYourCurrentBest.setFormat(null,18,0x000000);
			add(hudYourCurrentBest);
			
			hudYourCurrentBestScore = new FlxText(40,25,100,""+Registry.yourCurrentBest+" sec");
			hudYourCurrentBestScore.setFormat(null,12,0x000000);
			add(hudYourCurrentBestScore);
			
			FlxG.playMusic(Registry.gameplay,1);
		}	
		
		override public function update():void
		{
			if(FlxG.keys.justPressed("M"))
			{
				Registry.muteMusic = true;
				FlxG.playMusic(Registry.gameplay,0);
			}
			
			FlxG.overlap(player,Registry.blueSquares,gameOver);
			FlxG.overlap(player,Registry.redSquares,gameOver);
			FlxG.overlap(player,Registry.yellowSquares,gameOver);
			
			if(!Registry.highScoreAchieved)
			{	
				if(FlxU.floor(timer) > Registry.theBestTime)
				{
					Registry.highScoreAchieved = true;
					FlxG.play(Registry.highScore,1);							
				}
			}
			
			if(GameOver)
			{
				delay(3);
				if(!timerSet)
				{
					if(!Registry.muteMusic)
					{
						FlxG.playMusic(Registry.gameplay,0);
						FlxG.playMusic(Registry.gameplay1,0);
						FlxG.playMusic(Registry.gameplay2,0);
						FlxG.playMusic(Registry.gameplay3,0);
						FlxG.playMusic(Registry.gameplay4,0);
					}
					Registry.secondsReached10 = false;
					Registry.secondsReached30 = false;
					Registry.secondsReached60 = false;
					Registry.secondsReached120 = false;
					Registry.highScoreAchieved = false;
					FlxG.switchState(new TitleState());
				}
			}
			
			super.update();
			
			if(player.x < 0)
			{
				player.x = 0;
			}
			if(player.x > 384)
			{
				player.x = 384;
			}
			if(player.y < 0)
			{
				player.y = 0;
			}
			if(player.y > 384)
			{
				player.y = 384;
			}
			
			displayTimer();
			
			switch(FlxU.floor(timer))
			{
				case 10:
				{
					raiseDifficulty();
					break;
				}
				
				case 30:
				{
					raiseDifficulty();
					break;
				}
				
				case 60:
				{
					raiseDifficulty();
					break;
				}
					
				case 120:
				{
					raiseDifficulty();
					break;
				}
			}
		}
		
		private function gameOver(p:FlxSprite, e:FlxSprite):void
		{
			if(FlxU.floor(timer) > SaveBestTime.bestTime)
			{
				SaveBestTime.bestTime = FlxU.floor(timer);
				Registry.theBestTime = SaveBestTime.bestTime;
				Registry.yourCurrentBest = SaveBestTime.bestTime;
			}
			else if(FlxU.floor(timer) > Registry.yourCurrentBest)
			{
				Registry.yourCurrentBest = FlxU.floor(timer);
			}
			p.kill();
			emit = new FlxEmitter(e.x,e.y);
			emit.makeParticles(Registry.bits,27,0,true);
			add(emit);
			emit.start(true,2);
			FlxG.play(Registry.playerDead,1);
			GameOver = true;
		}
		
		private function displayTimer():void
		{
			
			timer += FlxG.elapsed;
			timerTxt.text = ""+FlxU.floor(timer)+" sec";
		}
		
		private function delay(howlong:int):void
		{	
			if(!timerSet)
			{
				t.start(howlong);
			}
			timerSet = true;
			if(t.finished)
			{
				t.stop();
				timerSet = false;
			}			
		}
		
		private function raiseDifficulty():void
		{
			if(!Registry.secondsReached10 && FlxU.floor(timer) == 10)
			{
				Registry.secondsReached10 = true;
				BlueSquareManager.releaseRate = 600;
				RedSquareManager.releaseRate = 600;
				YellowSquareManager.releaseRate = 600;
				if(!Registry.muteMusic)
				{
					FlxG.music.fadeOut(1);
					FlxG.playMusic(Registry.gameplay1,1);
				}		
			}
			else if(!Registry.secondsReached30 && FlxU.floor(timer) == 30)
			{
				Registry.secondsReached30 = true;
				BlueSquareManager.releaseRate = 500;
				RedSquareManager.releaseRate = 500;
				YellowSquareManager.releaseRate = 500;
				if(!Registry.muteMusic)
				{
					FlxG.music.fadeOut(1);
					FlxG.playMusic(Registry.gameplay2,1);
				}	
			}
			else if(!Registry.secondsReached60 && FlxU.floor(timer) == 60)
			{
				Registry.secondsReached60 = true;
				BlueSquareManager.releaseRate = 400;
				RedSquareManager.releaseRate = 400;
				YellowSquareManager.releaseRate = 400;
				if(!Registry.muteMusic)
				{
					FlxG.music.fadeOut(1);
					FlxG.playMusic(Registry.gameplay3,1);
				}	
			}
			else if(!Registry.secondsReached120 && FlxU.floor(timer) == 120)
			{
				Registry.secondsReached120 = true;
				BlueSquareManager.releaseRate = 300;
				RedSquareManager.releaseRate = 300;
				YellowSquareManager.releaseRate = 300;
				if(!Registry.muteMusic)
				{
					FlxG.music.fadeOut(1);
					FlxG.playMusic(Registry.gameplay4,1);
				}	
			}
		}
	}
}
