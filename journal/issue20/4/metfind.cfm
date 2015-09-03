<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "siano,posino,puno,auno,suno,buno,categ,type,ametfindid,colour,comm,desc_1,entby,entdate,findno,invch,layno,recby,recdate,seno,ttno">

<cfset names = "SIA Number,POSI Number,POSI Unit Number,AU Number,SU Number,BU Number,Category,Type,Archaeometallurgical Find Number,Colour,Comments,Description,Entered By,Entered Date,Find Number,Inventory?,Layer Number,Recorded By,Recorded Date,Structural Element Number,Transect Number">

<cfset field = "d,d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "ametfindid,categ,type"> 

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Metal Finds data</title>
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

 <h3>TAESP: Archaeometallurgical Finds Dataset</h3>

 <p>Record of archaeometallurgical finds recovered during survey.</p>
 
</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.ametfindid') AND not isdefined('URL.auno') AND not isdefined('URL.buno') AND not isdefined('URL.categ') AND not isdefined('URL.colour') AND not isdefined('URL.comm') AND not isdefined('URL.desc_1') AND not isdefined('URL.entby') AND not isdefined('URL.entdate') AND not isdefined('URL.findno') AND not isdefined('URL.flagch') AND not isdefined('URL.invch') AND not isdefined('URL.layno') AND not isdefined('URL.posino') AND not isdefined('URL.puno') AND not isdefined('URL.recby') AND not isdefined('URL.recdate') AND not isdefined('URL.seno') AND not isdefined('URL.siano') AND not isdefined('URL.suno')
AND not isdefined('URL.ttno') AND not isdefined('URL.type')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="ametfindidlist">
  select unique ametfindid from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="aunolist">
  select unique auno from taesp_20_metfind order by auno
</cfquery>

<cfquery datasource="intarchits" name="bunolist">
  select unique buno from taesp_20_metfind order by buno
</cfquery>

<cfquery datasource="intarchits" name="categlist">
  select unique categ from taesp_20_metfind order by categ
</cfquery>

<cfquery datasource="intarchits" name="colourlist">
  select unique colour from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="commlist">
  select unique comm from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="desc_1list">
  select unique desc_1 from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="findnolist">
  select unique findno from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="flagchlist">
  select unique flagch from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="invchlist">
  select unique invch from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="laynolist">
  select unique layno from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="posinolist">
  select unique posino from taesp_20_metfind order by posino
</cfquery>

<cfquery datasource="intarchits" name="punolist">
  select unique puno from taesp_20_metfind order by puno
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="senolist">
  select unique seno from taesp_20_metfind
</cfquery>

<cfquery datasource="intarchits" name="sianolist">
  select unique siano from taesp_20_metfind order by siano
</cfquery>

<cfquery datasource="intarchits" name="sunolist">
  select unique suno from taesp_20_metfind order by suno
</cfquery>

<cfquery datasource="intarchits" name="ttnolist">
  select unique ttno from taesp_20_metfind
</cfquery>


<cfquery datasource="intarchits" name="typelist">
  select unique type from taesp_20_metfind order by type
</cfquery>

  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>
<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('metalcodes.htm')">Metal codes</a></p>


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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='metfind.cfm'>new search</a>.">
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
   select ametfindid, #mydisplay# from taesp_20_metfind
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

        <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('metalcodes.htm')">Archaeometallurgy codes</a> | <a href="metfind.cfm">New Archaeometallurgy search</a></p>

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
     <td style="font-variant:small-caps; font-size:0.85em"><a href="metfind_record.cfm?ametfindid=#URLEncodedFormat(getcat.ametfindid)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	
	<cfelseif f eq "siano">
         <td><a href="sia.cfm?sianumber=#val#">#val#</a></td>
	<cfelseif f eq "posi">
        <td><a href="posi.cfm?posi=#val#">#val#</a></td>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/metfind.cfm">http://intarch.ac.uk/journal/issue20/4/metfind.cfm</a>
 <br />Last updated: Mon June 25 2007</p>


<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
