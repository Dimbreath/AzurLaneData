return {
	id = "W2003",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。セイレーンの異常浮氷を操作できる装置だと思われます",
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
					content = "装置を破壊する",
					flag = 0
				},
				{
					content = "装置から離れる",
					flag = 1
				}
			}
		}
	}
}
