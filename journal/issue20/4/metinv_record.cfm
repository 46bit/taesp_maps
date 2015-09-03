<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "invno,catno,ametfindid,categ,part,thick,pres,adhtype,comm,recby,recdate,entby,entdate">

<cfset names = "Inventory Number,Catalogue Number,Find ID,Category,Part of Furnace,Thickness (mm),Preservation,Adhesion Type,Comments,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Metal Inventory data</title>
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

 <h3>TAESP: Archaeometallurgical Inventory Dataset</h3>

</cfoutput>

<cfparam name="URL.ametfindid" default="">

<cfif URL.ametfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="metfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_metinv
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
	 <cfelseif fieldlist[f] eq "ametfindid">
	<tr><th>#names[f]#</th>
	 <td><a href="metfind_record.cfm?ametfindid=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "posino">
        <tr><th>#names[f]#</th>
         <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
		 
 <cfelseif fieldlist[f] eq "thick">
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/metinv.cfm">http://intarch.ac.uk/journal/issue20/4/metinv.cfm</a>
 <br />Last updated: Mon June 25 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
