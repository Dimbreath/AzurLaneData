return {
	id = "W1251",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "スキャンが完了しました。海面下に何かがあるようです。オフニャを艦隊に配置していれば、サルベージ作業を行うことが可能です",
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
					content = "今度オフニャを連れてこよう",
					flag = 0
				}
			}
		}
	}
}
