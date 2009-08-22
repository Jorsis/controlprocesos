<?php /* Smarty version 2.6.9, created on 2008-06-29 12:57:55
         compiled from barcode.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'html_table', 'barcode.tpl', 12, false),)), $this); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>CONTROL PROCESO </title>
</head>

<body>
<table align="center">
<tr>
<td><?php echo smarty_function_html_table(array('loop' => $this->_tpl_vars['id_orden'],'cellspacing' => 1,'cols' => 3,'td_attr' => 'width="25%" height="15%" align="center" valign="top"','table_attr' => 'border="0	" height="100%" align="center" whidth="75%"'), $this);?>
<br><br><br><br><br><br><br><br><br></td>
</tr>
<tr>
<td>
 <?php echo smarty_function_html_table(array('loop' => $this->_tpl_vars['codebar'],'cellspacing' => 10,'cols' => 4,'td_attr' => 'width="25%" height="15%" align="center" valign="top"','table_attr' => 'border="0" cellspacing="20" height="100%" align="center" whidth="90%"'), $this);?>

</td>
</tr>
</table>
</body>
</html>