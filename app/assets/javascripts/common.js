$(document).on('turbolinks:load', function() {
  // common：modal
  $('.js-modal').magnificPopup({
    type: 'inline',
    showCloseBtn: false
  });
  $('.c-modal').on('click', '.js-modal_btn-cancel', function (e) {
    e.preventDefault();
    $.magnificPopup.close();
  });

  // common：accordion
  $('.c-accordion_toggle').on('click', function() {
    $(this).next('.c-accordion_child').slideToggle();
    $(this).children('.c-accordion_icon').toggleClass('is-active');
  });

  // common：navi active
  $('.js-active a').each(function(){
    var url = window.location.pathname;
    var navilink = $(this).attr('href');
    if(url.match(navilink)) {
        $(this).addClass('is-active');
    } else {
        $(this).removeClass('is-active');
    }
  });

  // common：tab
	$('.js-tab_menu li').click(function() {
		var num = $(this).parent().children('li').index(this);
		$(this).parent().each(function(){
			$('>li',this).removeClass('is-active').eq(num).addClass('is-active');
		});
		$(this).parent().next().children('.js-tab_content').hide().eq(num).show();
	}).first().click();

  // common：tip
  var tipBtn = $('.js-tip_btn')
  var tipBox = $('.js-tip_box')
  tipBtn.on('click', function() {
    $(this).next(tipBox).addClass('is-show');
    if(tipBox.hasClass('is-show')){
      $(document).on('click touchend', function(e) {
        if (!$(e.target).closest(tipBox).length) {
          tipBox.removeClass('is-show');
        }
      });
      return false
    }
  });

  // common：smooth scroll
  $('.js-scroll').click(function(){
    var speed = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
})
