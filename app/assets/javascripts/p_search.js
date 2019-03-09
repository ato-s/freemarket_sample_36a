$(document).on('turbolinks:load', function() {

  var search_form = $("#js-brand-search");
  var search_list = $("#js-brand-search-result");
  var search_input = $("#js-brand-search-input");

  function appendBrand(brandId,name) {
    var html = `<li class="brand-search-item" data-brand-id="` + brandId + `" data-name="` + name + `">` + name + `
                </li>`;
    search_list.append(html);
  };
  function appendNoBrand(brand) {
    var html = `<li>` + brand + `</li>`;
    search_list.append(html);
  };

  search_form.on("keyup", function() {
    var input = $(this).val();
    var href = window.location.href;
    $.ajax({
      type: 'GET',
      url: href,
      data: { brand_name: input },
      dataType: 'json'
    })
    .done(function(brands) {
      search_list.empty();
      if (brands.length !== 0) {
        brands.forEach(function(brand){
          var name = brand.name;
          var brandId = brand.id;
          appendBrand(brandId,name);

          if (name == input) {
            search_input.val(brandId);
          }
        });
      } else {
        appendNoBrand("一致するブランドはありません");
      }
    })
    .fail(function() {
      alert('ブランド検索に失敗しました');
    });
  });

  $(document).on('click','.brand-search-item',function(e){
    var name = $(this).data('name');
    var brandId = $(this).data('brand-id');
    e.preventDefault();
    search_list.children('li').remove();
    search_input.val(brandId);
    search_form.val(name);
  });
});
