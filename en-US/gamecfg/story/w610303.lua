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
			say = "Scan complete. Additional supplies have been detected. Do you want to continue retrieval operations?",
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
					content = "Let’s do it.",
					flag = 1
				},
				{
					content = "We’ve retrieved enough.",
					flag = 2
				}
			}
		}
	}
}
