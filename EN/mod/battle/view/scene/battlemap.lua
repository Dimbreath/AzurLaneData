ys = ys or {}
slot1 = class("BattleMap")
ys.Battle.BattleMap = slot1
slot1.__name = "BattleMap"
slot2 = pg.map_data
slot1.LAYERS = {
	"close",
	"mid",
	"long",
	"sky",
	"sea"
}

slot1.Ctor = function (slot0, slot1)
	slot0._go = GameObject.New("scenes")
	slot0.mapLayerCtrls = {}
	slot0.materialList = {}
	slot2 = pg.map_data[slot1]

	for slot6, slot7 in ipairs(slot0.LAYERS) do
		setParent(slot8, slot0._go, false)

		GetOrAddComponent(slot8, "MapLayerCtrl").leftBorder = slot2.range_left
		GetOrAddComponent(slot8, "MapLayerCtrl").rightBorder = slot2.range_right
		slot9.speedToLeft = slot2[slot7 .. "_speed"] or 0
		slot9.speedScaler = 1
		slot11 = string.split(slot2[slot7 .. "_pos"], ";")
		slot12 = string.split(slot2[slot7 .. "_scale"], ";")

		for slot16, slot17 in ipairs(slot10) do
			slot18 = slot1.Battle.BattleResourceManager.GetInstance():InstMap(slot17)

			setParent(slot18, slot8, false)

			tf(slot18).localPosition = string2vector3(slot11[slot16])
			tf(slot18).localScale = string2vector3(slot12[slot16])

			if slot18:GetComponent(typeof(MeshRenderer)) then
				table.insert(slot0.materialList, {
					material = slot19.sharedMaterial,
					offset = slot19.sharedMaterial.GetTextureOffset(slot20, "_SeaTex")
				})
			end
		end

		table.insert(slot0.mapLayerCtrls, slot9)

		if slot7 == "sea" then
			slot0._buffer = slot8.transform:Find("gelidai(Clone)")

			if slot0._buffer then
				slot0._bufferRenderer = slot0._buffer:GetComponent("SpriteRenderer")
				slot0._bufferRenderer.color = Color.New(1, 1, 1, 0)
			end
		end
	end

	slot0:UpdateSpeedScaler()

	return slot0._go
end

slot1.ShiftSurface = function (slot0, slot1, slot2, slot3, slot4)
	if slot0._shiftTimer then
		return
	end

	slot5 = slot1
	slot6 = nil

	if slot2 < slot1 then
		slot6 = -1
	elseif slot1 < slot2 then
		slot6 = 1
	else
		return
	end

	slot0._shiftTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", -1, slot3, function ()
		if (slot0 - slot1) * slot2 > 0 then
			slot3.Battle.BattleVariable.AppendMapFactor("seaSurfaceShift", )
			slot4:UpdateMapOffset()
			slot4:UpdateSpeedScaler()

			slot1 = slot4 + slot2
		else
			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot4._shiftTimer)

			slot4._shiftTimer = nil

			if slot5 then
				slot5()
			end
		end
	end, true)
end

slot1.UpdateSpeedScaler = function (slot0)
	slot0:setSpeedScaler(slot0.Battle.BattleVariable.MapSpeedRatio)
end

slot1.UpdateBufferAlpha = function (slot0, slot1)
	slot0._bufferRenderer.color = Color.New(1, 1, 1, slot1 * 0.1)
end

slot1.setSpeedScaler = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.mapLayerCtrls) do
		slot6.speedScaler = slot1
	end
end

slot1.UpdateMapOffset = function (slot0)
	slot2 = -0.0005 * slot0.Battle.BattleVariable.MapSpeedRatio

	for slot6, slot7 in ipairs(slot0.materialList) do
		slot7.offset.x = slot7.offset.x + slot2

		slot7.material:SetTextureOffset("_SeaTex", slot7.offset)
	end
end

slot1.Dispose = function (slot0)
	if slot0._shiftTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._shiftTimer)
	end

	if slot0._go then
		Object.Destroy(slot0._go)

		slot0._go = nil
		slot0._buffer = nil
		slot0._bufferRenderer = nil
	end
end

slot1.GetMapResNames = function (slot0, slot1)
	return string.split(pg.map_data[slot0][slot1 .. "_shot"], ";")
end

slot1.setActive = function (slot0, slot1)
	SetActive(slot0._go, slot1)
end

return
