<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "posino,siano,isz,vill,settchk,chchchk,buildchk,brdgchk,chdmchk,tfchk,tombchk,kilnchk,othchk,rockchk,minechk,botchk,extchk,roadchk,pottchk,lithchk,viewchk,geochk,prehchk,iachk,hrchk,mochk,modchk,slagchk,shrichk,access_1,aerial,archit,chipst,cond,descenv,descposi,east,elev,entby,entdate,grdst,local,north,plotvill,pott,recby,recdate,refs,shtmap5000,shtplanvill,sketchchk,slag,source,summ,teamlead,tile,topo,veg,visib">

<cfset names = "POSI Number,SIA Number,Intensive Survey Zone,Village,Settlement,Church,Building,Bridge,Check Dam,Threshing Floor,Tomb,Kiln,Other Structure,Rock,Mine,Botany,Extraction,Road,Pottery,Lithics,View,Geomorphoplogy,Prehistoric,Iron Age,Hellenistic/ Roman,Medieval/Ottoman,Modern,Slag,Shrine,Access,Aerial Photograph,Architecture,Chipped Stone,Condition,Description Environment,Description POSI,Easting,Elevation,Entered By,Entered Date,Ground Stone,Localities,Northing,Plot Village,Pottery,Recorded By,Recorded Date,References,Sheet Map 1:5000,Sheet Plan Village,Sketch,Slag,Source,Summary,Team Leader,Tile,Topography,Vegetation,Visibility">

<cfset field = "d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "posino,isz,summ">

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Places of Special Interest data</title>
<script language="javascript">
  <!--
  function newWin(myurl) {
  bingo = window.open(myurl,'mywin','width=600,height=500,status=no,resizable=yes,scrollbars=yes');
  bingo.focus();
   }
 
  // -->
  </script>

</head>
<body>

<h3>TAESP: Places of Special Interest Dataset</h3>

</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.access_1') AND not isdefined('URL.aerial')> AND not isdefined('URL.archit')> AND not isdefined('URL.botchk')> AND not isdefined('URL.brdgchk')> AND not isdefined('URL.buildchk')> AND not isdefined('URL.chchchk')> AND not isdefined('URL.chdmchk')> AND not isdefined('URL.chipst')> AND not isdefined('URL.cond')> AND not isdefined('URL.descenv')> AND not isdefined('URL.descposi')> AND not isdefined('URL.east')> AND not isdefined('URL.elev')> AND not isdefined('URL.entby')> AND not isdefined('URL.entdate')> AND not isdefined('URL.extchk')> AND not isdefined('URL.geochk')> AND not isdefined('URL.grdst')> AND not isdefined('URL.hrchk')> AND not isdefined('URL.iachk')> AND not isdefined('URL.isz')> AND not isdefined('URL.kilnchk')> AND not isdefined('URL.lithchk')> AND not isdefined('URL.local')> AND not isdefined('URL.minechk')> AND not isdefined('URL.mochk')> AND not isdefined('URL.modchk')> AND not isdefined('URL.north')> AND not isdefined('URL.othchk')> AND not isdefined('URL.plotvill')> AND not isdefined('URL.posino')> AND not isdefined('URL.pott')> AND not isdefined('URL.pottchk')> AND not isdefined('URL.prehchk')> AND not isdefined('URL.recby')> AND not isdefined('URL.recdate')> AND not isdefined('URL.refs')> AND not isdefined('URL.roadchk')> AND not isdefined('URL.rockchk')> AND not isdefined('URL.settchk')> AND not isdefined('URL.shrichk')> AND not isdefined('URL.shtmap5000')> AND not isdefined('URL.shtplanvill')> AND not isdefined('URL.siano')> AND not isdefined('URL.sketchchk')> AND not isdefined('URL.slag')> AND not isdefined('URL.slagchk')> AND not isdefined('URL.source')> AND not isdefined('URL.summ')> AND not isdefined('URL.teamlead')> AND not isdefined('URL.tfchk')> AND not isdefined('URL.tile')> AND not isdefined('URL.tombchk')> AND not isdefined('URL.topo')> AND not isdefined('URL.veg')> AND not isdefined('URL.viewchk')> AND not isdefined('URL.vill')> AND not isdefined('URL.visib')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="access_1list">
  select unique access_1 from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="aeriallist">
  select unique aerial from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="architlist">
  select unique archit from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="botchklist">
  select unique botchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="brdgchklist">
  select unique brdgchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="buildchklist">
  select unique buildchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="chchchklist">
  select unique chchchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="chdmchklist">
  select unique chdmchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="chipstlist">
  select unique chipst from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="condlist">
  select unique cond from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="descenvlist">
  select unique descenv from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="descposilist">
  select unique descposi from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="eastlist">
  select unique east from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="elevlist">
  select unique elev from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="extchklist">
  select unique extchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="geochklist">
  select unique geochk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="grdstlist">
  select unique grdst from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="hrchklist">
  select unique hrchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="iachklist">
  select unique iachk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="iszlist">
  select unique isz from taesp_20_posi order by isz
