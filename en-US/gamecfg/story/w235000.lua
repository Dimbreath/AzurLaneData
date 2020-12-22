return {
	id = "W235000",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "We’ve achieved all our objectives for this operation. It’s time to head back to Dakar.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			side = 2,
			dir = 1,
			say = "You have reached the end of the currently implemented story. The Operation Siren map will still reset at regular periods, but the Operation Siren Data Logger can be bought from the shop to give you immediate access to all zones.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		}
	}
}
