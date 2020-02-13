EventConst = require("view/event/EventConst")
slot0 = class("EventListItem")

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.tr = slot1.transform
	slot0.dispatch = slot2
	slot0.bgNormal = slot0:findTF("bgNormal$").gameObject
	slot0.bgEmergence = slot0:findTF("bgEmergence$").gameObject
	slot0.timeLimit = slot0:findTF("timeLimit$").gameObject
	slot0.labelLimitTime = slot0:findTF("timeLimit$/labelLimitTime$"):GetComponent("Text")
	slot0.iconType = slot0:findTF("iconType$"):GetComponent("Image")
	slot0.iconState = slot0:findTF("iconState$")
	slot0.labelLv = slot0:findTF("level/labelLv$"):GetComponent("Text")
	slot0.iconTip = slot0:findTF("iconTip$").gameObject
	slot0.labelName = slot0:findTF("labelName$"):GetComponent("Text")
	slot0.labelTime = slot0:findTF("labelTime$/Text"):GetComponent("Text")
	slot0.awardsTr = slot0:findTF("awards$")
	slot0.specialAward = slot0:findTF("specialAward/item")
	slot0.awardItem = slot0:findTF("awards$/item").gameObject
	slot0.mark = slot0:findTF("mark")

	SetActive(slot0.mark, false)
end

function slot0.Update(slot0, slot1, slot2)
	slot0.index = slot1
	slot0.event = slot2

	slot0:Flush()
end

function slot0.UpdateTime(slot0)
	if not slot0.event then
		return
	end

	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.event.state == EventInfo.StateNone then
		slot0.labelTime.gameObject:SetActive(true)

		slot0.labelTime.text = pg.TimeMgr.GetInstance():DescCDTime(slot0.event.template.collect_time)
	elseif slot0.event.state == EventInfo.StateActive then
		slot0.labelTime.gameObject:SetActive(true)

		if slot1 <= slot0.event.finishTime then
			slot0.labelTime.text = pg.TimeMgr.GetInstance():DescCDTime(slot0.event.finishTime - slot1)
		else
			slot0.labelTime.text = "00:00:00"
		end
	elseif slot0.event.state == EventInfo.StateFinish then
		slot0.labelTime.gameObject:SetActive(false)
	end

	if slot0.event.state == EventInfo.StateNone and slot0.event.overTime > 0 and slot1 <= slot0.event.overTime then
		slot0.timeLimit:SetActive(true)

		slot0.labelLimitTime.text = pg.TimeMgr.GetInstance():DescCDTime(slot0.event.overTime - slot1)
	else
		slot0.timeLimit:SetActive(false)
	end

	SetActive(slot0.mark, slot0.event.state == EventInfo.StateFinish)
end

function slot0.Flush(slot0)
	slot0.bgNormal:SetActive(slot0.event.template.type ~= 2)
	slot0.bgEmergence:SetActive(slot0.event.template.type == 2)

	if slot0.event.state == EventInfo.StateFinish then
		slot0.iconTip:SetActive(true)
	else
		slot0.iconTip:SetActive(false)
	end

	LoadImageSpriteAsync("eventtype/" .. slot0.event.template.icon, slot0.iconType)
	eachChild(slot0.iconState, function (slot0)
		setActive(slot0, slot0.gameObject.name == tostring(slot0.event.state))
	end)

	slot0.labelLv.text = "" .. slot0.event.template.lv
	slot0.labelName.text = slot0.event.template.title

	for slot6 = slot0.awardsTr.childCount, #slot0.event.template.drop_display - 1, 1 do
		Object.Instantiate(slot0.awardItem).transform:SetParent(slot0.awardsTr, false)
	end

	for slot6 = 0, slot0.awardsTr.childCount - 1, 1 do
		slot7 = slot0.awardsTr:GetChild(slot6)

		if slot6 < #slot1 then
			slot7.gameObject:SetActive(true)
			updateDrop(slot7, {
				type = slot1[slot6 + 1].type,
				id = slot1[slot6 + 1].id,
				count = slot1[slot6 + 1].nums
			})
		else
			slot7.gameObject:SetActive(false)
		end
	end

	SetActive(slot0.specialAward, table.getCount(slot0.event.template.special_drop) ~= 0)

	if table.getCount(slot0.event.template.special_drop) ~= 0 then
		updateDrop(slot0.specialAward, {
			type = slot0.event.template.special_drop.type,
			id = slot0.event.template.special_drop.id
		})
	end
end

function slot0.Clear(slot0)
	return
end

function slot0.findTF(slot0, slot1)
	return findTF(slot0.tr, slot1)
end

return slot0
