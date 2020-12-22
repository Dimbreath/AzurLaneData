return {
	id = "W2107",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "このエリアに再び入ることはないだろう。",
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
					content = "エリアから離脱する",
					flag = 1
				},
				{
					content = "もう少し探索する",
					flag = 0
				}
			}
		}
	}
}
