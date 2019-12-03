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
			actorName = "{namecode:91}",
			side = 2,
			dir = -1,
			nameColor = "#ff0000",
			say = "啊啊…神明大人，您看到了吗…那灵魂碰撞激发出的熠熠光辉…这就是您所期望的「觉醒」吗？",
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
			actorName = "{namecode:91}",
			side = 2,
			dir = -1,
			nameColor = "#ff0000",
			say = "美丽而脆弱…让人忍不住想一把捏碎…呵呵……呵呵呵……",
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
			say = "唉…果然还是陷入这种状态了…也罢，这一次的表演也差不多接近尾声了",
			side = 0,
			actorName = "{namecode:92}",
			dir = -1,
			actor = 307020,
			nameColor = "#ff0000",
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
			actorName = "{namecode:91}",
			side = 1,
			dir = -1,
			nameColor = "#ff0000",
			say = "是吗…真遗憾～既然如此，那就准备吧…嘻嘻…前往…新的“圣域”——",
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
			dir = 1,
			nameColor = "#a9f548",
			say = "呜……别、别想走……我还有话——",
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
			actorName = "系统",
			dir = 0,
			soundeffect = "event:/ui/alarm",
			actor = 900011,
			nameColor = "#ff0000",
			say = "警告——回收进程已启动，本区域即将废弃——",
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
			say = "警告——回收进程已启动，本区域即将废弃——",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "系统",
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
			say = "警告——回收进程已启动，本区域即将废弃——",
			side = 0,
			nameColor = "#ff0000",
			dir = 0,
			actor = 900011,
			actorName = "系统",
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
			actorName = "{namecode:92}",
			side = 2,
			dir = 1,
			nameColor = "#ff0000",
			say = "同胞啊，世间万物一切自有其因果，在无垠的轮回中，我们一直在寻找着另一种可能性",
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
			dir = 1,
			nameColor = "#ff0000",
			say = "总有一天你会明白…我们在做什么，为什么会这么做……",
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
			dir = 1,
			nameColor = "#ff0000",
			say = "愿八百万神明的守护常伴于你——",
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
			actorName = "测试者?型",
			side = 2,
			blackBg = true,
			actor = 900011,
			nameColor = "#ff0000",
			say = "试验场γ…又完成了一轮测试",
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
			actorName = "观察者?型",
			blackBg = true,
			say = "嗯？我看看，试验场γ…啊，原来是“小动物”们那里吗，这是……",
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
			actorName = "测试者?型",
			blackBg = true,
			say = "嗯，“为了摆脱控制和拯救族人所爆发出的能力”…么？，算是超出预期的表现",
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
			actorName = "观察者?型",
			blackBg = true,
			say = "有意思，一群想要挣脱出命运之网而却不断作茧自缚的家伙，以为自己掌控一切，却又不知从开始的一切就只是假设…",
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
			actorName = "测试者?型",
			blackBg = true,
			say = "不过，从测试数据来看，她们倒是意外的受到“造物主”大人的青睐呢呵呵呵",
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
			actorName = "观察者?型",
			blackBg = true,
			say = "哼…那不过是“造物主”大人的恶趣味罢了…",
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
			actorName = "测试者?型",
			blackBg = true,
			say = "目前看来…还需要更多的历练，至少……不能让他们现在就相遇……",
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
			actorName = "观察者?型",
			blackBg = true,
			say = "那么，所有【棋子】归位，重置测试数据，提高5个百分点的指数……放出“钥匙”……开始下一轮测试——",
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
