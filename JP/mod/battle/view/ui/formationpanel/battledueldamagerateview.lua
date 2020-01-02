ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleDuelDamageRateView")
ys.Battle.BattleDuelDamageRateView = slot3
slot3.__name = "BattleDuelDamageRateView"

function slot3.Ctor(slot0, slot1)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._go = slot1
	slot0._tf = slot1.transform
	slot0._progressList = {}
	slot0._rateBarList = {}
	slot0._fleetList = {}
	slot0._rateBarList[slot1.FRIENDLY_CODE] = slot0._tf:Find("leftDamageBar")
	slot0._rateBarList[slot1.FOE_CODE] = slot0._tf:Find("rightDamageBar")
end

function slot3.SetActive(slot0, slot1)
	setActive(slot0._go, slot1)
end

function slot3.SetFleetVO(slot0, slot1, slot2)
	slot0._fleetList[slot1] = true
	slot0._rateBarList[slot1:GetIFF()].Find(slot3, "nameText"):GetComponent(typeof(Text)).text = slot2.name
	slot0._rateBarList[slot1.GetIFF()].Find(slot3, "LVText"):GetComponent(typeof(Text)).text = "Lv." .. slot2.level
	slot0._progressList[slot1:GetIFF()] = slot0._rateBarList[slot1.GetIFF()].Find(slot3, "bar/progress"):GetComponent(typeof(Image))

	slot1:RegisterEventListener(slot0, slot0.FLEET_DMG_CHANGE, slot0.onDMGChange)
end

function slot3.onDMGChange(slot0, slot1)
	slot0._progressList[slot1.Dispatcher.GetIFF(slot2)].fillAmount = slot1.Dispatcher:GetDamageRatio()
end

function slot3.Dispose(slot0)
	for slot4, slot5 in pairs(slot0._fleetList) do
		slot4:UnregisterEventListener(slot0, slot0.FLEET_DMG_CHANGE)
	end

	slot0._rateBarList = nil
	slot0._progressList = nil
end

return
