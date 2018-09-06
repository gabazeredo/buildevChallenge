
class TelaPerguntas extends Phaser.Scene{

	

	constructor ()
    {
        super({key: 'TelaPerguntas'});
		var cursors;
		var enunciado;
		
	
    }
	
	preload ()
	{
		this.load.image('telaPerguntas', 'recursos/telaPerguntas.png');
		this.load.image('btnPer', 'recursos/btnPer.png');
		this.load.image('btnSair', 'recursos/btnSair.png');
	
	}
	
	create ()
	{
		
		
		
	
		
		
		
		
		
		this.add.image(512, 288, 'telaPerguntas');
		
		
		this.btnSair = this.add.sprite(50, 50, 'btnSair').setInteractive();
		this.btnPer = this.add.sprite(260, 370, 'btnPer').setInteractive();
		this.btnPer1 = this.add.sprite(760, 370, 'btnPer').setInteractive();
		this.btnPer2 = this.add.sprite(260, 480, 'btnPer').setInteractive();
		this.btnPer3 = this.add.sprite(760, 480, 'btnPer').setInteractive();
		
		this.btnPer.on('pointerdown', () => this.verificaResp());
		this.btnPer1.on('pointerdown', () => this.verificaResp());
		this.btnPer2.on('pointerdown', () => this.verificaResp());
		this.btnPer3.on('pointerdown', () => this.verificaResp());
		this.btnSair.on('pointerdown', () => this.sair());
		this.enunciado = this.add.text(512, 288, perguntas[0]['enunciado'], { fontSize: '72px', fill: '#000' });


	}
	
	
	update ()
	{
		

	}
	
	sair(){
		
		game.scene.switch('TelaPerguntas', 'Fase');
	
	}
	
	verificaResp(){
		
		alert('PARE DE ME APERTAR SEU CONTINUO!');
	
	}
	
}