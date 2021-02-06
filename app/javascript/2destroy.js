alert('いいねが押せている！'); 

console.log("いいねを押す"); 



document.getElementById('romance_<%= @romance.id %>').innerHTML = '<%= j(render @romance) %>'