<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "posino,puno,suno,auno,layno,buno,seno,batchno,nopieces,cat,class,typechip,typegrd,mat,rawmatcol,condcomp,condbroke,heatalt,usesing,usere,usemult,multiclass,lithfindid,box,inv,recby,recdate,entby,entdate">

<cfset names = "POSI Number,POSI Unit Number,SU Number,AU Number,Layer Number,BU Number,Structural Element Number,Batch No,Number of Pieces,Category,Class,Type Chipped Stone,Type Ground Stone,Material,Raw Material Colour,Condition: Complete (no. of pieces),Condition: Broken (no. of pieces),Heat Altered,Use Single,Use Reused,Use Multiple,Multi Classes,Find ID,Box,Inventory Number,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Lithic Finds data</title>
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

 <h3>TAESP: Lithic Finds Dataset</h3>

</cfoutput>

<cfparam name="URL.lithfindid" default="">

<cfif URL.lithfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="lithfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_lithfind
  where lithfindid = <cfqueryparam value="#URL.lithfindid#">
 </cfquery>

  <cfquery datasource="intarchits" name="inv">
  select lithfindid from taesp_20_lithinv
  where lithfindid = <cfqueryparam value="#URL.lithfindid#">
 </cfquery>


 <cfoutput>

       <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('lithcodes.htm')">Lithic codes</a> | <a href="lithfind.cfm">New Lithic Find search</a></p>

 <table cellpadding="2" cellspacing="2" class="taespdbt">
 
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">
   <cfif fieldlist[f] eq "suno">
      <tr><th>#names[f]#</th>
      <td><a href="su_record.cfm?suno=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "posino">
	<tr><th>#names[f]#</th>
	 <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "cat">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##cat')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "class">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##class')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "typechip">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##blankretcore')">#res#</a></td></tr>
 <cfelseif fieldlist[f] eq "mat">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('lithcodes.htm##material')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>

<cfelseif fieldlist[f] eq "nopieces">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "condcomp">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "condbroke">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
		 
<cfelseif fieldlist[f] eq "usesing">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

 <cfelseif fieldlist[f] eq "usere">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "usemult">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>

<cfelseif fieldlist[f] eq "box">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
		 
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "lithfindid">
		<tr><th>#names[f]#</th>
        <td>
		<cfif inv.RecordCount gt '0'>
		 <cfloop query="inv" endrow="1"><a href="lithinv.cfm?lithfindid=#res#" title="Link to inventory level record">#res#</a></cfloop>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/lithfind.cfm">http://intarch.ac.uk/journal/issue20/4/lithfind.cfm</a>
 <br />Last updated: Mon June 25 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
