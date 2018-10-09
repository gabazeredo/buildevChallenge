<?php
	
	include_once("validacao_sessao_adm.php");
	
?>
<!doctype html> 
<html lang="en">

<head>

<meta charset="UTF-8" />
<meta name="description" content="jogo online "/>
<meta name="author" content="Rodrigo's production"/>
<link rel="icon" href="imgs/iconeGame.ico">

<link rel="stylesheet" type="text/css" href="../css/bootstrap/bootstrap.css"/>

<title>Buildev</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="../js/bootstrap/bootstrap.js"></script>


<script>

function deslogar(){

document.location.href="deslogar.php";

}

</script>

</head>



<body class=" text-center">

<nav class="navbar navbar-expand-lg navbar-light bg-light" action="home.php">
  <a class="navbar-brand" href="home.php"><img src="../imgs/minilogo.png"></a>
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