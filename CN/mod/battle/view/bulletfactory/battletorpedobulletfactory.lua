ys = ys or {}
ys.Battle.BattleTorpedoBulletFactory = singletonClass("BattleTorpedoBulletFactory", ys.Battle.BattleBulletFactory)
ys.Battle.BattleTorpedoBulletFactory.__name = "BattleTorpedoBulletFactory"

function ys.Battle.BattleTorpedoBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleTorpedoBulletFactory.MakeBullet(slot0)
	return slot0.Battle.BattleTorpedoBullet.New()
end

function ys.Battle.BattleTorpedoBulletFactory.onBulletHitFunc(slot0, slot1, slot2)
	slot6 = slot0.GetDataProxy()
	slot7 = slot0:GetBulletData()

	slot1.Battle.PlayBattleSFX(slot7:GetTemplate().hit_sfx)

	slot9 = slot7:GetDiveFilter()

	function slot10(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if slot5.Active then
				slot7 = false
				slot8 = slot0:GetSceneMediator():GetCharacter(slot5.UID):GetUnitData().GetCurrentOxyState(slot6)

				for slot12, slot13 in ipairs(slot1) do
					if slot8 == slot13 then
						slot7 = true
					end
				end

				if not slot7 then
					slot2:HandleDamage(slot3, slot6)
				end
			end
		end
	end

	if slot0:GetBulletData().GetTemplate(slot3).hit_type.range then
		slot6:SpawnColumnArea(slot7:GetEffectField(), slot7:GetIFF(), pg.Tool.FilterY(slot0:GetPosition():Clone()), slot5.range, slot5.time, slot10)
	else
		slot6:SpawnCubeArea(slot7:GetEffectField(), slot7:GetIFF(), pg.Tool.FilterY(slot0:GetPosition():Clone()), slot5.width, slot5.height, slot5.time, slot10)
	end

	slot16, slot18 = slot0.GetFXPool():GetFX(slot0:GetFXID())

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot11, slot12:Add(slot0:GetTf().localPosition), true)

	if slot7:GetPierceCount() <= 0 then
		slot6:RemoveBulletUnit(slot7:GetUniqueID())
	end
end

function ys.Battle.BattleTorpedoBulletFactory.onBulletMissFunc(slot0)
	slot0:onBulletHitFunc()
end

function ys.Battle.BattleTorpedoBulletFactory.MakeModel(slot0, slot1, slot2)
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
