<?php
include ("include/src/jpgraph.php");
include ("include/src/jpgraph_line.php");
session_start();

//$datay = array(1.23,1.9,1.6,3.1,3.4,2.8,2.1,1.9);
$datay = $_SESSION['grafica'];
$datax = $_SESSION['proceso'];
$graph = new Graph(500,400,"auto");
$graph->SetScale("textlin");

$graph->img->SetMargin(40,40,40,100);	
$graph->SetShadow();
$graph->xaxis->SetTickLabels($datax);
$graph->xaxis->SetLabelAngle(90);
$graph->SetGridDepth(DEPTH_FRONT);

$graph->title->Set("Informe grafico del la orden: ".$_SESSION['orden']);
//$graph->xaxis->title->Set("Procesos");
$graph->xaxis->SetTitle('Procesos','middle'); 
$graph->xaxis->title->SetMargin(50);
$graph->xaxis->title->Center(200,150,75);
$graph->yaxis->title->Set("Tiempo(Horas)");
$graph->title->SetFont(FF_FONT1,FS_BOLD);
$graph->yaxis->title->SetFont(FF_FONT1,FS_BOLD);
$graph->xaxis->title->SetFont(FF_FONT1,FS_BOLD);

$p1 = new LinePlot($datay);
$p1->SetFillColor("blue");
$p1->mark->SetType(MARK_FILLEDCIRCLE);
$p1->mark->SetFillColor("red");
$p1->mark->SetWidth(4);
$graph->Add($p1);

$graph->Stroke();
?>
