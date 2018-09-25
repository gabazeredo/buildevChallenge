class TelaPerguntas extends Phaser.Scene{

	

	constructor ()
    {
        super({key: 'TelaPerguntas'});
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
		
		
		this.btnPer0.on('pointerdown', () => this.verificar(0));
		this.btnPer1.on('pointerdown', () => this.verificar(1));
		this.btnPer2.on('pointerdown', () => this.verificar(2));
		this.btnPer3.on('pointerdown', () => this.verificar(3));
		
	
		
		this.buscaAlternativas();
		this.buscaPergunta();

	}
	
	buscaAlternativas() {

        var xmlhttp = new XMLHttpRequest();
		
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                
				objTelPerguntas.arrayAlternativas = JSON.parse(this.responseText);
				objTelPerguntas.alt = new Array();
				
					
					for(var i=0; i<objTelPerguntas.arrayAlternativas.length; i++){
					
						if((objTelPerguntas.arrayAlternativas[i].questoes_id)== pTerminal){
									
							objTelPerguntas.alt.push(objTelPerguntas.arrayAlternativas[i]);
														
						}
					
					}

				var texto0 = objTelPerguntas.add.text(90, 350, objTelPerguntas.alt[0].descricao, { fontSize: '24px', fill: '#000' });
				var texto1 = objTelPerguntas.add.text(590, 350, objTelPerguntas.alt[1].descricao, { fontSize: '24px', fill: '#000' });
				var texto2 = objTelPerguntas.add.text(90, 460, objTelPerguntas.alt[2].descricao, { fontSize: '24px', fill: '#000' });
				var texto3 = objTelPerguntas.add.text(590, 460, objTelPerguntas.alt[3].descricao, { fontSize: '24px', fill: '#000' });
				
			}
        };
        xmlhttp.open("GET", "js/buscarPerguntas.php?query=SELECT * FROM alternativas", true);
        xmlhttp.send();
	}
	
	
	
	buscaPergunta() {

        var xmlhttp = new XMLHttpRequest();
		
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
				objTelPerguntas.arrayPerguntas = JSON.parse(this.responseText);
				
				for(var i=0; i<objTelPerguntas.arrayPerguntas.length; i++){
					
						if((objTelPerguntas.arrayPerguntas[i].id)== pTerminal){
									
							var enunciado = objTelPerguntas.add.text(70, 70, objTelPerguntas.arrayPerguntas[i].enunciado, { fontSize: '32px', fill: '#000' });
							break;					
						}
					}
			}
        };
        xmlhttp.open("GET", "js/buscarPerguntas.php?query=SELECT * FROM questoes", true);
        xmlhttp.send();
	}
	
	verificar(id){
		
		if((objTelPerguntas.alt[id].status) == 1){
			
			alert("RESPOSTA CORRETA!");
			score += (15/this.timedEvent.getProgress());
			
			game.scene.switch('TelaPerguntas', 'Fase');
			ganharJogo += 1;
		}else{
			alert("RESPOSTA INCORRETA!");
			ganharJogo += 1;
			vida = vida - 1;
			game.scene.switch('TelaPerguntas', 'Fase');
			
		
		}
	}
	
	perdePergunta(){
		
		alert("TEMPO ESGOTADO!");
		game.scene.switch('TelaPerguntas', 'Fase');
	
	}
	
	
	
	update ()
	{
		this.tempo.setText('Tempo: ' + this.timedEvent.getProgress().toString().substr(0, 4));

	}
	
	
		
	
	
	
	
}