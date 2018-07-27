<div class="gallery homepage-hero-slider">

<% loop $Features %>
    <div data-pin-hover="true" class="cell">
    	
    	<div class="feature-bg" style="background-image: url('$Image.CroppedFocusedImage(1920,1080).URL'); background-position: $CoverImage.PercentageX% $CoverImage.PercentageY%;">
    	
			<div class="feature-text">
		    	<a href="$Link"><h2>$Title</h2>
		    	$Content
		    	<p>Continue reading...</p>
		    	</a>

		    	<% include ShareIcons %>
			</div>

		</div>
		
	</div>
<% end_loop %>
</div>

<% if $AllTestimonials %>
	<% loop $AllTestimonials.Limit(1) %>
		<div class="testimonial">
			<div class="row">
				<div class="$EvenOdd large-7 columns">

					<a href="$Venue.Link"><img width="760" height="507" src="$Image.CroppedFocusedImage(760,507).URL" nopin="nopin" class="photo"></a>
				</div>
				<div class="large-5 columns text-center">
					<h2 class="section-title"><a href="$Venue.Link">Testimonial: $Venue.Title &rarr;</a></h2>
					<a href="$Venue.Link">
					<blockquote>$Quote</blockquote>
					<p class="author">$Name</p>
					</a>
				</div>
			</div>
		</div>
	<% end_loop %>
<% end_if %>

<div class="row collapse">
	<div class="large-12 columns">
		<div class="row">
		
			<div class="large-6 large-offset-3 columns">
				<h2 class="section-title">Venues</h2>
			</div>
			<div class="large-3 show-for-large-up columns"><a href="venues/" class="section-link">See all &rarr;</a></div>
		</div>
		<ul class="resource-card-list">
			
			<% loop $AllVenues.Limit(4) %>
		  		<% include Card %>
		  	<% end_loop %>
		  	
		</ul>
		<div class="row">
			<div class="large-12 columns">
				<h2 class="section-title">Services</h2>
			</div>
		</div>
		<ul class="resource-card-list small">
			
			 <% loop $AllServices.Limit(4) %>
		  		<% include Card %>
		  	<% end_loop %>
		</ul>
		<!--<p class="text-center"><a href="services/">See all services &rarr;</a></p>-->
	</div>
</div>

<%--<div class="testimonial-container" style="background-image: url('{$ThemeDir}/dist/images/home-slider-2.jpg')">
	<% loop $Testimonials.Limit(1) %>
		<% include TestimonialCard %>
  	<% end_loop %>
</div>
<p class="text-center"><a href="testimonials/">See what people are saying &rarr;</a></p>--%>