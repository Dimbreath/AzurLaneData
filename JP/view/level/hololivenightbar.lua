slot0 = class("HololiveNightBar", BaseSubPanel)

slot0.GetUIName = function (slot0)
	return "HololiveBarNight"
end

slot0.OnInit = function (slot0)
	slot0.anim = slot0._go:GetComponent(typeof(Animator))
	slot0.animEvent = slot0._go:GetComponent(typeof(DftAniEvent))

	slot0.animEvent:SetEndEvent(function ()
		slot0:Hide()
	end)
end

slot0.OnShow = function (slot0)
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		weight = LayerWeightConst.THIRD_LAYER,
		groupName = LayerWeightConst.GROUP_LEVELUI
	})
end

slot0.OnHide = function (slot0)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0._tf)
end

slot0.AfterLoaded = function (slot0, slot1)
	if slot1 then
		slot1()
	end
end

slot0.PlayAnim = function (slot0)
	slot0:Hide()
	slot0:Show()
end

return slot0
