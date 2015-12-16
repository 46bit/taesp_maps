<cfsetting enablecfoutputonly="yes">

<cfset fieldlist = "buno,siano,posino,isz,vill,local,east,north,elev,source,shtmapcad,plotcad,shtplanvill,plotvill,shtmap5000,busum,locat,veg,access_1,assland,pott,tile,chipst,grdst,slag,lgth,width,hgt,level_1,levno,habit,occ,stab,found,walls,intplast,extplast,open,ceil,floors,roofs,eaves,bldgtype,structype,curruse,pastuse,strucname,specfeat,modalt,desc_1,ownshp,own,titledeedno,date_1,period1100,period1601,period1701,period1801,period1851,period1901,period1951,oralinfo,recby,recdate,entby,entdate">

<cfset names = "BU Number,SIA Number,POSI Number,Intensive Survey Zone,Village,Locality,Easting,Northing,Elevation,Source,Sheet Map Cadastral,Plot Cadastral,Village Plan,Plot Village,Sheet Map 1:5000,BU Summary,Location,Vegetation,Access,Associated Land,Pottery,Tile,Chipped Stone,Ground Stone,Slag,Length (m),Width (m),Height (m),Levels,Number of Levels,Habitable,Occupied,Stability,Foundation,Walls,Interior Plaster,Exterior Plaster,Openings,Ceiling,Floors,Roofs,Eaves,Building Type,Structure Type,Current Use,Past Use,Structure Name,Special Features,Moderations/Alterations,Description,Ownership,Owner,Title Deed Number,Date,Period 1100,Period 1601,Period 1701,Period 1801,Period 1851,Period 1901,Period 1951,Oral Information,Recorded By,Recorded Date,Entered By,Entered Date">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>


<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Building Unit Dataset</title>
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

 <h3>TAESP: Building Unit Dataset</h3>

</cfoutput>

<cfparam name="URL.buno" default="">

<cfif URL.buno eq "">
 <p>No ID number has been specified. Please return to the <a href="bu.cfm">search page</a>.</p>
<cfelse>

 <cfquery datasource="intarchits" name="fr">
  select * from taesp_20_bu
  where buno = <cfqueryparam value="#URL.buno#">
 </cfquery>
 
 <cfquery datasource="intarchits" name="ref">
  select ref from taesp_20_ref
  where buno = <cfqueryparam value="#URL.buno#">
 </cfquery>
 
 <cfquery datasource="intarchits" name="relbu">
  select relbu from taesp_20_relbu
  where buno = <cfqueryparam value="#URL.buno#">  
 </cfquery>

 <cfoutput>
<p class="mininav"><a href="javascript:history.go(-1)">Back</a> | <a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('bldgcodes.htm')">Building codes</a> | <a href="bu.cfm">New BU search</a></p>



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
<cfelseif fieldlist[f] eq "posino">
        <tr><th>#names[f]#</th>
         <td><a href="posi_record.cfm?posino=#res#">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "vill">
		<tr><th>#names[f]#</th>
         <td>#res#</td></tr>
        <tr><th>Related BUs</th><td><cfloop query="relbu"><a href="bu_record.cfm?buno=#relbu#">#relbu#</a>&nbsp;</cfloop></td></tr>
		 
<cfelseif fieldlist[f] eq "recby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>
<cfelseif fieldlist[f] eq "entby">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('pid.htm###res#')">#res#</a></td></tr>

<cfelseif fieldlist[f] eq "stab">
        <tr><th>#names[f]#</th>
         <td><a href="javascript:newWin('codeslist.htm##stab#res#')">#res#</a></td></tr>

<cfelseif fieldlist[f] eq "seanal">
        <tr><th>#names[f]#</th>
         <td>#res#</td></tr>		 
		 <tr><th>References</th><td><cfloop query="ref">
#ref#
</cfloop> [Link to <a href="javascript:newWin('biblio.htm')">Bibliography</a>]</td></tr>


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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/bu.cfm">http://intarch.ac.uk/journal/issue20/4/bu.cfm</a>
 <br />Last updated: Thur July 5 2007</p>



<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
