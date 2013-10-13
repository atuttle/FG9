<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="pageTitle"><mango:Page><mango:PageProperty title /></mango:Page> &mdash; Adam Tuttle</cfsavecontent>

<cfset comments = false />
<mango:Page><mango:PageProperty ifcommentsallowed>
	<cfset comments = true />
</mango:PageProperty>
</mango:Page>

<template:layout title="#pageTitle#" disqus="#comments#">
	<mango:Page>
		<div class="post">
			<h1><mango:PageProperty title /></h1>
			<mango:PageProperty body />
			<mango:Event name="beforePageContentEnd" template="page" mode="full" />
		</div><!-- /post -->
	</mango:Page>
</template:layout>
