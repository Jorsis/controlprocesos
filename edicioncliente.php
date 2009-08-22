<?php
require_once('include/header.inc.php');
require_once('formularios.php');

$consulta=$db->Execute("SELECT * FROM cliente order by nombre_cliente");


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


<script type="text/javascript">
function nuevoAjax()
{ 
	/* Crea el objeto AJAX. Esta funcion es generica para cualquier utilidad de este tipo, por
	lo que se puede copiar tal como esta aqui */
	var xmlhttp=false; 
	try 
	{ 
		// Creacion del objeto AJAX para navegadores no IE
		xmlhttp=new ActiveXObject("Msxml2.XMLHTTP"); 
	}
	catch(e)
	{ 
		try
		{ 
			// Creacion del objeto AJAX para IE 
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP"); 
		} 
		catch(E) { xmlhttp=false; }
	}
	if (!xmlhttp && typeof XMLHttpRequest!='undefined') { xmlhttp=new XMLHttpRequest(); } 

	return xmlhttp; 
} 

function eliminaEspacios(cadena)
{
	// Funcion equivalente a trim en PHP
	var x=0, y=cadena.length-1;
	while(cadena.charAt(x)==" ") x++;	
	while(cadena.charAt(y)==" ") y--;	
	return cadena.substr(x, y-x+1);
}

function cargaDatos(idDiv, idInput, name)
{
	var valorInput=document.getElementById(idInput).value;
	var divError=document.getElementById("error");
	
	// Elimino todos los espacios en blanco al principio y al final de la cadena
	valorInput=eliminaEspacios(valorInput);
	
	// Valido con una expresion regular el contenido de lo que el usuario ingresa
	var reg=/(^[a-zA-Z0-9._áéíóúñ¡!¿? -*]{1,50}$)/;
	if(!reg.test(valorInput)) 
	{ 
		// Si hay error muestro el div que contiene el error
		divError.innerHTML="El texto ingresado no es v&aacute;lido"
		divError.style.display="block";
	}
	else
	{
		// Si no hay error oculto el div (por si se mostraba)
		//divResultado = document.getElementById('resultado');
		divError.style.display="none";
		mostrandoInput=false;
		document.getElementById(idDiv).innerHTML=valorInput;
		
		// Creo objeto AJAX y envio peticion al servidor
		var ajax=nuevoAjax();
		//salert("guardarcambios.php?dato="+valorInput+"&codigo="+idInput+"&name="+name+"&user=cliente");
		ajax.open("GET", "guardarcambios.php?dato="+valorInput+"&codigo="+idInput+"&name="+name+"&user=cliente", true);
		ajax.send(null);
		
		/*ajax.onreadystatechange=function(){
			if (ajax.readyState==4){
				divResultado.innerHTML = ajax.responseText
			}
		}*/
	}
}

var mostrandoInput=false;

function creaInput(idDiv, idInput, name)
{
	/* Funcion encargada de cambiar el texto comun de la fila por un campo input que conserve
	el valor que tenia ese campo */
	var divError=document.getElementById("error");
	/* Solo mostramos el input si ya no esta siendo mostrado y si ademas el div del error no esta en pantalla */
	if(!mostrandoInput && divError.style.display!="block")
	{
		// Obtenemos el div contenedor del futuro input
		var divContenedor=document.getElementById(idDiv);
		// Creamos el input
		divContenedor.innerHTML="<input type='text' onBlur='cargaDatos(\""+idDiv+"\", \""+idInput+"\", \""+name+"\")' value='"+divContenedor.innerHTML+"' id='"+idInput+"' maxlength='50' onkeyup=\"pasarMayusculas(this)\">";
		// Colocamos el cursor en el input creado
		document.getElementById(idInput).focus();
		// Establecemos a true la variable para especificar que hay un input en pantalla y no se debe crear otro hasta que este se oculte
		mostrandoInput=true;
	}
}

function creaselect(idDiv, idInput, name)
{
	var divError=document.getElementById("error");
	var select;
	
	if(!mostrandoInput && divError.style.display!="block")
	{
		var divContenedor=document.getElementById(idDiv);
		select = "<select id='"+idInput+"' onBlur='cargaDatos(\""+idDiv+"\", \""+idInput+"\", \""+name+"\")'>";
		
		if (divContenedor.innerHTML == 't')
		{
			select = select + "<option value='t' selected>activo</option><option value='f' >inactivo</option>";
		}
		else if (divContenedor.innerHTML == 'f')
		{
			select = select + "<option value='t' >activo</option><option value='f' selected>inactivo</option>";
		}
		
		divContenedor.innerHTML = select + "</select>";
		
		
		
		document.getElementById(idInput).focus();
		// Establecemos a true la variable para especificar que hay un input en pantalla y no se debe crear otro hasta que este se oculte
		mostrandoInput=true;
	}
	
}
</script>

			
			<div id="demo" style="width:500px;">
			
			    <table border=1>
			    
			    <tr>
			      <td align="center"><h3>Nit o Cedula</h3></td>
			      <td align="center"><h3>Nombre</h3></td>
			      <td align="center"><h3>Usuario</h3></td>
			      <td align="center"><h3>Contraseña</h3></td>
			      <td align="center"><h3>Telefono</h3></td>
			      <td align="center"><h3>Direccion</h3></td>
			      <td align="center"><h3>Estado</h3></td>
			    </tr>
			<?
			   while(!$consulta->EOF)
			   {
			?>
			  
			  <tr><td>
				<div id="demoArr<?= $consulta->fields[0]?>a" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','id_usuario')"><?=$consulta->fields['id_usuario'];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>b" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','nombre_cliente')"><?=$consulta->fields['nombre_cliente'];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>c" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','nombre_usuario')"><?=$consulta->fields['nombre_usuario'];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>d" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','password')">*****</div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>e" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','telefono')"><?=$consulta->fields['telefono'];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>f" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaInput(this.id, '<?= $consulta->fields[0]?>','direccion')"><?=$consulta->fields['direccion'];?></div>
			  </td>
			  <td>
				<div id="demoArr<?= $consulta->fields[0]?>g" style="border:1px dashed; width:150px; background-color:#EAEAEA; text-align:center;" onclick="creaselect(this.id, '<?= $consulta->fields[0]?>','activo')"><?=$consulta->fields['activo'];?></div>
			  </td>
			  </tr>
			  
				<div class="mensaje" id="error"></div>
				
			<?
			$consulta->MoveNext();
			   }
			?>
				</table>
			</div>
			<div id="resultado" ></div>
</body>
</html>