ys = ys or {}
ys.Battle.BossSkillAlert = class("BossSkillAlert")
ys.Battle.BossSkillAlert.__name = "BossSkillAlert"

function ys.Battle.BossSkillAlert.Ctor(slot0, slot1)
	slot0._alertGO = slot1
	slot0._alertTF = slot1.transform
	slot0._alertTF.localPosition = Vector3.zero

	LeanTween.alpha(slot1, 0.3, 0.1):setDelay(0.1):setLoopPingPong()
end

function ys.Battle.BossSkillAlert.SetActive(slot0, slot1)
	slot0._alertGO:SetActive(slot1)
end

function ys.Battle.BossSkillAlert.GetActive(slot0)
	return slot0._alertGO.activeSelf
end

function ys.Battle.BossSkillAlert.SetScale(slot0, slot1)
	slot0._alertTF.localScale = slot1
end

function ys.Battle.BossSkillAlert.SetExistTime(slot0, slot1)
	slot0._timer = pg.TimeMgr.GetInstance():AddBattleTimer("BossSkillAlert", 0, slot1, function ()
		if slot0._alertGO then
			slot0:Dispose()
		end
	end)
end

function ys.Battle.BossSkillAlert.Dispose(slot0)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._timer)
	LeanTween.cancel(slot0._alertGO)
	Object.Destroy(slot0._alertGO)

	slot0._alertGO = nil
end

return
