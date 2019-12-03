ys = ys or {}
slot1 = singletonClass("BattleBulletPool")
ys.Battle.BattleBulletPool = slot1
slot1.__name = "BattleBulletPool"

slot1.Ctor = function (slot0)
	return
end

slot1.Init = function (slot0)
	slot0._bulletResCache = {}
end

slot1.InstantiateBullet = function (slot0, slot1, slot2)
	if slot0._bulletResCache[slot1] ~= nil then
		slot2(slot0._bulletResCache[slot1])
	else
		ResourceMgr.Inst:getAssetAsync("Item/" .. slot1, slot1, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
			slot0(slot0)

			slot0._bulletResCache[slot0] = slot0
		end), true, true)
	end
end

slot1.Clear = function (slot0)
	slot0._bulletResCache = nil
end

return
