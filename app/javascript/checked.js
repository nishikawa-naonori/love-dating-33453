function check() {
  const comments = document.querySelectorAll(".comment");  //クラス名がcommentのHTML要素を撮ってきてる
  comments.forEach(function (comment) { 

    if (comment.getAttribute("data-load") != null) {
      return null;
    }
    comment.setAttribute("data-load", "true");


    comment.addEventListener("click", () => { 
      const commentId = comment.getAttribute("data-id");
      
      // const cccId     = document.getElementById("profit");   

      console.log(commentId); 

      const XHR = new XMLHttpRequest();                 //Ajax通信を可能にするためのオブジェクト
      XHR.open("GET", `/romances/${commentId}/checked/`, true);  // リクエスト先を決めている  link_toと同じ
      XHR.responseType = "json";                        // 今回のレスポンスは、html→JSON形式のデータ
      XHR.send();                                     // 送信する

      XHR.onload = () => {

        // if (XHR.status != 200) {
        //   alert(`Error ${XHR.status}: ${XHR.statusText}`);
        //   return null;          
        // }


        const item = XHR.response.comment;
        if (item.checked === true) {
          comment.setAttribute("data-check", "true");
      

        } else if (item.checked === false) {
          comment.removeAttribute("data-check");
        
        }
      };


    });
  });
}


setInterval(check, 1000);