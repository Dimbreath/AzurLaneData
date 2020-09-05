return {
	id = "S013",
	events = {
		{
			alpha = 0.327,
			style = {
				text = "前往<color=#ff7d36>仓库</color>界面",
				mode = 2,
				dir = -1,
				posY = -50.56,
				posX = -163.2
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/equipButton",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -19.78,
					posX = 23.7
				}
			}
		},
		{
			alpha = 0.547,
			waitScene = "StoreHouseScene",
			style = {
				text = "点击<color=#ff7d36>选择科技箱</color>",
				mode = 2,
				dir = 1,
				posY = 191.3,
				posX = -93.8
			},
			ui = {
				pathIndex = "#",
				path = "UICamera/Canvas/UIMain/StoreHouseUI(Clone)/item_scrollview/item_grid",
				triggerType = {
					1
				},
				image = {
					source = "bg/icon_bg/icon",
					isChild = true,
					target = "bg/icon_bg/icon",
					isRelative = true
				},
				fingerPos = {
					posY = -44.21,
					posX = 50.3
				}
			}
		},
		{
			alpha = 0.298,
			style = {
				text = "点击<color=#ff7d36>使用</color>打开科技箱",
				mode = 2,
				dir = 1,
				posY = -252,
				posX = -393
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/ItemInfoUI(Clone)/window/actions/use_button",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -37.87,
					posX = 49.89
				}
			}
		}
	}
}
