<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">

<cfset monthList = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec" />
<cfset yearList = ""/>
<cfloop from="#year(now())#" to="2007" step="-1" index="y">
	<cfset yearList = listAppend(yearList, y)/>
</cfloop>

<cfset variables.prevYear = "" />
<cfset archivesActive = StructNew() />
<mango:Archives type="month">
	<mango:Archive>
		<cfsavecontent variable="variables.currYear"><mango:ArchiveProperty title dateformat="yyyy"/></cfsavecontent>
		<!--- make sure there's an array to store our active months for the current year --->
		<cfif not structKeyExists(archivesActive, variables.currYear)>
			<cfset variables.archivesActive[variables.currYear] = arrayNew(1)/>
		</cfif>
		<cfsavecontent variable="variables.currActiveMonth"><mango:ArchiveProperty title dateformat="MMM"/></cfsavecontent>
		<cfset arrayAppend(variables.archivesActive[variables.currYear], variables.currActiveMonth) />
	</mango:Archive>
</mango:Archives>

<template:layout title="Entries Index &bull; FusionGrokker">
	<div class="post">
		<h1>By date:</h1>
		<table id="archivesList">
			<cfoutput>
				<cfloop list="#variables.yearList#" index="y">
					<tr>
						<th>#y#:</th>
						<cfloop list="#variables.monthList#" index="m">
							<cfif structKeyExists(variables.archivesActive, y) and arrayFindNoCase(variables.archivesActive[y], m)>
								<cfset link = dateformat(parseDateTime(m & ' 01 ' & y), "YYYY/MM/")/>
								<td><a class="btn btn-success" href="/archives/date/#variables.link#">#m#</a></td>
							<cfelse>
								<td><a class="btn btn-warning disabled" disabled="disabled">#m#</a></td>
							</cfif>
						</cfloop>
					</tr>
				</cfloop>
			</cfoutput>
		</table>

		<h1>By Topic, Tag Cloud:</h1>
		<mangox:categorycloud />


		<h1>By Topic, Alphabetical:</h1>
		<div id="archiveTopics">
			<mango:Categories>
				<mango:Category>
					<a class="btn btn-success" href="<mango:CategoryProperty link />"><mango:CategoryProperty title /></a>
				</mango:Category>
			</mango:Categories>
		</div>
	</div>
</template:layout>
