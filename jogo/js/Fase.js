class Fase extends Phaser.Scene{
	constructor () {
        super({key: 'Fase'});
		var platforms;
		var player;
		var cursors;
		var timedEvent;
		
		

    }
	
	preload () 
	{
	
		this.load.image('ceu', 'recursos/ceu.png');
        this.load.image('chao', 'recursos/chao.png');
        this.load.image('predios', 'recursos/predios.png');
		this.load.image('arbusto', 'recursos/arbusto.png');
		this.load.image('placa', 'recursos/placa.png');
		this.load.image('computador', 'predio/pc.png');
		this.load.image('fundo', 'predio/fundo_andar_01.png');
		this.load.image('fundo2', 'predio/fundo_andar_2.png');
		this.load.image('fundo3', 'predio/fundo_andar_3.png');
		this.load.spritesheet('dude', 'assets/dude.png', { frameWidth: 32, frameHeight: 48 });	
		this.load.image('andar', 'predio/andar.png');

    }

		
	timerFase(){
	
		alert('Ola');
		
	
	}

	create ()
    {
		this.add.image(512, 288, 'ceu');
		this.add.image(512, 288, 'predios');
		this.add.image(512, 335, 'placa');
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
		
		
		
		/*
		this.timedEvent = this.time.addEvent({
			delay:5000,
			callback: this.timerFase,
			callbackScope:this
			
		});
		*/
		
		this.computador = this.physics.add.staticGroup();
		
		this.computador.create(430, 475, 'computador');

		// Jogador
		
		this.player = this.physics.add.sprite(250, 480, 'dude');

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
		
		this.physics.add.collider(this.player, this.computador, this.arrumar);
		this.physics.add.collider(this.player, this.platforms);
		this.cursors = this.input.keyboard.createCursorKeys();
    }
	
	arrumar(){
		
	
			game.scene.switch('Fase', 'GameOver');
		
		
	}
	
	
	
		
    update ()
    {
	
		
		
	
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