return {
	mode = 2,
	once = true,
	id = "W700002",
	skipTip = false,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "即将消耗一个时空道标，对未知空间进行探索。",
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
					content = "确认",
					flag = 1
				},
				{
					content = "取消",
					flag = 0
				}
			}
		}
	}
}
