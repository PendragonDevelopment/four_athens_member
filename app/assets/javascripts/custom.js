


$(document).ready(function() {
	$("#hidden-textarea").hide();
	$(".reply-form").hide();


	$("#newpost").on("click", function() {
 		$("#hidden-textarea").fadeToggle("fast", "linear");
	});

	$(".show-reply").on("click", function(event) {
		var parentContainer = $(event.target).closest(".initial-post");

		var	replyTextarea = parentContainer.find(".reply-form");
		replyTextarea.fadeToggle("fast", "linear");
	});

});

	