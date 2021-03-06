class TelaInstrucoes extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaInstrucoes'});
		var cursors;
		var btnVoltarFase;
	
    }
	
	preload ()
	{
		this.load.image('instrucoesdoplayer', 'recursos/tutorial.png');
		this.load.image('btnVoltarFase', 'recursos/btnSair.png');
		this.load.image('btnMenu', 'recursos/btnVoltarMenu.png');
		
	}
	
	create ()
	{
		
		
		this.add.image(512, 288, 'instrucoesdoplayer');
		
		this.btnVoltarFase = this.add.sprite(880, 510, 'btnVoltarFase').setInteractive();
		this.btnMenu = this.add.sprite(670, 510, 'btnMenu').setInteractive();
		
		this.btnVoltarFase.on('pointerdown', () => this.voltar());
		this.btnMenu.on('pointerdown', () => this.resetarJogo());
		
		
	}
	
	voltar(){
	
	
		this.scene.resume('Fase');
		this.scene.stop();
		//game.scene.switch('TelaInstrucoes', 'Fase');
	
	}
	
	resetarJogo(){
	
		window.location.reload('home.php');
	
	}
	
	update ()
	{
		

	}
	

}