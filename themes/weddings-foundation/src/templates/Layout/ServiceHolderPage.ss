<section class="row">
	<div class="large-12 columns">
		<h1 class="section-title">$Title</h1>
		<ul class="resource-card-list small">
			<% loop $Children %>
		  		<% include Card %>
		  	<% end_loop %>
		</ul>
	</div>
</section>
<div class="row">

	<div class="large-6 large-offset-3 columns">
		<h2 class="section-title">Related Venues</h2>
	</div>
	<div class="large-3 show-for-large-up columns"><a href="venues/" class="section-link">See all &rarr;</a></div>
</div>
<div class="row">
	<div class="large-12 columns">
		<ul class="resource-card-list">
			<% loop $ServiceVenues %>
		  		<% include Card %>
		  	<% end_loop %>
		</ul>
	</div>
</div>