slot0 = class("ShipType")
slot0.QuZhu = 1
slot0.QingXun = 2
slot0.ZhongXun = 3
slot0.ZhanXun = 4
slot0.ZhanLie = 5
slot0.QingHang = 6
slot0.ZhengHang = 7
slot0.QianTing = 8
slot0.HangXun = 9
slot0.HangZhan = 10
slot0.LeiXun = 11
slot0.WeiXiu = 12
slot0.ZhongPao = 13
slot0.QianMu = 17
slot0.ChaoXun = 18
slot0.YuLeiTing = 14
slot0.JinBi = 15
slot0.ZiBao = 16

slot0.Type2Name = function (slot0)
	return pg.ship_data_by_type[slot0].type_name
end

slot0.Type2Print = function (slot0)
	if not slot0.prints then
		slot0.prints = {
			"quzhu",
			"qingxun",
			"zhongxun",
			"zhanlie",
			"zhanlie",
			"hangmu",
			"hangmu",
			"qianting",
			"zhanlie",
			"hangzhan",
			"zhanlie",
			"weixiu",
			"zhongpao",
			"quzhu",
			"battle_jinbi",
			"battle_zibao",
			"qianmu",
			"chaoxun"
		}
	end

	return slot0.prints[slot0]
end

slot0.Type2BattlePrint = function (slot0)
	if not slot0.bprints then
		slot0.bprints = {
			"battle_quzhu",
			"battle_qingxun",
			"battle_zhongxun",
			"battle_zhanlie",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_hangmu",
			"battle_qianting",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_zhanlie",
			"battle_weixiu",
			"battle_zhanlie",
			"battle_quzhu",
			"battle_jinbi",
			"battle_zibao",
			"battle_hangmu",
			"battle_zhanlie"
		}
	end

	return slot0.bprints[slot0]
end

slot0.Type2CNLabel = function (slot0)
	if not slot0.cnLabel then
		slot0.cnLabel = {
			"label_1",
			"label_2",
			"label_3",
			"label_4",
			"label_5",
			"label_6",
			"label_7",
			"label_8",
			"label_3",
			"label_10",
			"label_3",
			"label_1",
			"label_3",
			"label_1",
			"label_1",
			"label_1",
			"label_17",
			"label_18"
		}
	end

	return slot0.cnLabel[slot0]
end

slot0.BundleBattleShip = "zhan"
slot0.BundleAircraftCarrier = "hang"
slot0.BundleSubmarine = "qian"
slot0.BundleLargeCrusier = "zhong"
slot0.BundleList = {
	zhan = {
		slot0.ZhanXun,
		slot0.ZhanLie
	},
	hang = {
		slot0.QingHang,
		slot0.ZhengHang
	},
	qian = {
		slot0.QianTing,
		slot0.QianMu
	},
	zhong = {
		slot0.ZhongXun,
		slot0.ChaoXun
	}
}

slot0.BundleType2CNLabel = function (slot0)
	if not slot0.bundleLabel then
		slot0.bundleLabel = {
			qian = "label_8",
			hang = "label_12",
			zhan = "label_11",
			zhong = "label_13"
		}
	end

	return slot0.bundleLabel[slot0]
end

return slot0
