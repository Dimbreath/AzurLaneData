return {
	id = "W2007",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。セイレーン実験場の気象操作装置が完全に破壊されました",
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
					content = "装置から離れる",
					flag = 1
				}
			}
		}
	}
}
