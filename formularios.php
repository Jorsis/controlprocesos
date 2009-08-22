<?
require_once('include/header.inc.php');

/*if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';*/
   
function formlariocliente($idcliente=null, $nombre=null, $telefono=null, $direccion=null)
{
	global $db;
	$imprimir = null;
	$formulario = new cForm();

    $formulario->_method='post';

    $imprimir .= "<table align=center border=0>
                 <caption><H2>CLIENTE</H1></caption>";

    $formulario->add_text('<h3>Nit o Cedula</h3>', 1, 0);
    $formulario->input('t_id_cliente_1', $idcliente, '15', '15', '', 0, 1);
    /*$formulario->add_text('Id_usuario', 1, 0);
    $formulario->input('t_id_usuario_1', $idcliente, '15', '15', '', 0, 1);*/
    $formulario->add_text('<h3>Nombre Usuario</h3>', 1, 0);
    $formulario->input('t_nombre_usuario_1', $nombre_usuario, '30', '50', '', 0, 1);
	$formulario->add_text('<h3>Nombre Cliente</h3>', 1, 0);
	$formulario->input('t_nombre_cliente_1', $nombre, '40', '50', '', 0, 1);
	$formulario->add_text('<h3>Telefono</h3>', 1, 0);
	$formulario->input('t_telefono_1', $telefono, '15', '15', '', 0, 1);
	$formulario->add_text('<h3>Direccion</h3>', 1, 0);
	$formulario->input('t_direccion_1', $direccion, '40', '50', '', 0, 1);
	//$formulario->add_text('tipo', 1, 0);
	$formulario->hidden('t_tipo_1', 'cliente');
	$formulario->add_text('<h3>Contraseña</h3>', 1, 0);
	$formulario->password('t_password_1', $password, '50', 0, 1);
	$formulario->add_text('<h3>Activo</h3>', 1, 0);
	$formulario->checkbox('activo', 'true', '', 0, 1, '');
		
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);
	$imprimir .= "</table>";
	
	return $imprimir;
}

function formularioorden($orden=null,$referencia=null,$unidades=null,$cliente=null)
{
	global $db;
$imprimir = null;
$formulario = new cForm();

$formulario->_method='post';

$imprimir .= "<table align=center border=0>
<caption><H2>LOTE</H2></caption>";

$imprimir .= "<tr rowspan=2><td colspan='4' >&nbsp;</td></tr>";
 
$formulario->add_text('<h3>Lote</h3>', 1, 0);
$formulario->input('t_lote_1', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Referencia</h3>', 0, 0);
$formulario->input('t_referencia_0', $referencia, '20', '50', '', 0, 1);

$formulario->add_text('<h3>Especie</h3>', 1, 0);
$formulario->input('t_especie_0', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Tipo</h3>', 0, 0);
$formulario->input('t_tipo_0', $referencia, '20', '50', '', 0, 1);

$formulario->add_text('<h3>Corte</h3>', 1, 0);
$formulario->input('t_corte_0', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Peso</h3>', 0, 0);
$formulario->input('t_peso_0', $referencia, '20', '50', '', 0, 1);

$formulario->add_text('<h3>Ancho</h3>', 1, 0);
$formulario->input('t_ancho_0', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Largo</h3>', 0, 0);
$formulario->input('t_largo_0', $referencia, '20', '50', '', 0, 1);

$formulario->add_text('<h3>Espesor</h3>', 1, 0);
$formulario->input('t_espesor_0', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Calidad</h3>', 0, 0);
$formulario->input('t_calidad_0', $referencia, '20', '50', '', 0, 1);

$formulario->add_text('<h3>Novedad</h3>', 1, 0);
$formulario->input('t_novedad_0', $orden, '15', '15', '', 0, 0);

$formulario->add_text('<h3>Unidades</h3>', 0, 0);
$formulario->input('t_unidades_6', $unidades, '15', '15', '', 0, 1);
/*$formulario->add_text('<h3>cliente</h3>', 1, 0);

$sql = "select * from cliente order by nombre_usuario";

	$data = $db->Execute($sql);
	
	$values = array();
	while (!$data->EOF)
	{
		
		$dato = array ('col0' => $data->fields[0],
		               'col1' => $data->fields['nombre_cliente']);        
		               
		$values[] = $dato;
		$data->moveNext();            
		
	}
			$formulario->select("s_cliente_1", $values, "", "","",0,1);*/


$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 4);

$imprimir .= "</table>";
	
return $imprimir;	
	
}
function formularioproceso($idproceso=null, $nombre=null, $descripcion=null, $obligatorio=null)
{
	$imprimir = null;
	$formulario = new cForm();

    $formulario->_method='post';

    $imprimir .= "<table align=center border=0>
                 <caption><H2>PROCESO</H2></caption>";

    $formulario->add_text('<h3>Id proceso</h3>', 1, 0);
    $formulario->input('t_id_proceso_1', $idproceso, '15', '15', '', 0, 1);

	$formulario->add_text('<h3>Nombre</h3>', 1, 0);
	$formulario->input('t_nombre_1', $nombre, '40', '50', '', 0, 1);
	$formulario->add_text('<h3>Descripcion</h3>', 1, 0);
	$formulario->input('t_descripcion_0', $telefono, '15', '15', '', 0, 1);
	$formulario->add_text('<h3>Obligatorio</h3>', 1, 0);
	$formulario->checkbox('obligatorio',1,'',0,1);
	
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);
	$imprimir .= "</table>";
	
	return $imprimir;
}



function formlariousuario($idusuario=null, $nombre=null, $nombre_usuario=null, $activo=true)
{
	global $db;
	$imprimir = null;
	$formulario = new cForm();

    $formulario->_method='post';

    $imprimir .= "<table align=center border=0>
                 <caption><H2>USUARIO</H1></caption>";

    $formulario->add_text('<h3>Cedula</h3>', 1, 0);
    $formulario->input('t_id_usuario_1', $idcliente, '15', '15', '', 0, 1);
    /*$formulario->add_text('Id_usuario', 1, 0);
    $formulario->input('t_id_usuario_1', $idcliente, '15', '15', '', 0, 1);*/
    $formulario->add_text('<h3>Nombre Usuario</h3>', 1, 0);
    $formulario->input('t_nombre_usuario_1', $nombre_usuario, '30', '50', '', 0, 1);
	$formulario->add_text('<h3>Nombre</h3>', 1, 0);
	$formulario->input('t_nombre_1', $nombre, '40', '50', '', 0, 1);

	//$formulario->add_text('tipo', 1, 0);
	$formulario->hidden('t_tipo_1', 'usuario');
	$formulario->add_text('<h3>Contraseña</h3>', 1, 0);
	$formulario->password('t_password_1', $password, '50', 0, 1);
	$formulario->add_text('<h3>Activo</h3>', 1, 0);
	$formulario->checkbox('activo', 'true', '', 0, 1, '');
		
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);
	$imprimir .= "</table>";
	
	return $imprimir;
}

function ingreso()
{
global $db;
	$imprimir = null;
	$formulario = new cForm();

    $formulario->_method='post';

    $imprimir .= "<table align=center border=0>
                 <caption><H2>INGRESO</H1></caption>";
    $formulario->add_text('<h3>Nombre Usuari</h3>o', 1, 0);
    $formulario->input('t_nombre_usuario_1', $nombre_usuario, '20', '30', '', 0, 1);
    $formulario->add_text('<h3>Contraseña</h3>', 1, 0);
	$formulario->password('t_password_1', $password, '20', 0, 1);
	
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);
	$imprimir .= "</table>";
	
	return $imprimir;
    
   
	
}


?>