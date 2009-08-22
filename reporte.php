<?

require_once('include/header.inc.php');
//include_once('include/sql2excel.class.php');
if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';
   
$imprimir .= "<table align=center border=0>
<caption><H2>Reporte</H2></caption>";

$formulario = new cForm();
$formulario->_name = 'freporte';

$dias = date('t');

    $formulario->add_text('<h3>Fecha Inicio</h3>', 0, 0);
	$formulario->inputcal('t_fecha_inicio_0', date('Y/m/d H:i', time()  - $dias * 24 * 60 * 60), '20', '20', '', 0, 0, 1, 1, "onclick=\"displayCalendar(document.forms[0].t_fecha_inicio_0,'yyyy/mm/dd hh:ii',this,true)\"", 'imagenes/cal.gif');
	$formulario->add_text('<h3>Fecha Fin</h3>', 0, 0);
	$formulario->inputcal('t_fecha_fin_0', date('Y/m/d H:i', time()), '20', '20', '', 0, 0, 1, 1, "onclick=\"displayCalendar(document.forms[0].t_fecha_fin_0,'yyyy/mm/dd hh:ii',this,true)\"", 'imagenes/cal.gif');
	
	$imprimir .= $formulario->drawwithout('enviar', 'Enviar', '', 'center', '', 1, 1, '', 1, 2);

$imprimir .= "</table>";


echo $imprimir;


function separeDate($date){
	$fecha = explode('/', $date);
	$day = explode(' ', $fecha[2]);
	
	$time = explode(':', $day[1]);
	
	return mktime($time[0],$time[1], 0, $fecha[1], $day[0], $fecha[0]);
}

if ($_REQUEST['enviar']) {
	$fechai = separeDate($_REQUEST['t_fecha_inicio_0']);
	$fechaf = separeDate($_REQUEST['t_fecha_fin_0']);
	
	
	
	$sql = "select o.*, s.proceso, s.unidad from seguimiento s, orden o where (s.finalizacion between  $fechai and $fechaf ) and o.orden = s.orden";
    $_SESSION['sqlexcel'] = $sql;
    
    echo '<meta http-equiv="Refresh" content="0;URL=excel.php">';
}

?>
<link type="text/css" rel="stylesheet" href="script/dhtmlgoodies_calendar.css?random=20051112" media="screen"></LINK>
	<SCRIPT type="text/javascript" src="script/dhtmlgoodies_calendar.js?random=20060118"></script>

