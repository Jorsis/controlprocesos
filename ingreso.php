<?
require_once('include/conexion.inc.php');
require_once('include/string.inc.php');
require_once('include/form.inc.php');
require_once('include/FormValidator.php');
error_reporting(0);
;


?>
<html>
<head>



<title>Control de Procesos</title>





<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="description" content="Create a sentence that will make users want to click through to your site.  Keep your description concise and brief.  Many search engines only "read" the first 200 characters.  Include the most important facts or keywords at the beginning of the description.">
<meta name="keywords" content="Enter up to 7 keywords.  100 characters maximum, separated by commas or spaces.  Keywords should be listed in order of importance.  Adding too many can reduce the relevance of a site, so limit the keywords to the top 3 or 5 most important and don't use highly used terms such as computer, Internet, web, web site, etc.">




<STYLE TYPE="text/css">
<!--
	a {text-decoration: none;}
	a:hover{background-color:#FFFF00;}
-->
</STYLE>



</head>

<body bgcolor="#CCCCCC" text="#000000" link="#000066" vlink="#003366" alink="#CCCCCC" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
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

	<td width="110" bgcolor="#ECECEC"> 

      <p>
		<b>
			<font face="Arial, Helvetica, sans-serif" size="2">
				<br>

				
        		

				
			</font>
		</b>

      </p>

    </td>
    <td bgcolor="#FFFFFF" width="455"> 

	<font face="Arial, Helvetica, sans-serif">


<?

session_start();
session_destroy();

if ($_POST['enviar'])
{
	$fv = new FormValidator($_POST);
	$fv->doValidation();
	
	
	if($fv->isError()) {

		//
		// if error show the error box
		//

		$imprimir .= ($fv->getErrorBox());
	}
	else 
	{
		$sql = "select * from usuario where nombre_usuario = '".$_REQUEST['t_nombre_usuario_1']."' and password = '".md5($_REQUEST['t_password_1'])."'";
		
		if (($recordset = $db->Execute($sql)) === false){
			$imprimir .= "Error el usuario no existe :". $db->ErrorMsg()."<br>";
		}
		elseif($recordset->_numOfRows == 0)
		 {
		 	$imprimir .= "Error el usuario no existe ". $db->ErrorMsg()."<br>";
		 }
		 elseif ($recordset->_numOfRows == 1)
		 {
		 	session_start();
		 	session_name('usuariosession');
		 	$_SESSION['nombre_user'] = $recordset->fields['nombre_usuario'];
		 	$_SESSION['id_user'] = $recordset->fields['id_usuario'];
		 	$_SESSION['type_user'] = $recordset->fields['tipo'];
		 	$_SESSION['valid_user'] = $recordset->fields['activo'];
		 	$_SESSION['valid_user'] = 't';
		 	echo '<meta http-equiv="refresh" content="0;url=menu_usuario.php"';
		 }
		 
		
		
	}	
}


function ingreso()
{
global $db;
	$imprimir = null;
	$formulario = new cForm();

    $formulario->_method='post';

    $imprimir .= "<table align=center border=0>
                 <caption><H2>INGRESO</H2></caption>";
    $formulario->add_text('nombre usuario', 1, 0);
    $formulario->input('t_nombre_usuario_1', $nombre_usuario, '20', '30', '', 0, 1);
    $formulario->add_text('password', 1, 0);
	$formulario->password('t_password_1', $password, '20', 0, 1);
	
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);
	$imprimir .= "</table>";
	
	return $imprimir;
    
   
	
}

echo $imprimir;
echo ingreso();

?>