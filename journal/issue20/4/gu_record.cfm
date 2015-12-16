<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "guno,siano,ttno,isz,east,north,elev,substage,subst,morphage,morph,eros,surfstab,soilcol,soilwetdry,soiltext,soiltextcoarse,soiltextpercent,soilcarb,soilcov,soilcovpercent,slope,aspect,landuse,ipno,comm,recby,recdate,entby,entdate">

<cfset names = "GU Number,SIA Number,Transect Number,Intensive Survey Zone,Easting,Northing,Elevation (m),Substratum Age,Substratum,Morphostratigraphy Age,Morphostratigraphy,Erosion,Surface Stability,Soil Colour Code,Soil Colour Wet/Dry,Soil Texture,Soil Texture Coarse Term,Soil Texture Percentage,Soil Carbonate,Soil Cover,Soil Coverage (%),Slope (degrees),Aspect,Land Use,Image Print Number,Comments,Recorded By,Record Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Geomorphological Unit Dataset</title>
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

 <h3>TAESP: Geomorphological Unit Dataset</h3>

</cfoutput>

<cfparam name="URL.guno" default="">

<cfif URL.guno eq "">
 <p>No ID number has been specified. Please return to the <a href="gu.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_gu
  where guno = <cfqueryparam value="#URL.guno#">
 </cfquery>

 <cfquery datasource="intarchits" name="posi">
  select posino from taesp_20_guposi
  where guno = <cfqueryparam value="#URL.guno#">
 </cfquery>
 
<cfquery datasource="intarchits" name="rf">
  select rtgfeat from taesp_20_gurf
  where guno = <cfqueryparam value="#URL.guno#">
 </cfquery>


 <cfoutput>
   <p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('codeslist.htm')">Geo codes</a> | <a href="gu.cfm">New GU search</a></p>



 <table cellpadding="2" cellspacing="2" class="taespdbt">
 <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
  <cfset res = evaluate("fr.#fieldlist[f]#")>
  <cfif res neq "">

<cfif fieldlist[f] eq "images">
      <tr><th>#names[f]#</th>
      <td><a href="javascript:newWin('images/#res#')"><img src="images/th#res#" border=="0"></a></td></tr>
   </cfif>
   <cfif fieldlist[f] eq "siano">
         <tr><th>#names[f]#</th>
         <td><a href="sia_record.cfm?sianumber=#res#">#res#</a></td></tr>
   <cfelseif fieldlist[f] eq "guno">
         <tr><th>#names[f]#</th>
         <td>#res#</td></tr>
<tr><th>POSI Number</th><td><cfloop query="posi">
<a href="posi_record.cfm?posino=#URLEncodedFormat(posino)#">#posino#</a>
</cfloop></td></tr>
		 
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "eros">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "morph">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "morphage" and #res# eq 'H'>
        <tr><th>#names[f]#</th>
         <td>Holocene</td></tr>	
<cfelseif fieldlist[f] eq "morphage" and #res# eq 'M'>
        <tr><th>#names[f]#</th>
         <td>Modern</td></tr>	
<cfelseif fieldlist[f] eq "morphage" and #res# eq 'P'>
        <tr><th>#names[f]#</th>
         <td>Pleistocene</td></tr>	
<cfelseif fieldlist[f] eq "morphage" and #res# eq 'Q'>
        <tr><th>#names[f]#</th>
         <td>Quaternary</td></tr>	
<cfelseif fieldlist[f] eq "soilcarb">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "soilcov">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "soiltext">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "soiltextcoarse">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td></tr>		 
<cfelseif fieldlist[f] eq "subst">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td>		</tr> 
<cfelseif fieldlist[f] eq "substage" and #res# eq 'H'>
        <tr><th>#names[f]#</th>
         <td>Holocene</td></tr>	
<cfelseif fieldlist[f] eq "substage" and #res# eq 'M'>
        <tr><th>#names[f]#</th>
         <td>Modern</td></tr>	
<cfelseif fieldlist[f] eq "substage" and #res# eq 'P'>
        <tr><th>#names[f]#</th>
         <td>Pleistocene</td></tr>	
<cfelseif fieldlist[f] eq "substage" and #res# eq 'Q'>
        <tr><th>#names[f]#</th>
         <td>Quaternary</td></tr>	
<cfelseif fieldlist[f] eq "surfstab">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td>	</tr>	 
 <cfelseif fieldlist[f] eq "landuse">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm###res#')">#res#</a></td>	</tr>
		 <tr><th>Retaining Features</th><td><cfloop query="rf"><a href="javascript:newWin('bldgcodes.htm###rtgfeat#')">#rtgfeat#</a>&nbsp;</cfloop></td></tr>

 <cfelseif fieldlist[f] eq "elev">
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/gu.cfm">http://intarch.ac.uk/journal/issue20/4/gu.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
