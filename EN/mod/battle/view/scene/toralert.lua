ys = ys or {}
ys.Battle.TorAlert = class("TorAlert")
ys.Battle.TorAlert.__name = "TorAlert"

function ys.Battle.TorAlert.Ctor(slot0, slot1)
	slot0._alertGO = slot1
	slot0._alertTF = slot1.transform

	slot0._alertGO:SetActive(true)

	slot0._alertTF.localScale = Vector3(20, 5, 1)

	LeanTween.scaleY(slot1, 0, 0.5):setDelay(0.1)
end

function ys.Battle.TorAlert.SetPosition(slot0, slot1, slot2)
	slot0._alertTF.localPosition = slot1
	slot0._alertTF.eulerAngles = Vector3(0, 180 - slot2, 0)
end

function ys.Battle.TorAlert.Dispose(slot0)
	LeanTween.cancel(slot0._alertGO)
	slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot0._alertGO)
end

return
