ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraTween = class("BattleCameraTween")
ys.Battle.BattleCameraTween.__name = "BattleCameraTween"

function ys.Battle.BattleCameraTween.Ctor(slot0)
	slot0._point = Vector3.zero
end

function ys.Battle.BattleCameraTween.SetFromTo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0._point:Set(slot2.x, slot2.y, slot2.z)

	slot8 = LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdateVector3(System.Action_UnityEngine_Vector3(function (slot0)
		slot0._point:Set(slot0.x, slot0.y, slot0.z)
	end))

	if slot5 and slot5 ~= 0 then
		slot8:setDelay(slot5)
	end

	if slot6 then
		slot8:setEase(LeanTweenType.easeOutExpo)
	end

	if slot7 then
		slot8:setOnComplete(System.Action(function ()
			slot0()
		end))
	end
end

function ys.Battle.BattleCameraTween.GetCameraPos(slot0)
	return slot0._point
end

function ys.Battle.BattleCameraTween.Dispose(slot0)
	slot0._point = nil
end

return
