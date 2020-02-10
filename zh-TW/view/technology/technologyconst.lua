slot0 = class("TechnologyConst")
slot0.OPEN_TECHNOLOGY_TREE_SCENE = "TechnologyConst:OPEN_TECHNOLOGY_TREE_SCENE"
slot0.OPEN_SHIP_BUFF_DETAIL = "TechnologyConst:OPEN_SHIP_BUFF_DETAIL"
slot0.OPEN_TECHNOLOGY_NATION_LAYER = "TechnologyConst:OPEN_TECHNOLOGY_NATION_LAYER"
slot0.CLOSE_TECHNOLOGY_NATION_LAYER = "TechnologyConst:CLOSE_TECHNOLOGY_NATION_LAYER"
slot0.CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION = "TechnologyConst:CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION"
slot0.OPEN_ALL_BUFF_DETAIL = "TechnologyConst:OPEN_ALL_BUFF_DETAIL"
slot0.UPDATE_REDPOINT_ON_TOP = "TechnologyConst:UPDATE_REDPOINT_ON_TOP"
slot0.CLICK_UP_TEC_BTN = "TechnologyConst:CLICK_UP_TEC_BTN"
slot0.START_TEC_BTN_SUCCESS = "TechnologyConst:START_TEC_BTN_SUCCESS"
slot0.FINISH_UP_TEC = "TechnologyConst:FINISH_UP_TEC"
slot0.FINISH_TEC_SUCCESS = "TechnologyConst:FINISH_TEC_SUCCESS"
slot0.MAX_LV = 120
slot0.AtlasName = "ui/technologytreeui_atlas"
slot1[1] = Nation.US
slot1[2] = Nation.EN
slot1[3] = Nation.JP
slot1[4] = Nation.DE
slot1[5] = Nation.CN
slot1[6] = Nation.SN
slot1[7] = Nation.FF
slot1[8] = Nation.MNF
slot1[9] = Nation.ITA
slot0.NationOrder = {}
slot0.NationResName = {
	"nation_all_",
	"nation_baiying_",
	"nation_huangjia_",
	"nation_chongying_",
	"nation_tiexue_",
	"nation_donghuang_",
	"nation_beilian_",
	"nation_ziyou_",
	"nation_weixi_",
	"nation_sading_"
}
slot1[1] = AttributeType.Durability
slot1[2] = AttributeType.Cannon
slot1[3] = AttributeType.Torpedo
slot1[4] = AttributeType.AntiAircraft
slot1[5] = AttributeType.Air
slot1[6] = AttributeType.Reload
slot1[7] = AttributeType.Armor
slot1[8] = AttributeType.Hit
slot1[9] = AttributeType.Dodge
slot1[10] = AttributeType.Speed
slot1[11] = AttributeType.Luck
slot1[12] = AttributeType.AntiSub
slot0.TECH_NATION_ATTRS = {}

function slot0.GetNationSpriteByIndex(slot0)
	return GetSpriteFromAtlas(uv0.AtlasName, uv0.NationResName[slot0] .. "01", true), GetSpriteFromAtlas(uv0.AtlasName, uv0.NationResName[slot0] .. "02", true)
end

slot2[1] = ShipType.QuZhu
slot1[1] = {}
slot2[1] = ShipType.QingXun
slot1[2] = {}
slot2[1] = ShipType.ZhongXun
slot2[2] = ShipType.ChaoXun
slot1[3] = {}
slot2[1] = ShipType.QingHang
slot2[2] = ShipType.ZhengHang
slot1[4] = {}
slot2[1] = ShipType.ZhanXun
slot2[2] = ShipType.ZhanLie
slot1[5] = {}
slot2[1] = ShipType.QianTing
slot2[2] = ShipType.QianMu
slot1[6] = {}
slot2[1] = ShipType.WeiXiu
slot2[2] = ShipType.ZhongPao
slot1[7] = {}
slot0.TypeOrder = {}
slot0.TypeResName = {
	"type_qvzhu_",
	"type_qingxun_",
	"type_zhongxun_",
	"type_hangmu_",
	"type_zhanlie_",
	"type_qianting_",
	"type_other_",
	"type_all_"
}

function slot0.GetTypeSpriteByIndex(slot0)
	return GetSpriteFromAtlas(uv0.AtlasName, uv0.TypeResName[slot0] .. "01", true), GetSpriteFromAtlas(uv0.AtlasName, uv0.TypeResName[slot0] .. "02", true)
end

function slot0.ClassToGroupIDList()
	slot0 = {}

	for slot4, slot5 in ipairs(pg.fleet_tech_ship_template.all) do
		if slot0[pg.fleet_tech_ship_template[slot5].class] then
			table.insert(slot0[slot6], slot5)
		else
			slot7[1] = slot5
			slot0[slot6] = {}
		end
	end

	return slot0
end

function slot0.GetOrderClassList()
	slot0 = {}

	for slot4, slot5 in ipairs(pg.fleet_tech_ship_class.all) do
		slot0[#slot0 + 1] = slot5
	end

	table.sort(slot0, function (slot0, slot1)
		slot4 = nil

		return pg.fleet_tech_ship_class[slot0].t_level == pg.fleet_tech_ship_class[slot1].t_level and slot3.t_level_1 < slot2.t_level_1 or slot3.t_level < slot2.t_level
	end)

	return slot0
end

return slot0
