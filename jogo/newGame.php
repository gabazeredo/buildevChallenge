<!doctype html> 
<?php include_once("js/buscarPerguntas.php");?>

<html lang="en"> 
<head> 
    <meta charset="UTF-8" />
    <title>BuilDev</title>
	
    <script src="js/phaser.min.js"></script>
	<script src="js/Fase.js"></script>
	<script src="js/GameOver.js"></script>	
	<script src="js/TelaPerguntas.js"></script>	
	
    <style type="text/css">
	
		body{
			margin:0;
		}
		
    </style>
</head>

<body>

<script type="text/javascript">


	var perguntas = <?php echo json_encode(buscaPerguntas("SELECT * FROM questoes ")); ?>;
	var respostas = <?php echo json_encode(buscaPerguntas("SELECT * FROM alternativas ")); ?>;
	
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
		
		scene:  [Fase, GameOver, TelaPerguntas]
    };

    var game = new Phaser.Game(config);
	game.scene.start(Fase);
	
	
	
</script>

</body>
</html>