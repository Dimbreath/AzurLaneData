return {
	id = "W2107",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "Once we leave, it’s doubtful that we’ll ever come back here.",
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
					content = "Leave the zone.",
					flag = 1
				},
				{
					content = "Look around more first.",
					flag = 0
				}
			}
		}
	}
}
