ys = ys or {}
ys.Battle.BattleEffectBulletFactory = singletonClass("BattleEffectBulletFactory", ys.Battle.BattleBulletFactory)
ys.Battle.BattleEffectBulletFactory.__name = "BattleEffectBulletFactory"

function ys.Battle.BattleEffectBulletFactory.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleEffectBulletFactory.MakeBullet(slot0)
	return slot0.Battle.BattleTorpedoBullet.New()
end

function ys.Battle.BattleEffectBulletFactory.onBulletHitFunc(slot0, slot1, slot2)
	slot3 = slot0.GetDataProxy()
	slot4 = slot0:GetBulletData()

	slot1.Battle.PlayBattleSFX(slot4:GetTemplate().hit_sfx)

	if not slot4:IsFlare() then
		slot4:spawnArea()
	end

	slot11, slot13 = slot0.GetFXPool():GetFX(slot0:GetFXID())

	pg.EffectMgr.GetInstance():PlayBattleEffect(slot6, slot7:Add(slot0:GetTf().localPosition), true)

	if slot4:GetPierceCount() <= 0 then
		slot3:RemoveBulletUnit(slot4:GetUniqueID())
	end
end

function ys.Battle.BattleEffectBulletFactory.onBulletMissFunc(slot0)
	slot0:onBulletHitFunc()
end

function ys.Battle.BattleEffectBulletFactory.MakeModel(slot0, slot1, slot2)
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
end

return
