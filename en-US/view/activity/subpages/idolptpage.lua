slot0 = class("IdolPTPage", import(".TemplatePage.PtTemplatePage"))
slot0.LinkActivityID = ActivityConst.IDOL_INS_ID
slot0.RefreshTime = 300

function slot0.OnInit(slot0)
	uv0.super.OnInit(slot0)

	slot0.lableList = slot0:findTF("list", slot0.bg)
	slot0.lableItems = {}

	for slot4 = 0, slot0.lableList.childCount - 1, 1 do
		table.insert(slot0.lableItems, slot0.lableList:GetChild(slot4))
	end

	slot0.linkBtn = slot0:findTF("btn_link", slot0.bg)
end

function slot0.OnDataSetting(slot0)
	slot1 = uv0.super.OnDataSetting(slot0)
	slot2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)
	slot0.linkAct = slot2

	if slot2 and not slot2:isEnd() then
		if slot0.RefreshTime <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot2.id] or 0) then
			slot8.activity_id = slot2.id

			slot0:emit(ActivityMediator.FETCH_INSTARGRAM, {})
		end

		return slot4 or slot1
	end

	return slot1
end

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.displayBtn, function ()
		slot4.type = uv0.ptData.type
		slot4.dropList = uv0.ptData.dropList
		slot4.targets = uv0.ptData.targets
		slot4.level = uv0.ptData.level
		slot4.count = uv0.ptData.count
		slot4.resId = uv0.ptData.resId

		uv0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		uv0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot5.arg1 = uv0.ptData:GetResProgress()
		slot5.activity_id = uv0.ptData:GetId()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.linkBtn, function ()
		if uv0.linkAct then
			if not uv0.linkAct:isEnd() then
				if uv0.linkAct:ExistMsg() then
					slot4.viewComponent = InstagramLayer
					slot4.mediator = InstagramMediator
					slot5.id = ActivityConst.IDOL_INS_ID
					slot4.data = {}

					uv0:emit(ActivityMediator.OPEN_LAYER, Context.New({}))
				end
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	uv0.super.OnUpdateFlush(slot0)

	if slot0.linkAct and not slot1:isEnd() then
		slot2 = {}

		for slot7 = 1, math.floor(#slot1.data1_list / 2), 1 do
			slot2[slot8] = (slot2[slot1.data1_list[2 * slot7 - 1]] or 0) + (slot1.data1_list[2 * slot7] or 0)
		end

		for slot8, slot9 in pairs(slot2) do
			slot12.name = slot8
			slot12.count = slot9

			table.insert({}, {})
		end

		table.sort(slot4, function (slot0, slot1)
			if slot0.count == slot1.count then
				return slot0.name < slot1.name
			else
				return slot1.count < slot0.count
			end
		end)

		for slot9 = 1, math.min(#slot4, #slot0.lableItems), 1 do
			slot10 = slot0.lableItems[slot9]

			setText(slot10:Find("name"), "#" .. tostring(ShipGroup.getDefaultShipNameByGroupID(slot4[slot9].name)) .. "#")
			setText(slot10:Find("Text"), slot0:TransFormat(slot4[slot9].count))
		end

		for slot9 = slot5 + 1, #slot0.lableItems, 1 do
			slot10 = slot0.lableItems[slot9]

			setText(slot10:Find("name"), "")
			setText(slot10:Find("Text"), "0")
		end
	end

	slot0:GetWorldRank(slot0.RefreshTime)
end

function slot0.TransFormat(slot0, slot1)
	slot1 = tonumber(slot1) or 0
	slot3 = slot1 % 10

	if math.floor(slot1 / 1000) >= 1 then
		return slot2 .. (slot3 > 0 and "." .. slot3 or "") .. "K"
	else
		return slot1
	end
end

function slot0.GetWorldRank(slot0, slot1)
	if slot0.linkAct then
		if slot0.linkAct:isEnd() then
			return
		end
	end

	if slot1 <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot0.linkAct.id] or 0) then
		slot6.activity_id = slot2

		slot0:emit(ActivityMediator.FETCH_INSTARGRAM, {})
	end
end

function slot0.NeedTip()
	slot0 = getProxy(ActivityProxy)

	if slot0:getActivityById(ActivityConst.IDOL_PT_ID) and not slot0:isEnd() then
		return slot0:readyToAchieve()
	end
end

return slot0
