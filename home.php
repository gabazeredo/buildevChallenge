<?php

	session_start();
	
	include_once("includes/validacaosessao.php");
	
?>
<!doctype html> 
<html lang="en">

<head>

<meta charset="UTF-8" />
<meta name="description" content="jogo online "/>
<meta name="author" content="Gabriel's production"/>
<link rel="icon" href="imgs/iconeGame.ico">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>

<title>Buildev</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>
<script src="js/phaser.min.js"></script>
<script src="js/Fase.js"></script>
<script src="js/GameOver.js"></script>	
<script src="js/TelaPerguntas.js"></script>	
<script src="js/TelaPerguntas2.js"></script>	
<script src="js/TelaPerguntas3.js"></script>	
<script src="js/TelaInicio.js"></script>	
<script src="js/TelaInstrucoes.js"></script>	
<script src="js/TelaParabens.js"></script>	

<script>

function deslogar(){

document.location.href="includes/deslogar.php";

}

</script>

<script type="text/javascript">

	var objTelPerguntas = new TelaPerguntas();
   
	var pTerminal = 1 //(Math.floor(Math.random() * 10)+1);
	var sTerminal = 1 //(Math.floor(Math.random() * 10)+1);
	var tTerminal = 1 //(Math.floor(Math.random() * 10)+1);
	var verComp1 = 0;
	var score = 0;
	var ganharJogo = 0;
	var vida = 3;
   
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
		
		scene:  [TelaInicio, Fase, TelaPerguntas, objTelPerguntas, TelaInstrucoes, TelaParabens, GameOver]
    };

    var game = new Phaser.Game(config);
	game.scene.start(TelaInicio);
	
	
	
</script>

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



<body class=" text-center">

<nav class="navbar navbar-expand-lg navbar-light bg-light" action="home.php">
  <a class="navbar-brand" href="#">Buildev</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <button class="btn btn-danger" type="button" onclick="deslogar()">Sair</button>
    </form>
  </div>
</nav>






</body>

</html>