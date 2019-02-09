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

  function getTargetInput(variabelenumber){
    var target_input = $("#item_pictures_attributes_"+ variabelenumber +"_content");
    return target_input;
  }

  function getUploaderBoxIndex(){
    if($(".p-sell_upload_item").length){
      var box_number = $(".p-sell_upload_item").length;
      var uploader_box_index = 9 - box_number;
      return uploader_box_index;
    }else{
      return 9;
    }
  }

  function changeInputIdAndName(variabelenumber, revisednumber){
    var target_input = $("#item_pictures_attributes_"+ variabelenumber +"_content");
    var new_number = revisednumber + 1;
    target_input.attr('name', 'item[pictures_attributes]['+ new_number +'][content]');
    target_input.attr('id', 'item_pictures_attributes_'+ new_number +'_content');
  }

  var picture_container = $(".p-sell_upload_items-container");
//   // // 処理
//   // // todo: 写真の最大枚数は10枚

  // //写真が選択されたとき、写真を表示
  $(".p-sell_upload_drop-box").on("change",function(e){
    var insertPicture = "";
    var picuture_file = e.target.files[0];
    var reader = new FileReader();
    var target_index = getUploaderBoxIndex();
    var target_input = getTargetInput(target_index);

    reader.addEventListener("load", function(){
      insertPicture = appendPicture(reader.result);
      if($('div').hasClass('p-sell_upload_item') == true){
        $('.p-sell_upload_item:last').after(insertPicture);
      }else{
        picture_container.prepend(insertPicture);
      }
    },false);

    if(picuture_file){
      reader.readAsDataURL(picuture_file);
    }

    target_input.css({
      "display": "none"
    });
  });

  // // 編集ボタンが押された時の処理 -> 写真の編集
  // // 写真の編集:=140x140でトリミング
  // // todo: appendで追加したクラスに適用可能か
  // $("#upload_item_edit").on("click", function(){

  // });

  // 削除ボタンが押された時の処理 -> 写真の削除
  picture_container.on("click", "#upload_item_delete", function(){
    var delete_target = $(this).parents(".p-sell_upload_item");
    var target_input_index = 9 - delete_target.index();
    var delete_input = getTargetInput(target_input_index);

    var empty_input = getUploaderBoxIndex();

    // 削除されたinputの名前,idの数字を10にする(名前の競合の回避)(1時的な避難場所)
    delete_input.attr('name', 'item[pictures_attributes][10][content]')
    delete_input.attr('id', 'item_pictures_attributes_10_content');
    var target_input_10 = getTargetInput(10);

    // それぞれの名前の数字に+1する(inputの箱をずらす)
    for(var i = 1; target_input_index - i > empty_input ; i++){
      var new_taget_input_index = target_input_index -i;
      changeInputIdAndName(new_taget_input_index, new_taget_input_index);
    }

    // inputのnameの数字が10のものを空いた数字のnameにする
    changeInputIdAndName(10,empty_input);
    target_input_10.css({
      "display": "block"
    });

    delete_target.remove();
  });

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
  });

  $("#profit").on("change", "#sell_price_val", function(){
    // addPictureValue();exi
  })

  $(".p-sell_form").on("submit",function(){
    console.log("success");
  })
})
