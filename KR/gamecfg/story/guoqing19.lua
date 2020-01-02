return {
	fadeOut = 1.5,
	mode = 2,
	noWaitFade = true,
	once = true,
	id = "GUOQING19",
	fadeType = 1,
	fadein = 1.5,
	scripts = {
		{
			actor = 307010,
			nameColor = "#ff0000",
			side = 2,
			dir = -1,
			say = "아아... 이 영혼의 충돌로 태어난 멋진 광채... 신이시여, 부디 봐주시어요... 이것이야말로 당신이 갈구하던 \"각성\"...",
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
			actor = 307010,
			nameColor = "#ff0000",
			side = 2,
			dir = -1,
			say = "이렇게나 아름답고... 이렇게나 물러... 쥐어서 으깨고 싶어져요... 후후후, 후후후후후......",
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
			actor = 307020,
			nameColor = "#ff0000",
			side = 0,
			dir = -1,
			say = "역시 이렇게 돼버렸군... 좋아. 아무래도 이번 공연은 여기까지인 것 같다.",
			paintingFadeOut = {
				time = 0.5,
				side = 1
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
			actor = 307010,
			nameColor = "#ff0000",
			side = 1,
			dir = -1,
			say = "그래...? 아쉽네~ 그럼 준비하자... 우후훗... 새로운 \"성역\"을────",
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
			actor = 307060,
			nameColor = "#92fc63",
			side = 2,
			dir = 1,
			say = "윽... 기, 기다려! 아직 얘기가────",
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
			withoutPainting = true,
			side = 0,
			actorName = "시스템",
			dir = 0,
			soundeffect = "event:/ui/alarm",
			actor = 900011,
			nameColor = "#ff0000",
			say = "────회수 시퀸스 기동────작업 에리어에서 시급히 대피해주십시오────",
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			say = "────반복합니다────회수 시퀸스 기동────작업 에리어에서 시급히 대피해주십시오────",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "시스템",
			withoutPainting = true,
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			say = "────회수 시퀸스 기동────작업 에리어에서 시급히 대피해주십시오────",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "시스템",
			withoutPainting = true,
			typewriter = {
				speed = 0.02,
				speedUp = 0.01
			},
			painting = {
				alpha = 0.3,
				time = 1
			}
		},
		{
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "동포여. 이 세상의 모든 것은 인과응보. 무한히 계속되는 윤회 속에서, 또 하나의 가능성을 찾는 것이야말로 우리의 역할......",
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
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "언젠가 알게 될 것이다. 우리가 한 일의 의미, 이유를......",
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
			actor = 307020,
			nameColor = "#ff0000",
			side = 2,
			dir = 1,
			say = "너에게도 모든 신의 가호가 있기를...",
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
			actorName = "테스터",
			side = 2,
			blackBg = true,
			actor = 900011,
			nameColor = "#ff0000",
			say = "시험장γ... 테스트 완료.",
			flashout = {
				dur = 1.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 2,
				dur = 2,
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
		},
		{
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "옵저버",
			blackBg = true,
			say = "응? 어디 보여줘... 시험장γ? ...뭐야, 그 \"작은 동물\"들이 있는 곳이구나...",
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
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "테스터",
			blackBg = true,
			say = "맞아. \"지배에서 벗어나려 할 때, 그리고 동포를 구하려 할 때의 저력\"인가. 예상 이상의 성적이네.",
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
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "옵저버",
			blackBg = true,
			say = "생각보다 재밌잖아? 정해진 운명의 고리에서 벗어나려 하면서 자신의 미래에 고랑을 채운다... 모든 것을 수중에 넣었다고 생각하지만, 그 모든 것이 거짓된 것이라는 것도 모르고...",
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
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "테스터",
			blackBg = true,
			say = "테스트 데이터로선 훌륭해. 이 녀석들, \"창조주\"께서 생각보다 마음에 드셨나 봐.",
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
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "옵저버",
			blackBg = true,
			say = "흥!... 그런 거 \"창조주\"님의 악취미에 불과해.",
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
			actor = 900011,
			nameColor = "#ff0000",
			side = 2,
			actorName = "테스터",
			blackBg = true,
			say = "지금 데이터에서 예측하면... 아직, 적어도...... 만나게 해줄 순 없겠어.",
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
			actor = 900012,
			nameColor = "#ff0000",
			side = 2,
			actorName = "옵저버",
			blackBg = true,
			say = "오케이. 그럼 【말】·테스트 데이터 전부 리셋하고, 파라미터는 5% 근처로, 읏차...... \"열쇠\"개방 완료. 다음 테스트로 이동────",
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
