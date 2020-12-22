slot0 = class("StoryAnimtion")

function slot0.Ctor(slot0, slot1)
	slot0.tweens = {}
	slot0.timers = {}
end

function slot0.TweenMove(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot4 > 1 then
		LeanTween.move(rtf(slot1), slot2, slot3):setDelay(slot5):setLoopPingPong(slot4)
	end

	if slot6 then
		slot7:setOnComplete(System.Action(slot6))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenScale(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 then
		LeanTween.scale(rtf(slot1), slot2, slot3):setDelay(slot4):setOnComplete(System.Action(slot5))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenRotate(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6 then
		LeanTween.rotate(rtf(slot1), slot2, slot3):setLoopPingPong(slot4):setDelay(slot5):setOnComplete(System.Action(slot6))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenValueForcanvasGroup(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6 then
		LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)
			uv0.alpha = slot0
		end)):setDelay(slot5):setOnComplete(System.Action(slot6))
	end

	table.insert(slot0.tweens, slot1.gameObject.transform)
end

function slot0.TweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot7 then
		LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(slot6)):setDelay(slot5):setOnComplete(System.Action(function ()
			if uv0 then
				uv0()
			end
		end))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenValueLoop(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot7 then
		LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(slot6)):setDelay(slot5):setLoopClamp():setOnComplete(System.Action(function ()
			if uv0 then
				uv0()
			end
		end))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenTextAlpha(slot0, slot1, slot2, slot3, slot4, slot5)
	if slot5 then
		LeanTween.textAlpha(slot1, slot2, slot3 or 1):setDelay(slot4):setOnComplete(System.Action(slot5))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenAlpha(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if slot6 then
		LeanTween.alpha(slot1, slot3, slot4):setFrom(slot2):setDelay(slot5):setOnComplete(System.Action(slot6))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.TweenMovex(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot6 then
		LeanTween.moveX(slot1, slot2, slot4):setDelay(slot5):setFrom(slot3):setLoopPingPong(slot6)
	end

	if slot7 then
		slot8:setOnComplete(System.Action(slot7))
	end

	table.insert(slot0.tweens, slot1)
end

function slot0.IsTweening(slot0, slot1)
	return LeanTween.isTweening(slot1)
end

function slot0.CancelTween(slot0, slot1)
	if slot0:IsTweening(slot1) then
		LeanTween.cancel(slot1)
	end
end

function slot0.DelayCall(slot0, slot1, slot2)
	if slot1 <= 0 then
		slot2()

		return
	end

	slot0.timers[slot2] = Timer.New(function ()
		uv0.timers[uv1]:Stop()

		uv0.timers[uv1] = nil

		uv1()
	end, slot1, 1)

	slot0.timers[slot2]:Start()
end

function slot0.CreateDelayTimer(slot0, slot1, slot2)
	if slot1 == 0 then
		slot2()

		return nil
	end

	slot3 = Timer.New(slot2, slot1, 1)

	slot3:Start()

	return slot3
end

function slot0.ClearAllTween(slot0)
	for slot4, slot5 in ipairs(slot0.tweens) do
		if not IsNil(slot5) and slot0:IsTweening(slot5.gameObject) then
			LeanTween.cancel(slot5.gameObject)
		end
	end
end

function slot0.ClearAllTimers(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = {}
end

function slot0.ClearAnimation(slot0)
	slot0:ClearAllTween()
	slot0:ClearAllTimers()
end

return slot0
