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

  function displayPicture(pictureOriginal){
      var insertPicture = "";
      insertPicture = appendPicture(pictureOriginal);
      if($('div').hasClass('p-sell_upload_item') == true){
        $('.p-sell_upload_item:last').after(insertPicture);
      }else{
        picture_container.prepend(insertPicture);
      }
  }

  function appendHiddenInput(targetNumber){
    var revise_name = 'item[pictures_attributes]['+ targetNumber +'][status]';
    var revise_id = 'item_pictures_attributes_'+ targetNumber +'_status';
    var hiddenInput = $('<input/>',{value: targetNumber, type: 'hidden', name: revise_name, id: revise_id});
    return hiddenInput;
  }

  function appendFileInput(targetNumber){
    var revise_name = 'item[pictures_attributes]['+ targetNumber +'][content]';
    var revise_id = 'item_pictures_attributes_'+ targetNumber +'_content';
    var fileInput = $('<input/>',{type: 'file', name: revise_name, id: revise_id, style: "display: block"});
    return fileInput;
  }


  function getTargetInput(variabelenumber){
    var target_input = $("#item_pictures_attributes_"+ variabelenumber +"_content");
    return target_input;
  }

  function getUploaderBoxIndex(){
    if($(".p-sell_upload_item").length){
      var box_number = $(".p-sell_upload_item").length;
      return box_number;
    }else{
      return 0;
    }
  }

  function changeInputIdAndName(variabelenumber, revisednumber){
    var new_number = revisednumber - 1;

    //f.file_fieldの名前の変更
    var target_input_content = $("#item_pictures_attributes_"+ variabelenumber +"_content");
    target_input_content.attr('name', 'item[pictures_attributes]['+ new_number +'][content]');
    target_input_content.attr('id', 'item_pictures_attributes_'+ new_number +'_content');

    //hidden_field_statusの名前の変更
    var target_input_status = target_input_content.next('#item_pictures_attributes_'+ variabelenumber +'_status');
    target_input_status.attr('name', 'item[pictures_attributes]['+ new_number +'][status]');
    target_input_status.attr('id', 'item_pictures_attributes_'+ new_number +'_status');
    target_input_status.attr('value', new_number);

    //hidden_field_idの名前の変更
    var target_input_id = target_input_status.next('#item_pictures_attributes_'+ variabelenumber +'_id');
    target_input_id.attr('name', 'item[pictures_attributes]['+ new_number +'][id]');
    target_input_id.attr('id', 'item_pictures_attributes_'+ new_number +'_id');
  }

  function deleteIdAndStatusField(targetNumber){
    var target_input_status = $("#item_pictures_attributes_"+ targetNumber +"_status");
    var target_input_id = $("#item_pictures_attributes_"+ targetNumber +"_id");

    target_input_status.remove();
    target_input_id.remove();
  }

//   // // 処理
//   // // todo: 写真の最大枚数は10枚
  var picture_container = $(".p-sell_upload_items-container");

  // 商品の編集のとき、登録されている写真を表示
  if( $(location).attr('pathname').match(/edit/)){
    var size = $('[picture_location]').length ;
    for(var i = 0 ; i < size ; i++ ){
      var picture_file_present = $('#item_pictures_attributes_'+ i +'_id').attr('picture_location');
      var target_input = getTargetInput(i);
      target_input.css({
        "display": "none"
      });
      displayPicture(picture_file_present);
    }
    getTargetInput(i).css({
      'display': 'block'
    });
  }

  if($(location).attr('pathname').match(/new/)){
    if($('div').hasClass('p-sell_upload_drop-box') == true){
      var displayInput = getTargetInput(0);
      displayInput.css('display','block');
    }
  }


  // //写真が選択されたとき、写真を表示
  $(".p-sell_upload_drop-box").on("change",function(e){
    var picture_file = e.target.files[0];
    var reader = new FileReader();

    var target_index = getUploaderBoxIndex();
    var target_input = getTargetInput(target_index);
    var target_next_input = getTargetInput(target_index + 1 );

    var hiddenInput = appendHiddenInput(target_index);
    target_input.after(hiddenInput);

    reader.addEventListener("load", function(){
      displayPicture(reader.result);
    },false);

    if(picture_file){
      reader.readAsDataURL(picture_file);
    }

    target_input.css('display','none');
    target_next_input.css('display','block');
  });

  // // 編集ボタンが押された時の処理 -> 写真の編集
  // // 写真の編集:=140x140でトリミング
  // // todo: appendで追加したクラスに適用可能か
  // $("#upload_item_edit").on("click", function(){

  // });

  // 削除ボタンが押された時の処理 -> 写真の削除
  picture_container.on("click", "#upload_item_delete", function(){
    var delete_target = $(this).parents(".p-sell_upload_item");
    var target_input_index = delete_target.index();
    var delete_input = getTargetInput(target_input_index);

    var empty_input_index = getUploaderBoxIndex();
    var empty_input = getTargetInput(empty_input_index);

    console.log(target_input_index);

    deleteIdAndStatusField(target_input_index);
    delete_input.remove();

    var new_taget_input_index = target_input_index;

    // それぞれの名前の数字に+1する(inputの箱をずらす)
    for(var i = 1; target_input_index + i < empty_input_index ; i++){
      new_taget_input_index = target_input_index + i;
      changeInputIdAndName(new_taget_input_index, new_taget_input_index);
    }

    empty_input.before(appendFileInput(new_taget_input_index));

    empty_input.css('display','none');

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
  })

  $(".p-sell_form").on("submit",function(){
    $("[picture_location]").each(function(){
      console.log($(this).val());
    });
  })
})
