<?php
include 'conexion.php';
conectar();

$consulta=pg_query("SELECT * FROM cliente");
desconectar();

// Capturo los valores de la DB para mostrarlos apenas se carga la pagina

?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<!-- 



Este contenido es de libre uso y modificación bajo la siguiente licencia: http://creativecommons.org/licenses/by-nc-sa/2.5/deed.es

Sobre el reconocimiento:
Todos los códigos han sido realizados con la idea de que sirvan para colaborar con el aprendizage de aquellos que se están introduciendo
en estas tecnologías y no con el objetivo de que sean utilizados directamente en sitios web. No obstante si utilizas algún código en tu sitio 
(ya sea sin modificar o modificado), o si ofreces los fuentes para descargar o si bien decides publicar alguno de los artículos debes cumplir con:
-Colocar un link a http://www.formatoweb.com.ar/ajax/ visible por tus usuarios como forma de mención a la fuente original del contenido.
-Enviar un correo a edanps@gmail.com informando la URL donde el contenido se ha publicado o se va a publicar en un futuro.
-Si publicas los fuentes para descargar este texto no debe ser eliminado ni alterado.

Más ejemplos y material sobre AJAX en: http://www.formatoweb.com.ar/ajax/
Cualquier sugerencia, crítica o comentario son bienvenidos.
Contacto: edanps@gmail.com



-->


<script type="text/javascript" src="ingreso_sin_recargar.js"></script>

			
			<div id="demo" style="width:500px;">
			
			    <table border=1>
			    
			    <tr>
			      <td>cedula</td>
			      <td>Nombre</td>
			      <td>Usuario</td>
			      <td>Password</td>
			      <td>telefono</td>
			      <td>direccion</td>
			      <td>Estado</td>
			    </tr>
			<?
			   while($dato = pg_fetch_array($consulta))
			   {
			?>
			  
			  <tr><td>
				<div id="demoArr<?= $dato[0]?>a" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[0];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>b" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[5];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>c" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[1];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>d" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')">*****</div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>e" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[7];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>f" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[6];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $dato[0]?>g" style="border:1px dashed; width:200px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $dato[0]?>')"><?=$dato[8];?></div>
			  </td>
			  </tr>
			  
				<div class="mensaje" id="error"></div>
				
			<?
			   }
			?>
				</table>
			</div>
			
</body>
</html>