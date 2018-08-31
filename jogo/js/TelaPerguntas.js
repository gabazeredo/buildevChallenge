class TelaPerguntas extends Phaser.Scene{

	constructor ()
    {
        super({key: 'TelaPerguntas'});
		var cursors;
		
	
    }
	
	preload ()
	{
		this.load.image('telaPerguntas', 'recursos/telaPerguntas.png');
		this.load.image('btnPer', 'recursos/btnPer.png');
	
	}
	
	create ()
	{
		
		this.add.image(512, 288, 'telaPerguntas');
		//this.add.image(100, 100 'btnPer');
		
		
		//this.btnPer = this.add.sprite(100, 100, 'btnPer').setInteractive();

		
		//this.btnPer.on('pointerdown', function (event) { verificaResp();});
		//this.btnPer.on('pointerout', function (event) { /* Do something when the mouse exits. */ });


	}
	
	update ()
	{
		

	}
	
	verificaResp{
		
		alert('Olá');
	
	}
}