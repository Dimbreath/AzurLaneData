return {
	id = "W611001",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "The Siren Stronghold has been dealt with. Leave the zone either by moving a fleet outside the map boundary, or by using a Transference Device.",
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
					content = "Leave this zone.",
					flag = 0
				}
			}
		}
	}
}
