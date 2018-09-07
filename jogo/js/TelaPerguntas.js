
class TelaPerguntas extends Phaser.Scene{

	

	constructor ()
    {
        super({key: 'TelaPerguntas'});
		var cursors;
		var enunciado;
		this.nQuestao = 3; //Math.floor(Math.random() * 4);
		
		this.ver = new Array();
		
		this.alternativas = new Array();
				
		for(var i = 0; i < respostas.length ; i++){
		
			if(respostas[i]["questoes_id"] == (this.nQuestao+1)){
				
				this.alternativas.push(respostas[i]["descricao"]);
				this.ver.push(respostas[i]["status"]);
			}

		}
		
		var timedEvent;
		var tempo;
	
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
		this.timedEvent = this.time.delayedCall(10000, this.perdePergunta, [], this);
		this.tempo = this.add.text(512, 32);
		
		this.btnPer0 = this.add.sprite(260, 370, 'btnPer').setInteractive();
		this.btnPer1 = this.add.sprite(760, 370, 'btnPer').setInteractive();
		this.btnPer2 = this.add.sprite(260, 480, 'btnPer').setInteractive();
		this.btnPer3 = this.add.sprite(760, 480, 'btnPer').setInteractive();
		
		this.btnPer0.on('pointerdown', () => this.verificaResp(0));
		this.btnPer1.on('pointerdown', () => this.verificaResp(1));
		this.btnPer2.on('pointerdown', () => this.verificaResp(2));
		this.btnPer3.on('pointerdown', () => this.verificaResp(3));
		
		
		this.enunciado = this.add.text(70, 70, perguntas[3]['enunciado'], { fontSize: '32px', fill: '#000' });
		
		
		
		var texto0 = this.add.text(90, 350, this.alternativas[0], { fontSize: '24px', fill: '#000' });
		var texto1 = this.add.text(590, 350, this.alternativas[1], { fontSize: '24px', fill: '#000' });
		var texto2 = this.add.text(90, 460, this.alternativas[2], { fontSize: '24px', fill: '#000' });
		var texto3 = this.add.text(590, 460, this.alternativas[3], { fontSize: '24px', fill: '#000' });
		
		
	}
	
	
	update ()
	{
		
		this.tempo.setText('Tempo: ' + this.timedEvent.getProgress().toString().substr(0, 4));

	}
	
	perdePergunta(){
		
		alert("Perdeu");
	
	}
	
	verificaResp(id){
		
		if(this.ver[id] == 1)
			alert("certo")
		else	
			alert("errado")
		
	
	}
	
}