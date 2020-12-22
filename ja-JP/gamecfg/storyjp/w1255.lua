return {
	id = "W1253",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "サルベージ作業が完了しました。オフニャとレア資材の回収に成功しました",
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
					content = "确定",
					flag = 0
				}
			}
		}
	}
}
