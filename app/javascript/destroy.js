console.log("check33333333333")


$("#like-buttons").html("<%= j(render partial: 'like', locals: { romances: @romances, likes: @likes }) %>");
