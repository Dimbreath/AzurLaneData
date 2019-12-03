ys = ys or {}
slot1 = class("BattleSceneObject")
ys.Battle.BattleSceneObject = slot1
slot1.__name = "BattleSceneObject"

slot1.Ctor = function (slot0)
	return
end

slot1.GetGO = function (slot0)
	return slot0._go
end

slot1.GetTf = function (slot0)
	return slot0._tf
end

slot1.SetGO = function (slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1.transform
end

slot1.GetCldBoxSize = function (slot0)
	return
end

slot1.GetCldBox = function (slot0)
	return
end

slot1.GetCldData = function (slot0)
	return
end

slot1.GetGOPosition = function (slot0)
	return slot0._tf.localPosition
end

slot1.CameraOrthogonal = function (slot0, slot1)
	slot0._tf.localRotation = slot1.transform.localRotation
end

slot1.Dispose = function (slot0)
	slot0._tf = nil

	slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot0._go)

	slot0._go = nil
end

return
