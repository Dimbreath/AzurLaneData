return {
	id = "W610302",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "調査ポイントに到着しました。サルベージ作業を開始しますか？",
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
					content = "資源をサルベージしよう",
					flag = 1
				},
				{
					content = "まだ大丈夫",
					flag = 2
				}
			}
		}
	}
}
