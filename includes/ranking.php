<?php

include_once("banco_de_dados.php");


$arr = select("SELECT * FROM jogadores");

echo "<table border='1'>";
echo "<tr>";
echo "<th>Usuários</th>";
echo "<th>Pontos</th>";
echo "</tr>";


foreach($arr as $key => $value){
	echo "<tr><td>".$value["nome_usuario"]."</td>";
	echo "<td>".$value["creditos"]."</td></tr>";
}

echo "</table>";

?>