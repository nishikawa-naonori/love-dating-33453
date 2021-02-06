console.log("check33333333333")


$("#like-buttond").html("<%= j(render partial: 'like', locals: { romances: @romances, likes: @likes }) %>");

console.log("check444444444")
