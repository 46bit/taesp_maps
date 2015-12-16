<!DOCTYPE html
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
   <head>
      <title>
         Internet Archaeol. 20. Given et al. Independent Exploration
      </title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <link rel="stylesheet" href="/style/journal.css" type="text/css" />


<script language="javascript" type="text/javascript">
  <!--
  function newWin(myurl) {
 
  bingo = window.open(myurl,'mywin','width=600,height=400,status=no,resizable=yes,scrollbars=yes');
  bingo.focus();
 
  }
 
  // -->
  </script>
  
<style type="text/css">
#mapContainer
    {
      width: 645px;
      border: 1px solid #555599;
    }
	#notice
    {
      padding: 5px;
      border: 1px solid #555599;
      width: 400px;
      text-align: center;
    }
</style>


	</head>
	<body>

	<!-- pnutst-start -->
<hr />
<p>
<a href="4.htm" title="Previous Page" class="button">
			<span class="navigation">&nbsp;PREVIOUS&nbsp;</span></a>
 <a href="toc.htm"  title="Article Contents Page" class="button">
			<span class="navigation">&nbsp;CONTENTS&nbsp;</span></a>
 <a href="/" title="Internet Archaeology Home Page" class="button">
			<span class="navigation">&nbsp;HOME&nbsp;</span></a>
</p>
<!-- pnutst-stop -->


<h1>GIS - Independent Exploration</h1>


<p class="alert_box"><a name="gis-map"></a>This online GIS contains a large amount of data. Please be patient while layers are loading and queries running. Do not try and send extra requests while your initial request is still loading, as this is likely to produce error messages. Your browser can only send and receive one GIS request at a time. Note that the data used within this GIS can also be downloaded for use offline from the <a target="_blank" href="http://ads.ahds.ac.uk/catalogue/resources.html?taesp_ahrc_2007">related digital archive</a> hosted by the Archaeology Data Service.<br /><br />

<a href="javascript:newWin('user_guide.htm')">User Guide</a> | <a href="javascript:newWin('bldgcodes.htm')">Building codes</a> | <a href="javascript:newWin('codeslist.htm')">Geomorphology codes</a> | <a href="javascript:newWin('lithcodes.htm')">Lithic codes</a> | <a href="javascript:newWin('metalcodes.htm')">Archaeometallurgy codes</a> | <a href="javascript:newWin('potcodes.htm')">Pottery codes</a> | <a href="javascript:newWin('speccodes.htm')">Special Finds codes</a> | <a href="javascript:newWin('sucodes.htm')">Survey Unit codes</a> | <a href="javascript:newWin('/journal/ims/help.html')">Interface help</a></p>




    <cfparam name="show" default="">
    <cfparam name="map" default = "taesp_ahrc_2007">


	<cfset minx = 479522.389213717>
	<cfset miny = 3871892.94459418>
	<cfset maxx = 505864.244062679>
	<cfset maxy = 3886644.47298197>

    <cfoutput>
      <cfif show eq "1">

        <div style="margin-left:2em;">
			<div id="mapContainer">
			<!---cf_getCustomMap
				MapServerName = "http://mapserver.archaeologydataservice.ac.uk"
				MapServerPort = "80"
				MapName="taesp_ahrc_2007"
				MapWidth="645"
				MapHeight="450"
				MapView = "taesp_ahrc_2007/indexp"
				MapExtent = "#minx#,#miny#,#maxx#,#maxy#"
				MapOverview = "true"
				MapTemplate = "intarch-custom"--->
        <p>This map is currently unavailable due to ESRI's abandonment of ArcIMS. We are currently working on migrating this interface to a more open and sustainable solution, so apologies for any inconvenience.</p>
			</div>
		</div>

        <p><a href="indexp.cfm?show=false##gis-map">Switch Off</a> the Interactive Map</p>
      <cfelse>

        <div id="notice">
          <p><a href="indexp.cfm?show=1##gis-map">Switch On</a> the Interactive Map</p>
		  <!---p style="text-align:center;"><em>Due to a server upgrade, these map services will be periodically unavailable from Sep 3rd, 2010</em></p--->
        </div>
      </cfif>
    </cfoutput>



<!-- pnutsb-start -->
<hr />
<p>

 <a href="toc.htm" title="Article Contents Page" class="button">
			<span class="navigation">&nbsp;CONTENTS&nbsp;</span></a>
 <a href="/"  title="Internet Archaeology Home Page" class="button">
			<span class="navigation">&nbsp;HOME&nbsp;</span></a>
</p><p class="copy">&copy; Internet Archaeology/Authors
 URL: <a href="http://intarch.ac.uk/journal/issue20/3/indexp.cfm">http://intarch.ac.uk/journal/issue20/4/indexp.cfm</a>
 <br />Last updated: Wed May 23 2007</p>
 <!-- pnuts:Wed Aug  9 17:14:04 BST 2006 -->

<!-- pnutsb-stop -->

<cfinclude template="/includes/stats.txt">
</body>
   </html>
