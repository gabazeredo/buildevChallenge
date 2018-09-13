<!doctype html> 
<?php include_once("js/buscarPerguntas.php");

	
	
	 buscaPerguntas("SELECT * FROM questoes ");
?>

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

	
	
	
	<?php  

	$arrayDoido = (json_encode(buscaPerguntas("SELECT * FROM questoes "))); ?>;

	
	
</script>

</body>
</html>