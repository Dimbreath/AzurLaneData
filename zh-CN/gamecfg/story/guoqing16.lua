return {
	fadeOut = 1.5,
	mode = 2,
	noWaitFade = true,
	once = true,
	id = "GUOQING16",
	fadeType = 1,
	fadein = 1.5,
	scripts = {
		{
			actor = 307020,
			actorName = "{namecode:92}",
			side = 2,
			nameColor = "#ff0000",
			say = "【棋子】终究只有这种水平的战斗力吗，趁这个时候…先手必胜！！",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307020,
			actorName = "{namecode:92}",
			side = 2,
			nameColor = "#ff0000",
			say = "你的灵魂，我们就收下了！",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307060,
			actorName = "{namecode:96}",
			side = 2,
			nameColor = "#a9f548",
			say = "！！！可恶，来不及回避了",
			shake = {
				speed = 1,
				number = 3
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
			side = 2,
			nameColor = "#a9f548",
			soundeffect = "event:/battle/boom2",
			actor = 307060,
			actorName = "{namecode:96}",
			say = "……翔…{namecode:95}姐？",
			flashout = {
				dur = 0.3,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 0.5,
				alpha = {
					1,
					0
				}
			},
			shake = {
				speed = 1,
				number = 3
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
			side = 1,
			say = "…约定……守护…………永远…",
			actorName = "{namecode:95}",
			actor = 307050,
			nameColor = "#a9f548",
			paintingFadeOut = {
				time = 0.5,
				side = 0
			},
			shake = {
				speed = 1,
				number = 3
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
			actor = 307060,
			actorName = "{namecode:96}",
			side = 0,
			nameColor = "#a9f548",
			say = "{namecode:95}姐…",
			shake = {
				speed = 1,
				number = 3
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
			side = 0,
			actorName = "{namecode:92}",
			dir = -1,
			actor = 307020,
			nameColor = "#ff0000",
			say = "这…这就是所谓的觉醒反应么…只要在合适的地点激发出心底最重要的一段类似的经历就…",
			shake = {
				speed = 1,
				number = 3
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
			side = 1,
			actorName = "{namecode:91}",
			dir = -1,
			actor = 307010,
			nameColor = "#ff0000",
			say = "{namecode:92}，先撤退，神谕里有记录，如果有觉醒的【棋子】出现，作为最高优先级上报日志",
			shake = {
				speed = 1,
				number = 3
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
			side = 0,
			actorName = "{namecode:92}",
			dir = -1,
			actor = 307020,
			nameColor = "#ff0000",
			say = "了解",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307060,
			actorName = "{namecode:96}",
			side = 0,
			nameColor = "#a9f548",
			say = "{namecode:95}姐…对不起，这么久了，我一直没有成长，总是这么鲁莽的只顾看着眼前…",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307050,
			actorName = "{namecode:95}",
			side = 1,
			nameColor = "#a9f548",
			say = "只要你能够好好的，我们就还有希望…只有你，能够战胜那个对手…",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307050,
			actorName = "{namecode:95}",
			side = 1,
			nameColor = "#a9f548",
			say = "所以，姐姐还是会一直在你身边…一直守护着你…",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307050,
			actorName = "{namecode:95}",
			side = 1,
			nameColor = "#a9f548",
			say = "你只要…放心的看着前方…看着那个目标就好…",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307060,
			actorName = "{namecode:96}",
			side = 0,
			nameColor = "#a9f548",
			say = "{namecode:95}姐…",
			shake = {
				speed = 1,
				number = 3
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
			actor = 307050,
			actorName = "{namecode:95}",
			side = 1,
			nameColor = "#a9f548",
			say = "去吧…追上她们，问清楚她们的动机，不能让重樱的未来…毁在她们手中…",
			shake = {
				speed = 1,
				number = 3
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
