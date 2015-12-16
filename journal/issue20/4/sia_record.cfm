<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "sianumber,vill,loc,easting,northing,elevation,source,aerial,summary,environment,topo,pott,tile,chipst,grdst,archit,slag,descriptionmaterialculture,descriptionsia,recby,recdate,entby,entdate">

<cfset names = "SIA number,Village,Locality,Easting,Northing,Elevation (m),Source,Aerial Photograph,Summary,Environment,Topography (metres ASL),Pottery,Tile,Chipped Stone,Ground Stone,Architecture,Slag,Material Culture,Description SIA,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Special Interest Area data</title>
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

 <h3>TAESP: Special Interest Area Dataset</h3>

</cfoutput>

<cfparam name="URL.sianumber" default="">

<cfif URL.sianumber eq "">
 <p>No ID number has been specified. Please return to the <a href="sia.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_sia
  where sianumber = <cfqueryparam value="#URL.sianumber#">
 </cfquery>

 <cfquery datasource="intarchits" name="ref">
  select ref from taesp_20_ref
  where siano = <cfqueryparam value="#URL.sianumber#">
 </cfquery>
 
 <cfquery datasource="intarchits" name="period">
  select period from taesp_20_siaperiod
  where siano = <cfqueryparam value="#URL.sianumber#">
 </cfquery>
 
 <cfoutput>

 
        <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="sia.cfm">New SIA search</a></p>



 <table cellpadding="2" cellspacing="2" class="taespdbt">
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "illust">
      <tr><th>#names[f]#</th>
         <td><a href="pid.htm###res#">#res#</a></td></tr>
  </cfif>
   <cfif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="pid.htm###res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
         <tr><th>#names[f]#</th>
         <td><a href="pid.htm###res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "environment">
         <tr><th>#names[f]#</th>
         <td>#res#</td></tr>
		 <tr><th>References</th><td>
		 <cfif ref.RecordCount gt '0'>
		 <cfloop query="ref">
#ref#
</cfloop> [Link to <a href="javascript:newWin('biblio.htm')">Bibliography</a>]</td></tr>
		<cfelse></td></tr>
</cfif>

<cfelseif fieldlist[f] eq "summary">
         <tr><th>#names[f]#</th>
         <td>#res#</td></tr>
		 <tr><th>Period</th><td><cfloop query="period">
		 <a href="javascript:newWin('speccodes.htm###period#')">#period#</a> </cfloop></td></tr>

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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/sia.cfm">http://intarch.ac.uk/journal/issue20/4/sia.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
