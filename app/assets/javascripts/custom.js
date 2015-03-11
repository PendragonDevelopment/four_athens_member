$(document).ready(function() {

	$('#skills').sortable({
		axis: "y",
		update: function(event,ui) {
			$.post($(this).data('update-url'), $(this).sortable('serialize') );

		}
	});

	$('textarea').autosize();

	//custom textarea focus
	$(".reply-txtarea").on("focus", function(){
		parentToReplyTextarea = $(this).closest(".reply-form");
		parentToReplyTextarea.addClass('reply-focus');
	});
	$(".reply-txtarea").on("blur", function(){
		parentToReplyTextarea = $(this).closest(".reply-form");
		parentToReplyTextarea.removeClass('reply-focus');
	});


	//whiteboard form validation
	$("form").submit(function() {
		$("div.error").remove();
		var this_textarea = $(this).find(".form-validate");
		if (this_textarea.val()==='') {
			$(this).before('<div class="error alert alert-info">Did you forget something?</div>');
			event.preventDefault();
		}
	});

<<<<<<< HEAD
    //micro_bio form validation
=======
	//micro_bio form validation
>>>>>>> 063e5da19450a75e5dbb714d4d0eb55fd3d34fb8
	$(".profile-form").submit(function() {
		$("div.error").remove();
		var this_textarea = $(this).find(".micro-bio-validate");
		if (this_textarea.val().length > 140) {
			$(this_textarea).after('<div class="error alert alert-info">The character limit on a Micro-bio is 140.</div>');
			event.preventDefault();
		}
	});

	//hide textareas
	$("#hiddenTextareaDiv").hide();
//	$(".reply-form").hide();

	$(".alert-info").delay(7000).fadeOut("fast", "linear");


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

function stripeResponseHandler(status, response) {
	var $form = $('form.payment-form');

	if (response.error) {
        // Show the errors on the form
        $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
      } else {
        // response contains id and card, which contains additional card details
        var token = response.id;
        var last4 = response.card.last4;
        // Insert the token into the form so it gets submitted to the server
        $form.append($('<input type="hidden" name="stripe_token" />').val(token));
        $form.append($('<input type="hidden" name="last_4_digits" />').val(last4));
        // and submit
        $form.get(0).submit();
      }
    }

    jQuery(function($) {
			$('form.payment-form').submit(function(event) {
				var $form = $(this);

        // Disable the submit button to prevent repeated clicks
        $form.find(':submit').prop('disabled', true);

        Stripe.card.createToken($form, stripeResponseHandler);

        // Prevent the form from submitting with the default action
        return false;
      });
    });


  });


