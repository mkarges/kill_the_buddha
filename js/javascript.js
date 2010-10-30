

$(document).ready(function()	{
	$('.loading').hide();
	
	$('.loading').ajaxStart(function() {
		 $('.response').hide();
	   $('.loading').fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn().fadeOut().fadeIn();
	});	
	$('.click').click(function() {
	  $('.response').load('');
	});	
	
})    



