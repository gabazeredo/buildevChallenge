class TelaPause extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaPause'});
		var cursors;
		
	
    }
	
	preload ()
	{
		
		
		this.load.image('btnVoltarAoJogo', 'recursos/btnJogar.png');
		this.load.image('fundoPause', 'recursos/telaPause.png');
		this.load.image('btnSair', 'recursos/btnSair.png');
		
		
	}
	
	create ()
	{
		
		this.add.image(512, 288, 'fundoPause');
		
		this.btnVoltarAoJogo = this.add.sprite(512, 300, 'btnVoltarAoJogo').setInteractive();
		this.btnSair = this.add.sprite(512, 400, 'btnSair').setInteractive();
		
		
		this.btnVoltarAoJogo.on('pointerdown', () => this.jogo());
		this.btnSair.on('pointerdown', () => this.sair());

		
	}
	
	jogo(){
		
		this.scene.resume('Fase');
		this.scene.stop();
	
	}
	
	sair(){
	
		window.location.reload('home.php');
	
	}
	
	
	update ()
	{
		

	}
	

}