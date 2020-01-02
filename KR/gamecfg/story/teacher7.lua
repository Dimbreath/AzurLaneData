return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "TEACHER7",
	fadein = 1.5,
	scripts = {
		{
			mode = 1,
			sequence = {
				{
					"가르쳐줘! Z23 선생님!\n\n<size=45>제7장 ——가르쳐줘! Z23 선생님!——</size>",
					1
				}
			}
		},
		{
			actor = 101170,
			side = 2,
			nameColor = "#92fc63",
			dir = 1,
			say = "Z23이 여기 필요하다고 들어서……",
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
			actor = 201210,
			nameColor = "#92fc63",
			side = 1,
			dir = 1,
			say = "특별 보충수업이라니 뭔가 되게 재밌을 거 같아~!",
			paintingFadeOut = {
				time = 0.5,
				side = 0
			},
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
			actor = 301050,
			side = 2,
			nameColor = "#92fc63",
			dir = 1,
			say = "아야나미도… Z23 처럼 공부해보고 싶어, 요…",
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
			actor = 401230,
			side = 2,
			nameColor = "#92fc63",
			dir = 1,
			say = "왜, 왜 다들 여기 와있는 거야!",
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
			actorShadow = true,
			side = 0,
			actorName = "세 함선 소녀",
			actor = 101170,
			hideOther = true,
			nameColor = "#92fc63",
			say = "(모두 다 함께) \"가르쳐주세요! Z23 선생님!!!\"",
			subActors = {
				{
					actor = 201210,
					pos = {
						x = 1125
					}
				},
				{
					actor = 301050,
					pos = {
						x = 600
					}
				}
			},
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 401230,
			side = 2,
			nameColor = "#92fc63",
			dir = 1,
			say = "크, 크헉! 모, 모처럼만에 모두가 와 있으니까, 그럼…",
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
			actor = 401231,
			nameColor = "#92fc63",
			say = "여기가 포인트입니다! 잘 메모해두지 않으면 Z23 선생님이 벌을 내려줄 거에요!",
			flashout = {
				dur = 1,
				black = true,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
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
