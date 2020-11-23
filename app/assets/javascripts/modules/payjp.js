window.addEventListener('DOMContentLoaded', function(){
  console.log("hoge")
  //id名が"payment_card_submit-button"というボタンが押されたら取得
  let btn = document.getElementById('token_submit');
  Payjp.setPublicKey('pk_test_d5231006a99ce6fd2f663ad6'); //公開鍵の記述(ご自身の公開鍵コードを記述しよう！)

  btn.addEventListener('click', function(e){ //ボタンが押されたらトークン作成開始。

    e.preventDefault(); //ボタンを1度無効化

    let card = { //入力されたカード情報を取得(id名の記載ミスに注意！)
        number: document.getElementById("card_no").value,
        cvc: document.getElementById("card_cvc").value,
        exp_month: document.getElementById("card_month").value,
        exp_year: document.getElementById("card_year").value
    };
    console.log(card);
    
    Payjp.createToken(card, function(status, response) {  // トークンを生成
      if (status === 200) { //成功した場合(status === 200はリクエストが成功している状況です。)
        //データを自サーバにpostしないようにremoveAttr("name")で削除
        console.log()
        $("#card_no").removeAttr("name");
        $("#card_cvc").removeAttr("name");
        $("#card__month").removeAttr("name");
        $("#card__year").removeAttr("name"); 
        $("#charge-form").append(
          $('<input type="hidden" name="payjp_token">').val(response.id)
        ); //取得したトークンを送信できる状態にします
        $("#charge-form").get(0).submit();
      } else {
        alert("カード情報が正しくありません。"); //エラー確認用
      }
    });
  });
});
