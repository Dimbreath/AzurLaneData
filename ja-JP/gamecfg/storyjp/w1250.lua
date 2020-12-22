return {
	id = "W1250",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。海面下に何かがあるようです。オフニャを派遣し、サルベージ作業を行いますか？",
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
					content = "オフニャ、出動！（オフニャスキルが一時適用されなくなります）",
					flag = 0
				},
				{
					content = "別にいいか",
					flag = 1
				}
			}
		}
	}
}
