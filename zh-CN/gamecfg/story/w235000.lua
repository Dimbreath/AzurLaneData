return {
	mode = 2,
	once = true,
	id = "W235000",
	skipTip = false,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "当前海域内事件已经全部完成，即将回到达咯尔港。",
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
			say = "本次主线剧情已经全部结束，请等待后续章节开放。",
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
