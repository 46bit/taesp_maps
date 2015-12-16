<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "suno,guno,ttno,isz,groundvisibility,background,lines,area,chippedstonebags,chippedstonecollected,chippedstonecount,comment_1,easting,elevation,entby,entereddate,furnacematerialbags,furnacematerialcollected,furnacematerialcount,glassbags,glasscollected,glasscount,groundstonebags,groundstonecollected,groundstonecount,metalbags,metalcollected,metalcount,northing,potterycount,potterytilebags,potterytilecollected,recby,recordeddate,shotguncartridgescount,siano,slagbags,slagcollected,slagcount,teamlead,tilecount">

<cfset names = "SU Number,GU Number,Transect Number,Intensive Survey Zone,Ground Visibility (%),Background,Lines Walked,Area,Chipped Stone Bags,Chipped Stone Collected,Chipped Stone Count,Comments,Easting,Elevation,Entered By,Entered Date,Furnace Material Bags,Furnace Material Collected,Furnace Material Count,Glass Bags,Glass Collected,Glass Count,Ground Stone Bags,Ground Stone Collected,Ground Stone Count,Metal Bags,Metal Collected,Metal Count,Northing,Pottery Count,Pottery Tile Bags,Pottery Tile Collected,Recorded By,Recorded Date,Shotgun Cartridges Count,SIA Number,Slag Bags,Slag Collected,Slag Count,Team Leader,Tile Count">

<cfset field = "d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "suno,guno,isz,potterycount,tilecount,chippedstonecount,groundstonecount,slagcount">

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Survey Unit data</title>
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

 <h3>TAESP: Survey Unit Dataset</h3>

</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.area') AND not isdefined('URL.background') AND not isdefined('URL.chippedstonebags') AND not isdefined('URL.chippedstonecollected') AND not isdefined('URL.chippedstonecount') AND not isdefined('URL.comment_1') AND not isdefined('URL.easting') AND not isdefined('URL.elevation') AND not isdefined('URL.entby') AND not isdefined('URL.entereddate') AND not isdefined('URL.furnacematerialbags') AND not isdefined('URL.furnacematerialcollected') AND not isdefined('URL.furnacematerialcount') AND not isdefined('URL.glassbags') AND not isdefined('URL.glasscollected') AND not isdefined('URL.glasscount') AND not isdefined('URL.groundstonebags') AND not isdefined('URL.groundstonecollected') AND not isdefined('URL.groundstonecount') AND not isdefined('URL.groundvisibility') AND not isdefined('URL.guno') AND not isdefined('URL.isz') AND not isdefined('URL.lines') AND not isdefined('URL.metalbags') AND not isdefined('URL.metalcollected') AND not isdefined('URL.metalcount') AND not isdefined('URL.northing') AND not isdefined('URL.potterycount') AND not isdefined('URL.potterytilebags') AND not isdefined('URL.potterytilecollected') AND not isdefined('URL.recby') AND not isdefined('URL.recordeddate') AND not isdefined('URL.shotguncartridgescount') AND not isdefined('URL.siano') AND not isdefined('URL.slagbags') AND not isdefined('URL.slagcollcted') AND not isdefined('URL.slagcount') AND not isdefined('URL.suno') AND not isdefined('URL.teamlead') AND not isdefined('URL.tilecount') AND not isdefined('URL.ttno')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="arealist">
  select unique area from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="backgroundlist">
  select unique background from taesp_20_su order by background
</cfquery>

<cfquery datasource="intarchits" name="chippedstonebagslist">
  select unique chippedstonebags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="chippedstonecollectedlist">
  select unique chippedstonecollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="chippedstonecountlist">
  select unique chippedstonecount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="comment_1list">
  select unique comment_1 from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="eastinglist">
  select unique easting from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="elevationlist">
  select unique elevation from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="entereddatelist">
  select unique entereddate from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="furnacematerialbagslist">
  select unique furnacematerialbags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="furnacematerialcollectedlist">
  select unique furnacematerialcollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="furnacematerialcountlist">
  select unique furnacematerialcount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="glassbagslist">
  select unique glassbags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="glasscollectedlist">
  select unique glasscollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="glasscountlist">
  select unique glasscount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="groundstonebagslist">
  select unique groundstonebags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="groundstonecollectedlist">
  select unique groundstonecollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="groundstonecountlist">
  select unique groundstonecount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="groundvisibilitylist">
  select unique groundvisibility from taesp_20_su order by groundvisibility
</cfquery>

<cfquery datasource="intarchits" name="gunolist">
  select unique guno from taesp_20_su order by guno
</cfquery>

<cfquery datasource="intarchits" name="iszlist">
  select unique isz from taesp_20_su order by isz
</cfquery>

<cfquery datasource="intarchits" name="lineslist">
  select unique lines from taesp_20_su order by lines
</cfquery>

<cfquery datasource="intarchits" name="metalbagslist">
  select unique metalbags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="metalcollectedlist">
  select unique metalcollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="metalcountlist">
  select unique metalcount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="northinglist">
  select unique northing from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="potterycountlist">
  select unique potterycount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="potterytilebagslist">
  select unique potterytilebags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="potterytilecollectedlist">
  select unique potterytilecollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="recordeddatelist">
  select unique recordeddate from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="shotguncartridgescountlist">
  select unique shotguncartridgescount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="sianolist">
  select unique siano from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="slagbagslist">
 select unique slagbags from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="slagcollectedlist">
  select unique slagcollected from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="slagcountlist">
  select unique slagcount from taesp_20_su
</cfquery>

<cfquery datasource="intarchits" name="sunolist">
  select unique suno from taesp_20_su order by suno
</cfquery>


<cfquery datasource="intarchits" name="teamleadlist">
  select unique teamlead from taesp_20_su
</cfquery>


<cfquery datasource="intarchits" name="tilecountlist">
  select unique tilecount from taesp_20_su
</cfquery>


<cfquery datasource="intarchits" name="ttnolist">
  select unique ttno from taesp_20_su order by ttno
</cfquery>


  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>
<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('sucodes.htm')">Survey Unit codes</a></p>

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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='su.cfm'>new search</a>.">
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
   select suno, #mydisplay# from taesp_20_su
   #preserveSingleQuotes(where)#
 </p>
</cfoutput --->

 <cftry>
  <cfquery datasource="intarchits" name="getcat">
   select suno, #mydisplay# from taesp_20_su
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

         <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('sucodes.htm')">Survey Unit codes</a> | <a href="su.cfm">New SU search</a></p>


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
     <td style="font-variant:small-caps; font-size:0.85em"><a href="su_record.cfm?suno=#URLEncodedFormat(getcat.suno)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	<!--- insert image link  --->
	<cfelseif f eq "guno">
         <td><a href="gu.cfm?guno=#val#">#val#</a></td>
	<cfelseif f eq "siano">
        <td><a href="sia.cfm?sianumber=#val#">#val#</a></td>
	<cfelseif f eq "potterycount">
        <td>#numberformat(val,'_______')#</td>
	<cfelseif f eq "tilecount">
        <td>#numberformat(val,'_______')#</td>
	<cfelseif f eq "chippedstonecount">
        <td>#numberformat(val,'_______')#</td>
	<cfelseif f eq "groundstonecount">
        <td>#numberformat(val,'_______')#</td>
	<cfelseif f eq "slagcount">
        <td>#numberformat(val,'_______')#</td>

		
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/su.cfm">http://intarch.ac.uk/journal/issue20/4/su.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
