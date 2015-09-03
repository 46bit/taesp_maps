<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "invno,catno,fragr,fragh,fragba,fragl,fragbo,text,hard,fract,sort,voidtype,catalch,comm,compa,decsurftreat,diaintext,diarbo,diaval,entby,entdate,munex,munint,munmat,pieceno,pottfindid,pres,recby,recdate,thick,voidcomm">

<cfset names = "Inventory Number,Catalogue Number,Fragment Type - Rim,Fragment Type - Handle,Fragment Type - Base,Fragment Type - Lid,Fragment Type - Body,Texture,Hardness,Fracture,Sorting,Void Type,Catalogue Check,Comments,Comparanda,Decoration Surface Treatment,Diameter Internal/External,Diameter Rim/Base/Other,Diameter Value,Entered By,Entered Date,Munsell Code Exterior,Munsell Code Interior,Munsell Matrix,Piece Number,Pottery Find ID,Preservation,Recorded By,Recorded Date,Thickness,Void Type Comment">

<cfset field = "d,d,d,d,d,d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "invno,pieceno,fragr,fragh,fragba,fragl,fragbo,catno"> 

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Pottery Inventory data</title>

<script language="javascript">
  <!--
  function newWin(myurl) {
  bingo = window.open(myurl,'mywin','status=no,resizable=yes,scrollbars=yes');
  bingo.focus();
   }

  // -->
  </script>

</head>
<body>

 <h3>TAESP: Pottery Inventory Dataset</h3>

 <p>Record of finds recorded at inventory level.</p>
</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') AND not isdefined('URL.catalch') AND not isdefined('URL.catno') AND not isdefined('URL.comm') AND not isdefined('URL.compa') AND not isdefined('URL.decsurftreat') AND not isdefined('URL.diaintext') AND not isdefined('URL.diarbo') AND not isdefined('URL.diaval') AND not isdefined('URL.entby') AND not isdefined('URL.entdate') AND not isdefined('URL.flagch') AND not isdefined('URL.fract') AND not isdefined('URL.fragba') AND not isdefined('URL.fragbo') AND not isdefined('URL.fragh') AND not isdefined('URL.fragl') AND not isdefined('URL.fragr') AND not isdefined('URL.hard') AND not isdefined('URL.invno') AND not isdefined('URL.munex') AND not isdefined('URL.munint') AND not isdefined('URL.munmat') AND not isdefined('URL.pieceno') AND not isdefined('URL.pottfindid') AND not isdefined('URL.pres') AND not isdefined('URL.recby') AND not isdefined('URL.recdate') AND not isdefined('URL.sort') AND not isdefined('URL.text') AND not isdefined('URL.thick') AND not isdefined('URL.voidcomm') AND not isdefined('URL.voidtype')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="catalchlist">
  select unique catalch from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="catnolist">
  select unique catno from taesp_20_pottinv order by catno
</cfquery>

<cfquery datasource="intarchits" name="commlist">
  select unique comm from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="compalist">
  select unique compa from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="decsurftreatlist">
  select unique decsurftreat from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="diaintextlist">
  select unique diaintext from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="diarbolist">
  select unique diarbo from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="diavallist">
  select unique diaval from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="flagchlist">
  select unique flagch from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fractlist">
  select unique fract from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fragbalist">
  select unique fragba from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fragbolist">
  select unique fragbo from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fraghlist">
  select unique fragh from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fragllist">
  select unique fragl from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="fragrlist">
  select unique fragr from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="hardlist">
  select unique hard from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="invnolist">
  select unique invno from taesp_20_pottinv order by invno
</cfquery>

<cfquery datasource="intarchits" name="munexlist">
  select unique munex from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="munintlist">
  select unique munint from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="munmatlist">
  select unique munmat from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="piecenolist">
  select unique pieceno from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="pottfindidlist">
  select unique pottfindid from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="preslist">
  select unique pres from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="sortlist">
  select unique sort from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="textlist">
  select unique text from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="thicklist">
  select unique thick from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="voidcommlist">
  select unique voidcomm from taesp_20_pottinv
</cfquery>

<cfquery datasource="intarchits" name="voidtypelist">
  select unique voidtype from taesp_20_pottinv order by voidtype
</cfquery>


  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>

<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('potcodes.htm')">Pottery codes</a> | <a href="pottinv.cfm">New Pottery Inventory search</a></p>


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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='pottinv.cfm'>new search</a>.">
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
   select pottfindid, #mydisplay# from taesp_20_pottinv
   #preserveSingleQuotes(where)#
 </p>
</cfoutput --->

 <cftry>
  <cfquery datasource="intarchits" name="getcat">
   select pottfindid, #mydisplay# from taesp_20_pottinv
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


        <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('potcodes.htm')">Pottery codes</a> | <a href="pottinv.cfm">New Pottery Inventory search</a></p>

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
	   <th>Thumbnail</th>
</tr>

<cfloop query="getcat" startrow="#start#" endrow="#listto#">
     <tr>
     <td style="font-variant:small-caps; font-size:0.85em"><a href="pottinv_record.cfm?pottfindid=#URLEncodedFormat(getcat.pottfindid)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	
	<cfelseif f eq "catno">
         <td>#val#</td>
		 <td>
<!--- cfif FileExists('http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/#val#.png') --->
<a href="javascript:newWin('http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/#val#.png')" title="Select to view large image from digital archive">
<img src="http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/thumbs/thumbnail_#val#.png"></a>

<!--- cfelse>
<img src="http://archaeologydataservice.ac.uk/catalogue/adsdata/arch-467-1/dissemination/png/Artefacts_pottery/thumbs/thumbnail_#val#.png">
</cfif --->
</td>	
	
	<cfelseif f eq "pieceno">
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/pottinv.cfm">http://intarch.ac.uk/journal/issue20/4/pottinv.cfm</a>
 <br />Last updated: Thur July 5 2007</p>


<cfinclude template="/includes/stats.txt">
 </body>
</html>
</cfoutput>
