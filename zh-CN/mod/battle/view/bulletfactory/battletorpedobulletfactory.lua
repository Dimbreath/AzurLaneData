ys = ys or {}
slot0 = ys
slot0.Battle.BattleTorpedoBulletFactory = singletonClass("BattleTorpedoBulletFactory", slot0.Battle.BattleBulletFactory)
slot0.Battle.BattleTorpedoBulletFactory.__name = "BattleTorpedoBulletFactory"
slot1 = slot0.Battle.BattleTorpedoBulletFactory

function slot1.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot1.MakeBullet(slot0)
	return uv0.Battle.BattleTorpedoBullet.New()
end

function slot1.onBulletHitFunc(slot0, slot1, slot2)
	slot7 = slot0:GetBulletData()

	uv1.Battle.PlayBattleSFX(slot7:GetTemplate().hit_sfx)

	slot9 = slot7:GetDiveFilter()

	if slot0:GetBulletData():GetTemplate().hit_type.range then
		uv0.GetDataProxy():SpawnColumnArea(slot7:GetEffectField(), slot7:GetIFF(), pg.Tool.FilterY(slot0:GetPosition():Clone()), slot5.range, slot5.time, function (slot0)
			for slot4, slot5 in ipairs(slot0) do
				if slot5.Active then
					slot7 = false

					for slot12, slot13 in ipairs(uv1) do
						if uv0:GetSceneMediator():GetCharacter(slot5.UID):GetUnitData():GetCurrentOxyState() == slot13 then
							slot7 = true
						end
					end

					if not slot7 then
						uv2:HandleDamage(uv3, slot6)
					end
				end
			end
		end)
	else
		slot6:SpawnCubeArea(slot7:GetEffectField(), slot7:GetIFF(), pg.Tool.FilterY(slot0:GetPosition():Clone()), slot5.width, slot5.height, slot5.time, slot10)
	end

	slot11, slot12 = uv0.GetFXPool():GetFX(slot0:GetFXID())

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot11, slot12:Add(slot0:GetTf().localPosition), true)

	if slot7:GetPierceCount() <= 0 then
		slot6:RemoveBulletUnit(slot7:GetUniqueID())
	end
end

function slot1.onBulletMissFunc(slot0)
	uv0.onBulletHitFunc(slot0)
end

function slot1.MakeModel(slot0, slot1, slot2)
	slot3 = slot1:GetBulletData()
	slot4 = slot3:GetTemplate()
	slot5 = slot0:GetDataProxy()

	if not slot0:GetBulletPool():InstBullet(slot1:GetModleID(), function (slot0)
		uv0:AddModel(slot0)
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
