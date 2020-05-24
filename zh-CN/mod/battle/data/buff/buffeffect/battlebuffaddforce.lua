ys = ys or {}
slot0 = ys
slot1 = class("BattleBuffAddForce", slot0.Battle.BattleBuffEffect)
slot0.Battle.BattleBuffAddForce = slot1
slot1.__name = "BattleBuffAddForce"

function slot1.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._singularity = slot0._tempData.arg_list.singularity
	slot0._casterGravity = slot0._tempData.arg_list.gravitationalCaster
	slot0._force = slot0._tempData.arg_list.force
	slot0._forceScalteRate = slot0._tempData.arg_list.scale_rate

	if slot0._singularity then
		slot0._staticSingularity = Vector3.New(slot0._singularity.x, 0, slot0._singularity.z)
	end
end

function slot1.onUpdate(slot0, slot1, slot2)
	slot3 = nil
	slot5 = slot0._force

	if pg.Tool.FilterY(((not slot0._singularity or slot0._staticSingularity) and slot2:GetCaster():GetPosition()) - slot1:GetPosition()).magnitude < 2 then
		slot5 = 1e-08
	elseif slot0._forceScalteRate then
		slot5 = math.min(slot6, 1 / slot6 * slot5)
	end

	slot1:SetUncontrollableSpeed(slot4, slot5, 1e-18)
end

function slot1.onAttach(slot0, slot1, slot2)
end

function slot1.onRemove(slot0, slot1, slot2)
	slot3 = nil

	slot1:SetUncontrollableSpeed(pg.Tool.FilterY(((not slot0._singularity or slot0._staticSingularity) and slot2:GetCaster():GetPosition()) - slot1:GetPosition()), 0.1, 0.1)
end
