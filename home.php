<?php

	
	include("includes/validacaosessao.php");
	
?>

<html>

<head>

<meta name="description" content="jogo online "/>
<meta name="author" content="Rodrigo's production"/>
<link rel="icon" href="imgs/iconGame.ico">

<link rel="stylesheet" type="text/css" href="css/bootstrap/bootstrap.css"/>

<title>Home</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script type="text/javascript" src="js/bootstrap/bootstrap.js"></script>

<script>

function deslogar(){

document.location.href="includes/deslogar.php";

}

</script>

</head>



<body class=" text-center">

<nav class="navbar navbar-expand-lg navbar-light bg-light" action="home.php">
  <a class="navbar-brand" href="#">Buildev</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Perfil <span class="sr-only">(current)</span></a>
      </li>
	  <li class="nav-item active">
        <a class="nav-link" href="#">Ranking <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
	  <button type="button" class="btn btn-danger" onclick="deslogar()">Sair</button>
    </form>
  </div>
</nav>

</body>

</html>