return {
	id = "NG0029",
	events = {
		{
			alpha = 0.4,
			code = {
				1
			},
			style = {
				text = "オフニャをハウスに配置すると、時間経過とともに経験値を手に入れられるの！",
				mode = 1,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/right_panel/commanders/box/home",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -48.24,
					posX = 64.78
				}
			}
		},
		{
			alpha = 0.4,
			code = {
				2
			},
			style = {
				text = "「オフニャハウス」が開放されたわ",
				mode = 1,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/right_panel/commanders/box/home",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -48.24,
					posX = 64.78
				}
			}
		},
		{
			alpha = 0.4,
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/frame/scrollrect/content/tpl",
				triggerType = {
					1
				}
			},
			style = {
				text = "オフニャをハウスに配置すると、時間経過とともに経験値を手に入れられるの！",
				mode = 1,
				dir = -1,
				posY = 0,
				posX = 41.84
			}
		},
		{
			alpha = 0.4,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/CatteryDescPage(Clone)/right/pages/CommanderHomeSelCommanderPage(Clone)/scrollrect/content/0",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -53.09,
					posX = 51.93
				}
			}
		},
		{
			alpha = 0.4,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/CatteryDescPage(Clone)/right/pages/CommanderHomeSelCommanderPage(Clone)/ok_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -32.34,
					posX = 42.25
				}
			}
		},
		{
			alpha = 0.4,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/CatteryDescPage(Clone)/right/close_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -32.65,
					posX = 48.72
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "オフニャハウスでは毎日一度だけ、掃除や食糧補充、オフニャたちと遊ぶことができる！",
				mode = 1,
				dir = -1,
				posY = 245.9,
				posX = -382.13,
				ui = {
					path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/bubble"
				}
			}
		},
		{
			alpha = 0.4,
			style = {
				text = "掃除をすると、オフニャハウスが成長するわ！配置するオフニャが多ければ多いほど、成長スピードも早くなるの！",
				mode = 1,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/bubble/clean",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -38.53,
					posX = 101.3
				}
			}
		},
		{
			alpha = 0.4,
			delay = 1,
			style = {
				text = "食糧補充をすると、配置中のオフニャが経験値を獲得できるわね！",
				mode = 1,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/bubble/feed",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -46.46,
					posX = 70.73
				}
			}
		},
		{
			alpha = 0.4,
			delay = 1,
			ui = {
				path = "OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/bubble/play",
				triggerType = {
					1
				}
			},
			style = {
				text = "さらにオフニャと遊ぶと、ネコハコ加速材や家具コインを手に入れる場合があるの！オフニャが多ければ多いほど報酬が増えるわね！",
				mode = 1,
				dir = -1,
				posY = 122.14,
				posX = -340.6
			}
		},
		{
			waitScene = "AwardInfoLayer",
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)",
				fingerPos = {
					posY = -172,
					posX = 520
				}
			}
		},
		{
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/CommanderHomeUI(Clone)/bg/frame/close_btn",
				fingerPos = {
					posY = -45,
					posX = 45
				}
			}
		},
		{
			code = {
				2
			},
			style = {
				text = "点击这里可以查看具体的帮助信息！要加油哦！拜拜~",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = -500
			},
			ui = {
				path = "/UICamera/Canvas/UIMain/CommandRoomUI(Clone)/blur_panel/main/left_panel/help_btn",
				fingerPos = {
					posY = -45,
					posX = 45
				}
			}
		},
		{
			code = {
				1
			},
			style = {
				text = "点击这里可以查看具体的帮助信息！要加油哦！拜拜~",
				mode = 1,
				dir = -1,
				posY = -200,
				posX = -500
			},
			ui = {
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/main/left_panel/help_btn",
				fingerPos = {
					posY = -45,
					posX = 45
				}
			}
		}
	}
}
