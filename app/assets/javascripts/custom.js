


$(document).ready(function() {

	//hide textareas
	$("#hidden-textarea").hide();
	$(".reply-form").hide();

/*	
		$("form").submit(function() {
			console.log($(":input.form-control:first"));
			var abort = false;
			$(':input.form-control').each(function(){
				if ($(this).val()==='') {
					$(this).after('<div class="error alert alert-danger">Did you forget something?</div>');
					abort = true
				}
			});
			if (abort) {return false;} else {return true;}
		});
	



	$( "form" ).submit(function( event ) {
		$("div.error").remove();
		console.log($(this).closest(":input"));
  		if ($(":input").val()==='') {
    		$(this).before('<div class="error alert alert-danger">Did you forget something?</div>');
    		event.preventDefault();
  		}
  		else {return false;} 	
  		return false;	
	});
*/

	$(".alert-info").delay(4000).fadeOut("fast", "linear");


	$("#newpost").on("click", function() {
 		$("#hidden-textarea").fadeToggle("fast", "linear");
	});

	$(".show-reply").on("click", function(event) {
		var parentContainer = $(event.target).closest(".initial-post");

		var	replyTextarea = parentContainer.find(".reply-form");
		replyTextarea.fadeToggle("fast", "linear");
	});

});

	