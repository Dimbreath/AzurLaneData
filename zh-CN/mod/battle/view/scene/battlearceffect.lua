ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = slot0.Battle.BattleConfig
slot3 = class("BattleArcEffect")
slot0.Battle.BattleArcEffect = slot3
slot3.__name = "BattleArcEffect"

function slot3.Ctor(slot0, slot1, slot2, slot3)
	slot0._go = slot1
	slot0._unitA = slot2
	slot0._unitB = slot3
	slot0._material = slot0._go.transform:GetComponent(typeof(Renderer)).material
	slot4 = slot0._unitA:GetPosition()
	slot5 = slot0._unitB:GetPosition()
	slot0._vectorA = Vector4.New(slot4.x, 5, slot4.z, 1)
	slot0._vectorB = Vector4.New(slot5.x, 5, slot5.z, 1)

	slot0._material:SetVector("_PosBegin", slot0._vectorA)
	slot0._material:SetVector("_PosEnd", slot0._vectorB)
end

function slot3.Update(slot0)
	slot1 = slot0._unitA:GetPosition()
	slot2 = slot0._unitB:GetPosition()
	slot0._vectorA.x = slot1.x
	slot0._vectorA.z = slot1.z
	slot0._vectorB.x = slot2.x
	slot0._vectorB.z = slot2.z

	slot0._material:SetVector("_PosBegin", slot0._vectorA)
	slot0._material:SetVector("_PosEnd", slot0._vectorB)

	slot0._go.transform.position = slot0._vectorA
end

function slot3.Dispose(slot0)
	slot0._material = nil
	slot0._go = nil
	slot0._unitA = nil
	slot0._unitB = nil
	slot0._vectorA = nil
	slot0._vectorB = nil
end
