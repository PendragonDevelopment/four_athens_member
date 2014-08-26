


$(document).ready(function() {

	//hide textareas
	$("#hidden-textarea").hide();
	$(".reply-form").hide();

	


$("form").submit(function() {
			$("div.error").remove();
			var this_textarea = $(this).find(".form-control");
			if (this_textarea.val()==='') {
					$(this).before('<div class="error alert alert-info">Did you forget something?</div>');
					event.preventDefault();
				};

		});



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

	