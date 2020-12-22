return {
	id = "W610303",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。さらなる資材の反応を検出しました。サルベージを続行しますか？",
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
					content = "もう大丈夫",
					flag = 2
				}
			}
		}
	}
}
