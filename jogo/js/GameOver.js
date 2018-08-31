class GameOver extends Phaser.Scene{

	constructor ()
    {
        super({key: 'GameOver'});
		var cursors;
	
    }
	
	preload ()
	{
		this.load.image('gameOver', 'recursos/telaPerguntas.png');
	
	}
	
	create ()
	{
		
		this.add.image(512, 288, 'gameOver');
		
		const helloButton = this.add.text(100, 100, 'Hello Phaser!', { fill: '#0f0' });
		helloButton.setInteractive();
		
	}
	
	update ()
	{
		

	}
	
}