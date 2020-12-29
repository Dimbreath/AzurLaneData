return {
	mode = 2,
	once = true,
	id = "GWORLDS06",
	skipTip = false,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "「セイレーン海域情報」を使用しました。海域の移動制限が解除され、報酬（エリア詳細画面で表示）を全部入手され、さらにエリアの移動制限が解除された。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			options = {
				{
					content = "エリアを自由に行き来できるようになった。",
					flag = 0
				}
			}
		}
	}
}
