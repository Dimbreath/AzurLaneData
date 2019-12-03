slot0 = class("ShenshengxvmuPage", import(".TemplatePage.PtTemplatePage"))

slot0.OnFirstFlush = function (slot0)
	slot0.super.OnFirstFlush(slot0)
	setActive(slot0.displayBtn, false)
	setActive(slot0.awardTF, false)
	onButton(slot0, slot0.battleBtn, function ()
		slot0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end, SFX_PANEL)
end

slot0.OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.step, (slot3 >= 1 and setColorStr(slot1, COLOR_GREEN)) or slot1)
	setText(slot0.progress, "/" .. slot2)
end

return slot0
