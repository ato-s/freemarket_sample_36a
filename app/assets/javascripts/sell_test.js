// $(function(){

//   // 出品データ
//   $(".p-sell_form").on("submit", function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     $.ajax({

//     })
//     .done(function({

//     })
//   });



  // var picture_container = $(".p-sell_upload_items-container");

  // //メソッドの定義

  // function appendPicture(picture_url){
  //   var html = `<div class='p-sell_upload_item'>
  //                 <figure class='p-sell_upload_figure' style="background-image: url(${picture_url})"></figure>
  //                 <ul class='p-sell_upload_button'>
  //                   <li>
  //                     <a id="upload_item_edit" >編集</a>
  //                   </li>
  //                   <li>
  //                     <a id="upload_item_delete" >削除</a>
  //                   </li>
  //                 </ul>
  //               </div>`
  //   return html;
  // }


  // // 処理
  // // todo: 写真の最大枚数は10枚

  // //写真が選択されたとき、写真を表示
  // $(".p-sell_upload_drop-box").on("change",function(e){
  //   var file = e.target.files[0],
  //       reader = new FileReader() ;

  //   reader.onload = (function(file) {
  //     return function(e) {
  //       var picture_url = e.taget.result;
  //       picture_container.appendPicture(picture_url);
  //     };
  //   })(file);

  // });


  // // 編集ボタンが押された時の処理 -> 写真の編集
  // // 写真の編集:=140x140でトリミング
  // // todo: appendで追加したクラスに適用可能か
  // $("#upload_item_edit").on("click", function(){

  // });

  // // 削除ボタンが押された時の処理 -> 写真の削除
  // // todo: appendで追加したクラスに適用可能か
  // $("#upload_item_delete").on("click", function(){

  // });

// })