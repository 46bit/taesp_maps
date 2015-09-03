<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "suno,guno,siano,ttno,isz,easting,northing,elevation,area,teamlead,groundvisibility,background,potterycount,tilecount,potterytilecollected,potterytilebags,chippedstonecount,chippedstonecollected,chippedstonebags,groundstonecount,groundstonecollected,groundstonebags,glasscount,glasscollected,glassbags,slagcount,slagcollected,slagbags,furnacematerialcount,furnacematerialcollected,furnacematerialbags,shotguncartridgescount,metalcount,metalcollected,metalbags,comment_1,lines,recby,recordeddate,entby,entereddate">

<cfset names = "SU Number,GU Number,SIA Number,Transect Number,Intensive Survey Zone,Easting,Northing,Elevation (m),Area (m sq),Team Leader,Ground Visibility (%),Background,Pottery Count,Tile Count,Pottery and Tile Collected,Pottery and Tile Bags,Chipped Stone Count,Chipped Stone Collected,Chipped Stone Bags,Ground Stone Count,Ground Stone Collected,Ground Stone Bags,Glass Count,Glass Collected,Glass Bags,Slag Count,Slag Collected,Slag Bags,Furnace Material Count,Furnace Material Collected,Furnace Material Bags,Shotgun Cartridges Count,Metal Count,Metal Collected,Metal Bags,Comments,Lines Walked,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Survey unit data</title>
<script language="javascript">
  <!--
  function newWin(myurl) {
 
  bingo = window.open(myurl,'mywin','width=600,height=400,status=no,resizable=yes,scrollbars=yes');
  bingo.focus();
 
  }
 
  // -->
  </script>
</head>
<body>

 <h3>TAESP: Survey Unit Dataset</h3>

</cfoutput>

<cfparam name="URL.suno" default="">

<cfif URL.suno eq "">
 <p>No ID number has been specified. Please return to the <a href="su.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_su
  where suno = <cfqueryparam value="#URL.suno#">
 </cfquery>

 <cfoutput>

         <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('sucodes.htm')">Survey Unit codes</a> | <a href="su.cfm">New SU search</a></p>


 <table cellpadding="2" cellspacing="2" class="taespdbt">
 
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "guno">
      <tr><th>#names[f]#</th>
      <td><a href="gu_record.cfm?guno=#res#">#res#</a></td></tr>
   <cfelseif fieldlist[f] eq "siano">
	<tr><th>#names[f]#</th>
	 <td><a href="sia_record.cfm?sianumber=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
        <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "teamlead">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "background">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('sucodes.htm###res#')">#numberformat(res,'_________')#</a></td></tr>
 <cfelseif fieldlist[f] eq "potterycount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>


 <cfelseif fieldlist[f] eq "tilecount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "potterytilecollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "potterytilebags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "chippedstonecount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "chippedstonecollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "chippedstonebags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "groundstonecount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "groundstonecollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "groundstonebags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "glasscount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "glasscollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "glassbags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "slagcount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "slagcollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "slagbags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "furnacematerialcount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "furnacematerialcollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "furnacematerialbags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "shotguncartridgescount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "metalcount">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "metalcollected">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>

 <cfelseif fieldlist[f] eq "metalbags">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
 <cfelseif fieldlist[f] eq "groundvisibility">
      <tr><th>#names[f]#</th>
      <td>#numberformat(res,'_________')#</td></tr>
	  
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/su.cfm">http://intarch.ac.uk/journal/issue20/4/su.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
