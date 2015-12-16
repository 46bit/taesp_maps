<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "posino,siano,isz,vill,local,east,north,elev,source,aerial,shtmap5000,shtplanvill,plotvill,teamlead,refs,summ,topo,veg,access_1,descenv,pott,tile,chipst,grdst,slag,archit,visib,descposi,cond,settchk,chchchk,buildchk,brdgchk,chdmchk,tfchk,tombchk,kilnchk,othchk,rockchk,minechk,botchk,extchk,roadchk,pottchk,lithchk,viewchk,geochk,prehchk,iachk,hrchk,mochk,modchk,slagchk,shrichk,entby,entdate,recby,recdate">

<cfset names = "POSI Number,SIA Number,Intensive Survey Zone,Village,Locality,Easting,Northing,Elevation (m),Source,Aerial Photograph,Sheet Map 1:5000,Village Plan,Plot Village,Team Leader,References,Summary,Topography,Vegetation,Access,Description Environment,Pottery,Tile,Chipped Stone,Ground Stone,Slag,Architecture,Visibility (%),Description POSI,Condition,Settlement,Church,Building,Bridge,Check Dam,Threshing Floor,Tomb,Kiln,Other Structure,Rock,Mine/Adit,Botany,Extraction,Road,Pottery,Lithics,View,Geomorphology,Prehistoric,Iron Age,Hellenistic/Roman,Medieval/Ottoman,Modern,Slag,Shrine,Entered By,Entered Date,Recorded By,Recorded Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Places of Special Interest Data</title>
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

<h3>TAESP: Places of Special Interest Dataset</h3>
 
</cfoutput>

<cfparam name="URL.posino" default="">

<cfif URL.posino eq "">
 <p>No ID number has been specified. Please return to the <a href="su.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_posi
  where posino = <cfqueryparam value="#URL.posino#">
 </cfquery>
 
 <cfquery datasource="intarchits" name="gu">
  select guno from taesp_20_guposi
  where posino = <cfqueryparam value="#URL.posino#">
 </cfquery>
 
 <cfquery datasource="intarchits" name="ref">
  select ref from taesp_20_ref
  where posino = <cfqueryparam value="#URL.posino#">
 </cfquery>

 <cfoutput>
 
         <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="posi.cfm">New POSI search</a></p>


 <table cellpadding="2" cellspacing="2" class="taespdbt">

 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "siano">
         <tr><th>#names[f]#</th>
         <td><a href="sia_record.cfm?sianumber=#res#">#res#</a></td></tr>
		 
   <cfelseif fieldlist[f] eq "entby">
         <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>

<cfelseif fieldlist[f] eq "posino">
         <tr><th>#names[f]#</th>
         <td>#res#</td></tr>
<tr><th>GU number</td><td><cfloop query="gu">
<a href="gu_record.cfm?guno=#URLEncodedFormat(guno)#">#guno#</a>
</cfloop></td></tr>

<cfelseif fieldlist[f] eq "elev">
         <tr><th>#names[f]#</th>
         <td>#res#</td></tr>
<tr><th>References</th><td><cfloop query="ref">
#ref#
</cfloop> [Link to <a href="javascript:newWin('biblio.htm')">Bibliography</a>]</td></tr>

   <cfelseif fieldlist[f] eq "recby">
         <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
   <cfelseif fieldlist[f] eq "teamlead">
         <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "visib">
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/posi.cfm">http://intarch.ac.uk/journal/issue20/4/posi.cfm</a>
 <br />Last updated: Thur July 5 2007</p>

<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
