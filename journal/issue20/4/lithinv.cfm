<cfsetting enablecfoutputonly="yes">
<!--- labels for query form and the table headings --->

<cfset fieldlist = "invno,catno,chipblanktype,coretype,blankretcore,grdblanktype,usesurfchar,lithfindid,,basalthick,bldlgth,bowldia,bowldpth,butbrdth,buttangext,buttangint,buttprepf,buttprepg,buttthick,butttype,comm,conde,condt,condu,cortbody,cortplat,corttype,dorscar,edloc,edtype,edunits,entby,entdate,erachk,hght,lgth,lipchk,longsect,perfdia,perfdpth,pieceno,planshp,planshpoth,platfang,platftype,prefcs,prefdr,preffl,prefgr,prefpe,prismn,prismy,pt,pw,recby,recdate,reshcr,reshes,reshrp,retdel,retloc,rettype,retunits,reusedch,reuseseq,scarseq,scartypesb,scartypesbl,scartypesf,termtype,thick,transect,umodgr,umodha,umodin,umodpe,umodpo,umodst,width">

<cfset names = "Inventory Number,Catalogue Number,Chipped Blank Type,Core Type,Blank Retouch Core,Ground Blank Type,Use-Surface Character,Lith Find ID,Basal Thickness,Blade Length,Bowl Diameter mm,Bowl Depth mm,Butt Breadth,Butt Angle External,Butt Angle Internal,Butt Preparation F,Butt Preparation G,Butt Thickness,Butt Type,Comments,Condition E,Condition T,Condition U,Cortex Body,Cortex Platform,Cortex Type,Dorsal Scars,Edge Location,Edge Type,Edge Units,Entered By,Entered Date,Eraillure?,Height mm,Length,Lip,Longitudinal Section,Perforation Diameter,Perforation Depth,Number of Pieces,Plan Shape,Plan Shape Other,Platform Angle,Platform Type,Preforming - Cobble Splitter,Preforming - Drilling,Preforming - Flaking,Preforming - Grinding,Preforming - Pecking,Prismatic No,Prismatic Yes,Butt thickness,Butt Width/Breadth,Recorded By,Recorded Date,Reshaping - Chip Reshaping,Reshaping - Edge Sharpening,Reshaping - RePecking,Ret Delineation,Ret Location,Ret Type,Ret Units,Re-Used?,ReUseSequence,Scar Sequence,Scar Types B,Scar Types BL,Scar Types F,Termination Type,Thickness  mm,Transverse Section,Use Modification - Grinding,Use Modification - Hammering,Use Modification - Incisions,Use Modification - Pecking,Use Modification - Polishing,Use Modification - Striations,Width mm">

<cfset field = "d,d,d,d,d,d,d,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0">

<cfset ftype = "t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t,t">

<cfset fieldlist = listToArray(fieldlist)>

<cfset names = listToArray(names)>

<cfset field = listToArray(field)>

<cfset ftype = listToArray(ftype)>

<cfset default_fields = "invno,catno,pieceno,blankretcore,chipblanktype,coretype,grdblanktype"> 

<cfoutput>
<html>
<head>
 <link rel="stylesheet" href="/style/journal.css" type="text/css">
 <title>Internet Archaeol. 20. Given et al. Lithic Inventory data</title>
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

 <h3>TAESP: Lithic Inventory Dataset</h3>

 <p>Inventory of lithic finds recovered during survey.</p>
 
</cfoutput>

 <!--- ##################################################################### --->
 <!---                       the query form                                  --->
 <!--- ##################################################################### --->

