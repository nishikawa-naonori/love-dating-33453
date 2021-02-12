function check() {
  const romances = document.querySelectorAll(".romance");  //クラス名がcommentのHTML要素を撮ってきてる
  romances.forEach(function (romance) { 

    if (romance.getAttribute("data-load") != null) {
      return null;
    }
    romance.setAttribute("data-load", "true");

    romance.addEventListener("click", () => { 
      const romanceId = romance.getAttribute("data-id1");
      
      console.log(romanceId); 

      const XHR = new XMLHttpRequest();                 //Ajax通信を可能にするためのオブジェクト
      XHR.open("GET", `/romances/${romanceId}/kaiketu/`, true);  // リクエスト先を決めている  link_toと同じ
      XHR.responseType = "json";                        // 今回のレスポンスは、html→JSON形式のデータ
      XHR.send();                                     // 送信する

      XHR.onload = () => {

        const item = XHR.response.romance;

        console.log(item); 

        if (item.kaiketu === true) {                   //クリックされたら
          romance.setAttribute("data-check1", "true");
      

        } else if (item.kaiketu === false) {           //クリックされたら
          romance.removeAttribute("data-check1");
        
        }
      };


    });
  });
}


setInterval(check, 1000);