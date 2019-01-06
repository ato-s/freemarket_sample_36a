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
