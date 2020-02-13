slot0 = class("SummaryAnimationPage", import(".SummaryPage"))

function slot0.OnInit(slot0)
	return
end

function slot0.Show(slot0, slot1)
	setActive(slot0._tf, true)

	slot0.inAniming = true

	slot0._go:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		slot0.inAniming = nil

		if slot0 then
			slot1()
		end
	end)
end

function slot0.inAnim(slot0)
	return slot0.inAniming
end

return slot0
