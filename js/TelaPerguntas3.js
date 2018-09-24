
class TelaPerguntas3 extends Phaser.Scene{

	

	constructor ()
    {
        super({key: 'TelaPerguntas3'});
		var cursors;
		var timedEvent;
		var tempo;
		var tex;
		this.arrayPerguntas = new Array();
		this.arrayAlternativas = new Array();
    }
	
	preload ()
	{
		this.load.image('telaPerguntas', 'recursos/telaPerguntas.png');
		this.load.image('btnPer', 'recursos/btnPer.png');
		
	
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
		
		
		this.btnPer0.on('pointerdown', () => this.volta(0));
		this.btnPer1.on('pointerdown', () => this.volta(1));
		this.btnPer2.on('pointerdown', () => this.volta(2));
		this.btnPer3.on('pointerdown', () => this.volta(3));
		
		var tex= this.add.text(70, 70, '3', { fontSize: '24px', fill: '#000' });
		
		this.buscaAlternativas();
		this.buscaPergunta();

	}
	
	buscaAlternativas() {

        var xmlhttp = new XMLHttpRequest();
		
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                
				objTelPerguntas3.arrayAlternativas = JSON.parse(this.responseText);
				objTelPerguntas3.alt = new Array();
				
				
					for(var i=0; i<objTelPerguntas3.arrayAlternativas.length; i++){
					
						if((objTelPerguntas3.arrayAlternativas[i].questoes_id)== tTerminal){
									
							objTelPerguntas3.alt.push(objTelPerguntas3.arrayAlternativas[i]);
														
						}
					
					}

				var texto0 = objTelPerguntas3.add.text(90, 350, objTelPerguntas3.alt[0].descricao, { fontSize: '24px', fill: '#000' });
				var texto1 = objTelPerguntas3.add.text(590, 350, objTelPerguntas3.alt[1].descricao, { fontSize: '24px', fill: '#000' });
				var texto2 = objTelPerguntas3.add.text(90, 460, objTelPerguntas3.alt[2].descricao, { fontSize: '24px', fill: '#000' });
				var texto3 = objTelPerguntas3.add.text(590, 460, objTelPerguntas3.alt[3].descricao, { fontSize: '24px', fill: '#000' });
				
			}
        };
        xmlhttp.open("GET", "js/buscarPerguntas.php?query=SELECT * FROM alternativas", true);
        xmlhttp.send();
	}
	
	
	
	buscaPergunta() {

        var xmlhttp = new XMLHttpRequest();
		
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
				objTelPerguntas3.arrayPerguntas = JSON.parse(this.responseText);
				
				for(var i=0; i<objTelPerguntas3.arrayPerguntas.length; i++){
					
						if((objTelPerguntas3.arrayPerguntas[i].id)== pTerminal){
									
							var enunciado = objTelPerguntas3.add.text(70, 70, objTelPerguntas3.arrayPerguntas[i].enunciado, { fontSize: '32px', fill: '#000' });
							break;					
						}
					}
			}
        };
        xmlhttp.open("GET", "js/buscarPerguntas.php?query=SELECT * FROM questoes", true);
        xmlhttp.send();
	}
	/*
	verificaResp(id){
		
		if((objTelPerguntas3.alt[id].status) == 1){
			
			alert("CErto");
			score += (15*this.timedEvent.getProgress());
			debugger;
			game.scene.switch('TelaPerguntas3', 'Fase');
		}else{
			
			vida = vida - 1;
			game.scene.switch('TelaPerguntas3', 'Fase');
		}
	
	}
	*/
	volta(){
		
		ganharJogo += 1;
		game.scene.switch('TelaPerguntas3', 'Fase');
		
	
	}
	
	
	update ()
	{
		this.tempo.setText('Tempo: ' + this.timedEvent.getProgress().toString().substr(0, 4));

	}
	
	
		
	
	
	
	
}