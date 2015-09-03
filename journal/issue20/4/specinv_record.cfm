<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "invno,catno,specfindid,pieceno,thick,lgth,pres,muncodeext,muncodeint,muncodemat,comparanda,decorationsurfacetreatment,comm,recby,recdate,rerdby,rereaddate,entby,entdate">

<cfset names = "Inventory Number,Catalogue Number,SFind ID,Number of Pieces,Thickness (mm),Length (mm),Preservation,Munsell Code: Exterior,Munsell Code: Interior,Munsell Code: Material,Comparanda,Decoration Surface Treatment,Comments,Recorded By,Recorded Date,Re-Read By,Re-Read Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Special Finds Inventory data</title>
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

 <h3>TAESP: Special Finds Inventory Dataset</h3>

</cfoutput>

<cfparam name="URL.specfindid" default="">

<cfif URL.specfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="specfind.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_specinv
  where specfindid = <cfqueryparam value="#URL.specfindid#">
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
<cfelseif fieldlist[f] eq "date_1">
	<tr><th>#names[f]#</th>
	 <td><a href="javascript:newWin('potcodes.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
 <cfelseif fieldlist[f] eq "buno">
        <tr><th>#names[f]#</th>
         <td><a href="bu_record.cfm?buno=#res#">#res#</a></td></tr>
		  <cfelseif fieldlist[f] eq "specfindid">
        <tr><th>#names[f]#</th>
         <td><a href="specfind_record.cfm?sfindid=#res#">#res#</a></td></tr>
		 
 <cfelseif fieldlist[f] eq "material" and #res# eq 'Ter'>
        <tr><th>#names[f]#</th>
         <td>Terracotta</td></tr>		 

 <cfelseif fieldlist[f] eq "catno" and #res# eq 'TCS001' or #res# eq 'TCS003' or #res# eq 'TCS046' or #res# eq 'TCS004' or #res# eq 'TCS045' or #res# eq 'TCS048' or #res# eq 'TCS047' or #res# eq 'TCS049' or #res# eq 'TCS051' or #res# eq 'TCS050' or #res# eq 'TCS052' or #res# eq 'TCS053' or #res# eq 'TCS054' or #res# eq 'TCS055' or #res# eq 'TCS056' or #res# eq 'TCS057' >
         <tr><th>#names[f]#</th>
		<td>#res#</td></tr>
<tr><th>Thumbnail</th>
<td><a href="javascript:newWin('http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_special/#res#.png')" title="Select to view large image from digital archive">
<img src="http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_special/thumbs/thumbnail_#res#.png" border=="0" /></a></td></tr>	 

 
		 	
			 
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
