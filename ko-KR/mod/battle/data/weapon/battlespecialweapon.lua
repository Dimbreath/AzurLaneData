ys = ys or {}
slot1 = class("BattleSpecialWeapon", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleSpecialWeapon = slot1
slot1.__name = "BattleSpecialWeapon"

function slot1.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function slot1.CheckPreCast(slot0)
	slot1 = slot0._dataProxy:GetSeqCenter()

	if not slot0._tmpData.bullet_ID[1] then
		slot0._castInfo = {
			weapon = slot0
		}

		return true
	end

	slot4 = slot0.Battle.NodeData.New(slot0._host, {
		weapon = slot0
	}, slot3)

	pg.NodeMgr.GetInstance():GenNode(slot4, pg.BattleNodesCfg[slot2], slot1:NewSeq("precast"))

	if slot4:GetData().targets[1] == nil then
		return false
	end

	slot0._castInfo = slot5

	return true
end

function slot1.Fire(slot0)
	slot2 = slot0._tmpData.bullet_ID[1]
	slot4 = slot0._dataProxy:GetSeqCenter().NewSeq(slot1, "cast")
	slot5 = slot0.Battle.NodeData.New(slot0._host, slot3, slot4)

	pg.NodeMgr.GetInstance():GenNode(slot5, pg.BattleNodesCfg[slot0._tmpData.barrage_ID[1]], slot4)
	slot0._host:SetCurNodeList(slot5:GetAllSeq())

	slot0._currentState = slot0.STATE_ATTACK
	slot0._castInfo = nil

	slot0:CheckAndShake()
	slot4:Add(slot0.Battle.CallbackNode.New(function ()
		slot0:EnterCoolDown()
	end))

	return true
end

return
