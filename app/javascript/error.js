
if (document.URL.match( /sign_up/ )) {

  window.addEventListener('load',function(){


    const nickName = document.getElementById("nickname");
    const eMail = document.getElementById("email");
//--------------------------------------------------------------
    nickName.addEventListener("blur", e => { 
      const nickNameError = document.getElementById("nickname-error")
      if (nickName.value == ""){
        nickNameError.removeAttribute("hidden")
        }else if(!nickName.value.match(/\S/g)){
      nickNameError.removeAttribute("hidden")

      } else {
        console.log("いいいいいいいいいいいい"); 
        nickNameError.setAttribute("hidden", true)
      }
    })
//--------------------------------------------------------------
    eMail.addEventListener("blur", e => { 
        const eMailError = document.getElementById("email-error")
        const eMailValidate = /^[a-z]+@[a-z]{1,}$/;
        if (eMailValidate.test(eMail.value)){
          eMailError.setAttribute("hidden", true)
        } else {
          eMailError.removeAttribute("hidden")
        }

        const eMailErrorUniq = document.getElementById("email-error-uniq")
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/users`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          const uniq = XHR.response.users;

          if (uniq.includes(eMail.value)) {
            eMailErrorUniq.removeAttribute("hidden");
            eMailError.setAttribute("hidden", true)
          } else {
            eMailErrorUniq.setAttribute("hidden", true);
          }
        }
      })
//--------------------------------------------------------------

    })
  };



 
//  登録済みのメール

//  nickName.value != " "
//|| !nickName.value.trim()