ys = ys or {}
ys.Battle.BattleTimerView = class("BattleTimerView")
ys.Battle.BattleTimerView.__name = "BattleTimerView"

ys.Battle.BattleTimerView.Ctor = function (slot0, slot1)
	slot0._go = slot1
	slot0._timer = slot0._go.transform:Find("Text")
	slot0._blinker = slot0._timer:GetComponent(typeof(Animator))
	slot0._isBlink = false
	slot0._text = slot0._timer:GetComponent(typeof(Text))
	slot0.timeStr = ""
end

ys.Battle.BattleTimerView.SetActive = function (slot0, slot1)
	setActive(slot0._go, slot1)
end

ys.Battle.BattleTimerView.SetCountDownText = function (slot0, slot1)
	if slot1 <= 30 and not slot0._isBlink then
		slot0._blinker.enabled = true
		slot0._isBlink = true
	end

	if slot0.formatTime(math.floor(slot1)) == slot0.timeStr then
		return
	end

	slot0.timeStr = slot2
	slot0._text.text = slot2
end

ys.Battle.BattleTimerView.formatTime = function (slot0)
	return string.format("%02u:%02u", math.floor(slot0 / 60), slot0 % 60)
end

ys.Battle.BattleTimerView.Dispose = function (slot0)
	return
end

return
