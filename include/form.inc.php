<?php
/*****************************************************************************
    $Id: cform.inc.php,v 1.16 2002/08/26 21:15:09 djresonance Exp $
    Copyright 2002 Brandon Tallent

    This file is part of phpTest.

    This program is free software; you can redistribute it and/or
    modify it under the terms of the GNU General Public License
    as published by the Free Software Foundation; either version 2
    of the License, or (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*****************************************************************************/

/****************************************************************************
Este formaulario fue tomado del software aplicativo phptest donde 
Yo Diego Leon Arcila Herrera modifique el script debido a que la 
generacion del formulario era vertical y utilizando como separador 
de campos la instruccion <br>. La modificacion se relaizo con el fin 
de manejar los formularios a partir de tablas 
*****************************************************************************/



/**
 * Esta clase permite dibujar un formulario con tablas 
 *
 */

// class for outputting XHTML compliant forms


class cForm  {
    
    var $_action;
    var $_method;
    var $_name;
    var $_form_string;

    function cForm()
    {
        global $PHP_SELF;
        // set some defaults
        $this->set_action($PHP_SELF);
        $this->set_method('post');
    }

    /**
     * add_feedback
     *
     * @param string $text
     * @param string $tdclass
     * @param boolean $str
     * @param boolean $etr
     */
    
    function add_feedback($text, $tdclass='', $str=1, $etr=1) 
    {

        if ($str == true)
        {
            $string = "<tr>";
        }
        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass . ">";
        }
        else
            $string .= "<td>";

        $string = $string . "<span class=\"feedback\">" . addslashes($text) . "</span>\n";
        $string = $string . "</td>";
        
        if ($etr == true)
        {
            $string = $string ."</tr>";
        }

