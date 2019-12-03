ys = ys or {}
ys.Battle.BattleBuffScapegoat = class("BattleBuffScapegoat", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffScapegoat.__name = "BattleBuffScapegoat"

function ys.Battle.BattleBuffScapegoat.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffScapegoat.SetArgs(slot0, slot1, slot2)
	slot0._target = slot0._tempData.arg_list.target
	slot0._rant = slot0._tempData.arg_list.rant or 10000
end

function ys.Battle.BattleBuffScapegoat.onAttach(slot0, slot1)
	slot0:updateGoatsList(slot1)
end

function ys.Battle.BattleBuffScapegoat.onStartGame(slot0, slot1)
	slot0:updateGoatsList(slot1)
end

function ys.Battle.BattleBuffScapegoat.onFriendlyShipDying(slot0, slot1)
	slot0:updateGoatsList(slot1)
end

function ys.Battle.BattleBuffScapegoat.updateGoatsList(slot0, slot1)
	slot0._goatList = slot0:getTargetList(slot1, slot0._target, slot0._tempData.arg_list)
	slot0._goatCount = #slot0._goatList
end

function ys.Battle.BattleBuffScapegoat.onTakeDamage(slot0, slot1, slot2, slot3)
	if not slot0.Battle.BattleFormulas.IsHappen(slot0._rant) then
		return "chance"
	end

	if slot3.miss then
		return
	end

	slot5 = math.floor(slot3.damage / slot0._goatCount) * -1
	slot6 = {}

	for slot10, slot11 in ipairs(slot0._goatList) do
		slot6[#slot6 + 1] = slot11
	end

	for slot10, slot11 in ipairs(slot6) do
		slot11:UpdateHP(slot5, {
			isMiss = false,
			isCri = false,
			isShare = true,
			isHeal = false
		})
	end

	slot3.damage = 0
end

return
