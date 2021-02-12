function check() {
  const comments = document.querySelectorAll(".comment");  //クラス名がcommentのHTML要素を撮ってきてる
  comments.forEach(function (comment) { 

    if (comment.getAttribute("data-load") != null) {
      return null;
    }
    comment.setAttribute("data-load", "true");

    comment.addEventListener("click", () => { 
      const commentId = comment.getAttribute("data-id");
      
      console.log(commentId); 

      const XHR = new XMLHttpRequest();                 //Ajax通信を可能にするためのオブジェクト
      XHR.open("GET", `/romances/${commentId}/checked/`, true);  // リクエスト先を決めている  link_toと同じ
      XHR.responseType = "json";                        // 今回のレスポンスは、html→JSON形式のデータ
      XHR.send();                                     // 送信する

      XHR.onload = () => {

        const item = XHR.response.comment;

        console.log(item); 

        if (item.checked === true) {                   //クリックされたら
          comment.setAttribute("data-check", "true");
      

        } else if (item.checked === false) {           //クリックされたら
          comment.removeAttribute("data-check");
        
        }
      };


    });
  });
}


setInterval(check, 1000);