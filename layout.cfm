<cfimport prefix="mango" taglib="../../tags/mango" />
<cfimport prefix="mangox" taglib="../../tags/mangoextras" />
<cfimport prefix="template" taglib="." />

<cfif thisTag.executionMode eq "start">

<cfparam name="attributes.sidebar" default="true" />

<cfsavecontent variable="variables.basepath"><mango:Blog basePath /></cfsavecontent>
<cfset variables.basePath = trim(variables.basePath) />

<cfsavecontent variable="variables.blogUrl"><mango:Blog url /></cfsavecontent>
<cfparam name="attributes.socialURL" default="#trim(variables.blogUrl)#" />

<cfsavecontent variable="variables.skinurl"><mango:Blog skinurl /></cfsavecontent>
<cfset variables.skinurl = trim(variables.skinurl) />

<cfsavecontent variable="variables.defaultTitle">Adam Tuttle</cfsavecontent>
<cfparam name="attributes.title" default="#variables.defaultTitle#" />

<cfsavecontent variable="variables.rssurl"><mango:Blog rssurl /></cfsavecontent>
<cfset variables.rssurl = trim(variables.rssurl) />

<cfsavecontent variable="variables.atomurl"><mango:Blog atomurl /></cfsavecontent>
<cfset variables.atomurl = trim(variables.atomurl) />

<cfsavecontent variable="variables.apiurl"><mango:Blog apiurl /></cfsavecontent>
<cfset variables.apiurl = trim(variables.apiurl) />

<cfset variables.cssUrl = variables.skinurl & "assets/css" />
<cfset variables.jsUrl = variables.skinurl & "assets/js" />

<cfcontent reset="true" /><!DOCTYPE html>
<cfoutput>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>#attributes.title#</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="#attributes.title#">
		<meta name="author" content="Adam Tuttle">

		<link href="#variables.cssUrl#/bundle.css" rel="stylesheet" />

		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="#variables.rssurl#" />
		<link rel="alternate" type="application/atom+xml" title="Atom" href="#variables.atomurl#" />
		<link rel="EditURI" type="application/rsd+xml" title="RSD" href="#variables.apiurl#" />

		<meta property="og:site_name" content="Adam Tuttle"/>
		<meta property="og:url" content="#attributes.socialURL#"/>
		<meta property="og:title" content="#attributes.title#"/>
		<meta property="og:type" content="blog"/>
		<meta property="og:image" content="#variables.blogUrl##variables.skinUrl#assets/img/headshot-medium.png"/>
		<meta property="og:description" content="#attributes.title#"/>

		<mango:Event name="beforeHtmlHeadEnd" />
	</head>
	<body id="top">
		<mango:Event name="beforeHtmlBodyStart" />

		<div id="parallax">
			<img src="#variables.skinurl#assets/img/bg.jpg" />
			<div class="parallaxGradient"></div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-md-offset-1">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<i class="icon-reorder"></i>
					</button>
					<img src="http://fusiongrokker.com/skins/FG8/assets/img/headshot-medium.png" class="pull-left avatar" width="60px" height="60px" />
					<h2 class="title">Adam Tuttle</h2>
				</div>
				<div class="col-md-4">
					<form id="searchform" class="form-inline pull-right" action="http://google.com/search" method="get">
						<label class="sr-only" for="searchbox">Search FusionGrokker.com</label>
						<input type="text" name="q" id="searchbox" placeholder="Search FusionGrokker.com" class="input-lg" style="width:300px" />
						<input type="hidden" name="q" value="site:fusiongrokker.com" />
						<button type="submit" class="btn btn-success"><i class="icon-search"></i></button>
					</form>
				</div>
			</div>
			<div class="row">
				<cfif attributes.sidebar>
					<div class="col-md-2 col-md-offset-1" id="sidebar">
						<ul class="nav collapse navbar-collapse">
							<li><a href="/">Home</a></li>
							<li><a href="#variables.basepath#page/about-me">About Me</a></li>
							<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="##">Projects <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="https://github.com/atuttle/taffy">Taffy</a></li>
									<li><a href="https://github.com/cfcommunity/Ramen">Ramen</a></li>
									<li><a href="https://github.com/cfcommunity/CFScript-Community-Components">CFScript Community Components</a></li>
									<li><a href="#variables.basepath#page/projects">Mango Plugins &amp; More</a></li>
									<li><a href="https://github.com/atuttle/">GitHub</a></li>
								</ul>
							</li>
							<li><a href="#variables.basepath#page/presentations">Presentations</a></li>
							<li><a href="#variables.basepath#page/contact-me">Contact Me</a></li>
							<li><a href="#variables.basepath#page/archives">Blog Archives</a></li>
						</ul>
						<hr />
						<div id="sidebarExtra">
							<template:sidebar>
						</div>
					</div>
				</cfif>
				<div class="<cfif attributes.sidebar>col-md-8<cfelse>col-md-10 col-md-offset-1</cfif>" id="content">
</cfoutput>
<cfelse>
<cfoutput>
				</div>
			</div>

			<footer class="row">
				<div class="col-md-12">
					<p>
						&copy; Copyright #year(now())# <a href="http://fusiongrokker.com">Adam Tuttle</a>.
						Built with <a href="http://www.getbootstrap.com">Bootstrap</a>.
						Fonts from <a href="http://typekit.com">Typekit</a>.
						Theme inspired by <a href="http://git-scm.com/book">Pro Git</a>.
					</p>
				</div>
			</footer>
		</div>

		<script src="#variables.jsUrl#/bundle.min.js"></script>
	</body>
</html>
</cfoutput>
</cfif>
