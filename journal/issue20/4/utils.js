/* Utility functions to display/hide DIVisions in DHTML
 * Written by J. Huggett, Department of Archaeology, University of Glasgow
 * http://www.gla.ac.uk/archaeology/
 * ***************************************************************************************************************
 * VERSION 2 (05/2005)
 * Browser detection streamlined to avoid deprecated browser 'sniffing' although an element is still required 
 * in order to detect Opera 6 which isn't capable of accessing the DOM display element utilised here.
 * ***************************************************************************************************************
 *	Requires:
 *		a .hidden CSS style defined which is used to format the hidden DIV
 *		a browser capable of accessing the DOM - version 5 or higher (but not Opera 5/6)
 *
 * The functions operate on the display property of the layer - in a capable browser, this will be hidden
 * until the user clicks a button to reveal it. The display property, unlike the visibility property, does not
 * reserve space for the hidden layer, and hence the user does not see empty spaces in the body of the text.
 *
 * At the head of an HTML document that will use these functions, there should be a hidden CSS style defined.
 * For example:
 * <STYLE type="text/css">
 * 	<!--
 *		.hidden { font-size: smaller; display: block; margin-left: 20  }
 *	-->
 * </STYLE>
 *
 * Within the body of the HTML document at the beginning of a hidden section, a call to the startDiv function
 * is made, passing it the name of a layer to create. In the event that Javascript is not available, a 
 * <NOSCRIPT> statement keeps things tidy.
 * For example:
 * <SCRIPT type="text/javascript">startDiv('Hide1')</SCRIPT>
 * <NOSCRIPT><DIV id="Hide1" class="reveal"><HR align="left" width="25%"></NOSCRIPT>
 *
 * A matching call to the endDiv is made at the end of the hidden section, again accompanied by a <NOSCRIPT>:
 * <SCRIPT type="text/javascript">endDiv('Hide1')</SCRIPT>
 * <NOSCRIPT><HR align="left" width="25%"></DIV></NOSCRIPT>
*/

// Initialise images for use as the display/hide buttons
var plusOn = new Image(); 
var plusOff = new Image();
plusOff.src = "minus.gif";
plusOn.src = "plus.gif";

/* Browser sniffer to detect Opera 6
 * Runs automatically on loading the file. 
 * Ideally, this wouldn't be necessary as a call to document.getElementById will identify DHTML-capable browsers.
 * Unfortunately, Opera 6 is DHTML-capable, but does not access the DOM display element used by these scripts.
 */
 
var agt		= navigator.userAgent.toLowerCase();
var is_opera6 = (agt.indexOf("opera 6") != -1 || agt.indexOf("opera/6") != -1); 

// Finally, use 'browserOK' to flag up browsers that support DHTML *and* access the display properties of a layer
// Note, we have to trap Opera 5/6 since, although it supports the getElementByID method, it doesn't support the 
// display property within it.

var browserOK=false;
	if (document.getElementById) // Set browser capability
		if (is_opera6)
			browserOK=false;
		else
			browserOK=true;
/*
 * +---------------------+
 * |MAIN DHTML FUNCTIONS |
 * +---------------------+
 */

/* accessCSS
 * Accesses the style properties for a named layer (see toggleDisplay, below).
 * This function was originally derived from Ryan Frishberg's DHTML tutorial at http://www.pageresource.com/dhtml/ryan/index.html
 * but now bears little resemblance to it!
 * Note that since the startDiv and endDiv functions which generate the hidden DIV blocks have already checked the browser 
 * capability, no check is requireed here
 */
function accessCSS(layerID)
{      
	return document.getElementById(layerID).style;
}

/* showHeader
 * Displays an appropriate message regarding the level of interactivity available in the current browser.
 * Note that Opera has the document.getElementById method, but cannot access the display property, so this is treated
 * as a lower version browser. However, versions of Opera from 7 up can emulate Mozilla/MSIE *and* access the display property.
 * The function should be followed in the body of the HTML with a NOSCRIPT tag which displays an appropriate message 
 * if Javascript is not available.
 */
