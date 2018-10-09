<?php

	
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
<script src="js/TelaInstrucoesFase.js"></script>	
<script src="js/TelaParabens.js"></script>	
<script src="js/TelaPause.js"></script>	

<script>

function deslogar(){

	document.location.href="includes/deslogar.php";

}

</script>

<script type="text/javascript">

	var objTelPerguntas = new TelaPerguntas();
	var objTelPerguntas2 = new TelaPerguntas2();
	var objTelPerguntas3 = new TelaPerguntas3();
	var objFase = new Fase();
   
   
    var pc_status_1 = 0;
    var pc_status_2 = 0;
    var pc_status_3 = 0;
   
	n1 = (Math.floor(Math.random() * 8)+1);
	n2 = (Math.floor(Math.random() * 8)+1);
	n3 = (Math.floor(Math.random() * 8)+1);
	
	while(n1 == n2 || n3 == n2){
		n2 = (Math.floor(Math.random() * 8)+1);
	}
	
	while(n1 == n3 || n3 == n2){
		n3 = (Math.floor(Math.random() * 8)+1);
	}
	
	//alert('números'+n1+' '+n2+' '+n3+'.');
	
	var pTerminal = n1; 
	var sTerminal = n2; 
	var tTerminal = n3; 
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
		
		scene:  [TelaInicio, TelaPerguntas, objFase, objTelPerguntas, TelaPerguntas2, objTelPerguntas2, TelaPerguntas3, objTelPerguntas3, TelaInstrucoes, TelaParabens, GameOver, TelaInstrucoesFase, TelaPause]
    };

    var game = new Phaser.Game(config);
	game.scene.start(TelaInicio);
	
	
	
</script>

<style type="text/css">
	
		body{
			margin:0;
		}
		canvas{
			border: 5px solid black;
			margin: 0 auto;
			display: block;
		}
		
    </style>

</head>



<body class=" text-center">

<body class=" text-center">

<nav class="navbar navbar-expand-lg navbar-light bg-light" action="home.php">
  <a class="navbar-brand" href="home.php"><img src="imgs/minilogo.png"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
	<li class="nav-item active">
        <a class="nav-link" href="includes/perfil.php">Perfil <span class="sr-only">(current)</span></a>
      </li>
	  <li class="nav-item active">
        <a class="nav-link" href="includes/ranking.php">Ranking <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <button class="btn btn-danger" type="button" onclick="deslogar()">Sair</button>
    </form>
  </div>
</nav>






</body>




</body>


</html>