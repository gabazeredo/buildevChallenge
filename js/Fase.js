class Fase extends Phaser.Scene{
	constructor () {
        super({key: 'Fase'});
		var platforms;
		var player;
		var cursors;
		var computador1;
		var computador2;
		var computador3;
		var scoreText;
		var placa;
		var timedEvent;
		var tempo;
		
		
    }
	
	preload () 
	{
	
		this.load.image('ceu', 'recursos/ceu'+Phaser.Math.Between(0, 1)+'.png');
        this.load.image('chao', 'recursos/chao.png');
        this.load.image('predios', 'recursos/predios.png');
		this.load.image('arbusto', 'recursos/arbusto.png');
		this.load.image('placa', 'recursos/placaBtn.png');
		this.load.image('computador', 'predio/pc.png');
		this.load.image('computadorCorreto', 'predio/pcCorreto.png');
		
		
		
		
		this.load.image('fundo', 'predio/fundo_pAndar_'+(Math.floor(Math.random() * 5)+1)+'.png');
		this.load.image('fundo2', 'predio/fundo_sAndar_'+(Math.floor(Math.random() * 5)+1)+'.png');
		this.load.image('fundo3', 'predio/fundo_tAndar_'+(Math.floor(Math.random() * 5)+1)+'.png');	
		this.load.image('andar', 'predio/andar.png');
		this.load.image('heart', 'recursos/heart.png');
		this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });
		
    }


	create ()
    {
			
		this.timedEvent = this.time.delayedCall(30000, this.gameOver, [], this);
		
		
		this.add.image(512, 288, 'ceu');
		this.add.image(512, 288, 'predios');
		this.placa = this.add.sprite(120, 385, 'placa').setInteractive();
		this.add.image(512, 288, 'arbusto');
		
		this.platforms = this.physics.add.staticGroup();
		
		this.platforms.create(512, 544, 'chao');
		
		this.add.image(512, 450, 'fundo');
		this.add.image(512, 325, 'fundo2');
		this.add.image(512, 200, 'fundo3');
		
		this.platforms.create(512, 513, 'andar');
		this.platforms.create(512, 388, 'andar');
		this.platforms.create(512, 263, 'andar');
		this.platforms.create(512, 138, 'andar');
		
	
		//this.coracao1.create(45, 45, 'heart');
		//this.coracao2.create(90, 45, 'heart');
		//this.coracao3.create(135, 45, 'heart');
	

		this.tempo = this.add.text(50, 32);
		this.scoreText = this.add.text(850, 32);
	
		
		this.computador1 = this.physics.add.staticGroup();
		this.computador2 = this.physics.add.staticGroup();
		this.computador3 = this.physics.add.staticGroup();
		
		
		this.computador1.create(605, 475, 'computador');
		this.computador2.create(620, 350, 'computador');
		this.computador3.create(610, 225, 'computador');
	
		
		// Jogador
		
		this.player = this.physics.add.sprite(550, 480, 'dude');

        this.player.setBounce(0.2);
		this.player.setCollideWorldBounds(true);
		
		

        this.anims.create({
            key: 'left',
            frames: this.anims.generateFrameNumbers('dude', { start: 0, end: 3 }),
            frameRate: 10,
            repeat: -1
        });

        this.anims.create({
            key: 'turn',
            frames: [ { key: 'dude', frame: 4 } ],
            frameRate: 20
        });

        this.anims.create({
            key: 'right',
            frames: this.anims.generateFrameNumbers('dude', { start: 5, end: 8 }),
            frameRate: 10,
            repeat: -1
        });
		
		this.physics.add.collider(this.player, this.computador1, this.arrumar1);
		this.physics.add.collider(this.player, this.computador2, this.arrumar2);
		this.physics.add.collider(this.player, this.computador3, this.arrumar3);
		this.physics.add.collider(this.player, this.platforms);
		this.cursors = this.input.keyboard.createCursorKeys();
		
		this.placa.on('pointerdown', () => this.tutorial());

    }
	
	arrumar1(player, computador1 ){
	
		player.setPosition(550, 480);
		game.scene.switch('Fase', 'TelaPerguntas');
	
	}
	
	arrumar2(player, computador2){
		
		player.setPosition(580, 355);
		game.scene.switch('Fase', 'TelaPerguntas2');
	
	}
	
	arrumar3(player, computador3){
	
		player.setPosition(580, 230);
		game.scene.switch('Fase', 'TelaPerguntas3');
	
	}
		
	gameOver(){
		
		game.scene.switch('Fase', 'GameOver');
	
	}
	
	tutorial(){
	
		game.scene.switch('Fase', 'TelaInstrucoes');
	
	}
		
    update ()
    {
	
		if(ganharJogo == 3){
			if(vida <= 0){
				game.scene.switch('Fase', 'GameOver');
			}else{
				score *= (this.timedEvent.getProgress()*10)
				game.scene.switch('Fase', 'TelaParabens');
			}
		}
		
		
		
		this.tempo.setText('Tempo: ' + (this.timedEvent.getProgress()).toString().substr(0, 4));
		this.scoreText.setText('Score: '+ score)
		
	
		if (this.cursors.left.isDown)
			{
				this.player.setVelocityX(-160);

				this.player.anims.play('left', true);
			}
			else if (this.cursors.right.isDown)
			{
				this.player.setVelocityX(160);

				this.player.anims.play('right', true);
			}
			else
			{
				this.player.setVelocityX(0);

				this.player.anims.play('turn');
			}

			if (this.cursors.up.isDown && this.player.body.touching.down)
			{
				this.player.setVelocityY(-330);
			}
			
			
	
    }
}