<div class="row">
	<div class="large-12 columns">
		<h1 class="section-title">Venues Related to: $UseTag.Title</h1>
	</div>
	<ul class="resource-card-list">
		<% loop $VenuePages %>
	  			<% include Card %>
	  	<% end_loop %>
	</ul>
</div>
