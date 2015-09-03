<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "posino,puno,auno,layno,suno,buno,seno,sfindid,batchno,box,nopiece,weight,material,clay,type,form,period,date_1,description,decoration,inv,throw,recby,recdate,entby,entdate">

<cfset names = "POSI Number,POSI Unit Number,AU Number,Layer Number,SU Number,BU Number,Structural Element Number,SFind ID,Batch Number,Box,Number of Pieces,Weight (gms),Material,Clay,Type,SF Form Code,Period,Date,Description,Decoration,Inventory,Number Discarded,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Special Finds data</title>
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

 <h3>TAESP: Special Finds Dataset</h3>

</cfoutput>

<cfparam name="URL.sfindid" default="">

<cfif URL.sfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="specfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_specfind
  where sfindid = <cfqueryparam value="#URL.sfindid#">
 </cfquery>


 <cfquery datasource="intarchits" name="inv">
  select catno from taesp_20_specinv
  where specfindid = <cfqueryparam value="#URL.sfindid#">
 </cfquery>
 
 <cfoutput>

         <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('speccodes.htm')">Special Finds codes</a> | <a href="specfind.cfm">New Special Finds search</a></p>


 <table cellpadding="2" cellspacing="2" class="taespdbt">
 
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "suno">
      <tr><th>#names[f]#</th>
      <td><a href="su_record.cfm?suno=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "clay">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('speccodes.htm##clay')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "type">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('speccodes.htm##type')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "form">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('speccodes.htm##form')">#res#</a></td></tr>		 
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
 <cfelseif fieldlist[f] eq "buno">
        <tr><th>#names[f]#</th>
         <td><a href="bu_record.cfm?buno=#res#">#res#</a></td></tr>
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Ter'>
        <tr><th>#names[f]#</th>
         <td>Terracotta</td></tr>		 
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Fai'>
        <tr><th>#names[f]#</th>
         <td>Faience</td></tr>		 
 <cfelseif fieldlist[f] eq "material" and #res# eq 'mor'>
        <tr><th>#names[f]#</th>
         <td>Mortar</td></tr>		 
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Pls'>
        <tr><th>#names[f]#</th>
         <td>Plaster</td></tr>		 
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Gla'>
        <tr><th>#names[f]#</th>
         <td>Glass</td></tr>			 		
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Met'>
        <tr><th>#names[f]#</th>
         <td>Metal</td></tr>			 		
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Stn'>
        <tr><th>#names[f]#</th>
         <td>Stone</td></tr>			 		
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Wood'>
        <tr><th>#names[f]#</th>
         <td>Wood</td></tr>
		 <cfelseif fieldlist[f] eq "clay" and #res# eq '-'>
        <tr><th>#names[f]#</th>
         <td>Anomaly</td></tr>
<cfelseif fieldlist[f] eq "clay" and #res# eq 'F'>
        <tr><th>#names[f]#</th>
         <td>Ferrous</td></tr>
<cfelseif fieldlist[f] eq "clay" and #res# eq 'K'>
        <tr><th>#names[f]#</th>
         <td>Kaolin</td></tr>
<cfelseif fieldlist[f] eq "clay" and #res# eq 'M'>
        <tr><th>#names[f]#</th>
         <td>Mixed</td></tr>
<cfelseif fieldlist[f] eq "clay" and #res# eq 'SS'>
        <tr><th>#names[f]#</th>
         <td>Self slipped</td></tr>			 		
 <cfelseif fieldlist[f] eq "sfindid">
        <tr><th>#names[f]#</th>
		 <td>
		 <cfif inv.RecordCount gt '0'>
		 <cfloop query="inv" endrow="1"><a href="specinv.cfm?specfindid=#res#">#res#</a></cfloop>
		 <cfelse>
		 #res#
		 </cfif>
		 
		 </td></tr>			 	 
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/specfind.cfm">http://intarch.ac.uk/journal/issue20/4/specfind.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
