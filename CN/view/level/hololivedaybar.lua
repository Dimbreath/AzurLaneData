slot0 = class("HololiveDayBar", BaseSubPanel)

function slot0.GetUIName(slot0)
	return "HololiveBarDay"
end

function slot0.OnInit(slot0)
	slot0.anim = slot0._go:GetComponent(typeof(Animator))
	slot0.animEvent = slot0._go:GetComponent(typeof(DftAniEvent))

	slot0.animEvent:SetEndEvent(function ()
		slot0:Hide()
	end)
end

function slot0.OnShow(slot0)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		weight = LayerWeightConst.THIRD_LAYER,
		groupName = LayerWeightConst.GROUP_LEVELUI
	})
end

function slot0.OnHide(slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)
end

function slot0.AfterLoaded(slot0, slot1)
	if slot1 then
		slot1()
	end
end

function slot0.PlayAnim(slot0)
	slot0:Hide()
	slot0:Show()
end

return slot0
