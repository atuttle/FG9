<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="variables.pageTitle"><mango:Post><mango:PostProperty title /></mango:Post> &bull; FusionGrokker</cfsavecontent>
<cfsavecontent variable="variables.socialURL"><mango:Post><mango:PostProperty permalink /></mango:Post></cfsavecontent>

<cfset comments = false />
<mango:Post><mango:PostProperty ifcommentsallowed>
	<cfset comments = true />
</mango:PostProperty></mango:Post>

<template:layout title="#variables.pageTitle#" socialURL="#variables.socialURL#" disqus="#comments#">
	<mango:Post>
		<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
		<div class="post" id="post-<mango:PostProperty id />">
			<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
			<mango:PostProperty body />
			<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
			<p class="well postMeta">
				Published <cfoutput>#variables.postDate#</cfoutput> in
				<mango:Categories>
					<mango:Category>
						<span class="tag-icon"><i class="icon icon-tags"></i></span>
						<a href="<mango:CategoryProperty link />" title="View all posts in: <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a>
					</mango:Category>
				</mango:Categories>
			</p>
		</div><!-- /post -->
	</mango:Post>
</template:layout>
