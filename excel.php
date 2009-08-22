<?
header("Content-type: application/vnd.ms-excel");
header("Content-Disposition: attachment; filename=\"filename.xls\"");

pg_connect('host=localhost user=cdiazz password=cdiazz dbname=cicaicsa');
session_start();

$sql = stripcslashes($_SESSION['sqlexcel']);
//echo $sql;
$con = pg_query($sql);

?>
<table width="60%" border="1">
<tr>
<td align="center"><b>Lote</b></td>
<td align="center"><b>EAN</b></td>
<td align="center"><b>Referencia</b></td>
<td align="center"><b>Especie</b></td>
<td align="center"><b>Tipo</b></td>
<td align="center"><b>Proceso</b></td>
<td align="center"><b>Corte</b></td>
<td align="center"><b>Peso</b></td>
<td align="center"><b>Ancho</b></td>
<td align="center"><b>Espesor</b></td>
<td align="center"><b>Calidad</b></td>
<td align="center"><b>Novedad</b></td>
</tr>
  <?
  while ($data = pg_fetch_array($con)) {
  	
  
  ?>
  <tr>
    <td><?= $data['orden'] ?>&nbsp;</td>
    <td><?= $data['unidad'] ?>&nbsp;</td>
    <td><?= $data['referencia'] ?>&nbsp;</td>
    <td><?= $data['especie'] ?>&nbsp;</td>
    <td><?= $data['tipo'] ?>&nbsp;</td>
    <td><?= $data['proceso'] ?>&nbsp;</td>
    <td><?= $data['corte'] ?>&nbsp;</td>
    <td><?= $data['peso'] ?>&nbsp;</td>
    <td><?= $data['ancho'] ?>&nbsp;</td>
    <td><?= $data['espesor'] ?>&nbsp;</td>
    <td><?= $data['calidad'] ?>&nbsp;</td>
    <td><?= $data['novedad'] ?>&nbsp;</td>
  </tr>
  <? } ?>
</table>