</cfquery>

<cfquery datasource="intarchits" name="kilnchklist">
  select unique kilnchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="lithchklist">
  select unique lithchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="locallist">
  select unique local from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="minechklist">
  select unique minechk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="mochklist">
  select unique mochk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="modchklist">
  select unique modchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="northlist">
  select unique north from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="othchklist">
  select unique othchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="plotvilllist">
  select unique plotvill from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="posinolist">
  select unique posino from taesp_20_posi order by posino
</cfquery>

<cfquery datasource="intarchits" name="pottlist">
  select unique pott from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="pottchklist">
  select unique pottchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="prehchklist">
  select unique prehchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="refslist">
  select unique refs from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="roadchklist">
  select unique roadchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="rockchklist">
  select unique rockchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="settchklist">
  select unique settchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="shrichklist">
  select unique shrichk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="shtmap5000list">
  select unique shtmap5000 from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="shtplanvilllist">
  select unique shtplanvill from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="sianolist">
  select unique siano from taesp_20_posi order by siano
</cfquery>

<cfquery datasource="intarchits" name="sketchchklist">
  select unique sketchchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="slaglist">
  select unique slag from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="slagchklist">
  select unique slagchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="sourcelist">
  select unique source from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="summlist">
  select unique summ from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="teamleadlist">
  select unique teamlead from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="tfchklist">
  select unique tfchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="tilelist">
  select unique tile from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="tombchklist">
  select unique tombchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="topolist">
  select unique topo from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="veglist">
  select unique veg from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="viewchklist">
  select unique viewchk from taesp_20_posi
</cfquery>

<cfquery datasource="intarchits" name="villlist">
  select unique vill from taesp_20_posi order by vill
</cfquery>

<cfquery datasource="intarchits" name="visiblist">
  select unique visib from taesp_20_posi
