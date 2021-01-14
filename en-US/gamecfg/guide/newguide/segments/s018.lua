return {
	id = "S018",
	events = {
		{
			alpha = 0.274,
			style = {
				text = "Let's head to the <color=#ff7d36>Dock</color>.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/toTop/frame/bottomPanel/btm/buttons_container/dockBtn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -19.37,
					posX = 35.15
				}
			},
			code = {
				2
			}
		},
		{
			waitScene = "DockyardScene",
			alpha = 0.306,
			style = {
				text = "Select one of your girls and tap to view her details.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = -5.18
			},
			ui = {
				pathIndex = 0,
				path = "UICamera/Canvas/UIMain/DockyardUI(Clone)/main/ship_container/ships/",
				image = {
					source = "content/ship_icon",
					isChild = true,
					target = "content/ship_icon",
					isRelative = true
				},
				triggerType = {
					1
				},
				fingerPos = {
					posY = -74.58,
					posX = 48.4
				}
			},
			code = {
				2
			}
		},
		{
			waitScene = "ShipMainScene",
			alpha = 0.294,
			style = {
				text = "Tap <color=#ff7d36>gear</color> to see what gear she currently has equipped.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/blur_panel/adapt/left_length/frame/root/equpiment_toggle",
				triggerType = {
					2
				},
				fingerPos = {
					posY = -24.93,
					posX = 39.67
				}
			},
			code = {
				2
			}
		},
		{
			alpha = 0.364,
			style = {
				text = "Let's <color=#ff7d36>enhance this gear</color> one time!",
				mode = 2,
				dir = 1,
				posY = -140,
				posX = 6
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/equipment_r_container(Adapt)/equipment_r_container/equipment_r/equipment/equipment_r2",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 7.8
				}
			}
		},
		{
			alpha = 0.152,
			waitScene = "EquipmentInfoLayer",
			style = {
				text = "Tap to confirm.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 265.7
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/EquipmentInfoUI(Clone)/default/actions/action_button_2",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -29.38,
					posX = 44.9
				}
			}
		},
		{
			alpha = 0.405,
			style = {
				text = "This is where you'll see <color=#ff7d36>the gear's stats after it's been enhanced!</color>",
				mode = 2,
				dir = -1,
				posY = 226,
				posX = 479
			}
		},
		{
			alpha = 0.366,
			style = {
				text = "Tap <color=#ff7d36>enhance</color> to start enhancing.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "OverlayCamera/Overlay/UIMain/EquipUpgradeUI(Clone)/main/panel/material_panel/start_btn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -19.78,
					posX = 30.24
				}
			}
		}
	}
}
