class GameOver extends Phaser.Scene{

	constructor ()
    {
        super({key: 'GameOver'});
		var cursors;
	
    }
	
	preload ()
	{
		this.load.image('gameOver', 'recursos/telaGameOver.png');
	
	}
	
	create ()
	{
		
		this.add.image(512, 288, 'gameOver');
		
		this.pontosFinais = this.add.text(512, 400, 'Pontos finais:', { fontSize: '32px', fill: '#000' });
		
	}
	
	update ()
	{
		

	}
	
}