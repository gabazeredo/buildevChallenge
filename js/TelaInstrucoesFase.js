class TelaInstrucoesFase extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaInstrucoesFase'});
		var cursors;
		var btnVoltarFase;
	
    }
	
	preload ()
	{
		this.load.image('instrucoesdoplayer', 'recursos/tutorial.png');
		this.load.image('btnVoltarFase', 'recursos/btnSair.png');
		this.load.image('btnMenu', 'recursos/btnSair.png');
		
	}
	
	create ()
	{
		
		
		this.add.image(512, 288, 'instrucoesdoplayer');
		
		this.btnMenu = this.add.sprite(750, 510, 'btnMenu').setInteractive();
		
		
		this.btnMenu.on('pointerdown', () => this.resetarJogo());
		
		
	}
	
	
	resetarJogo(){
	
		window.location.reload('home.php');
	
	}
	
	update ()
	{
		

	}
	

}