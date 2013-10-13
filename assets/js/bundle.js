
$(function(){
	// we know jQuery is included for bootstrap, so just use its load-event detection
	prettyPrint();

	//search form button activation
	$("#searchbox").on('focus', function(){
		$(this).closest('form').find('button').show('fast');
	}).on('blur', function(){
		var $this = $(this);
		if ($this.val().length === 0){
			$(this).closest('form').find('button').hide('fast');
		}
	});

	//bg parallax
	$(window).on('scroll', function(){
		var top = $(window).scrollTop();
		top = top / 2;
		top = Math.round(top);
		if (top < -600) return;
		$('#parallax').css({'top': top+'px'});
	});

	$(".post a > img").each(function(){
		$(this).closest('a').attr('data-lightbox', 'lightbox');
	});

});
