return {
	id = "S013",
	events = {
		{
			alpha = 0.327,
			style = {
				text = "<color=#ff7d36>倉庫</color>を確認するわ",
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
			waitScene = "StoreHouseScene",
			alpha = 0.547,
			style = {
				text = "<color=#ff7d36>装備箱</color>を選んでね",
				mode = 2,
				dir = 1,
				posY = 191.3,
				posX = -93.8
			},
			spriteui = {
				pathIndex = "#",
				childPath = "bg/icon_bg/icon",
				path = "UICamera/Canvas/UIMain/StoreHouseUI(Clone)/item_scrollview/item_grid"
			},
			ui = {
				pathIndex = "#",
				path = "UICamera/Canvas/UIMain/StoreHouseUI(Clone)/item_scrollview/item_grid",
				triggerType = {
					1
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
				text = "<color=#ff7d36>使う</color>で装備箱を開けるのよ",
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
