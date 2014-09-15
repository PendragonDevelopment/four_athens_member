


$(document).ready(function() {

	//hide textareas
	$("#hiddenTextareaDiv").hide();
	$(".reply-form").hide();


    //whiteboard form validation
	$("form").submit(function() {
		$("div.error").remove();
		var this_textarea = $(this).find(".form-validate");
		if (this_textarea.val()==='') {
				$(this).before('<div class="error alert alert-info">Did you forget something?</div>');
				event.preventDefault();
			};

	});


	
	$(".alert-info").delay(4000).fadeOut("fast", "linear");


	$("#newpost").on("click", function() {
 		$("#hiddenTextareaDiv").fadeToggle("fast", "linear");
 		$(".newPostTextArea").focus();
	});

	$(".show-reply").on("click", function(event) {
		var parentContainer = $(event.target).closest(".initial-post");

		var	replyTextareaDiv = parentContainer.find(".reply-form");
		replyTextareaDiv.fadeToggle("fast", "linear");
		var replyTextarea = parentContainer.find(".reply-txtarea");
		replyTextarea.focus();
	});

});

	