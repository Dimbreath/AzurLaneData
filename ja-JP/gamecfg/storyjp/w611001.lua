return {
	id = "W611001",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "セイレーン要塞の掃討に成功した。セイレーン転送装置かエリア移動（マップ間際に艦隊を移動しマップ外側をタップ）でここから脱出しよう。",
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
					content = "エリアから脱出する（再度進入出来ません）",
					flag = 0
				}
			}
		}
	}
}
