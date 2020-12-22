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
			say = "检测到塞壬的特殊资源补给。因为能源枯竭，已经无法正常开启了。不过，就算强行破坏也能回收一定材料。",
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
					content = "使用[塞壬能源存储器]（额外获得适应性）",
					flag = 0
				},
				{
					content = "直接破坏",
					flag = 1
				},
				{
					content = "暂时离开",
					flag = 2
				}
			}
		}
	}
}
