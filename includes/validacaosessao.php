<?php

if(($_SESSION['id_session']!=session_id()) || empty($_SESSION['usuario'])){
  unset($_SESSION);
  session_destroy();
  header("location:../cad.php");
	
}

?>