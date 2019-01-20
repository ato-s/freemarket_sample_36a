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

  var picture_container = $(".p-sell_upload_items-container");
//   // // 処理
//   // // todo: 写真の最大枚数は10枚

  // //写真が選択されたとき、写真を表示
  $(".p-sell_upload_drop-box").on("change",function(e){
    var insertPicture = "";
    var file = e.target.files[0];
    var reader = new FileReader();
    console.log(params);

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
  });

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

  $(".p-sell_form").on("submit", function(){
  })
})
