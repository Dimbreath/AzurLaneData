return {
	id = "W1252",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "オフニャがレア資材を発見したようです。サルベージ完了までしばらくお待ち下さい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			},
			options = {
				{
					content = "わかった。",
					flag = 0
				}
			}
		}
	}
}
