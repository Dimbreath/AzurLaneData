slot0 = class("IdolPTPage", import(".TemplatePage.PtTemplatePage"))
slot0.LinkActivityID = ActivityConst.IDOL_INS_ID
slot0.RefreshTime = 300

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.lableList = slot0:findTF("list", slot0.bg)
	slot0.lableItems = {}

	for slot4 = 0, slot0.lableList.childCount - 1, 1 do
		table.insert(slot0.lableItems, slot0.lableList:GetChild(slot4))
	end

	slot0.linkBtn = slot0:findTF("btn_link", slot0.bg)
end

function slot0.OnDataSetting(slot0)
	slot1 = slot0.super.OnDataSetting(slot0)
	slot0.linkAct = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)

	if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot2:isEnd() then
		if slot0.RefreshTime <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot2.id] or 0) then
			slot0:emit(ActivityMediator.FETCH_INSTARGRAM, {
				activity_id = slot2.id
			})
		end

		return slot4 or slot1
	end

	return slot1
end

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.displayBtn, function ()
		slot0:emit(ActivityMediator.SHOW_AWARD_WINDOW, PtAwardWindow, {
			type = slot0.ptData.type,
			dropList = slot0.ptData.dropList,
			targets = slot0.ptData.targets,
			level = slot0.ptData.level,
			count = slot0.ptData.count,
			resId = slot0.ptData.resId
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		slot0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot2, slot5.arg1 = slot0.ptData:GetResProgress()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = slot0.ptData:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.linkBtn, function ()
		if slot0.linkAct and not slot0.linkAct:isEnd() and slot0.linkAct:ExistMsg() then
			slot0:emit(ActivityMediator.OPEN_LAYER, Context.New({
				viewComponent = InstagramLayer,
				mediator = InstagramMediator,
				data = {
					id = ActivityConst.IDOL_INS_ID
				}
			}))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))
		end
	end)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)

	if slot0.linkAct and not slot1:isEnd() then
		slot2 = {}

		for slot7 = 1, math.floor(#slot1.data1_list / 2), 1 do
			slot2[slot8] = (slot2[slot1.data1_list[2 * slot7 - 1]] or 0) + (slot1.data1_list[2 * slot7] or 0)
		end

		slot4 = {}

		for slot8, slot9 in pairs(slot2) do
			table.insert(slot4, {
				name = slot8,
				count = slot9
			})
		end

		table.sort(slot4, function (slot0, slot1)
			if slot0.count == slot1.count then
				return slot0.name < slot1.name
			else
				return slot1.count < slot0.count
			end
		end)

		for slot9 = 1, math.min(#slot4, #slot0.lableItems), 1 do
			setText(slot0.lableItems[slot9].Find(slot10, "name"), "#" .. tostring(ShipGroup.getDefaultShipNameByGroupID(slot4[slot9].name)) .. "#")
			setText(slot0.lableItems[slot9].Find(slot10, "Text"), slot0:TransFormat(slot4[slot9].count))
		end

		for slot9 = slot5 + 1, #slot0.lableItems, 1 do
			setText(slot0.lableItems[slot9].Find(slot10, "name"), "")
			setText(slot0.lableItems[slot9].Find(slot10, "Text"), "0")
		end
	end

	slot0:GetWorldRank(slot0.RefreshTime)
end

function slot0.TransFormat(slot0, slot1)
	slot3 = (tonumber(slot1) or 0) % 10

	if math.floor((tonumber(slot1) or 0) / 1000) >= 1 then
		return slot2 .. ((slot3 > 0 and "." .. slot3) or "") .. "K"
	else
		return slot1
	end
end

function slot0.GetWorldRank(slot0, slot1)
	if not slot0.linkAct or slot0.linkAct:isEnd() then
		return
	end

	if slot1 <= pg.TimeMgr.GetInstance():GetServerTime() - (getProxy(ActivityProxy).requestTime[slot0.linkAct.id] or 0) then
		slot0:emit(ActivityMediator.FETCH_INSTARGRAM, {
			activity_id = slot2
		})
	end
end

function slot0.NeedTip()
	if getProxy(ActivityProxy):getActivityById(ActivityConst.IDOL_PT_ID) and not slot0:isEnd() then
		return slot0:readyToAchieve()
	end
end

return slot0
