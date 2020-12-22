return {
	id = "W1040",
	mode = 2,
	once = true,
	scripts = {
		{
			paintingNoise = true,
			side = 2,
			dir = 1,
			actor = 900284,
			nameColor = "#a9f548",
			say = "A special Siren resource supply has been located. Due to a lack of power, it can no longer be opened through normal means. How should I proceed?",
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
					content = "Use an Energy Storage Device.",
					flag = 0
				},
				{
					content = "Smash it open.",
					flag = 1
				},
				{
					content = "Leave it for now.",
					flag = 2
				}
			}
		}
	}
}
