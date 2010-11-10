

$(document).ready(function()	{
	$('.loading').hide();
	
	$('.loading').ajaxStart(function() {
		 $('.response').hide();
	   $('.loading').fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn();
	});	
	$('.click').click(function() {
	  $('.response').load('');
	});	
	
	$('.what').hide();
	$('.how').hide();
	$('.why').hide();
	
	$('.whatClick').click(function() {
  	$('.how').hide();
		$('.why').hide();		
	  $('.what').show('slow');
	});
	
	$('.howClick').click(function() {
		$('.what').hide();
		$('.why').hide();		
	  $('.how').show('slow');
	
	});
	$('.whyClick').click(function() {
	  $('.how').hide();		
	  $('.what').hide();
	  $('.why').show('slow');
	});
	
	$('.overlay').click(function()	{
		$('.how').hide();
		$('.what').hide();
		$('.why').hide();
	})
	
})    



