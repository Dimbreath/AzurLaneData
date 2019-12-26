ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEffectArea")
ys.Battle.BattleEffectArea = slot3
slot3.__name = "BattleEffectArea"
slot4 = Vector3(0, 3.5, -5)

function slot3.Ctor(slot0, slot1, slot2)
	slot0._go = slot1
	slot0._aoeData = slot2

	slot0:Init()
end

function slot3.SetStatic(slot0)
	slot0._static = true
end

function slot3.Init(slot0)
	slot0._tf = slot0._go.transform
	slot0._areaType = slot0._aoeData:GetAreaType()

	if slot0._areaType == slot0.AreaType.CUBE then
		slot0.UpdateScale = slot0.updateCubeScale
	elseif slot0._areaType == slot0.AreaType.COLUMN then
		slot0.UpdateScale = slot0.updateColumnScale
	end

	if slot0._aoeData:GetIFF() == slot1.FOE_CODE then
		function slot0.GetAngle()
			return 180 - slot0._aoeData:GetAngle()
		end
	else
		function slot0.GetAngle()
			return slot0._aoeData:GetAngle()
		end
	end

	slot0:UpdateScale()
	slot0:UpdatePosition()
	slot0:UpdateRotation()
end

function slot3.Update(slot0)
	if not slot0._static then
		slot0:UpdatePosition()
		slot0:UpdateRotation()
	end
end

function slot3.updateCubeScale(slot0)
	slot0._tf.localScale = Vector3(slot0._aoeData:GetWidth() * slot0._aoeData:GetIFF(), 0, slot0._aoeData:GetHeight())
end

function slot3.updateColumnScale(slot0)
	slot0._tf.localScale = Vector3(slot0._aoeData:GetRange(), 1, )
end

function slot3.UpdatePosition(slot0)
	slot0._tf.position = slot0._aoeData:GetPosition() + slot0
end

function slot3.UpdateRotation(slot0)
	slot0._tf.localEulerAngles = Vector3(0, slot0:GetAngle(), 0)
end

function slot3.Dispose(slot0)
	slot0.Battle.BattleResourceManager.GetInstance():DestroyOb(slot0._go)

	slot0._go = nil
end

function slot3.ResetScale(slot0)
	slot0._tf.localScale = Vector3(1, 1, 1)
end

return
