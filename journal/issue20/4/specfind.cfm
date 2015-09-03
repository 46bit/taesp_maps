<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "posino,puno,auno,suno,buno,material,clay,type,form,period,batchno,box,date_1,decoration,description,entby,entdate,inv,layno,nopiece,recby,recdate,seno,sfindid,throw,weight,wtunitg,wtunitkg">

<cfset names = "POSI Number,POSI Unit Number,AU Number,SU Number,BU Number,Material,Clay,Type,Form,Period,Batch Number,Box,Date,Decoration,Description,Entered By,Entered Date,Inventory,Layer Number,Number of Pieces,,Recorded By,Recorded Date,Structural Element Number,Special Find ID,Number Discarded,Weight (g),Weight Unit grammes,Weight Unit kg">

<cfset field = "d,d,d,d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "sfindid,nopiece,material,type,form,period"> 

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Special Finds data</title>
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

 <h3>TAESP: Special Finds Dataset</h3>

 <p>Record of special finds recovered during survey.</p>
 
</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.auno') AND not isdefined('URL.batchno') AND not isdefined('URL.box') AND not isdefined('URL.buno') AND not isdefined('URL.clay') AND not isdefined('URL.date_1') AND not isdefined('URL.decoration') AND not isdefined('URL.description') AND not isdefined('URL.entby') AND not isdefined('URL.entdate') AND not isdefined('URL.flag') AND not isdefined('URL.inv') AND not isdefined('URL.layno') AND not isdefined('URL.material') AND not isdefined('URL.nopiece') AND not isdefined('URL.period') AND not isdefined('URL.posino') AND not isdefined('URL.puno') AND not isdefined('URL.recby') AND not isdefined('URL.recdate') AND not isdefined('URL.seno') AND not isdefined('URL.form') AND not isdefined('URL.sfindid') AND not isdefined('URL.type') AND not isdefined('URL.suno') AND not isdefined('URL.throw') AND not isdefined('URL.weight') AND not isdefined('URL.wtunitg') AND not isdefined('URL.wtunitkg')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="aunolist">
  select unique auno from taesp_20_specfind order by auno
</cfquery>

<cfquery datasource="intarchits" name="batchnolist">
  select unique batchno from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="boxlist">
  select unique box from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="bunolist">
  select unique buno from taesp_20_specfind order by buno
</cfquery>

<cfquery datasource="intarchits" name="claylist">
  select unique clay from taesp_20_specfind order by clay
</cfquery>

<cfquery datasource="intarchits" name="date_1list">
  select unique date_1 from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="decorationlist">
  select unique decoration from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="descriptionlist">
  select unique description from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="flaglist">
  select unique flag from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="invlist">
  select unique inv from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="laynolist">
  select unique layno from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="materiallist">
  select unique material from taesp_20_specfind order by material
</cfquery>

<cfquery datasource="intarchits" name="nopiecelist">
  select unique nopiece from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="periodlist">
  select unique period from taesp_20_specfind order by period
</cfquery>

<cfquery datasource="intarchits" name="posinolist">
  select unique posino from taesp_20_specfind order by posino
</cfquery>

<cfquery datasource="intarchits" name="punolist">
  select unique puno from taesp_20_specfind order by puno
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="senolist">
  select unique seno from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="formlist">
  select unique form from taesp_20_specfind order by form
</cfquery>

<cfquery datasource="intarchits" name="sfindidlist">
  select unique sfindid from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="typelist">
  select unique type from taesp_20_specfind order by type
</cfquery>

<cfquery datasource="intarchits" name="sunolist">
  select unique suno from taesp_20_specfind order by suno
</cfquery>

<cfquery datasource="intarchits" name="throwlist">
  select unique throw from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="weightlist">
  select unique weight from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="wtunitglist">
  select unique wtunitg from taesp_20_specfind
</cfquery>

<cfquery datasource="intarchits" name="wtunitkglist">
  select unique wtunitkg from taesp_20_specfind
</cfquery>


  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>
<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('speccodes.htm')">Special Finds Codes</a></p>

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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='specfind.cfm'>new search</a>.">
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
   select sianumber, #mydisplay# from taesp_20_sia
   #preserveSingleQuotes(where)#
 </p>
</cfoutput --->

 <cftry>
  <cfquery datasource="intarchits" name="getcat">
   select sfindid, #mydisplay# from taesp_20_specfind
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


        <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('speccodes.htm')">Special Finds codes</a> | <a href="specfind.cfm">New Special Finds search</a></p>

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
     <td style="font-variant:small-caps; font-size:0.85em"><a href="specfind_record.cfm?sfindid=#URLEncodedFormat(getcat.sfindid)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	
	<cfelseif f eq "guno">
         <td><a href="sia.cfm?guno=#val#">#val#</a></td>
	<cfelseif f eq "guno">
        <td><a href="sia.cfm?sianumber=#val#">#val#</a></td>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/specfind.cfm">http://intarch.ac.uk/journal/issue20/4/specfind.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
