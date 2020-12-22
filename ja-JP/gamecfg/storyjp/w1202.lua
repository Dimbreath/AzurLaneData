return {
	id = "W1202",
	mode = 2,
	once = true,
	scripts = {
		{
			side = 2,
			dir = 1,
			say = "エリアを「安全エリア」として確保できた。…とはいっても、このエリアに戻る際にはまた「行動力」を消費しなければならないようだ",
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
					content = "次のエリアに向かおう",
					flag = 0
				}
			}
		}
	}
}
