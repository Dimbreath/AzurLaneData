ys = ys or {}
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = singletonClass("BattlePopNumManager")
ys.Battle.BattlePopNumManager = slot2
slot2.__name = "BattlePopNumManager"
slot2.CONTAINER_HP = "HPTextContainer"
slot2.CONTAINER_SCORE = "ScoreTextContainer"
slot2.POP_SCORE = "score"
slot2.POP_MISS = "miss"
slot2.POP_HEAL = "heal"
slot2.POP_COMMON = "common"
slot2.POP_UNBREAK = "unbreak"
slot2.POP_NORMAL = "normal"
slot2.POP_EXPLO = "explo"
slot2.POP_PIERCE = "pierce"
slot2.POP_CT_NORMAL = "critical_normal"
slot2.POP_CT_EXPLO = "critical_explo"
slot2.POP_CT_PIERCE = "critical_pierce"
slot2.FontIndex = {
	slot2.POP_NORMAL,
	slot2.POP_PIERCE,
	slot2.POP_EXPLO,
	slot2.POP_UNBREAK
}
slot2.CTFontIndex = {
	slot2.POP_CT_NORMAL,
	slot2.POP_CT_PIERCE,
	slot2.POP_CT_EXPLO,
	slot2.POP_UNBREAK
}

slot2.Ctor = function (slot0)
	return
end

slot2.Init = function (slot0, slot1, slot2)
	slot0._allPool = {}
	slot0._activeList = {}
	slot0._allPool[slot0.POP_COMMON] = slot0:generateTempPool(slot0.POP_COMMON, slot2, slot1, 10)
	slot0._allPool[slot0.POP_MISS] = slot0:generateTempPool(slot0.POP_MISS, slot2, slot1, 10)
	slot0._allPool[slot0.POP_UNBREAK] = slot0:generateTempPool(slot0.POP_UNBREAK, slot2, slot1, 10)
	slot0._allPool[slot0.POP_HEAL] = slot0:generateTempPool(slot0.POP_HEAL, slot2, slot1, 0)
	slot0._allPool[slot0.POP_NORMAL] = slot0:generateTempPool(slot0.POP_NORMAL, slot2, slot1, 0)
	slot0._allPool[slot0.POP_EXPLO] = slot0:generateTempPool(slot0.POP_EXPLO, slot2, slot1, 0)
	slot0._allPool[slot0.POP_PIERCE] = slot0:generateTempPool(slot0.POP_PIERCE, slot2, slot1, 0)
	slot0._allPool[slot0.POP_CT_NORMAL] = slot0:generateTempPool(slot0.POP_CT_NORMAL, slot2, slot1, 0)
	slot0._allPool[slot0.POP_CT_EXPLO] = slot0:generateTempPool(slot0.POP_CT_EXPLO, slot2, slot1, 0)
	slot0._allPool[slot0.POP_CT_PIERCE] = slot0:generateTempPool(slot0.POP_CT_PIERCE, slot2, slot1, 0)
	slot0._allPool[slot0.POP_SCORE] = slot0:generateTempPool(slot0.POP_SCORE, slot2, slot1, 5)
end

slot2.InitialPoolRoot = function (slot0, slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_COMMON], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_MISS], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_UNBREAK], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_HEAL], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_NORMAL], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_EXPLO], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_PIERCE], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_CT_NORMAL], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_CT_EXPLO], slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_CT_PIERCE], slot1)
end

slot2.InitialScorePoolRoot = function (slot0, slot1)
	slot0:resetPopParent(slot0._allPool[slot0.POP_SCORE], slot1)
end

slot2.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0._allPool) do
		slot5:Dispose()
	end

	slot0._allPool = {}
	slot0._activeList = {}
end

slot2.Update = function (slot0)
	for slot4, slot5 in pairs(slot0._activeList) do
		slot4:Update()
	end
end

slot2.UnloadPopNum = function (slot0, slot1)
	slot0._activeList[slot1] = nil
end

slot2.GetPop = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6, slot7 = slot0.getType(slot1, slot2, slot3, slot5)
	slot9 = slot0._allPool[slot6].GetObject(slot8)

	if slot6 ~= slot0.POP_MISS then
		slot9:SetText(slot4)
	end

	slot9:SetScale(slot7)

	slot0._activeList[slot9] = 1

	return slot9
end

slot2.GetScorePop = function (slot0, slot1)
	slot3 = slot0._allPool[slot0.POP_SCORE].GetObject(slot2)

	slot3:SetText(slot1)

	slot0._activeList[slot3] = 1

	return slot3
end

slot2.getType = function (slot0, slot1, slot2, slot3)
	slot4 = 1
	slot5 = nil

	if slot0 and not slot2 then
		slot5 = slot0.POP_HEAL
	elseif slot2 then
		slot5 = slot0.POP_MISS
	elseif slot3 then
		slot7 = slot3[2]
		slot5 = (not slot1 or slot0.CTFontIndex[slot3[1]]) and slot0.FontIndex[slot3[1]]
		slot4 = slot3[2]
	else
		return (not slot1 or slot0.POP_CT_EXPLO) and slot0.POP_COMMON, slot4
	end
end

slot2.generatePool = function (slot0, slot1, slot2, slot3, slot4)
	return pg.LuaObPool.New(slot0.Battle.BattlePopNum, {
		template = slot3:Find(slot1).gameObject,
		parentTF = slot2,
		mgr = slot0
	}, slot4)
end

slot2.generateTempPool = function (slot0, slot1, slot2, slot3, slot4)
	return pg.LuaObPool.New(slot0.Battle.BattlePopNum, {
		template = slot3.transform:Find(slot1).gameObject,
		parentTF = slot2,
		mgr = slot0
	}, slot4)
end

slot2.resetPopParent = function (slot0, slot1, slot2)
	slot1:UpdateInfo("parentTF", slot2)

	for slot6, slot7 in ipairs(slot1.list) do
		slot7:SetParent(slot2)
	end
end

return
