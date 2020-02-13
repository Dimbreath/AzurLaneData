ys = ys or {}
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = singletonClass("BattleArrowManager")
ys.Battle.BattleArrowManager = slot2
slot2.__name = "BattleArrowManager"
slot2.ROOT_NAME = "EnemyArrowContainer"
slot2.ARROW_NAME = "EnemyArrow"

function slot2.Ctor(slot0)
	return
end

slot3 = Vector3(0, 10000, 0)

function slot2.HideBullet(slot0)
	slot0.transform.position = slot0
end

function slot2.Init(slot0, slot1)
	slot1:Find(slot0.ARROW_NAME).gameObject.transform.position = slot1

	slot1.Find(slot0.ARROW_NAME).gameObject.SetActive(slot2, true)

	slot3 = pg.Pool.New(slot1, slot2, 5, 10, true, true)

	slot3:SetRecycleFuncs(slot0.HideBullet)
	slot3:InitSize()

	slot0._arrowPool = slot3
end

function slot2.Clear(slot0)
	slot0._arrowPool:Dispose()
end

function slot2.GetArrow(slot0)
	return slot0._arrowPool:GetObject()
end

function slot2.DestroyObj(slot0, slot1)
	if slot1 == nil then
		return
	end

	slot0._arrowPool:Recycle(slot1)
end

return
