<?
require_once('include/header.inc.php');
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';
?>
<script language="javascript" src="script/cal2.js"></script>
<script language="javascript" src="script/cal_conf2.js"></script>

<?
$imprimir = null;
$imprimir .= "<table align=center border=0>
<caption><H2>Reporte</H2></caption>";

$formulario = new cForm();
$formulario->_name = 'freporte';

    $formulario->add_text('fecha_inicio', 0, 0);
	$formulario->inputcal('t_fecha_inicio_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar1')", 'imagenes/cal.gif');
	$formulario->add_text('fecha_fin', 0, 0);
	$formulario->inputcal('t_fecha_fin_4', '', '12', '10', '', 0, 0, 1, 1, "javascript:showCal('Calendar2')", 'imagenes/cal.gif');

$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);

$imprimir .= "</table>";

echo $imprimir;

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
	else {
		  
		  
		$sql = "select ord.ingreso, ord.referencia, ord.unidades, cliente.nombre_cliente, ord.orden,
		
		(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 's001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as SEPARACION, 		   
		        (select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'i001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as IMPRESION, 
		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'g001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as GRABACION, 

(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'm001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as MUESTRA, 
		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'p001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as PRODUCCION,		        		        		        
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 't001' and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and ((finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') or finalizacion is null)) as TERMOFIJACION, 
(select to_char(inicio, 'YYYY/mm/dd HH12:MI:SS') || ' -- ' || case when finalizacion is null then 'sin finalizar' else to_char(finalizacion, 'YYYY/mm/dd HH12:MI:SS') end from seguimiento where orden = ord.orden and proceso = 'd001' and inicio >='{$_REQUEST['t_fecha_inicio_4']}'  and finalizacion <= '{$_REQUEST['t_fecha_fin_4']}') as DESPACHO
		                   
		        from cliente, orden as ord, seguimiento";
		 
		            $sql .= " where '".$_SESSION['id_user']."' = ord.cliente and ord.orden = seguimiento.orden and cliente.id_cliente = ord.cliente";
		            
		            $sql .= " and (inicio between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') and (finalizacion between '{$_REQUEST['t_fecha_inicio_4']}' and '{$_REQUEST['t_fecha_fin_4']}') group by ingreso, referencia, unidades, nombre_cliente, ord.orden";
			         
		          
       //echo $sql;
		$pager = new ADODB_Pager($db,$sql); 
        $pager->Render($rows_per_page=10); 
        
		/*if ($db->Execute($sql) === false){
			$imprimir .= "Error en la consulta :". $db->ErrorMsg()."<br>";
		}*/
	
	}
	
}


?>