        $this->_form_string[] = $string;
    }
    
    
    /**
     * add_text
     * 
     * Allow draw a text in a form
     *
     * @param string $text
     * @param boolean $str
     * @param boolean $etr
     * @param int $colspan
     * @param int $rowspan
     * @param string $width
     * @param string $class
     * @param string $tdclass
     */

    
    function add_text($text, $str=1, $etr=1, $colspan=1, $rowspan=1, $width='', $class = '', $tdclass='')
    {
        if ($str == true)
        {
            $string = "<tr>";
        }

        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass;
        }
        else
            $string .= "<td";
        
        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string= $string . " rowspan=" . $rowspan;
        }
        
        if ($width != '' and $width > 0)
        {
		    $string = $string . " width=" . $width;
		}
        
        $string .= ">";

        if (!empty($class)) 
        {
            $string = $string . "<div class=\"$class\">$text</div>";
        } 
        else 
        {
            $string = $string . $text;
        }
        
        $string = $string . "</td>";
        
        if ($etr == true)
        {
          $string = $string . "</tr>";
        }

        $this->_form_string[] = $string;
        
        
    }

    
    /**
     * checkbox
     * 
     * Alow draw a check box in a form 
     *
     * @param string $name
     * @param string $value
     * @param string $checked
     * @param boolean $str
     * @param boolean $etr
     * @param string $tdclass
     */
    
    function checkbox($name, $value, $checked = '', $str=1, $etr=1, $tdclass='')
    {
        if ($str == true)
        {
            $string = "<tr>";
        }
        
        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass . ">";
        }
        else
            $string .= "<td>";

        $string = $string . "<input type=\"checkbox\" name=\"$name\"";

        if ($checked) 
        {
            $string .= " checked=\"checked\"";
        }

        $string .= " value=\"$value\" />\n";
        
        $string = $string . "</td>";
        
        if ($etr == true)
        {
          $string= $string . "</tr>";
        }


        $this->_form_string[] = $string;
    }
    
    /**
     * radio
     * allow draw a radio button with values in array
     *
     * @param string $name
     * @param array $value
     * @param string $checked
     * @param boolean $str
     * @param boolean $etr
     * @param boolean $std
     * @param boolean $etd
     * @param int $colspan
     * @param string $tdclass
     */
    
    function radio($name, $value = array(), $checked = '', $str=1, $etr=1, $std=1, $etd=1, $colspan=1,  $tdclass='', $onkeypress = '')
    {
        if ($str == true)
        {
          $string = "<tr>";
        }
        
        $i = 1;
        if ($std == true)
            {
        	    if (!empty($tdclass))
        	    {
          		    $string .= "<td class=" .$tdclass;
        	    }
        	    else
        		    $string .= "<td";
        		    
        	    if ($colspan == 1)
        	    {
			        $string .= ">";
			    }
			    else
			        $string .= " colspan=" .$colspan .">";
		    }
		    
        foreach ($value as $key=>$data)
        {
            
		    
            $string = $string . "<input type=\"radio\" name=\"$name\" id=\"$name$i\"";

            if ($checked == $data) 
            {
                $string .= " checked=\"checked\"";
            }
            
            $string .= " onclick= \"$onkeypress\" ";
            $string .= " value=\"$data\" />";
            
            $string .= $key;
        
            $i++;
        
		   
        }
         if ($etd == true)
        	    $string = $string . "</td>";
        if ($etr == true)
        {
          $string = $string . "</tr>";
        }

        $this->_form_string[] = $string;
        
    }
    
    

    /**
     * Draw a form in a document
     *
     * @param string $name
     * @param string $value
     * @param string $enctype
     * @param string $align
     * @param string $class
     * @param boolean $str
     * @param boolean $etr
     * @param string $bclass
     */
    
    function draw($name, $value, $enctype = '', $align='center', $class='', $str=1, $etr=1, $bclass='')
    {
        global $PHP_SELF, $strings;

        if (!$this->_action) 
        {
            $this->set_action($PHP_SELF);
        }
        
        echo "<table align=\" $align \" border=\"1\" class=\" $class \" >";
        echo "<div class=\"form\">\n";
        echo "<form";

        if (!empty($enctype)) 
        {
            echo " enctype=\"$enctype\"";
        }

        echo " method=\"$this->_method\" action=\"$this->_action\"";

        if ($this->_name) {
            echo " name=\"$this->_name\"";
        }


        echo ">\n";

        foreach ($this->_form_string as $form_string) 
        {
            echo $form_string;
        }
        
        if ($str == true)
        {
            echo "<tr>";
        }
        
        echo "<td>";
        
        echo "<input type=\"submit\" name=\"$name\" class='$bclass' value='$value' />\n";
        echo "</td>";
        
        if ($etr == true)
        {
            echo "</tr>";
        }
        
        echo "</form>\n";
        echo "</div>\n";
        echo "<br /><br />\n";
        echo "</table>";
    }
    
    /**
     * draw a form without show in a document
     *
     * @param string $name
     * @param string $value
     * @param string $enctype
     * @param string $align
     * @param string $class
     * @param boolean $str
     * @param boolean $etr
     * @param int $bclass
     * @param boolean $std
     * @param int $colspan
     * @param string $onclick
     * @param string $onsubmit
     * @param boolean $disabled
     * @return form
     */
    
    
    function drawwithout($name, $value, $enctype = '', $align='center', $class='', $str=1, $etr=1, $bclass='', $std=0, $colspan=1, $onclick="", $onsubmit="",$disabled="false")
    {
        global $PHP_SELF, $strings;
        

        if (!$this->_action) {
            $this->set_action($PHP_SELF);
        }
        
        
        $formdraw .= "<form";

        if (!empty($enctype)) 
        {
            $formdraw .= " enctype=\"$enctype\"";
        }

        $formdraw .= " method=\"$this->_method\" action=\"$this->_action\"";

        if ($this->_name) 
        {
            $formdraw .= " name=\"$this->_name\"";
        }
        
        if ($onsubmit)
        {
		  $formdraw .= " onsubmit=\"$onsubmit\"";
		}


        $formdraw .= ">\n";

        foreach ($this->_form_string as $form_string) 
        {
            $formdraw .= $form_string;
        }
        
        if ($str == true)
        {
            $formdraw .= "<tr>";
        }
        
        if ($std == true)
        {
            $formdraw.="<td align=$align ";
            
        	if ($colspan > 1)
        	{
			  $formdraw .= " colspan=\"$colspan\">";
			}
			else 
				$formdraw .= ">";
        }

        if ($disabled == "true")
            $disabled = "disabled";
        else
            $disabled="";
            
        $formdraw .= "<input type=\"submit\" name=\"$name\" class=\"$bclass\" value=\"$value\" onClick=\"$onclick\"/ \"$disabled\">\n";
        $formdraw .= "</td>";
        
        if ($etr == true)
        {
            $formdraw.= "</tr>";
        }
        
        $formdraw .= "</form>\n";
         
        return $formdraw;
        
    }
    
    
    /**
     * draw a form without show in a document
     *
     * @param string $name
     * @param string $value
     * @param string $enctype
     * @param string $align
     * @param string $class
     * @param boolean $str
     * @param boolean $etr
     * @param string $bclass
     * @param boolean $std
     * @param int $colspan
     * @param string $onclick
     * @param boolean $disable
     * @return form
     */
    
    
    function drawwithoutbutton($name, $value, $enctype = '', $align='center', $class='', $str=1, $etr=1, $bclass='', $std=0, $colspan=1, $onclick="", $disable="false")
    {
        global $PHP_SELF, $strings;
        

        if (!$this->_action) 
        {
            $this->set_action($PHP_SELF);
        }
        
        
        $formdraw .= "<form";

        if (!empty($enctype)) 
        {
            $formdraw .= " enctype=\"$enctype\"";
        }

        $formdraw .= " method=\"$this->_method\" action=\"$this->_action\"";

        if ($this->_name) 
        {
            $formdraw .= " name=\"$this->_name\"";
        }

        $formdraw .= ">\n";

        foreach ($this->_form_string as $form_string) 
        {
            $formdraw .= $form_string;
        }
        
        if ($str == true)
        {
            $formdraw .= "<tr>";
        }
        
        if ($std == true)
        {
        	$formdraw .= "<td";
        	
        	if ($colspan > 1)
        	{
			  $formdraw .= " colspan=\"$colspan\">";
			}
			else 
				$formdraw .= ">";
        }
        
        $formdraw .= "<input type=\"button\" name=\"$name\" class=$bclass value=\"$value\" onClick=\"$onclick\"/ readonly>\n";
        $formdraw .= "</td>";
        
        if ($etr == true)
        {
            $formdraw .= "</tr>";
        }
        
        $formdraw .= "</form>\n";
        
        
        return $formdraw;
        
    }
    
    
    

    /**
     * draw a input file
     *
     * @param string $name
     * @param string $tdclass
     * @param boolean $str
     * @param boolean $etr
     */

    function file($name, $tdclass='', $str=1, $etr=1)
    {
        if ($str == true)
        {
            $string = "<tr>";
        }
        
        if (!empty($tdclass))
        {
            $string .= "<td class=\"$tdclass\">";
        }
        else
            $string .= "<td>";
        
        $string = $string."<input type=\"file\" name=\"$name\"";
        $string .= " />\n";

        $string .= "</td>";
        
        if ($etr==true)
        {
            $string = $string . "</tr>";
        }
        $this->_form_string[] = $string;
    }

    
    /**
     * draw a hidden imput
     *
     * @param string $name
     * @param string $value
     */
    
    function hidden($name, $value)
    {
        $string = "<input type=\"hidden\" name=\"$name\" value=\"$value\" />\n";
        $this->_form_string[] = $string;
    }
    
    

    /**
     * draw a input field
     *
     * @param string $name
     * @param string $value
     * @param string $size
     * @param string $maxlength
     * @param string $class
     * @param boolean $str
     * @param boolean $etr
     * @param int $colspan
     * @param int $rowspan
     * @param string $keypress
     */
    
    
    function input($name, $value = '', $size = '', $maxlength = '', $class='', $str=1, $etr=1, $colspan=1, $rowspan=1, $keypress='', $disabled =  false, $id_input='', $extrahtml='onkeyup="pasarMayusculas(this)"')
    {
    	
    	$id_input = $name;
        if ($str == true)
        {
            $string = "<tr>";
        }
        
        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass;
        }
        else
            $string .= "<td ";
        
        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string ." colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
          $string = $string . " rowspan=" . $rowspan;
        }

        $string .= ">";
        
        $string = $string . "<input type=\"text\" name=\"$name\"";

        if (isset($value)) 
        {
            $string .= " value=\"$value\"";
        }

        if (!empty($size)) 
        {
            $string .= " size=\"$size\"";
        }

        if (!empty($maxlength)) 
        {
            $string .= " maxlength=\"$maxlength\"";
        }
        
        if(!empty($id_input))
          $string .= " id=\"$id_input\"";
        
        if ($disabled == true)
            $string .= " disabled='disabled'";

        $string .= " onKeyPress=\"$keypress\" {$extrahtml}/>\n";


        $string .= "</td>";
        if ($etr == true)
        {
          $string = $string . "</tr>";
        }
        
        $this->_form_string[] = $string;
    }
    
    

    /**
     * draw a password field
     *
     * @param string $name
     * @param string $value
     * @param string $maxlength
     * @param boolean $str
     * @param boolean $etr
     * @param int $colspan
     * @param int $rowspan
     */
    
    function password($name, $value = '', $maxlength = '', $str=1, $etr=1, $colspan=1, $rowspan=1)
    {
        if ($str == true)
        {
            $string = "<tr>";
        }

        if (!empty($tdclass))
        {
            $string .= "<td class=" .$tdclass;
        }
        else
            $string .= "<td ";

        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string = $string . " rowspan=" . $rowspan;
        }

        $string .= ">";
        
        $string = $string . "<input type=\"password\" name=\"$name\"";
        
        if ($value) $string .= " value = \"$value\"";
        
        if ($maxlength) $string .= " maxlength=\"$maxlength\"";
        
        $string .= " />\n";

        $string .= "</td>";
        
        if ($etr == true)
        {
            $string = $string . "</tr>";
        }
        $this->_form_string[] = $string;
    }
    

    /**
    * select
    *
    * Adds an html select box to the form queue to be drawn
    *
    * @param      string    $name     The html name of the select box
    * @param      array     $values   An array of values to put the select boxes in
    * @param      int       $breaks   The number of <br>s to put after the select box
    * @param      string    $selected (optional) The value which should initially be selected
    * @param      string    $onchange (optional) The value of the onchange javascript parameter
    * @return     none
    * @access     public
    */

    function select($name, $values, $selected = '', $onchange = '', $tdclass='', $str=1, $etr=1, $colspan=1, $rowspan=1, $disabled = false)
    {
        if ($str == true)
        {
            $string = "<tr>";
        }

      if (!empty($tdclass))
        {
            $string .= "<td class=" .$tdclass;
        }
        else
            $string .= "<td ";

        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string = $string . " rowspan=" . $rowspan;
        }

        $string .= ">";

        $string .= "<select name=\"$name\"";
        if ($disabled == true)
            $string .= " disabled='disabled'";
            
        $string .= " >\n";
        
      
        foreach ($values as $value)
        {
            $string .= " <option ";
            
            if ($selected == $value['col0']) {
                $string .= " selected=\"selected\"";
            }
            
            $string .= " value=\"" . $value['col0'] . "\">" . $value['col1'] . "</option>\n";
            
        }
      

        $string .= "</select>\n";


        $string .= "</td>";
        if ($etr == true)
        {
            $string = $string . "</tr>";
        }
        $this->_form_string[] = $string;
    }

    
    function set_action($action)
    {
        $this->_action = $action;
    }

    
    function set_method($method)
    {
        $this->_method = $method;
    }
    

    function set_name($name)
    {
        $this->_name = $name;
    }

    
    /**
     * Draw a text area field
     *
     * @param string $name
     * @param string $value
     * @param int $rows
     * @param int $cols
     * @param string $tdclass
     * @param boolean $str
     * @param boolean $etr
     * @param int $colspan
     * @param int $rowspan
     * @param boolean $disable
     */
    
    function textarea($name, $value = '', $rows = 10, $cols = 60, $tdclass='', $str=1, $etr=1, $colspan=1, $rowspan=1, $disable='false')
    {
        if ($str == true)
        {
            $string = "<tr>";
        }

        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass;
        }
        else
            $string .= "<td ";

        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string = $string . " rowspan=" . $rowspan;
        }

        $string .= ">";
        
        $string .= "<textarea name=\"$name\" rows=\"$rows\" cols=\"$cols\"";
        
        if ($disable == 'true')
        {
            $string .= " disabled>";
        }
        else
        {
            $string .= ">";
        }
        
        $string .= $value;
        $string .= "</textarea>\n";

        for ($i = 0; $i < $breaks; $i++) {
            $string .= '<br />';
        }

        $string .= "</td>";
        
        if ($etr == true)
        {
          $string = $string . "</tr>";
        }
        
        $this->_form_string[] = $string;
    }
    
    
    
    /**
     * This function allow draw a row into a table 
     *
     * @param string $tdclass
     * @param int $str
     * @param int $etr
     * @param int $colspan
     * @param int $rowspan
     */
    
    
    function table_region($tdclass='', $str=1, $etr=1, $colspan=1, $rowspan=1)
    {
        if ($str == true)
        {
            $string = "<tr>";
        }
        
        $string .= "<td";
        
        if (!empty($tdclass))
        {
            $string .= " class=" . $tdclass;
        }
        
        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string = $string . " rowspan=" . $rowspan;
        }
        
        $string .= ">&nbsp;";
        
        $string = $string . "</td>";
        
        if ($etr == true)
        {
            $string = $string . "</tr>";
        }
        
        $this->_form_string[] = $string;
    }
    
    /**
     * this function allow draw a input box with a calendario
     *
     * @param string $name
     * @param string $value
     * @param string $size
     * @param string $maxlength
     * @param string $tdclass
     * @param int $str
     * @param int $etr
     * @param int $colspan
     * @param int $rowspan
     * @param string $href
     * @param string $src
     */
    
    function inputcal($name, $value = '', $size = '', $maxlength = '', $tdclass='',$str=1,$etr=1,$colspan=1,$rowspan=1,$href='',$src='')
    {
        if ($str == true)
        {
            $string = "<tr>";
        }

        if (!empty($tdclass))
        {
            $string .= "<td class=" . $tdclass;
        }
        else
            $string .= "<td ";

        if ($colspan != 1 and $colspan != 0 and $colspan > 1)
        {
            $string = $string . " colspan=" . $colspan;
        }
        
        if ($rowspan != 1 and $rowspan != 0 and $rowspan > 1)
        {
            $string = $string . " rowspan=" . $rowspan;
        }

        $string .= ">";

        $string = $string . "<input type=\"text\" name=\"$name\"";

        if (isset($value)) 
        {
            $string .= " value=\"$value\"";
        }

        if (!empty($size)) 
        {
            $string .= " size=\"$size\"";
        }

        if (!empty($maxlength)) {
            $string .= " maxlength=\"$maxlength\"";
        }
        
        $string .= " readonly";

        $string .= " />";
        
        
        
        if (!empty($src))
        {
            $string .= "<img src=\"$src\"/ {$href}>";
        }

        $string .= "</td>";
        
        if ($etr == true)
        {
          $string = $string . "</tr>";
        }
        
        $this->_form_string[] = $string;
    }

}
?>