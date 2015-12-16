B<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "siano,posino,puno,auno,layno,suno,buno,seno,batchno,nopiece,wgt,clay,fragrim,fraghand,fragbase,fraglid,fragbody,decor,func,chrottype,chrotper,pergroup,box,ctno,inv,pottfindid,throw,comm,recby,recdate,entby,entdate">

<cfset names = "SIA Number,POSI Number,POSI Unit Number,Archaeometallurgy Unit Number,Layer Number,SU Number,BU Number,Structural Element Number,Batch Number,Number of Pieces,Weight (gms),Clay,Fragment Rim,Fragment Handle,Fragment Base,Fragment Lid,Fragment Body,Decoration,Function,Chronotype Type,Chronotype Period,Period Group,Boxed,Circle Transect Number,Inventory,Pottery Finds ID,Thrown,Comments,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Pottery Finds data</title>
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

 <h3>TAESP: Pottery Finds Dataset</h3>

</cfoutput>

<cfparam name="URL.pottfindid" default="">

<cfif URL.pottfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="pottfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_pottfind
  where pottfindid = <cfqueryparam value="#URL.pottfindid#">
 </cfquery>

 <cfquery datasource="intarchits" name="inv">
  select pottfindid from taesp_20_pottinv
  where pottfindid = <cfqueryparam value="#URL.pottfindid#">
 </cfquery>

 <cfoutput>
 
 
        <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('potcodes.htm')">Pottery codes</a> | <a href="pottfind.cfm">New Pottery Find search</a></p>





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

<cfelseif fieldlist[f] eq "nopiece">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "fragrim">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "fraghand">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "fragbase">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "fraglid">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "fragbody">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "box">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "wgt">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "inv">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>


		 
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "posino">
        <tr><th>#names[f]#</th>
         <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "chrottype">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('potcodes.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "chrotper">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('potcodes.htm##period')">#res#</a></td></tr>
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
<cfelseif fieldlist[f] eq "func">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('potcodes.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "pottfindid">
        <tr><th>#names[f]#</th>
		<td>
		<cfif inv.RecordCount gt '0'>
		 <cfloop query="inv" endrow="1"><a href="pottinv.cfm?pottfindid=#res#" title="Link to inventory level record">#res#</a></cfloop>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/pottfind.cfm">http://intarch.ac.uk/journal/issue20/4/pottfind.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
