slot0 = class("OutPostPtPage", import(".MaoziPtPage"))

function slot0.OnInit(slot0)
	slot0.super.OnInit(slot0)

	slot0.getBtn = slot0:findTF("AD/switcher/phase2/get_btn")

	print(slot0.getBtn)
end

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)
	setActive(slot0.displayBtn, true)

	slot3, slot4 = slot0:GetActTask()

	setActive(slot0.displayBtn:Find("Image1"), not (slot3 and slot3:isReceive() and slot4))
	setActive(slot0.displayBtn:Find("Image2"), slot3 and slot3.isReceive() and slot4)

	if slot3 and not slot3:isReceive() then
		blinkAni(go(slot1), 0.8, -1, 0.3)
	else
		LeanTween.cancel(go(slot1))
	end

	onButton(slot0, slot0.displayBtn, function ()
		if slot0 and slot0:isReceive() and not slot1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("undermist_tip"))

			return
		end

		if slot0 and not slot1 then
			slot2:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
				page = "activity",
				targetId = slot0.id
			})
		end
	end, SFX_PANEL)
end

function slot0.GetActTask(slot0)
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.OUTPOST_TASK) or slot1:isEnd() then
		return
	end

	slot3 = getProxy(TaskProxy)
	slot4 = nil
	slot5 = false

	for slot9 = #_.flatten(slot1:getConfig("config_data")), 1, -1 do
		if slot3:getTaskById(slot2[slot9]) or slot3:getFinishTaskById(slot10) then
			slot4 = slot11

			if slot9 == #slot2 then
				slot5 = true
			end

			break
		end
	end

	return slot4, slot5
end

return slot0
