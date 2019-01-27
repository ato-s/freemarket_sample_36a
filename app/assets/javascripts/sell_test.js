$(function(){

  //メソッドの定義

  function appendPicture(picture){
    var html = `<div class='p-sell_upload_item'>
                   <figure class='p-sell_upload_figure' style="background-image: url(${picture})"></figure>
                  <ul class='p-sell_upload_button'>
                    <li>
                      <a id="upload_item_edit" >編集</a>
                    </li>
                    <li>
                      <a id="upload_item_delete" >削除</a>
                    </li>
                  </ul>
                </div>`
    return html;
  }

  function appendMiddlecategoryForm(upper_category_id){

    var html = `<div class="c-form_group">
                  <%= f.label :middle_category_id do %>
                    <span></span>
                  <% end %>
                  <div>
                    <div class="c-select-wrap">
                      <%= f.collection_select :middle_category_id, MiddleCategory.where(upper_category_id: ${upper_category_id}), :id, :name, include_blank: "---" %>
                    </div>
                  </div>
                </div>`
    return html;
  }

  // // input(picture.file_field)の値を消去
  // function deleteAllPictureValue(){
  //   var figure_box_number = $(".p-sell_upload_figure").length; //0,1,2...
  //   for( var content_i = 0; content_i <= figure_box_number ; content_i++ ){
  //     $("#item_pictures_attributes_" + content_i + "_content").val("")
  //   }
  // }

  // input(picture.file_field)に値を入力
  // function addPictureValue(){
  //   var figure_box_number = $(".p-sell_upload_figure").length; //0,1,2...
  //   var picture_value = [];
  //   var picture_target = $(".p-sell_upload_figure");
  //   var content_i = 0;

  //   if(figure_box_number > 0){
  //     content_i = 0;
  //     var picture_url = picture_target.eq(content_i).css("background-image");
  //     // console.log(picture_url);
  //   }

  //   if(figure_box_number > 0 ){
  //     for(var content_i = 0; content_i < figure_box_number ; content_i++ ){
  //       var picture_url = picture_target.eq(content_i).css("background-image");
  //       picture_url = picture_url.replace(/^url\(\"|\"\)/g, "");
  //       picture_value.push(picture_url);
  //     }
  //   }

  //   console.log(picture_value);

  //   for(content_i=0; content_i < figure_box_number ; content_i++ ){
  //     $("#item_pictures_attributes_" + content_i + "_content").val(picture_value[content_i]);
  //   }
  // }

  var picture_container = $(".p-sell_upload_items-container");
//   // // 処理
//   // // todo: 写真の最大枚数は10枚

  // //写真が選択されたとき、写真を表示
  $(".p-sell_upload_drop-box").on("change",function(e){
    var insertPicture = "";
    var file = e.target.files[0];
    var file1 = e.target.files[1];
    var reader = new FileReader();

    reader.addEventListener("load", function(){
      insertPicture = appendPicture(reader.result);
      if($('div').hasClass('p-sell_upload_item') == true){
        $('.p-sell_upload_item:last').after(insertPicture);
      }else{
        picture_container.prepend(insertPicture);
      }
    },false);

    if(file){
      reader.readAsDataURL(file);
    }

    // deleteAllPictureValue();
  });

  // $("#item_pictures_attributes_0_content").on("change", function(){
  //   var value = $(this).val();
  //   console.log(value);
  //   $("#item_pictures_attributes_1_content").val() = value;
  //   $("#item_pictures_attributes_0_content").val() = $("#item_pictures_attributes_1_content").val();
  // })

  // // 編集ボタンが押された時の処理 -> 写真の編集
  // // 写真の編集:=140x140でトリミング
  // // todo: appendで追加したクラスに適用可能か
  // $("#upload_item_edit").on("click", function(){

  // });

  // 削除ボタンが押された時の処理 -> 写真の削除
  picture_container.on("click", "#upload_item_delete", function(){
    var delete_target = $(this).parents(".p-sell_upload_item");
    delete_target.remove();
  });

  // $("#item_upper_category_id").on("change", function(){
  //   var upper_category_id = $(this).val();
  //   var insert_html = "";
  //   console.log(upper_category_id);
  //   insert_html = appendMiddlecategoryForm(upper_category_id);
  //   $("#product_category").after(insert_html);
  // })


  // 販売手数料、販売利益の表示
  $(".c-input-default").on("keyup", function(){
    var price = $(this).val();
    var commission_fee = Math.floor(price*0.1);
    var sales_profit = price - commission_fee;

    if (300 <= price && price <= 9999999){
      $("#commission_price").html(commission_fee.toLocaleString('ja-JP', {"style": "currency", "currency": "JPY"}));
      $("#commission_price_val").val(commission_fee);
      $("#profit").html(sales_profit.toLocaleString('ja-JP', {"style": "currency", "currency": "JPY"}));
      $("#sell_price_val").val(sales_profit);
    }else{
      $("#commision_price").html("-");
      $("#profit").html("-");
    }
    // test
    // test
  });

  $("#profit").on("change", "#sell_price_val", function(){
    // addPictureValue();exi
  })

  $(".p-sell_form").on("submit",function(){
    console.log("success");
  })
})