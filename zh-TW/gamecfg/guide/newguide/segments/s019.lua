return {
	id = "S019",
	events = {
		{
			alpha = 0,
			style = {
				text = "武器強化完畢！戰鬥力飛升！！",
				mode = 2,
				dir = -1,
				posY = -301,
				posX = 422
			},
			ui = {
				hideChildEvent = true,
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/EquipUpgradeUI(Clone)/finish_panel",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -295,
					posX = 203
				}
			}
		},
		{
			alpha = 0,
			ui = {
				hideChildEvent = true,
				pathIndex = -1,
				delay = 0.5,
				path = "/OverlayCamera/Overlay/UIMain/EquipUpgradeUI(Clone)",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -230,
					posX = 690
				}
			}
		},
		{
			alpha = 0.344,
			style = {
				text = "點擊返回按鈕退出角色詳情",
				mode = 2,
				dir = -1,
				posY = 211.84,
				posX = -105.86
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/top/back_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -57.53,
					posX = 92.1
				}
			}
		},
		{
			alpha = 0.376,
			waitScene = "DockyardScene",
			style = {
				text = "點擊返回按鈕退出船塢",
				mode = 2,
				dir = -1,
				posY = 230.33,
				posX = -231.7
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/blur_panel/adapt/top/back",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -54.42,
					posX = 77.9
				}
			}
		}
	}
}