function showHeader() 
{
	document.write('<P align=\"center\">');
	if (browserOK)
	{
		document.write('<FONT size=\"-1\"><I>Click on the plus symbol <IMG border=\"0\" src=\"plus.gif\" width=\"12\" height=\"12\" alt=\"+\"> to display additional comments, and the minus symbol <IMG border=\"0\" src="\minus.gif\" width=\"12\" height=\"12\" alt=\"-\"> to hide them.<\/I><\/FONT>');
	}
	else	// toggling the display of a layer isn't going to work ...
	{				 
		document.write('<FONT size=\"-1\"><I>Unfortunately your browser indicates that it is not compatible with the Hide/Reveal section facility. <BR>The \'hidden\' sections will consequently appear as delineated blocks of text with no interaction available.<BR>A browser version 5 or higher (7 or higher for Opera) is necessary for the interactive element to work.<\/I><\/FONT>');
	}
	document.write('<\/P>');
}

/* toggleDisplay
 * Passed the name of a layer as a string, and toggles its display property according to its current setting.
 * Plus and minus buttons are switched appropriately.
 * The function is only called if the browser is capable of modifying the display property, otherwise the buttons for the
 * user to toggle the display will not have been shown in the first place.
 */
function toggleDisplay(layerID)
{
	if(accessCSS(layerID).display=="none") 				// Turn on the invisible text
			{
             accessCSS(layerID).display = "block";
			 document['i'+layerID].src = plusOff.src;
            }
	else												// Turn off the text
			{
             accessCSS(layerID).display = "none";
			 document['i'+layerID].src = plusOn.src;
            }
}

function showStatus(layerID)
{
	if (accessCSS(layerID).display=="none")
	{
		this.window.status="Click to show hidden section ...";
	}
	else
	{
		this.window.status="Click to hide section ...";
	}
}

/* startDIV
 * Passed the name of a layer to be created as a string.
 * Creates a DIV of that name, and, if the browser is capable of handling the display property (as distinct from the visibility property)
 * writes the relevant code to be triggered and sets the display to "none" (i.e. the DIV block is hidden). Otherwise the DIV block is
 * displayed with a seperator.
 * The function call in the HTML should be accompanied by a NOSCRIPT tag which sets up a visible non-interactive DIV if
 * Javascript is disabled.
 */
function startDiv(layerID) 
{
	if (browserOK)	// We can make the interactive elements available ...
	{
		document.write('<A href=\"javascript: toggleDisplay(\''+layerID+'\')\" onMouseOver=\"showStatus(\''+layerID+'\'); return true\" onMouseOut=\"window.status=\' \';return true\")\"><IMG src=\"plus.gif\" border=\"0\" width=\"12\" height=\"12\" alt=\"+\" name=\"i'+layerID+'\"><\/A>');
		document.write('<DIV id=\"'+layerID+'\" class=\"hidden\" style=\"display: none\">');
	}
	else			// No interactive element available
	{
		document.write('<DIV id=\"'+layerID+'\" class=\"hidden\"><HR align=\"left\" width=\"25%\">');
	}

}

/* endDiv
 * Passed the name of the layer which has been previously created by a call to startDiv and writes the closing </DIV> tag
 * If the browser is capable, a toggle button is written to close the DIV if it is visible, otherwise a seperator is shown.
 * The function call in the HTML should be accompanied by a NOSCRIPT tag to close the DIV if Javascript is disabled.
 */ 
function endDiv(layerID)	
{
	if (browserOK)	
	{
		document.write('<A href=\"javascript: toggleDisplay(\''+layerID+'\')\" onMouseOver=\"showStatus(\''+layerID+'\'); return true\" onMouseOut=\"window.status=\' \';return true\")\"><IMG src=\"minus.gif\" border=\"0\" width=\"12\" height=\"12\" alt=\"-\"><\/A><\/DIV>');
	}
	else
	{
		document.write('<HR align=\"left\" width=\"25%\"><\/DIV>');
	}
}
