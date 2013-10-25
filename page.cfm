<cfimport prefix="mango" taglib="../../tags/mango">
<cfimport prefix="mangox" taglib="../../tags/mangoextras">
<cfimport prefix="template" taglib=".">
<cfsavecontent variable="pageTitle"><mango:Page><mango:PageProperty title /></mango:Page> &mdash; Adam Tuttle</cfsavecontent>

<template:layout title="#pageTitle#">
	<mango:Page>
		<div class="post">
			<h1><mango:PageProperty title /></h1>
			<mango:PageProperty body />
			<mango:Event name="beforePageContentEnd" template="page" mode="full" />


			<mango:PageProperty ifcommentsallowed>

				<section id="comments">

					<mango:PageProperty ifCommentCountGT="0">
						<h1><mango:PageProperty commentCount /> response<mango:PageProperty ifCommentCountGT="1">s</mango:PageProperty>:</h1>
					</mango:PageProperty>
					<mango:PageProperty ifCommentCountLT="1">
						<h1>Be the first to leave a comment:</h1>
					</mango:PageProperty>

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
						<mango:PageProperty ifCommentCountGT="0">
							<hr/>
							<h2>Your comment:</h2>
						</mango:PageProperty>
						<form method="post" class="form" action="#respond">
							<input name="action" value="addComment" type="hidden" />
							<input name="comment_post_id" value="<mango:PageProperty id />" type="hidden" />
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

			</mango:PageProperty><!-- /ifCommentsAllowed -->
		</div><!-- /post -->
	</mango:Page>
</template:layout>
