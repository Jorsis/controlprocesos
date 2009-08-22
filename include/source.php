<?php
/**
 * Created on 27 avr. 2006
 *
 * This an exemple of showsource file
 * 
 * It uses the Pear package Text_Highligth
 * 
 * /!\ Don't forget to securise this script /!\
 * 
 * @package PHP_Debug
 * @filesource
 */


// Additional include path for Pear (to adapt to your configuration )
//require_once '../../config/ApplicationCfg.php';
set_include_path(PD_WEB_PEAR_ROOT . PATH_SEPARATOR. get_include_path());
// End //


//Include Pear 
require_once 'PEAR.php';

//Include Debug_Renderer_HTML_Table_Config to get the configuration
require_once 'Debug.php';
require_once 'Debug/Renderer/HTML_Table_Config.php';

//Include the class definition of highlighter
require_once 'Text/Highlighter.php';
require_once 'Text/Highlighter/Renderer/Html.php';


// Get View source configuration
$options = Debug_Renderer_HTML_Table_Config::singleton()->getConfig();
//Debug::dumpVar($options, '$options');

// Buil the array options for the HTML renderer to get the nice file numbering
$rendOptions = array( 
    'numbers' => $options['HTML_TABLE_view_source_numbers'],
    'tabsize' => $options['HTML_TABLE_view_source_tabsize'],
);


// Finish parser object creation 
$renderer = new Text_Highlighter_Renderer_Html($rendOptions);
$phpHighlighter = Text_Highlighter::factory("PHP");
$phpHighlighter->setRenderer($renderer);

// Now make output, header
$header = str_replace('<title>PEAR::PHP_Debug</title>', '<title>PEAR::PHP_Debug::View_Source::'. $_GET['file']. '</title>', $options['HTML_TABLE_simple_header']);
print($header);

// Print style sheet
print($options['HTML_TABLE_view_source_stylesheet']);

// Output source
print('
  </head>
  <body>
    <div>
      <span class="hl-title">'. 
        $_GET['file'].'
      </span>
    </div>');

print($phpHighlighter->highlight(file_get_contents($_GET['file'])));

// Footer
print($options['HTML_TABLE_simple_footer']);


?>