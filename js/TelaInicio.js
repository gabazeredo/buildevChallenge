class TelaInicio extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaInicio'});
		var cursors;
		
	
    }
	
	preload ()
	{
		this.load.image('telaPrincipal', 'recursos/telaInicio.png');
		this.load.image('btnIniciar', 'recursos/btnJogar.png');
		this.load.image('btnInstrucoes', 'recursos/btnInstrucoes.png');
		
	}
	
	create ()
	{
		
		
		this.add.image(512, 288, 'telaPrincipal');
		
		this.btnIniciar = this.add.sprite(520, 280, 'btnIniciar').setInteractive();
		this.btnInstrucoes = this.add.sprite(520, 370, 'btnInstrucoes').setInteractive();
		
		
		this.btnIniciar.on('pointerdown', () => this.iniciar());
		this.btnInstrucoes.on('pointerdown', () => this.tutorial());
		
	}
	
	iniciar(){
		
		game.scene.switch('TelaInicio', 'Fase');
	
	}
	
	tutorial(){
	
		game.scene.switch('TelaInicio', 'TelaInstrucoes');
	
	}
	
	update ()
	{
		

	}
	

}