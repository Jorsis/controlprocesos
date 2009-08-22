<?
//require_once('include/header.inc.php');
require_once('formularios.php');
require_once('include/menu/xpMenu.class.php');

//print_r($_SESSION);

if ($_SESSION['valid_user'] != 't')
   echo '<meta http-equiv="refresh" content="0;url=ingreso.php?invalid=invalid"';
   

function menuadmin (){
    $fmenu = null;
    $menu = new xpMenu();
    
    $fmenu .= $menu->javaScript();
    $fmenu .= $menu->style();
    
    $menu->addMenu('menu1');
    /*$menu->addCategory('cliente', 'Administración cliente', 'imagenes/menu/network.gif', 'menu1');
    $menu->addOption('ingresocliente', 'Ingreso Cliente', 'imagenes/menu/si.gif', 'ingresocliente.php', 'cliente', 'menu1');
    $menu->addOption('edicioncliente', 'Edición Cliente', 'imagenes/menu/si.gif', 'edicioncliente.php', 'cliente', 'menu1');*/
    $menu->addCategory('usuariolinea', 'Administración Usuario', 'imagenes/menu/usuario.png', 'menu1');
    $menu->addOption('ingresousuario', 'Ingreso Usuarios', 'imagenes/menu/agregar.png', 'ingresousuario.php', 'usuariolinea', 'menu1');
    $menu->addOption('edicionusuario', 'Edición Usuarios', 'imagenes/menu/edicion.png', 'edicionusuario.php', 'usuariolinea', 'menu1');
     
    $menu->addCategory('manejoprocesos', 'Producción', 'imagenes/menu/produccion.png', 'menu1');
    
    $menu->addOption('ordenservicio', 'Ingreso de Lote', 'imagenes/menu/lote.png', 'orden.php', 'manejoprocesos', 'menu1');
    $menu->addOption('ingresoproceso','Ingreso de Procesos', 'imagenes/menu/proceso.png', 'proceso.php', 'manejoprocesos', 'menu1');
    $menu->addOption('seguimiento','Seguimiento', 'imagenes/menu/seguimiento.png', 'seguimiento.php', 'manejoprocesos', 'menu1');
    
    $menu->addCategory('reportes', 'Reportes', 'imagenes/menu/reportes.png', 'menu1');
    $menu->addOption('reportesinf', 'Reportes', 'imagenes/menu/reporte.png', 'reporteadmin.php', 'reportes', 'menu1');
    
    $menu->addCategory('salir', 'Salir', 'imagenes/menu/network.gif', 'menu1');
    $menu->addOption('salida', 'Salir del sistema', 'imagenes/menu/salir.png', 'ingreso.php', 'salir', 'menu1');
    
    $fmenu .= $menu->mountMenu('menu1');
    
    return $fmenu;
}

function menucliente(){
    $fmenu = null;
    $menu = new xpMenu();
    $fmenu .= $menu->javaScript();
    $fmenu .= $menu->style();
    
    $menu->addMenu('menucliente');
    $menu->addCategory('reporte', 'Seguimientos', 'imagenes/menu/network.gif', 'menucliente');
    $menu->addOption('seguimientoorden', 'Orden', 'imagenes/menu/si.gif', 'reportecliente.php', 'reporte', 'menucliente');

    $menu->addOption('salir', 'Salir', 'imagenes/menu/logout.gif', 'ingreso.php', 'reporte', 'menucliente');
    $fmenu .= $menu->mountMenu('menucliente');
    return $fmenu;
}



function menuusuario(){
    $fmenu = null;
    $menu = new xpMenu();
    $fmenu .= $menu->javaScript();
    $fmenu .= $menu->style();
    
    $menu->addMenu('menuusuario');
    $menu->addCategory('reporte', 'Seguimientos', 'imagenes/menu/network.gif', 'menuusuario');
    $menu->addOption('orden', 'Orden', 'imagenes/menu/si.gif', 'orden.php', 'reporte', 'menuusuario');
    $menu->addOption('seguimiento', 'Seguimiento', 'imagenes/menu/si.gif', 'seguimiento.php', 'reporte', 'menuusuario');

    $menu->addOption('salir', 'Salir', 'imagenes/menu/logout.gif', 'ingreso.php', 'reporte', 'menuusuario');
    $fmenu .= $menu->mountMenu('menuusuario');
    return $fmenu;
}


if ($_SESSION['type_user'] == 'admin')
     echo menuadmin();
else if($_SESSION['type_user'] == 'cliente')
     echo menucliente();
else if($_SESSION['type_user'] == 'usuario')
     echo menuusuario();

?>