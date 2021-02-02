// 金額を入力した数値をpriceInputという変数に格納する
window.addEventListener('load', () => {             // 入力された時
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {       // 入力された時

    const inputValue = priceInput.value;        // .valueとは自分が入力した内容を取得 変数名 = ｛キー: バリュー｝
    // 販売手数料                                                                  変数名 = ｛priceInput: .value｝
    
    const charNum1  = document.getElementById("add-tax-price");
    charNum1.innerHTML = Math.floor(inputValue * 0.1);       //  innerHTML ビューファイルに表示できる

    
    // 販売手数料
    const charNum2  = document.getElementById("profit");
    charNum2.innerHTML = Math.ceil(inputValue * 0.9);
  })
})


