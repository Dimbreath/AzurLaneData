ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleConst
slot2 = pg.bullet_template
slot3 = pg.barrage_template
slot0.Battle.BattleDataFunction = slot0.Battle.BattleDataFunction or {}
slot4 = slot0.Battle.BattleDataFunction

function slot4.CreateBattleBulletData(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.GetBulletTmpDataFromID(slot1)
	slot7, slot8 = uv0.generateBulletFuncs[slot5.type](slot0, slot5, slot2, slot3, slot4)

	slot7:SetTemplateData(slot5)
	slot7:SetAttr(slot2._attr)
	slot7:SetBuffTrigger(slot2)
	slot7:SetWeapon(slot3)

	if slot3 and slot3:GetStandHost() then
		slot7:SetStandHostAttr(slot3:GetStandHost():GetAttr())
	end

	return slot7, slot8
end

function slot4.GetBulletTmpDataFromID(slot0)
	return uv0[slot0]
end

function slot4.GetBarrageTmpDataFromID(slot0)
	return uv0[slot0]
end

function slot4.GetConvertedBarrageTableFromID(slot0)
	return uv0.ConvertedBarrageTableList[slot0]
end

function slot4.GenerateTransBarrage(slot0, slot1, slot2)
	slot3 = {}
	slot4 = uv0.GetBarrageTmpDataFromID(slot0)

	while slot4.trans_ID ~= -1 do
		if uv0.GetBarrageTmpDataFromID(slot4.trans_ID).offset_prioritise then
			-- Nothing
		else
			slot6.transAimAngle = slot4.angle + slot4.delta_angle * slot2

			if slot1 == -1 then
				slot6.transAimAngle = slot6.transAimAngle + 180
			end
		end

		slot3[#slot3 + 1] = {
			transStartDelay = slot4.first_delay + slot4.delay * slot2 + slot4.delta_delay * slot2,
			transAimPosX = slot4.offset_x + slot4.delta_offset_x * slot2,
			transAimPosZ = slot4.offset_z + slot4.delta_offset_z * slot2
		}
	end

	return slot3
end

function slot4._createCannonBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleCannonBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(true)

	return slot5, true
end

function slot4._createBombBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleBombBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetAttr(slot2._attr)
	slot5:SetTemplateData(slot1)

	if slot4:EqualZero() then
		slot4 = slot2:GetPosition():Clone()

		if slot2:GetDirection() == uv1.UnitDir.RIGHT then
			slot4.x = slot4.x + slot3:GetTemplateData().range
		else
			slot4.x = slot4.x - slot6
		end
	end

	slot5:SetExplodePosition(slot4)
	slot5:SetIsCld(false)

	return slot5, false
end

function slot4._createStrayBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleStrayBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(true)

	return slot5, true
end

function slot4._createTorpedoBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleTorpedoBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetExplodePosition(slot4)
	slot5:SetIsCld(true)

	return slot5, true
end

function slot4._createDirectBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleAntiAirBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(false)

	return slot5, false
end

function slot4._createAntiAirBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleAntiAirBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(false)

	return slot5, false
end

function slot4._createAntiSeaBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleAntiSeaBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(false)

	return slot5, false
end

function slot4._createSharpnelBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleShrapnelBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetExplodePosition(slot4)
	slot5:SetSrcHost(slot2)
	slot5:SetIsCld(true)

	return slot5, true
end

function slot4._createEffectBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleEffectBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetTemplateData(slot1)
	slot5:SetIsCld(false)
	slot5:SetImmuneCLS(true)

	if slot1.attach_buff[1].flare then
		slot5:spawnArea(true)
	end

	return slot5, false
end

function slot4._createBeamBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleAntiAirBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetIsCld(false)

	return slot5, false
end

function slot4._createGravitationBullet(slot0, slot1, slot2, slot3, slot4)
	slot5 = uv0.Battle.BattleGravitationBulletUnit.New(slot0, slot2:GetIFF())

	slot5:SetExplodePosition(slot4)
	slot5:SetIsCld(true)
	slot5:SetImmuneCLS(true)

	return slot5, true
end

slot4.generateBulletFuncs = {
	[slot1.BulletType.CANNON] = slot4._createCannonBullet,
	[slot1.BulletType.BOMB] = slot4._createBombBullet,
	[slot1.BulletType.TORPEDO] = slot4._createTorpedoBullet,
	[slot1.BulletType.DIRECT] = slot4._createDirectBullet,
	[slot1.BulletType.ANTI_AIR] = slot4._createAntiAirBullet,
	[slot1.BulletType.ANTI_SEA] = slot4._createAntiSeaBullet,
	[slot1.BulletType.SHRAPNEL] = slot4._createSharpnelBullet,
	[slot1.BulletType.STRAY] = slot4._createStrayBullet,
	[slot1.BulletType.EFFECT] = slot4._createEffectBullet,
	[slot1.BulletType.BEAM] = slot4._createBeamBullet,
	[slot1.BulletType.G_BULLET] = slot4._createGravitationBullet,
	[slot1.BulletType.ELECTRIC_ARC] = slot4._createDirectBullet
}

function slot4.ConvertBarrage()
	slot0 = {}

	for slot6, slot7 in ipairs(pg.barrage_template.all) do
		slot0[slot7][uv0.Battle.BattleConst.UnitDir.RIGHT], slot0[slot7][uv0.Battle.BattleConst.UnitDir.LEFT] = uv1.barrageInteration(pg.barrage_template[slot7])
		slot0[slot7] = {}
	end

	uv1.ConvertedBarrageTableList = slot0
end

function slot4.barrageInteration(slot0)
	slot1 = 1
	slot3 = {}
	slot4 = {}
	slot5 = slot0.offset_x
	slot6 = slot0.offset_z
	slot7 = slot0.angle
	slot8 = slot0.delay

	for slot16 = 0, slot0.primal_repeat do
		slot17 = {
			OffsetX = slot5,
			OffsetZ = slot6,
			Angle = slot7,
			Delay = slot8
		}

		table.insert(slot3, slot17)

		slot18 = Clone(slot17)
		slot18.OffsetX = slot18.OffsetX * -1

		table.insert(slot4, slot18)

		slot5 = slot5 + slot0.delta_offset_x
		slot6 = slot6 + slot0.delta_offset_z
		slot7 = slot7 + slot0.delta_angle
		slot8 = slot8 + slot0.delta_delay
	end

	return slot3, slot4
end

slot4.ConvertBarrage()
