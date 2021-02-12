console.log("gggggggggg"); 

window.addEventListener('load',function(){


    const kaiKetu = document.getElementById("kaiketu");

//--------------------------------------------------------------
      kaiKetu.addEventListener("click", () => {   
      const kaiKetuZumi = document.getElementById("kaiketuzumi")

      if (kaiKetuZumi.value == ""){
        kaiKetuZumi.removeAttribute("hidden")
       
        console.log("333333333333333"); 
      } else {

        console.log("444444444444444"); 
        kaiKetuZumi.removeAttribute("hidden")
      }
    })
//--------------------------------------------------------------

    })




 