<cfif not isdefined('form.fieldnames') 
AND not isdefined('URL.invno') AND not isdefined('URL.catno') AND not isdefined('URL.chipblanktype') AND not isdefined('URL.coretype') AND not isdefined('URL.blankretcore') AND not isdefined('URL.grdblanktype') AND not isdefined('URL.usesurfchar') AND not isdefined('URL.lithfindid') AND not isdefined('URL.basalthick') AND not isdefined('URL.bldlgth') AND not isdefined('URL.bowldia')
AND not isdefined('URL.bowldpth') AND not isdefined('URL.butbrdth') AND not isdefined('URL.buttangext') AND not isdefined('URL.buttangint') AND not isdefined('URL.buttprepf') AND not isdefined('URL.buttprepg') AND not isdefined('URL.buttthick') AND not isdefined('URL.butttype') AND not isdefined('URL.comm')
AND not isdefined('URL.conde') AND not isdefined('URL.condt') AND not isdefined('URL.condu')
AND not isdefined('URL.cortbody') AND not isdefined('URL.cortplat') AND not isdefined('URL.corttype') AND not isdefined('URL.dorscar') AND not isdefined('URL.edloc')
AND not isdefined('URL.edtype') AND not isdefined('URL.edunits') AND not isdefined('URL.entby') AND not isdefined('URL.entdate') AND not isdefined('URL.erachk')
AND not isdefined('URL.hght') AND not isdefined('URL.lgth') AND not isdefined('URL.lipchk')
AND not isdefined('URL.longsect') AND not isdefined('URL.perfdia') AND not isdefined('URL.perfdpth') AND not isdefined('URL.pieceno') AND not isdefined('URL.planshp')
AND not isdefined('URL.planshpoth') AND not isdefined('URL.platfang')
AND not isdefined('URL.platftype') AND not isdefined('URL.prefcs')
AND not isdefined('URL.prefdr') AND not isdefined('URL.preffl')
AND not isdefined('URL.prefgr') AND not isdefined('URL.prefpe')
AND not isdefined('URL.prismn') AND not isdefined('URL.prismy') AND not isdefined('URL.pt')
AND not isdefined('URL.pw') AND not isdefined('URL.recby') AND not isdefined('URL.recdate')
AND not isdefined('URL.reshcr') AND not isdefined('URL.reshes') AND not isdefined('URL.reshrp') AND not isdefined('URL.retdel') AND not isdefined('URL.retloc')
AND not isdefined('URL.rettype') AND not isdefined('URL.retunits') AND not isdefined('URL.reusedch') AND not isdefined('URL.reuseseq') AND not isdefined('URL.scarseq')
AND not isdefined('URL.scartypesb') AND not isdefined('URL.scartypesbl') AND not isdefined('URL.scartypesf') AND not isdefined('URL.termtype') AND not isdefined('URL.thick')
AND not isdefined('URL.transect') AND not isdefined('URL.umodgr') AND not isdefined('URL.umodha') AND not isdefined('URL.umodin') AND not isdefined('URL.umodpe')
AND not isdefined('URL.umodpo') AND not isdefined('URL.umodst') AND not isdefined('URL.width')>

 <!--- do queries to populate the select lists --->

<cfquery datasource="intarchits" name="invnolist">
  select unique invno from taesp_20_lithinv order by invno
</cfquery>

<cfquery datasource="intarchits" name="catnolist">
  select unique catno from taesp_20_lithinv order by catno
</cfquery>

<cfquery datasource="intarchits" name="chipblanktypelist">
  select unique chipblanktype from taesp_20_lithinv order by chipblanktype
</cfquery>

<cfquery datasource="intarchits" name="coretypelist">
  select unique coretype from taesp_20_lithinv order by coretype
</cfquery>

<cfquery datasource="intarchits" name="blankretcorelist">
  select unique blankretcore from taesp_20_lithinv order by blankretcore
</cfquery>

<cfquery datasource="intarchits" name="grdblanktypelist">
  select unique grdblanktype from taesp_20_lithinv order by grdblanktype
</cfquery>

<cfquery datasource="intarchits" name="usesurfcharlist">
  select unique usesurfchar from taesp_20_lithinv order by usesurfchar
</cfquery>

