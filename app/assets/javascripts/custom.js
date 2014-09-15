


$(document).ready(function() {

	

    //whiteboard form validation
	$("form").submit(function() {
		$("div.error").remove();
		var this_textarea = $(this).find(".form-validate");
		if (this_textarea.val()==='') {
				$(this).before('<div class="error alert alert-info">Did you forget something?</div>');
				event.preventDefault();
			};
	});

    //micro_bio form validation
	$("form").submit(function() {
		$("div.error").remove();
		var this_textarea = $(this).find(".micro-bio-validate");
		console.log(this_textarea.val().length);
		if (this_textarea.val().length > 140) {
				$(this_textarea).after('<div class="error alert alert-info">The character limit on a Micro-bio is 140.</div>');
				event.preventDefault();
			};
	});

	//hide textareas
	$("#hiddenTextareaDiv").hide();
	$(".reply-form").hide();

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

	