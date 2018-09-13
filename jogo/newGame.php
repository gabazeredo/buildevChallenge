<!doctype html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8" />
    <title>BuilDev</title>
	
    <script src="js/phaser.min.js"></script>
	<script src="js/Fase.js"></script>
	<script src="js/GameOver.js"></script>	
	<script src="js/TelaPerguntas.js"></script>	
	<script src="js/TelaInicio.js"></script>	
	<script src="js/TelaInstrucoes.js"></script>	
	<script src="js/TelaParabens.js"></script>	
	
    <style type="text/css">
	
		body{
			margin:0;
		}
		canvas{
			margin: 0 auto;
			display: block;
		}
		
    </style>
</head>

<body>

<script type="text/javascript">

	var objTelPerguntas = new TelaPerguntas();
    var config = {
        type: Phaser.AUTO,
        width: 1024,
        height: 576,
        
		physics: {
        default: 'arcade',
        arcade: {
            gravity: { y: 300 },
            debug: false
        }
    },
		
		scene:  [TelaInicio, Fase, objTelPerguntas, TelaInstrucoes, TelaParabens, GameOver]
    };

    var game = new Phaser.Game(config);
	game.scene.start(TelaInicio);
	
	
	
</script>

</body>
</html>