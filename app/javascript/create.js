console.log("check2222222")



$("#like-buttonc").html("<%= j(render partial: 'like', locals: { romances: @romances, likes: @likes, like: @like}) %>")

console.log("check55555555555")