<cfquery datasource="intarchits" name="lithfindidlist">
  select unique lithfindid from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="basalthicklist">
  select unique basalthick from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="bldlgthlist">
  select unique bldlgth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="bowldialist">
  select unique bowldia from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="bowldpthlist">
  select unique bowldpth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="butbrdthlist">
  select unique butbrdth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="buttangextlist">
  select unique buttangext from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="buttangintlist">
  select unique buttangint from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="buttprepflist">
  select unique buttprepf from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="buttprepglist">
  select unique buttprepg from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="buttthicklist">
  select unique buttthick from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="butttypelist">
  select unique butttype from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="commlist">
  select unique comm from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="condelist">
  select unique conde from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="condtlist">
  select unique condt from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="condulist">
  select unique condu from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="cortbodylist">
  select unique cortbody from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="cortplatlist">
  select unique cortplat from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="corttypelist">
  select unique corttype from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="dorscarlist">
  select unique dorscar from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="edloclist">
  select unique edloc from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="edtypelist">
  select unique edtype from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="edunitslist">
  select unique edunits from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="entbylist">
  select unique entby from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="entdatelist">
  select unique entdate from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="erachklist">
  select unique erachk from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="hghtlist">
  select unique hght from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="lgthlist">
  select unique lgth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="lipchklist">
  select unique lipchk from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="longsectlist">
  select unique longsect from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="perfdialist">
  select unique perfdia from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="perfdpthlist">
  select unique perfdpth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="piecenolist">
  select unique pieceno from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="planshplist">
  select unique planshp from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="planshpothlist">
  select unique planshpoth from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="platfanglist">
  select unique platfang from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="platftypelist">
  select unique platftype from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prefcslist">
  select unique prefcs from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prefdrlist">
  select unique prefdr from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="preffllist">
  select unique preffl from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prefgrlist">
  select unique prefgr from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prefpelist">
  select unique prefpe from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prismnlist">
  select unique prismn from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="prismylist">
  select unique prismy from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="ptlist">
  select unique pt from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="pwlist">
  select unique pw from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="recbylist">
  select unique recby from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="recdatelist">
  select unique recdate from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="reshcrlist">
  select unique reshcr from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="resheslist">
  select unique reshes from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="reshrplist">
  select unique reshrp from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="retdellist">
  select unique retdel from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="retloclist">
  select unique retloc from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="rettypelist">
  select unique rettype from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="retunitslist">
  select unique retunits from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="reusedchlist">
  select unique reusedch from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="reuseseqlist">
  select unique reuseseq from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="scarseqlist">
  select unique scarseq from taesp_20_lithinv
</cfquery>


<cfquery datasource="intarchits" name="scartypesblist">
  select unique scartypesb from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="scartypesflist">
  select unique scartypesf from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="termtypelist">
  select unique termtype from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="thicklist">
  select unique thick from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="transectlist">
  select unique transect from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodgrlist">
  select unique umodgr from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodhalist">
  select unique umodha from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodinlist">
  select unique umodin from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodpelist">
  select unique umodpe from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodpolist">
  select unique umodpo from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="umodstlist">
  select unique umodst from taesp_20_lithinv
</cfquery>

<cfquery datasource="intarchits" name="widthlist">
  select unique width from taesp_20_lithinv
</cfquery>


  <cfoutput>


  <p>Select one or more fields to refine your query - note that no fields are ignored by the search. To view all records, leave fields set to 'All' and select 'Display selected records'.
</p>
<p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('lithcodes.htm')">Lithic codes</a></p>


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
      <cfset error = "You cannot search for a range of values on a text field. Please carry out a <a href='lithfind.cfm'>new search</a>.">
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
   select lithfindid, #mydisplay# from taesp_20_lithinv
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

      <p class="mininav"><a href="data.htm">Other Data Sets</a> | <a href="javascript:newWin('lithcodes.htm')">Lithic codes</a> | <a href="lithinv.cfm">New Lithic Inventory search</a></p>

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
     <td style="font-variant:small-caps; font-size:0.85em"><a href="lithinv_record.cfm?lithfindid=#URLEncodedFormat(getcat.lithfindid)#">More</a></td>
      <cfloop index="f" list="#mydisplay#">
       <cfset val = evaluate("getcat.#f#")>
       <cfif val eq "">
        <td>&nbsp;</td>
	
	<cfelseif f eq "siano">
         <td><a href="sia.cfm?sianumber=#val#">#val#</a></td>
	<cfelseif f eq "posi">
        <td><a href="posi.cfm?posi=#val#">#val#</a></td>
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
 URL: <a href="http://intarch.ac.uk/journal/issue20/4/lithinv.cfm">http://intarch.ac.uk/journal/issue20/4/lithinv.cfm</a>
 <br />Last updated: Mon June 25 2007</p>

<cfinclude template="/includes/stats.txt">
</body>
</html>
</cfoutput>
