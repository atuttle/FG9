<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="variables.pageTitle"><mango:Post><mango:PostProperty title /></mango:Post> &bull; FusionGrokker</cfsavecontent>
<cfsavecontent variable="variables.socialURL"><mango:Post><mango:PostProperty permalink /></mango:Post></cfsavecontent>

<template:layout title="#variables.pageTitle#" socialURL="#variables.socialURL#">
	<mango:Post>
		<cfsavecontent variable="variables.postDate"><mango:PostProperty date dateformat="yyyy-mm-dd" /> <mango:PostProperty time timeFormat="hh:MM" /></cfsavecontent>
		<div class="post" id="post-<mango:PostProperty id />">
			<h1><a href="<mango:PostProperty link />" rel="bookmark" title="Permanent link to: <mango:PostProperty title />"><mango:PostProperty title /></a></h1>
			<mango:PostProperty body />
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

			<mango:PostProperty ifcommentsallowed>

				<section id="comments">

					<mango:PostProperty ifCommentCountGT="0">
						<h1><mango:PostProperty commentCount /> response<mango:PostProperty ifCommentCountGT="1">s</mango:PostProperty>:</h1>
					</mango:PostProperty>
					<mango:PostProperty ifCommentCountLT="1">
						<h1>Be the first to leave a comment:</h1>
					</mango:PostProperty>

					<mango:Comments>
						<mango:Comment>
							<cfset commentClass = "" />
							<mango:CommentProperty ifIsAuthor><cfset commentClass="author" /></mango:CommentProperty>
							<div class="comment well <cfoutput>#commentClass#</cfoutput>" id="comment-<mango:CommentProperty id />">
								<cfsavecontent variable="tmpEmail"><mango:CommentProperty email /></cfsavecontent>
								<cfset variables.tmpEmail = lcase(hash(lcase(trim(variables.tmpEmail)))) />
								<div class="commentBody">
									<mangox:Gravatar size="60" class="gravatar" />
									<h4>
										<mango:CommentProperty ifhasurl>
											<a href="<mango:CommentProperty url />" rel="external follow"><mango:CommentProperty name /></a>
										</mango:CommentProperty>
										<mango:CommentProperty ifNotHasUrl>
											<mango:CommentProperty name />
										</mango:CommentProperty>
									</h4>
									<div class="by">
										<a href="#comment-<mango:CommentProperty id />" title="Link to this comment">
											<mango:CommentProperty date dateformat="yyyy-mm-dd" />
											@ <mango:CommentProperty time />
										</a>
									</div>
									<mango:CommentProperty content />
								</div>
							</div>
						</mango:Comment>
					</mango:Comments>

					<article id="respond">
						<mango:PostProperty ifCommentCountGT="0">
							<hr/>
							<h2>Your comment:</h2>
						</mango:PostProperty>
						<form method="post" class="form" action="#respond">
							<input name="action" value="addComment" type="hidden" />
							<input name="comment_post_id" value="<mango:PostProperty id />" type="hidden" />
							<input name="comment_parent" value="" type="hidden" />
							<mango:Message ifMessageExists type="comment" status="error">
								<p class="error">There was a problem: <mango:Message text /></p>
							</mango:Message>
							<mango:Message ifMessageExists type="comment" status="success">
								<p class="message"><mango:Message text /></p>
							</mango:Message>
							<mango:AuthenticatedAuthor ifIsLoggedIn>

								<div class="alert alert-success">
									You are logged in as
									<mangox:Gravatar imgtag class="gravatar" size="30" />
									<strong><mango:AuthorProperty name /></strong>
								</div>
								<input type="hidden" name="comment_name" value="<mango:AuthorProperty name />" />
								<input type="hidden" name="comment_email" value="<mango:AuthorProperty email />" />
								<input type="hidden" name="comment_website" value="<mango:Blog url />" />
							</mango:AuthenticatedAuthor>
							<mango:AuthenticatedAuthor ifNotIsLoggedIn>
								<p id="gravatar_preview" class="pull-right"></p>
								<p><input name="comment_name" class="input-lg commentField" value="<mango:RequestVar name="comment_name" />" type="text" placeholder="Name (required)" /></p>
								<p><input name="comment_email" class="input-lg commentField" value="<mango:RequestVar name="comment_email" />" type="email" placeholder="Email (required, not published)" /></p>
								<p><input name="comment_website" class="input-lg commentField" value="<mango:RequestVar name="comment_website" />" type="url" placeholder="Website (optional, published)" /></p>
							</mango:AuthenticatedAuthor>
							<p><textarea name="comment_content" class="form-control input-lg" rows="10" placeholder="Your Comment"></textarea></p>
							<p><label><input id="subscribe" name="comment_subscribe" value="1" type="checkbox"> Email me when others comment</label></p>
							<p class="extra"><mango:Event name="beforeCommentFormEnd" /></p>
							<p><button class="btn btn-success btn-lg"><i class="icon icon-comment-alt"></i> &nbsp;Submit Comment</button></p>
						</form>
					</article>

			</mango:PostProperty><!-- /ifCommentsAllowed -->

		</div><!-- /post -->
	</mango:Post>
</template:layout>
