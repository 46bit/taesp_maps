<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "buno,siano,posino,isz,vill,bldgtype,structype,ownshp,period1100,period1601,period1701,period1801,period1851,period1901,period1951,access_1,assland,busum,catchk,ceil,chipst,curruse,date_1,desc_1,east,eaves,elev,entby,entdate,extplast,floors,found,grdst,habit,hgt,intplast,level_1,levno,lgth,local,locat,modalt,north,occ,open,oralinfo,own,pastuse,plotcad,plotvill,posichk,pott,recby,recdate,roofs,seanal,shtmap5000,shtmapcad,shtplanvill,sketchchk,slag,source,specfeat,stab,strucname,tile,titledeedno,veg,walls,width">

<cfset names = "BU number,SIA Number,POSI Number,Intensive Survey Zone,Village,Building Type,Structure Type,Ownership,Period 1100-1600,Period 1601-1700,Period 1701-1800,Period 1801-1850,Period 1851-1900,Period 1901-1950,Period 1951-present,Access,Associated Land,BU Summary,Catalogue Check,Ceiling,Chipped Stone,Current Use,Date,Description,Easting,Eaves,Elevation,Entered By,Entered Date,Exterior Plaster,Floors,Foundation,Ground Stone,Habitable,Height,Interior Plaster,Levels,Levels Number,Length,Locality,Location,Modifications/Alterations,Northing,Occupied,Openings,Oral Information,Owner,Past Use,Plot Cadastral,Plot Village,POSI Check,Pottery,Recorded By,Recorded Date,Roofs,Structural Element Analysis,Sheet Map 1:5000,Sheet Map Cadastral,Sheet Plan Village,Sketch Check,Slag,Source,Special Features,Stability,Structure Name,Tile,Title Deed Number,Vegetation,Walls,Width">

<cfset field = "d,d,d,d,d,d,0,d,d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "buno,isz,busum,period1100,period1601,period1701,period1801,period1851,period1901,period1951">

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Building Unit Dataset</title>
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

 <h3>TAESP: Building Unit Dataset</h3>

 
</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.access_1') AND not isdefined('URL.assland') AND not isdefined('URL.bldgtype') AND not isdefined('URL.buno') AND not isdefined('URL.busum') AND not isdefined('URL.catchk') AND not isdefined('URL.ceil') AND not isdefined('URL.chipst') AND not isdefined('URL.curruse') AND not isdefined('URL.date_1') AND not isdefined('URL.desc_1') AND not isdefined('URL.east') AND not isdefined('URL.eaves') AND not isdefined('URL.elev') AND not isdefined('URL.entby') AND not isdefined('URL.entdate') AND not isdefined('URL.extplast') AND not isdefined('URL.floors') AND not isdefined('URL.found') AND not isdefined('URL.grdst') AND not isdefined('URL.habit') AND not isdefined('URL.hgt') AND not isdefined('URL.intplast') AND not isdefined('URL.isz') AND not isdefined('URL.level_1') AND not isdefined('URL.levno') AND not isdefined('URL.lgth') AND not isdefined('URL.local') AND not isdefined('URL.locat') AND not isdefined('URL.modalt') AND not isdefined('URL.north') AND not isdefined('URL.occ') AND not isdefined('URL.open') AND not isdefined('URL.oralinfo') AND not isdefined('URL.own') AND not isdefined('URL.ownshp') AND not isdefined('URL.pastuse') AND not isdefined('URL.period1100') AND not isdefined('URL.period1601') AND not isdefined('URL.period1701') AND not isdefined('URL.period1801') AND not isdefined('URL.period1851') AND not isdefined('URL.period1901') AND not isdefined('URL.period1951') AND not isdefined('URL.plotcad') AND not isdefined('URL.plotvill') AND not isdefined('URL.posichk') AND not isdefined('URL.posino') AND not isdefined('URL.pott') AND not isdefined('URL.recby') AND not isdefined('URL.recdate') AND not isdefined('URL.roofs') AND not isdefined('URL.seanal') AND not isdefined('URL.shtmap5000') AND not isdefined('URL.shtmapcad') AND not isdefined('URL.shtplanvill') AND not isdefined('URL.siano') AND not isdefined('URL.sketchchk') AND not isdefined('URL.slag') AND not isdefined('URL.source') AND not isdefined('URL.specfeat') AND not isdefined('URL.stab') AND not isdefined('URL.strucname') AND not isdefined('URL.structype') AND not isdefined('URL.tile') AND not isdefined('URL.titledeedno') AND not isdefined('URL.veg') AND not isdefined('URL.vill') AND not isdefined('URL.walls') AND not isdefined('URL.width')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="access_1list">
  select unique access_1 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="asslandlist">
  select unique assland from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="bldgtypelist">
  select unique bldgtype from taesp_20_bu order by bldgtype
