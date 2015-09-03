<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "invno,catno,pottfindid,pieceno,fragr,fragh,fragba,fragl,fragbo,thick,diaval,diarbo,diaintext,pres,munex,munint,munmat,text,hard,fract,sort,voidtype,voidcomm,decsurftreat,comm,compa,recby,recdate,entby,entdate">

<cfset names = "Inventory Number,Catalogue Number,Pottery Find ID,Number of Pieces,Fragment Type - Rim,Fragment Type - Handle,Fragment Type - Base,Fragment Type - Lid,Fragment Type - Body,Thickness (mm),Diameter Value (mm),Diameter: Rim/Base/Other,Diameter: Internal/External,Preservation,Munsell Code: Exterior,Munsell Code: Interior,Munsell Matrix,Texture,Hardness,Fracture,Sorting,Void Type,Void Type Comments,Decoration Surface Treatment,Comments,Comparanda,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
<link rel="stylesheet" href="/style/journal.css" type="text/css">
<title>Internet Archaeol. 20. Given et al. Pottery Inventory</title>

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

 <h3>TAESP: Pottery Inventory Dataset</h3>

</cfoutput>

<cfparam name="URL.pottfindid" default="">

<cfif URL.pottfindid eq "">
 <p>No ID number has been specified. Please return to the <a href="pottinv.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_pottinv
  where pottfindid = <cfqueryparam value="#URL.pottfindid#">
 </cfquery>


 <cfoutput>
 
        <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('potcodes.htm')">Pottery codes</a> | <a href="pottinv.cfm">New Pottery Inventory search</a></p>

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
<cfelseif fieldlist[f] eq "compa" and #res# neq '0'>
	<tr><th>#names[f]#</th>
	 <td>#res# [Go to <a href="biblio.htm">bibliography</a>]</td></tr>

<cfelseif fieldlist[f] eq "pieceno">
        <tr><th>#names[f]#</th>
         <td>#numberformat(res,'_______')#</td></tr>
<cfelseif fieldlist[f] eq "thick">
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
<cfelseif fieldlist[f] eq "pottfindid">
        <tr><th>#names[f]#</th>
         <td><a href="pottfind_record.cfm?pottfindid=#res#" title="Link to Finds level record">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "catno">
        <tr><th>#names[f]#</th>
		<td>#res#</td></tr>
<tr><th>Thumbnail</th>
<td>
<!--- cfif FileExists('http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/#res#.png') --->
<a href="javascript:newWin('http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/#res#.png')" title="Select to view large image from digital archive"><img src="http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/thumbs/thumbnail_#res#.png"></a>
<!--- cfelse>
<img src="http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/thumbs/thumbnail_#res#.png">
</cfif --->
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/pottinv.cfm">http://intarch.ac.uk/journal/issue20/4/pottinv.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
