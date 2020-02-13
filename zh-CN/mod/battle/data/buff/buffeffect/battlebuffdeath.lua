ys = ys or {}
ys.Battle.BattleBuffDeath = class("BattleBuffDeath", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffDeath.__name = "BattleBuffDeath"

function ys.Battle.BattleBuffDeath.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffDeath.SetArgs(slot0, slot1, slot2)
	if slot0._tempData.arg_list.time then
		slot0._time = slot3.time + pg.TimeMgr.GetInstance():GetCombatTime()
	end

	slot0._maxX = slot3.maxX
	slot0._minX = slot3.minX
	slot0._maxY = slot3.maxY
	slot0._minY = slot3.minY
	slot0._countType = slot3.countType
end

function ys.Battle.BattleBuffDeath.onUpdate(slot0, slot1, slot2, slot3)
	if slot0._time and slot0._time < slot3 then
		slot0:DoDead(slot1)
	else
		slot4 = slot1:GetPosition()

		if slot0._maxX and slot0._maxX <= slot4.x then
			slot0:DoDead(slot1)
		elseif slot0._minX and slot4.x <= slot0._minX then
			slot0:DoDead(slot1)
		elseif slot0._maxY and slot0._maxY <= slot4.z then
			slot0:DoDead(slot1)
		elseif slot0._minY and slot4.z <= slot0._minY then
			slot0:DoDead(slot1)
		end
	end
end

function ys.Battle.BattleBuffDeath.onBattleBuffCount(slot0, slot1, slot2, slot3)
	if slot3.countType == slot0._countType then
		slot0:DoDead(slot1)
	end
end

function ys.Battle.BattleBuffDeath.DoDead(slot0, slot1)
	slot1:SetDeathReason(slot0.Battle.BattleConst.UnitDeathReason.LEAVE)
	slot1:DeadAction()
end

return
