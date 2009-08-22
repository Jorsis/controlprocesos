<?php
function conectar()
{
	pg_connect("host=localhost user=cdiazz password=cdiazz dbname=lineadigital");
	
}

function desconectar()
{
	pg_close();
}
?>