pg = pg or {}
pg.share_template = {
	{
		description = "#碧藍航線#",
		name = "個人訊息界面",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 1,
		qrcode_location = {
			373,
			178
		},
		hidden_comps = {
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/left_panel/swichSkin_btn",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/left_panel/replace_btn",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/top/gizmos",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/top/title",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/bottom_panel",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/right_panel/btn_share",
			"/UICamera/Canvas/UIMain/AdmiralUI(Clone)/blur_panel/adapt/right_panel/btn_attire"
		}
	},
	{
		description = "#碧藍航線#",
		name = "檔案界面",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 2,
		qrcode_location = {
			373,
			120
		},
		hidden_comps = {
			"/OverlayCamera/Overlay/UIMain/blur_panel",
			"/UICamera/Canvas/UIMain/ShipProfileUI(Clone)/profile_panel/eva_btn",
			"/UICamera/Canvas/UIMain/ShipProfileUI(Clone)/profile_panel/share_btn",
			"/UICamera/Canvas/UIMain/ShipProfileUI(Clone)/profile_panel/view_btn"
		}
	},
	{
		description = "#碧藍航線#",
		name = "獲得新艦船界面",
		deck = 2,
		camera = "OverlayCamera",
		id = 3,
		qrcode_location = {
			-340,
			160
		},
		hidden_comps = {
			"/OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ForNotch",
			"/OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/property_btn",
			"/OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/dialogue",
			"/OverlayCamera/Overlay/UIOverlay/TipPanel(Clone)",
			"/OverlayCamera/Overlay/UIEffect/ClickEffect(Clone)"
		},
		show_comps = {
			"/OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ship_type"
		},
		move_comps = {
			{
				y = -920,
				x = 18,
				path = "/OverlayCamera/Overlay/UIMain/NewShipUI(Clone)/shake_panel/ship_type"
			}
		}
	},
	{
		description = "#碧藍航線#",
		name = "後宅",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 4,
		qrcode_location = {
			373,
			120
		},
		hidden_comps = {
			"/UICamera/Canvas/UIMain/BackYardUI(Clone)/main",
			"/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/decorateBtn",
			"/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/back"
		}
	},
	{
		description = "#碧藍航線#",
		name = "獲得新造型界面",
		deck = 2,
		move_comps = "",
		camera = "OverlayCamera",
		show_comps = "",
		id = 5,
		qrcode_location = {
			-340,
			160
		},
		hidden_comps = {
			"/OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/dialogue",
			"/OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/left_panel",
			"/OverlayCamera/Overlay/UIMain/NewSkinUI(Clone)/shake_panel/set_skin_btn",
			"/OverlayCamera/Overlay/UIEffect/ClickEffect(Clone)",
			"/OverlayCamera/Overlay/UIOverlay/TipPanel(Clone)"
		}
	},
	{
		description = "#碧藍航線#",
		name = "玩家歷程界面",
		deck = 3,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 6,
		qrcode_location = {
			-592,
			-381
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/PlayerSummaryUI(Clone)/bg/main/pages/page5/share"
		}
	},
	{
		description = "#碧藍航線#",
		name = "拍照分享",
		deck = 1,
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 7,
		qrcode_location = {
			373,
			120
		},
		hidden_comps = {
			"UICamera/Canvas/UIMain/SnapshotShareUI(Clone)/BtnPanel"
		}
	},
	{
		description = "#碧藍航線#",
		name = "回流紀念信",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 8,
		qrcode_location = {
			373,
			120
		}
	},
	{
		description = "#碧藍航線#",
		name = "獲得新指揮喵界面",
		deck = 1,
		move_comps = "",
		camera = "OverlayCamera",
		show_comps = "",
		id = 9,
		qrcode_location = {
			373,
			120
		},
		hidden_comps = {
			"/OverlayCamera/Overlay/UIMain/GetCommanderUI(Clone)/left_panel/btns/lock",
			"/OverlayCamera/Overlay/UIMain/GetCommanderUI(Clone)/left_panel/btns/share"
		}
	},
	{
		description = "#碧藍航線#",
		name = "畫圖功能分享",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		show_comps = "",
		id = 10,
		qrcode_location = {
			-592,
			-381
		}
	},
	{
		description = "#碧蓝航线#",
		name = "挑战分享",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "OverlayCamera",
		show_comps = "",
		id = 11,
		qrcode_location = {
			373,
			120
		}
	},
	{
		description = "#碧藍航線#",
		name = "台服分享活动",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		id = 12,
		qrcode_location = {
			373,
			120
		},
		show_comps = {
			"UICamera/Canvas/TWCelebrationShare(Clone)"
		}
	},
	[5000] = {
		description = "#碧蓝航线#",
		name = "台服分享活动（改动过唯一id 原id12）",
		deck = 1,
		hidden_comps = "",
		move_comps = "",
		camera = "UICamera",
		id = 5000,
		qrcode_location = {
			373,
			120
		},
		show_comps = {
			"UICamera/Canvas/TWCelebrationShare(Clone)"
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		5000
	}
}
