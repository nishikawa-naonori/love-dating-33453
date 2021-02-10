
if (document.URL.match( /sign_up/ )) {

  window.addEventListener('load',function(){


    const nickName = document.getElementById("nickname");
    const eMail = document.getElementById("email");
    const passWord = document.getElementById("password");
    const passWordConfirmation = document.getElementById("password-confirmation");
//--------------------------------------------------------------
    nickName.addEventListener("blur", e => { 
      const nickNameError = document.getElementById("nickname-error")
      if (nickName.value == ""){
        nickNameError.removeAttribute("hidden")
        }else if(!nickName.value.match(/\S/g)){
      nickNameError.removeAttribute("hidden")

      } else {
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
      passWord.addEventListener("blur", e => { 
        const passWordError = document.getElementById("password-error")
        const passWordValidate = /^(?=.*[a-z])(?=.*[0-9])[0-9a-z]{6,}$/;
        if (passWordValidate.test(passWord.value)){
          passWordError.setAttribute("hidden", true)
        } else {
          passWordError.removeAttribute("hidden")
        }
      })

//--------------------------------------------------------------
      passWordConfirmation.addEventListener("blur", e => { 
        const passWordConfirmationError = document.getElementById("password-confirmation-error")
        if (passWord.value == passWordConfirmation.value){
          passWordConfirmationError.setAttribute("hidden", true)
        } else {
          passWordConfirmationError.removeAttribute("hidden")
        }
      })

    })
  };



 
