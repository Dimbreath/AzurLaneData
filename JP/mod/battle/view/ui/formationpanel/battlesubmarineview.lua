ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = class("BattleSubmarineView")
ys.Battle.BattleSubmarineView = slot2
slot2.__name = "BattleSubmarineView"

function slot2.Ctor(slot0, slot1)
	slot0._submarineCount = 0
	slot0._go = slot1
	slot0._icon = slot1.transform:Find("icon")
	slot0._tips = slot1.transform:Find("warningTips")
end

function slot2.UpdateHostileSubmarineCount(slot0, slot1)
	if slot1 > 0 and slot0._submarineCount <= 0 then
		slot0:activeWarning()
	elseif slot0._submarineCount > 0 and slot1 <= 0 then
		slot0:deacteveWarning()
	end

	slot0._submarineCount = slot1
end

function slot2.activeWarning(slot0)
	SetActive(slot0._icon, true)
	SetActive(slot0._tips, true)
	LeanTween.cancel(go(slot0._icon))
	LeanTween.alpha(rtf(slot0._icon), 1, 2):setFrom(0)
end

function slot2.deacteveWarning(slot0)
	LeanTween.cancel(go(slot0._icon))
	LeanTween.alpha(rtf(slot0._icon), 0, 1):setFrom(1):setOnComplete(System.Action(function ()
		SetActive(slot0._icon, false)
		SetActive(slot0._tips, false)
	end))
end

function slot2.Dispose(slot0)
	slot0._go = nil
	slot0._icon = nil
	slot0._tips = nil
end

return
