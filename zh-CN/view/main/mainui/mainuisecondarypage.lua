slot0 = class("MainUISecondaryPage", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "MainUISecondaryPanel"
end

function slot0.OnLoaded(slot0)
	SetActive(slot0._tf, false)

	slot1 = slot0:findTF("frame/bg", slot0._tf)
	slot0._academyBtn = slot0:findTF("school_btn", slot1)
	slot0._haremBtn = slot0:findTF("backyard_btn", slot1)
	slot0._commanderBtn = slot0:findTF("commander_btn", slot1)
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0._commanderBtn, function ()
		uv0:emit(MainUIMediator.OPEN_COMMANDER)
	end, SFX_MAIN)
	onButton(slot0, slot0._haremBtn, function ()
		uv0:emit(MainUIMediator.OPEN_BACKYARD)
	end, SFX_MAIN)
	onButton(slot0, slot0._academyBtn, function ()
		uv0:emit(MainUIMediator.OPEN_SCHOOLSCENE)
	end, SFX_MAIN)
	onButton(slot0, slot0._tf, function ()
		uv0:Hide()
	end, SFX_PANEL)
end

function slot0.Show(slot0, slot1, slot2, slot3, slot4)
	uv0.super.Show(slot0)
	SetActive(slot0._academyBtn:Find("tip"), slot2)
	SetActive(slot0:findTF("tip", slot0._commanderBtn), slot3)
	SetActive(slot0:findTF("tip", slot0._haremBtn), slot4)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, true, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot1.level, "CommandRoomMediator") then
		slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot1.level, "BackYardMediator") then
		slot0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		slot0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end
end

function slot0.Hide(slot0)
	if slot0:isShowing() then
		uv0.super.Hide(slot0)
		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf, slot0._parentTf)
	end
end

function slot0.OnDestroy(slot0)
	slot0:Hide()
end

return slot0
