slot0 = class("ChuixuePTRePage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	uv0.super.OnFirstFlush(slot0)

	uv0.scrolltext = ScrollTxt:changeToScroll(slot0:findTF("name", slot0.awardTF))

	onButton(slot0, slot0.battleBtn, function ()
		slot3.warp = ShopsLayer.TYPE_SHOP_STREET
		slot3.actId = uv0.activity:getConfig("config_client").id

		uv0:emit(ActivityMediator.GO_SHOPS_LAYER_STEEET, {})
	end)
end

function slot0.OnUpdateFlush(slot0)
	uv0.super.OnUpdateFlush(slot0)
	slot0:SetAwardName()

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.progress, (slot3 >= 1 and setColorStr(slot1, "#A2A2A2FF") or slot1) .. "/" .. slot2)
end

function slot0.SetAwardName(slot0)
	slot1 = slot0.ptData

	uv0.scrolltext:clear()

	if pg.item_data_statistics[slot1:GetAward().id] then
		if slot1.type == 1 then
			uv0.scrolltext:setText(pg.item_data_statistics[pg.player_resource[slot1.id].itemid].name)
		else
			uv0.scrolltext:setText(pg.item_data_statistics[slot1.id].name)
		end
	else
		setActive(slot0:findTF("name", slot0.awardTF), false)
	end
end

return slot0
