return {
	id = "W2035",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。装置を破壊すれば内部に保存される物資を確保できますが、思わぬ影響が発生する恐れがあります",
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
					content = "回収する",
					flag = 1
				},
				{
					content = "装置から離れる",
					flag = 2
				}
			}
		}
	}
}
