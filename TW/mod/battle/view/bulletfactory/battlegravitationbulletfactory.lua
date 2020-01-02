ys = ys or {}
ys.Battle.BattleGravitationBulletFactory = singletonClass("BattleGravitationBulletFactory", ys.Battle.BattleBulletFactory)
ys.Battle.BattleGravitationBulletFactory.__name = "BattleGravitationBulletFactory"

function ys.Battle.BattleGravitationBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleGravitationBulletFactory.MakeBullet(slot0)
	return slot0.Battle.BattleTorpedoBullet.New()
end

function ys.Battle.BattleGravitationBulletFactory.onBulletHitFunc(slot0, slot1, slot2)
	if slot0:GetBulletData().GetPierceCount(slot3) <= 0 then
		return
	end

	slot7 = slot0:GetBulletData()

	slot1.Battle.PlayBattleSFX(slot7:GetTemplate().hit_sfx)

	slot9 = slot7:GetDiveFilter()
	slot11 = slot7:GetTemplate().extra_param.buff_id

	slot0.GetDataProxy():SpawnLastingColumnArea(slot7:GetEffectField(), slot7:GetIFF(), pg.Tool.FilterY(slot10), slot3:GetTemplate().hit_type.range, slot3.GetTemplate().hit_type.time, function (slot0)
		if slot0:CanDealDamage() then
			for slot4, slot5 in ipairs(slot0) do
				if slot5.Active then
					slot7 = false
					slot8 = slot1:GetSceneMediator():GetCharacter(slot5.UID):GetUnitData().GetCurrentOxyState(slot6)

					for slot12, slot13 in ipairs(slot2) do
						if slot8 == slot13 then
							slot7 = true
						end
					end

					if not slot7 then
						slot6:AddBuff(slot9)
						slot5:HandleDamage(slot0, slot6)

						if pg.Tool.FilterY(slot6 - slot6:GetPosition()).magnitude < 0.1 then
							slot6:SetUncontrollableSpeed(slot10, 0.001, 1e-06)
						else
							slot6:SetUncontrollableSpeed(slot10, 0.1, 1e-07)
						end
					end
				end
			end

			slot0:DealDamage()
		end
	end, function (slot0)
		if slot0.Active then
			slot1 = slot0:GetSceneMediator():GetCharacter(slot0.UID):GetUnitData()

			slot1:RemoveBuff(slot1)
		end
	end, false, slot0:GetFXID(), false, function (slot0)
		slot1 = slot0:GetTemplate().extra_param.exploDMG

		for slot5, slot6 in ipairs(slot0) do
			if slot6.Active then
				slot8 = false
				slot9 = slot1:GetSceneMediator():GetCharacter(slot6.UID):GetUnitData().GetCurrentOxyState(slot7)

				for slot13, slot14 in ipairs(slot2) do
					if slot9 == slot14 then
						slot8 = true
					end
				end

				if not slot8 then
					slot3:HandleDirectDamage(slot7, slot1, slot0)
					slot7:SetUncontrollableSpeed(slot10, 1, 0.2, 6)
					slot7:RemoveBuff(slot5)
				end
			end
		end

		slot6, slot8 = slot1.GetFXPool():GetFX(slot6:GetMissFXID())

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot2, slot3:Add(pg.EffectMgr.GetInstance().PlayBattleEffect), true)
		slot3:RemoveBulletUnit(slot0:GetUniqueID())
	end)
end

function ys.Battle.BattleGravitationBulletFactory.onBulletMissFunc(slot0)
	slot0:onBulletHitFunc()
end

function ys.Battle.BattleGravitationBulletFactory.MakeModel(slot0, slot1, slot2)
	slot4 = slot1:GetBulletData().GetTemplate(slot3)
	slot5 = slot0:GetDataProxy()

	if not slot0:GetBulletPool():InstBullet(slot1:GetModleID(), function (slot0)
		if slot0:AddModel(slot0) and slot1.track_fx ~= "" then
			slot6, slot3 = slot2:GetFXPool():GetFX(slot0:GetTrackFXID())

			slot2:MakeTrack(slot0, slot1, slot2)
		end
	end) then
		slot1:AddTempModel(slot0:GetTempGOPool():GetObject())
	end

	slot1:SetSpawn(slot2)
	slot1:SetFXFunc(slot0.onBulletHitFunc, slot0.onBulletMissFunc)
	slot0:GetSceneMediator():AddBullet(slot1)

	if slot3:GetIFF() ~= slot5:GetFriendlyCode() and slot4.alert_fx ~= "" then
		slot1:MakeAlert(slot0:GetFXPool():GetFX(slot4.alert_fx))
	end
end

return
