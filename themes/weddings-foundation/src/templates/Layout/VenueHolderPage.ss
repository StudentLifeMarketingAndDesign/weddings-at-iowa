<div class="row">
	<div class="large-12 columns">
		<h1 class="section-title">$Title</h1>
	</div>
	<ul class="resource-card-list">
		
		<% loop $Children %>
	  		<% include VenueCard %>
	  	<% end_loop %>
	</ul>
</div>
