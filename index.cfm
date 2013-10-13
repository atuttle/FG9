<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<template:layout>
		<mango:Posts count="4">
			<mango:Post>
				<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> @ <mango:PostProperty time timeFormat="hh:MM tt" /></cfsavecontent>
				<div class="post" id="post-<mango:PostProperty id />">
					<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
					<mango:PostProperty ifhasExcerpt excerpt>
						<div class="previous"><a href="<mango:PostProperty link />" title="Read the rest of this entry">Read more &rarr;</a></div>
					</mango:PostProperty>
					<mango:PostProperty ifNotHasExcerpt body />
					<mango:Event name="beforePostContentEnd" template="index" mode="excerpt" />
					<p class="well postMeta">
						<span class="responseCount">
							<i class="icon icon-comments"></i>
							<a href="<mango:PostProperty link />#comments" title="Comments for: <mango:PostProperty title />"
							><mango:PostProperty ifCommentCountGT="0">
								<mango:PostProperty commentCount /> Response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty
								></mango:PostProperty
							><mango:PostProperty ifCommentCountLT="1">No Responses Yet</mango:PostProperty></a>
						</span>
						<span class="byline">
							<cfoutput>#variables.postDate#</cfoutput> in
							<mango:Categories>
								<mango:Category>
									<span class="tag-icon"><i class="icon icon-tags"></i></span>
									<a href="<mango:CategoryProperty link />" title="View all posts in: <mango:CategoryProperty title />" rel="category tag"><mango:CategoryProperty title /></a>
								</mango:Category>
							</mango:Categories>
						</span>
					</p>
				</div><!-- /post -->
			</mango:Post>
		</mango:Posts>
		<mango:Archive pageSize="4">
			<div class="bottomFix"></div>
			<div id="archiveNav">
				<mango:ArchiveProperty ifHasNextPage>
					<a class="btn btn-large btn-success pull-left" href="<mango:ArchiveProperty link pageDifference='1' />"><i class="icon icon-large icon-circle-arrow-left"></i> Older Entries</a>
				</mango:ArchiveProperty>
			</div>
		</mango:Archive>
</template:layout>