slot0 = class("SaratogaWFSkinPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
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
		uv0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot5.arg1 = uv0.ptData:GetResProgress()
		slot5.activity_id = uv0.ptData:GetId()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	uv0.super.OnUpdateFlush(slot0)

	slot1 = slot0.ptData
	slot7, slot8, slot3 = slot1:GetResProgress()

	setText(slot0.progress, setColorStr(slot1, "#F294B8FF") .. "/" .. slot2)
end

return slot0
