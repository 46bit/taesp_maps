<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "ttno,siano,posino,puno,auno,layno,suno,buno,seno,ametfindid,findno,categ,type,colour,desc_1,invch,comm,recby,recdate,entby,entdate">

<cfset names = "Transect Number,SIA Number,POSI Number,POSI Unit Number,AU Number,Layer Number,SU Number,BU Number,Structural Element Number,Find ID,Finds Number,Category,Type,Colour,Description,Inventory?,Comments,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Metal Finds data</title>
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

 <h3>TAESP: Archaemetallurgical Finds Dataset</h3>

</cfoutput>

<cfparam name="URL.ametfindid" default="">

<cfif URL.ametfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="metfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_metfind
  where ametfindid = <cfqueryparam value="#URL.ametfindid#">
 </cfquery>
 
  <cfquery datasource="intarchits" name="inv">
  select ametfindid from taesp_20_metinv
  where ametfindid = <cfqueryparam value="#URL.ametfindid#">
 </cfquery>


 <cfoutput>

         <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('metalcodes.htm')">Archaeometallurgy codes</a> | <a href="metfind.cfm">New Archaeometallurgy search</a></p>


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
 <cfelseif fieldlist[f] eq "type">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('metalcodes.htm##type')">#res#</a></td></tr>
 <cfelseif fieldlist[f] eq "categ">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('metalcodes.htm##categ')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "posino">
        <tr><th>#names[f]#</th>
         <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "suno">
        <tr><th>#names[f]#</th>
         <td><a href="su_record.cfm?suno=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "ametfindid">
		<tr><th>#names[f]#</th>
        <td>
		<cfif inv.RecordCount gt '0'>
		 <cfloop query="inv"><a href="metinv_record.cfm?ametfindid=#res#" title="Link to inventory level record">#res#</a></cfloop>
		 <cfelse>#res#</a></td></tr>	
		  </cfif>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/metfind.cfm">http://intarch.ac.uk/journal/issue20/4/metfind.cfm</a>
 <br />Last updated: Mon June 25 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