</cfquery>


  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>


  <form name="query" method="post">
   <table cellpadding="2" cellspacing="2" class="taespdbt">
   <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
    <cfif field[f] neq 0>
     <!--- cfset chk = "">
     <cfif find(fieldlist[f],default_fields) neq 0>
      <cfset chk = "checked">
     </cfif --->
     <tr><th>
      <!--- input type="checkbox" name="display" value="#fieldlist[f]#" #chk# ---> #names[f]#</th>

     <cfif field[f] eq "t">
      <td><input type="text" name="#fieldlist[f]#" size="20"></td>
     <cfelseif field[f] eq "d">
      <td><select name="#fieldlist[f]#">
         <option value="">All</option>
        <cfloop query="#fieldlist[f]#list">
       <cfset val = evaluate("#fieldlist[f]#list.#fieldlist[f]#")>
	   <option value="#val#">#val#</option>
      </cfloop>
      </select></td>
     </cfif>
    </cfif><!--- end of if = 0 --->
    </tr>
   </cfloop>
   <tr>
   <td><input type="reset" name="clear" value="Clear selection"></td>
   <td><input type="submit" name="query" value="Display selected records">
   &nbsp; Records per page &nbsp;<input type="text" name="stepsize" value="25" size="4">
   </td>
   </tr>
   </table>
  </form>
  </cfoutput>


 <!--- ##################################################################### --->
 <!---                            the results table                          --->
 <!--- ##################################################################### --->

 <cfelse>
 <cfparam name="search" default="yes">

  <!--- DEFAULT VALUES --->
  <!--- loop through the query of variables and assign values --->
  <cfloop index="u" list= "#ArrayToList(fieldlist)#,display,stepsize">
   <cfif u eq "display">
    <cfparam name="mydisplay" default = "#default_fields#"> 
  <cfelseif u eq "stepsize">
    <cfparam name="mystepsize" default = 25>
   <cfelse>
    <cfparam name="my#u#" default="">
   </cfif>
   <cfif isdefined("URL.#u#")>
    <cfset "my#u#" = evaluate("URL.#u#")>
   <cfelseif isdefined("form.#u#")>
    <cfset "my#u#" = evaluate("form.#u#")>
   </cfif>
  </cfloop>

  <cfif not isdefined('form.where')><!--- if first time to results page --->
   <!--- set up query --->
   <cfset where = "">
   <cfset qstr = "">
   <cfloop index="f" from="1" to="#arrayLen(fieldlist)#">
    <!--- get the query term --->
    <cfset term = evaluate("my#fieldlist[f]#")>
    <cfif term neq "">
    <!--- split it according to & or | --->
    <cfif find("&", term)>
     <cfset qterm = listToArray(term, "&")>
     <cfset type = "and">
    <cfelseif find("|", term)>
     <cfset qterm = listToArray(term, "|")>
     <cfset type="or">
    <cfelseif find("..", term)>
     <cfset qterm = listToArray(term, "..")>
     <cfset type="range">
    <cfelseif field[f] eq "d">
     <cfset qterm = arrayNew(1)>
     <cfset qterm[1] = term>
     <cfset type="d">
    <cfelse>
     <cfset qterm = arrayNew(1)>
     <cfset qterm[1] = term>
     <cfset type="">
    </cfif>

    <!--- loop through each bit of the query term --->
    <cfset thisw = "">
    <!--- if a range --->
    <cfif type eq "range">
     <cfif ftype[f] eq "n">
      <cfset thisw = " #fieldlist[f]# between #qterm[1]# and #qterm[2]# ">
     <cfelse>
      <cfset search = "no">
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='posi.cfm'>new search</a>.">
     </cfif>
    <!--- if not range --->
    <cfelse>
    <cfloop index="t" from="1" to="#arrayLen(qterm)#">
     <cfset qt = "#trim(lcase(qterm[t]))#">
     <cfif qt eq "is not null">
      <cfset op = "">
     </cfif>
     <cfif find("<=", qt) neq 0>
      <cfset op = "<=">
      <cfset qt = trim(replace(qt, "<=", "", "one"))>
     </cfif>
     <cfif find(">=", qt) neq 0>
      <cfset op = ">=">
      <cfset qt = trim(replace(qt, ">=", "", "one"))>
     </cfif>
     <cfif REfind("<>|!=", qt) neq 0>
      <cfset op = "not like">
      <cfset qt = trim(replace(qt, "<>", "", "one"))>
      <cfset qt = trim(replace(qt, "!=", "", "one"))>
      <cfset qt = "%#qt#%">
     </cfif>
     <cfif find(">", qt) neq 0>
      <cfset op = ">">
      <cfset qt = trim(replace(qt, ">", "", "one"))>
     </cfif>
     <cfif find("<", qt) neq 0>
      <cfset op = "<">
      <cfset qt = trim(replace(qt, "<", "", "one"))>
     </cfif>
     <cfif find("==", qt) neq 0>
      <cfset op = "=">
      <cfset qt = trim(replace(qt, "==", "", "one"))>
     </cfif>
     <cfif find("{", qt) neq 0>
      <cfset qt = trim(replace(qt, "{", "", "one"))>
      <cfset qt = "#qt#%">
     </cfif>
     <cfif find("}", qt) neq 0>
      <cfset qt = trim(replace(qt, "}", "", "one"))>
      <cfset qt = "%#qt#">
     </cfif>
    
	 <cfif not isdefined('op')>
     <cfset op = "like">
      <cfif find("%", qt) eq 0>
       <cfset qt = "#qt#">
	  </cfif>

     </cfif><!--- end of if not range of values --->

     <!--- put quotes round the text fields --->
     <cfif ftype[f] eq "t">
      <cfset qt = "'#qt#'">
      <cfif REfind("<|>", op) neq 0>
       <cfoutput><p>You appear to have used a numeric operator (#op#) on a text field, so you might get unexpected results.</p> </cfoutput>
      </cfif>
     </cfif>
     <cfset thisw = thisw & " lower(#fieldlist[f]#) #op# #qt# ">
     <!--- stick and/or in --->
     <cfif t lt arrayLen(qterm)>
      <cfset thisw = thisw & " #type# ">
     </cfif>
    </cfloop>
   </cfif>
   <!--- end of loop through qterm --->

   <cfif arrayLen(qterm) le 1>
    <cfset where = where & " and #thisw# ">
   <cfelse>
    <cfset where = where & " and (#thisw#) ">
   </cfif>
   <cfset myq = " #names[f]# - " & evaluate("my#fieldlist[f]#")>
   <cfset qstr = listappend(qstr, myq)>

  </cfif>
  </cfloop>
  <!--- end of loop through fields --->

  <!--- replace first bit of the where clause with 'where' --->
  <cfif where neq "">
   <cfset wlen = len(where) - 4>
   <cfset where = " where " & right(where, wlen)>
   <cfset qstr = replace(qstr, ",", " and ", "all")>
  </cfif>

 <cfelse><!--- if not first page of results --->
  <cfset where = form.where>
  <cfset qstr = form.qstr>
 </cfif>

<cfif search eq "yes">
 <!--- to print query for debugging uncomment the lines below --->
 <!--- cfoutput>
 <p>
   select posino, #mydisplay# from taesp_20_posi
   #preserveSingleQuotes(where)#
 </p>
</cfoutput --->

 <cftry>
  <cfquery datasource="intarchits" name="getcat">
   select posino, #mydisplay# from taesp_20_posi
   #preserveSingleQuotes(where)#

  </cfquery>


  <cfcatch type="database">
   <cfoutput>
   <p>There was an error retrieving your query</p>
   <p>Please email the <a href="mailto:editor@intarch.ac.uk">editor</a></p>
   </cfoutput>
  <cfabort>
  </cfcatch>
 </cftry>

  <!--- make paging additions if buttons are pressed --->
  <cfparam name="totalrecs" default = #getcat.recordcount#>
  <cfparam name="start" default = 1>
  <cfif isdefined('form.nav')>
   <cfif nav eq "previous #mystepsize# records">
    <cfset start = start - mystepsize>
     <cfif start lt 1>
      <cfset start = 1>
     </cfif>
   </cfif>
   <cfif nav eq "next #mystepsize# records">
    <cfset start = start + mystepsize>
   </cfif>
  </cfif>

  <!--- print table of results --->
  <cfoutput>
   <h4>Results</h4>

        <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="posi.cfm">New POSI search</a></p>

   <cfif totalrecs gt 0>

   <cfif qstr eq ""><cfset qstr = "<i>all records</i>"></cfif>
   <cfset listto = start + mystepsize - 1>
   <cfif listto gt totalrecs>
    <cfset listto = totalrecs>
   </cfif>

   <p>Records returned  - <b>#start# - #listto# of #totalrecs#</b> for <i>#qstr#</i></p>
   <p><b>Click on the More link to view the full record.</b></p>
   <table border="1" cellpadding="4" cellspacing="0" class="taespdbt">
    <tr>
    <th>More</th>
     <cfloop index="b" list="#mydisplay#">
      <cfloop index="j" from="1" to="#arrayLen(fieldlist)#">
       <cfif fieldlist[j] eq b> 
        <th>#names[j]#</th>
       </cfif>
      </cfloop> 
      </cfloop>
    </tr>

<cfloop query="getcat" startrow="#start#" endrow="#listto#">
     <tr>
     <td style="font-variant:small-caps; font-size:0.85em"><a href="posi_record.cfm?posino=#URLEncodedFormat(getcat.posino)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	<!--- insert image link  --->
	<cfelseif f eq "images">
         <td><a href="javascript:newWin('images/#val#')"><img src="images/th#val#" border=="0"></a></td>
	<cfelseif f eq "design">
	<td><a href="sherds.cfm?design=#val#">#val#</a></td>
       <cfelseif f eq "site">
        <td><a href="sherds.cfm?site=#val#">#val#</a></td>
	   <cfelseif f eq "part">
        <td><a href="sherds.cfm?part=#val#">#val#</a></td>
	<cfelse>
        <td>#val#</td>
       	</cfif>
      </cfloop>

     </tr>
    </cfloop>

   </table>

   <!--- form that makes the paging button and passes on the query stuff --->
   <form method="post">
    <input type="hidden" name="where" value="#where#">
    <input type="hidden" name="qstr" value="#qstr#">
    <input type="hidden" name="start" value="#start#">
    <input type="hidden" name="display" value="#mydisplay#">
    <cfif start gt mystepsize>
     <input type="submit" name="nav" value="previous #mystepsize# records">
    </cfif>
    <cfif start + mystepsize lt totalrecs>
     <input type="submit" name="nav" value="next #mystepsize# records">
    </cfif>
   </p>
   </form>

   <!--- if query returns not results --->
   <cfelse>
    <p>Your query #qstr# returned no results</p>
   </cfif>
  </cfoutput>
  <cfelse><!--- if search = no! --->
   <cfoutput><p>#error#</p></cfoutput>
  </cfif>


 </cfif><!--- end of query form or display results if --->

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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/posi.cfm">http://intarch.ac.uk/journal/issue20/4/posi.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
