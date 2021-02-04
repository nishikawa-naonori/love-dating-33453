
$(function () {
  $(document).on("mouseover", "h2", function () {
    console.log("9999999"); 

    $(this).css({ "color": "blue" });
  }).on("mouseout", "h2", function () {
    $(this).css({ "color": "" });
  })
});