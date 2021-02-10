window.addEventListener('popstate', function(e) {
//alert('ブラウザバックを検知しました。');
location.reload();
console.log("ブラウザバックを検知しました。"); 

});