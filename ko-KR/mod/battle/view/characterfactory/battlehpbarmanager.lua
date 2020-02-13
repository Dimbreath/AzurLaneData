ys = ys or {}
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = singletonClass("BattleHPBarManager")
ys.Battle.BattleHPBarManager = slot2
slot2.__name = "BattleHPBarManager"
slot2.ROOT_NAME = "HPBarContainer"
slot2.HP_BAR_FRIENDLY = "heroBlood"
slot2.HP_BAR_FOE = "enemyBlood"
slot2.ORIGIN_BAR_WIDTH = {
	heroBlood = 70,
	enemyBlood = 154
}
slot2.ORIGIN_PROGRESS_WIDTH = {
	heroBlood = 66,
	enemyBlood = 153
}

function slot2.Ctor(slot0)
	return
end

function slot2.Init(slot0, slot1, slot2)
	slot0._allPool = {}
	slot0._ob2Pool = {}
	slot0._allPool[slot0.HP_BAR_FRIENDLY] = slot0.generateTempPool(slot0.HP_BAR_FRIENDLY, slot2, slot1, 3, 10)
	slot0._allPool[slot0.HP_BAR_FOE] = slot0.generateTempPool(slot0.HP_BAR_FOE, slot2, slot1, 8, 10)
end

function slot2.InitialPoolRoot(slot0, slot1)
	slot0._allPool[slot0.HP_BAR_FRIENDLY]:ResetParent(slot1)
	slot0._allPool[slot0.HP_BAR_FOE]:ResetParent(slot1)
end

function slot2.Clear(slot0)
	for slot4, slot5 in pairs(slot0._allPool) do
		slot5:Dispose()
	end

	slot0._ob2Pool = {}
	slot0._allPool = {}
end

function slot2.GetHPBar(slot0, slot1)
	slot0._ob2Pool[slot0._allPool[slot1].GetObject(slot2)] = slot0._allPool[slot1]
	slot0._allPool[slot1].GetObject(slot2).transform.Find(slot4, "blood").GetComponent(slot5, typeof(Image)).fillAmount = 1

	if slot0._allPool[slot1].GetObject(slot2).transform:Find("type") then
		SetActive(slot6, false)
	end

	if slot4:Find("torpedoIcons") then
		SetActive(slot7, false)
	end

	return slot3
end

function slot2.DestroyObj(slot0, slot1)
	if slot1 == nil then
		return
	end

	if slot0._ob2Pool[slot1] then
		slot2:Recycle(slot1)
	else
		Object.Destroy(slot1)
	end
end

slot3 = Vector3(0, 10000, 0)

function slot2.HideBullet(slot0)
	slot0.transform.position = slot0
end

function slot2.generateTempPool(slot0, slot1, slot2, slot3, slot4)
	slot2.transform.Find(slot5, slot0).gameObject.transform.position = slot0

	slot2.transform.Find(slot5, slot0).gameObject.SetActive(slot6, true)

	slot7 = pg.Pool.New(slot1, slot6, slot3, slot4, true, true)

	slot7:SetRecycleFuncs(slot1.HideBullet)
	slot7:InitSize()

	return slot7
end

return
