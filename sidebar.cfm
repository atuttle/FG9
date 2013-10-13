<cfimport prefix="mango" taglib="../../tags/mango" />
<cfimport prefix="mangox" taglib="../../tags/mangoextras" />
<cfimport prefix="template" taglib="." />

<!--- dynamic pods! --->
<mangox:PodGroup locationId="sidebar" template="index">

	<mangox:TemplatePod id="subscribe">
		<div class="pod">
			<form id="subscribeForm" method="get" action="/generic.cfm">
				<div class="input-append">
					<label for="subscribeemail" class="sr-only">Subscribe By Email:</label>
					<input name="email" class="form-control" id="subscribeemail" type="email" value="" placeholder="Email" style="max-width:100%" />
					<button class="btn btn-success form-control subscribeButton"><i class="icon-envelope"></i> Subscribe</button>
				</div>
				<input name="event" value="scribe-subscribe" type="hidden">
			</form>
		</div>
	</mangox:TemplatePod>

	<!--- output all the pods, including the ones added by plugins --->
	<mangox:Pods>
		<mangox:Pod>
			<mangox:PodProperty content />
		</mangox:Pod>
	</mangox:Pods>

</mangox:PodGroup>


<cfoutput>
	<div class="banners pod">
		<hr/>
		<p>
			<a href="http://www.learncfinaweek.com"
				title="Free eBook &amp; Training: Learn ColdFusion in a Week"
			><img src="//fusiongrokker.com/assets/content/learn-cf-250x250-dark.png"
				alt="Free eBook &amp; Training: Learn ColdFusion in a Week"
			/></a>
		</p>
	</div>
</cfoutput>