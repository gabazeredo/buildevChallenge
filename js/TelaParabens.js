class TelaParabens extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaParabens'});
		var cursors;
		var scoreText;
		
	
    }
	
	preload ()
	{
		this.load.image('telaGanhou', 'recursos/telaGanhador.png');
		this.load.image('btnJogarNov', 'recursos/btnJogarNovamente.png');
		
		
	}
	
	create ()
	{
		
		
		this.add.image(512, 288, 'telaGanhou');
		
		
		this.btnJogarNov = this.add.sprite(512, 410, 'btnJogarNov').setInteractive();
		
		this.btnJogarNov.on('pointerdown', () => this.resetarJogo());
		
		this.scoreText = this.add.text(420, 325, 'Score final:'+score, { fontSize: '24px', fill: '#000' });
		
		
	}
	
	resetarJogo(){
	
		window.location.reload('newGame.php');
	
	}
	
	update ()
	{
		

	}
	

}