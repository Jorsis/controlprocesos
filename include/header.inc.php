<?
/**
 * Eate es el archivo de cabecera para los demas, en este se cargaran todas las librerias 
 * necesarias para que pueda correr el programa, ademas en este archivo se depositaran las 
 * funciones que se programen a lo largo de el desarrollo. 
 * En este archivo se cargara la conexion con la base de datos, y se cargaran las sesiones
 */

require_once('conexion.inc.php');
require_once('string.inc.php');
require_once('form.inc.php');
require_once('FormValidator.php');
require_once('Smarty/Smarty.class.php');
require_once 'Debug.php';
require_once 'Debug/Renderer/HTML_Table_Config.php';
session_start(); 
//para hacer debug sobre la base de datos se pone true
$db->debug = false;


$barcode = array('CODE' => 'code39',
                 'OUTPUT' => '1',  // 1 = png, 2 = jpg
                 'THICKNESS' => '50', //
                 'RESOLUTION' => '2', // resolucion
                 'FONT' => '2', //tamaño de la fuen1554te
                 'A1' => '', //Checksum
                 'A2' => '',
                 'ALT' => 'Error');
                 
$smarty = new Smarty;

$Dbg = new Debug();
$htmlOptions = Debug_Renderer_HTML_Table_Config::singleton()->getConfig();
print($htmlOptions['HTML_TABLE_stylesheet']); 


?>
<html>
<head>



<title>Control Proceso</title>





<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="Create a sentence that will make users want to click through to your site.  Keep your description concise and brief.  Many search engines only "read" the first 200 characters.  Include the most important facts or keywords at the beginning of the description.">
<meta name="keywords" content="Enter up to 7 keywords.  100 characters maximum, separated by commas or spaces.  Keywords should be listed in order of importance.  Adding too many can reduce the relevance of a site, so limit the keywords to the top 3 or 5 most important and don't use highly used terms such as computer, Internet, web, web site, etc.">




<STYLE TYPE="text/css">
<!--
	a {text-decoration: none;}
	a:hover{background-color:#FFFF00;}
-->
</STYLE>

<script type="text/javascript">

function pasarMayusculas(cadena) {

    var result="";

    var str = cadena.value.split('');

 

    for(i=0; i<=str.length-1; i++) {

        str[i] = str[i].toUpperCase();

        result+=str[i];

    }

    cadena.value = result;
    

}

</script>

</head>



<body bgcolor="#CCCCCC" text="#000000" link="#000066" vlink="#003366" alink="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="if(document.getElementById('t_orden_1')) document.getElementById('t_orden_1').focus(); else if (document.getElementById('t_proceso_1')) document.getElementById('t_proceso_1').focus();">
<table width="100%">
<tr><td>
<table width="100%" border="0" cellspacing="0" cellpadding="5" height="70" bgcolor="#006666">
  <tr> 
	<td align="center" valign="middle" width="236">
		<i>
			<b>
				<font face="Arial, Helvetica, sans-serif" color="#FFFFFF" size="5">
               
               
               <img src="imagenes/codigo2.png" width="50%" height="50%" >

					<!-- logo tambien va aca -->



				</font>
			</b>
		</i>
	</td>



	<td valign="middle" width="539" align="left"> 



      <!------Banner Here.  Works well for standard size 468x 60 Banner------->
     
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,42,0"
  id="Movie1" width="728" height="90">
  <param name="movie" value="Movie1.swf">
  <param name="bgcolor" value="#006666">
  <param name="quality" value="high">
  <param name="allowscriptaccess" value="samedomain">
  <embed type="application/x-shockwave-flash"
   pluginspage="http://www.macromedia.com/go/getflashplayer"
   width="728" height="90"
   name="Movie1" src="Movie1.swf"
   bgcolor="#006666" quality="high"
   swLiveConnect="true" allowScriptAccess="samedomain"
  ></embed>
</object>






    </td>


  </tr>


</table>


<table width="100%" border="0" cellspacing="0" cellpadding="5">

  <tr align="left" valign="top"> 

	<td width="110" bgcolor="#999999"> 

      <p>
		<b>
			<font face="Arial, Helvetica, sans-serif" size="2">
				<br>

				
        			<? include('menu.php') ?>

				
			</font>
		</b>

      </p>

    </td>
    <td bgcolor="" width="100%"> 

	<font face="Arial, Helvetica, sans-serif">
