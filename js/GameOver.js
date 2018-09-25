class GameOver extends Phaser.Scene{

	constructor ()
    {
        super({key: 'GameOver'});
		var cursors;
		
	
    }
	
	preload ()
	{
		this.load.image('gameOver', 'recursos/telaGameover.png');
		this.load.image('btnJogarNov', 'recursos/btnJogarNovamente.png');
				
	}
	
	create ()
	{
		
		
		this.add.image(512, 288, 'gameOver');
		
		this.btnJogarNov = this.add.sprite(512, 280, 'btnJogarNov').setInteractive();
		
		this.btnJogarNov.on('pointerdown', () => this.resetarJogo());
		
		
		
	}
	
	resetarJogo(){
	
		window.location.reload('home.php');
	
	}

	update ()
	{
		

	}
	
	
}