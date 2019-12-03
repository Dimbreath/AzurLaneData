slot0 = class("SummaryAnimationPage", import(".SummaryPage"))

slot0.OnInit = function (slot0)
	return
end

slot0.Show = function (slot0, slot1)
	setActive(slot0._tf, true)

	slot0.inAniming = true

	slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		slot0.inAniming = nil

		if slot0 then
			slot1()
		end
	end)
end

slot0.inAnim = function (slot0)
	return slot0.inAniming
end

return slot0
