// common：modal
$(document).ready(function() {
  $('.js-modal').magnificPopup({
    type: 'inline',
    showCloseBtn: false
  });
  $('.c-modal').on('click', '.js-modal_btn-cancel', function (e) {
    e.preventDefault();
    $.magnificPopup.close();
  });
});
// common：accordion
$(function() {
  $('.c-accordion_toggle').on('click', function() {
    $(this).next('.c-accordion_child').slideToggle();
    $(this).children('.c-accordion_icon').toggleClass('is-active');
  });
});
