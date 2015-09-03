<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "invno,catno,lithfindid,pieceno,lgth,width,thick,hght,pw,pt,blankretcore,chipblanktype,prismy,prismn,butttype,buttprepf,buttprepg,buttangint,buttangext,lipchk,erachk,dorscar,termtype,retloc,retunits,rettype,retdel,edloc,edunits,edtype,reusedch,reuseseq,coretype,platftype,platfang,scartypesb,scartypesbl,scartypesf,scarseq,condt,condu,conde,corttype,cortplat,cortbody,perfdia,perfdpth,bowldia,bowldpth,basalthick,butbrdth,buttthick,bldlgth,grdblanktype,prefcs,prefdr,preffl,prefgr,prefpe,umodgr,umodin,umodpe,umodha,umodst,umodpo,reshrp,reshes,reshcr,usesurfchar,planshp,planshpoth,longsect,transect,comm,recby,recdate,entby,entdate">



<cfset names = "Inventory Number,Catalogue Number,Lithic Find ID,Number of Pieces,Length (mm),Width (mm),Thickness (mm),Height (mm),Butt Width/Breadth (mm),Butt Thickness (mm),Blank Retouch Core,Chipped Blank Type,Prismatic Yes,Prismatic No,Butt Type,Butt Preparation F,Butt Preparation G,Butt Angle Internal (degrees),Butt Angle External (degrees),Lip?,Eraillure?,Dorsal Scars,Termination Type,Retouch Location,Retouch Units,Retouch Type,Retouch Delineation,Edge Location,Edge Units,Edge Type,Re-Used?,ReUse Sequence,Core Type,Platform Type,Platform Angle,Scar Types B,Scar Types BL,Scar Types F,Scar Sequence,Condition T,Condition U,Condition E,Cortex Type,Cortex Platform,Cortex Body,Perforation Diameter (mm),Perforation Depth (mm),Bowl Diameter (mm),Bowl Depth (mm),Basal Thickness (mm),Butt Breadth (mm),Butt Thickness (mm),Blade Length (mm),Ground Blank Type,Preforming - Cobble Splitter,Preforming - Drilling,Preforming - Flaking,Preforming - Grinding,Preforming - Pecking,Use Modification - Grinding,Use Modification - Incisions,Use Modification - Pecking,Use Modification - Hammering,Use Modification - Striations,Use Modification - Polishing,Reshaping - RePecking,Reshaping - Edge Sharpening,Reshaping - Chip Reshaping,Use-Surface Character,Plan Shape,Plan Shape Other,Longitudinal Section,Transverse Section,Comments,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Lithic Inventory data</title>
<script language="javascript">
  <!--
  function newWin(myurl) {
 
  bingo = window.open(myurl,'mywin','width=600,height=600,status=no,resizable=yes,scrollbars=yes');
  bingo.focus();
 
  }
 
  // -->
  </script>
</head>
<body>

 <h3>TAESP: Lithic Inventory Dataset</h3>

</cfoutput>

<cfparam name="URL.lithfindid" default="">

<cfif URL.lithfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="lithinv.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_lithinv
  where lithfindid = <cfqueryparam value="#URL.lithfindid#">
 </cfquery>


 <cfoutput>
      <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('lithcodes.htm')">Lithic codes</a> | <a href="lithinv.cfm">New Lithic Inventory search</a></p>


 <table cellpadding="2" cellspacing="2" class="taespdbt">
 
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "guno">
      <tr><th>#names[f]#</th>
      <td><a href="gu_record.cfm?guno=#res#">#res#</a></td></tr>
	
		 <cfelseif fieldlist[f] eq "lithfindid">
	<tr><th>#names[f]#</th>
	 <td><a href="lithfind_record.cfm?lithfindid=#res#">#res#</a></td></tr>

	
	 <cfelseif fieldlist[f] eq "chipblanktype">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##chipblanktype')">#res#</a></td></tr>
	 <cfelseif fieldlist[f] eq "dorscar">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##dorscar')">#res#</a></td></tr>
	 	 <cfelseif fieldlist[f] eq "">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "butttype">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##butttype')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "corttype">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##corttype')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "grdblanktype">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##grdblanktype')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "longsect">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##longsect')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "planshp">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##planshp')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "retloc">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##retloc')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "edloc">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##edloc')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "termtype">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##termtype')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "transect">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##transect')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "usesurfchar">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##usesurfchar')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "posino">
        <tr><th>#names[f]#</th>
         <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
		 
<cfelseif fieldlist[f] eq "catno" and #res# eq 'TCL273' or #res# eq 'TCL150' or #res# eq 'TCL192' or #res# eq 'TCL270' or #res# eq 'TCL271' or #res# eq 'TCL272' or #res# eq 'TCL498' or #res# eq 'TCL274' or #res# eq 'TCL275' or #res# eq 'TCL276' or #res# eq 'TCL277' or #res# eq 'TCL334' or #res# eq 'TCL359' or #res# eq 'TCL360' or #res# eq 'TCL361' or #res# eq 'TCL395' or #res# eq 'TCL396' or #res# eq 'TCL398' or #res# eq 'TCL411' or #res# eq 'TCL418'>
        <tr><th>#names[f]#</th>
		<td>#res#</td></tr>
         <tr><th>Thumbnail</th>
		 <td><a href="javascript:newWin('http://ads.ahds.ac.uk/catalogue/adsdata/taesp_ahrc_2007/ahds/dissemination/png/Artefacts_stone/#res#.png')" title="Select to view large image from digital archive"><img src="http://ads.ahds.ac.uk/catalogue/adsdata/taesp_ahrc_2007/ahds/dissemination/png/Artefacts_stone/thumbs/thumbnail_#res#.png" border=="0" /></a></td></tr>

 <cfelseif fieldlist[f] eq "pieceno">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "edunits">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
		 
<cfelseif fieldlist[f] eq "buttangint">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "buttangext">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>


     <cfelse>
   <tr><th>#names[f]#</th>
   <td>#res#</td></tr>
  </cfif>
 </cfif>

</cfloop>
 </table>

 </cfoutput>
</cfif>


<cfoutput>
<p><hr />

 <a href="javascript:history.go(-1)"  title="Last Page" class="button">
                        <span class="navigation">&nbsp;BACK&nbsp;</span></a>
 <a href="toc.htm"  title="Contents" class="button">
                        <span class="navigation">&nbsp;CONTENTS&nbsp;</span></a>
 <a href="/"  title="Internet Archaeology Home Page" class="button">
                        <span class="navigation">&nbsp;HOME&nbsp;</span></a>
 <a href="/contact/feedback.cfm"  title="Comments" class="button">
                        <span class="navigation">&nbsp;COMMENTS&nbsp;</span></a>
</p><p class="copy">&copy; Internet Archaeology/Authors
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/lithinv.cfm">http://intarch.ac.uk/journal/issue20/4/lithinv.cfm</a>
 <br />Last updated: Mon June 25 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
