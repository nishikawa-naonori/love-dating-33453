console.log("check2222222")



$("#like-buttons").html("<%= j(render partial: 'like', locals: { romances: @romances, likes: @likes, like: @like}) %>")