</cfquery>


<cfquery datasource="intarchits" name="bunolist">
  select unique buno from taesp_20_bu order by buno
</cfquery>

<cfquery datasource="intarchits" name="busumlist">
  select unique busum from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="catchklist">
  select unique catchk from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="ceillist">
  select unique ceil from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="chipstlist">
  select unique chipst from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="curruselist">
  select unique curruse from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="date_1list">
  select unique date_1 from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="desc_1list">
  select unique desc_1 from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="eastlist">
  select unique east from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="eaveslist">
  select unique eaves from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="elevlist">
  select unique elev from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="extplastlist">
  select unique extplast from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="floorslist">
  select unique floors from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="foundlist">
  select unique found from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="grdstlist">
  select unique grdst from taesp_20_bu
</cfquery>


<cfquery datasource="intarchits" name="habitlist">
  select unique habit from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="hgtlist">
  select unique hgt from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="intplastlist">
  select unique intplast from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="iszlist">
  select unique isz from taesp_20_bu order by isz
</cfquery>

<cfquery datasource="intarchits" name="level_1list">
  select unique level_1 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="levnolist">
  select unique levno from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="lgthlist">
  select unique lgth from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="locallist">
  select unique local from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="locatlist">
  select unique locat from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="modaltlist">
  select unique modalt from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="northlist">
  select unique north from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="occlist">
  select unique occ from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="openlist">
  select unique open from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="oralinfolist">
  select unique oralinfo from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="ownlist">
  select unique own from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="ownshplist">
  select unique ownshp from taesp_20_bu order by ownshp
</cfquery>

<cfquery datasource="intarchits" name="pastuselist">
  select unique pastuse from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1100list">
  select unique period1100 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1601list">
  select unique period1601 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1701list">
  select unique period1701 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1801list">
  select unique period1801 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1851list">
  select unique period1851 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1901list">
  select unique period1901 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="period1951list">
  select unique period1951 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="plotcadlist">
  select unique plotcad from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="plotvilllist">
  select unique plotvill from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="posichklist">
  select unique posichk from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="posinolist">
  select unique posino from taesp_20_bu order by posino
</cfquery>

<cfquery datasource="intarchits" name="pottlist">
  select unique pott from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="roofslist">
  select unique roofs from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="seanallist">
  select unique seanal from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="shtmap5000list">
  select unique shtmap5000 from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="shtmapcadlist">
  select unique shtmapcad from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="shtplanvilllist">
  select unique shtplanvill from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="sianolist">
  select unique siano from taesp_20_bu order by siano
</cfquery>

<cfquery datasource="intarchits" name="sketchchklist">
  select unique sketchchk from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="slaglist">
  select unique slag from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="sourcelist">
  select unique source from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="specfeatlist">
  select unique specfeat from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="stablist">
  select unique stab from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="strucnamelist">
  select unique strucname from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="structypelist">
  select unique structype from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="tilelist">
  select unique tile from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="titledeednolist">
  select unique titledeedno from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="veglist">
  select unique veg from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="villlist">
  select unique vill from taesp_20_bu order by vill
</cfquery>

<cfquery datasource="intarchits" name="wallslist">
  select unique walls from taesp_20_bu
</cfquery>

<cfquery datasource="intarchits" name="widthlist">
  select unique width from taesp_20_bu
</cfquery>

  <cfoutput>



  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>

<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('bldgcodes.htm')">Building codes</a></p>

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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='bu.cfm'>new search</a>.">
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
   select buno, #mydisplay# from taesp_20_bu
   #preserveSingleQuotes(where)#
 </p>
</cfoutput --->

 <cftry>
  <cfquery datasource="intarchits" name="getcat">
   select buno, #mydisplay# from taesp_20_bu
   #preserveSingleQuotes(where)#

  </cfquery>


  <cfcatch type="database">
   <cfoutput>
   <p>There was an error retrieving your query</p>

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

   <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('bldgcodes.htm')">Building codes</a> | <a href="bu.cfm">New BU search</a></p>

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
     <td style="font-variant:small-caps; font-size:0.85em"><a href="bu_record.cfm?buno=#URLEncodedFormat(getcat.buno)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	<!--- insert image link  --->
	<cfelseif f eq "images">
         <td><a href="javascript:newWin('images/#val#')"><img src="images/th#val#" border=="0"></a></td>
	<cfelseif f eq "posino">
	<td><a href="posi_record.cfm?posino=#val#">#val#</a></td>
       <cfelseif f eq "siano">
        <td><a href="sia_record.cfm?sianumber=#val#">#val#</a></td>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/bu.cfm">http://intarch.ac.uk/journal/issue20/4/bu.cfm</a>
 <br />Last updated: Thur July 5 2007</p>



<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
