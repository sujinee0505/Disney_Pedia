	$(function() {
		var width = $('.scroll').width();
		$(document).on('click', '.right', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX + width);
		});
		$(document).on('click', '.left', function() {
			var scrollX = $(this).siblings('.scroll').scrollLeft();
			$(this).siblings('.scroll').scrollLeft(scrollX - width);
		});
		$('.scroll').scroll(
				function() {
					if ($(this).scrollLeft() + $(this).innerWidth() >= $(this)
							.prop('scrollWidth')) {
						$(this).parent().find('.right').hide();
					} else {
						$(this).parent().find('.right').show();
					}
				});
		$('.scroll').scroll(function() {
			if ($(this).scrollLeft() == 0) {
				$(this).parent().find('.left').hide();
			} else if ($(this).scrollLeft() != 0) {
				$(this).parent().find('.left').show();
			}
		});

		more = function() {
			var status = $('#status').text();
			if (status == '더보기') {
				$('#overview').css('display', 'block');
				$('#status').text('접기');
			} else if (status == '접기') {
				$('#overview').css('display', '-webkit-box');
				$('#status').text('더보기');
			}
		}
		$(document).ready(
				function() {
					var height = $('#overview').height();
					if (height > 96) {
						$('#overview').removeClass('css-kywn6v-StyledText')
								.addClass('css-kywn7v-StyledText');
						$('#status').show();
					}
				});

	});