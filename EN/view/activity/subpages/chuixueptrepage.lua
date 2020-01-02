slot0 = class("ChuixuePTRePage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)

	slot0.scrolltext = ScrollTxt:changeToScroll(slot1)

	onButton(slot0, slot0.battleBtn, function ()
		slot0:emit(ActivityMediator.GO_SHOPS_LAYER_STEEET, {
			warp = ShopsLayer.TYPE_SHOP_STREET,
			actId = slot0.activity:getConfig("config_client").id
		})
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)
	slot0:SetAwardName()

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.progress, ((slot3 >= 1 and setColorStr(slot1, "#A2A2A2FF")) or slot1) .. "/" .. slot2)
end

function slot0.SetAwardName(slot0)
	slot0.scrolltext:clear()

	if pg.item_data_statistics[slot0.ptData:GetAward().id] then
		if slot1.type == 1 then
			slot0.scrolltext:setText(pg.item_data_statistics[pg.player_resource[slot1.id].itemid].name)
		else
			slot0.scrolltext:setText(pg.item_data_statistics[slot1.id].name)
		end
	else
		setActive(slot0:findTF("name", slot0.awardTF), false)
	end
end

return slot0
