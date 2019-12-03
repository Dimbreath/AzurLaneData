slot0 = class("SaratogaWFSkinPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
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
		slot0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot2, slot5.arg1 = slot0.ptData:GetResProgress()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = slot0.ptData:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot7, slot8, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.progress, setColorStr(slot1, "#F294B8FF") .. "/" .. slot2)
end

return slot0
