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

function slot1.Ctor(slot0, slot1)
	slot0._go = GameObject.New("scenes")
	slot0.mapLayerCtrls = {}
	slot0.materialList = {}
	slot2 = pg.map_data[slot1]

	for slot6, slot7 in ipairs(uv0.LAYERS) do
		slot8 = GameObject.New(slot7 .. "Layer")

		setParent(slot8, slot0._go, false)

		slot9 = GetOrAddComponent(slot8, "MapLayerCtrl")
		slot9.leftBorder = slot2.range_left
		slot9.rightBorder = slot2.range_right
		slot9.speedToLeft = slot2[slot7 .. "_speed"] or 0
		slot9.speedScaler = 1

		for slot16, slot17 in ipairs(slot0.GetMapResNames(slot1, slot7)) do
			slot18 = uv1.Battle.BattleResourceManager.GetInstance():InstMap(slot17)

			setParent(slot18, slot8, false)

			tf(slot18).localPosition = string2vector3(string.split(slot2[slot7 .. "_pos"], ";")[slot16])
			tf(slot18).localScale = string2vector3(string.split(slot2[slot7 .. "_scale"], ";")[slot16])

			if slot18:GetComponent(typeof(MeshRenderer)) then
				slot20 = slot19.sharedMaterial

				table.insert(slot0.materialList, {
					material = slot20,
					offset = slot20:GetTextureOffset("_SeaTex")
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

function slot1.ShiftSurface(slot0, slot1, slot2, slot3, slot4)
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
		if (uv0 - uv1) * uv2 > 0 then
			uv3.Battle.BattleVariable.AppendMapFactor("seaSurfaceShift", uv1)
			uv4:UpdateMapOffset()
			uv4:UpdateSpeedScaler()

			uv1 = uv1 + uv2
		else
			pg.TimeMgr.GetInstance():RemoveBattleTimer(uv4._shiftTimer)

			uv4._shiftTimer = nil

			if uv5 then
				uv5()
			end
		end
	end, true)
end

function slot1.UpdateSpeedScaler(slot0)
	slot0:setSpeedScaler(uv0.Battle.BattleVariable.MapSpeedRatio)
end

function slot1.UpdateBufferAlpha(slot0, slot1)
	slot0._bufferRenderer.color = Color.New(1, 1, 1, slot1 * 0.1)
end

function slot1.setSpeedScaler(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.mapLayerCtrls) do
		slot6.speedScaler = slot1
	end
end

function slot1.UpdateMapOffset(slot0)
	for slot6, slot7 in ipairs(slot0.materialList) do
		slot8 = slot7.offset
		slot8.x = slot8.x + -0.0005 * uv0.Battle.BattleVariable.MapSpeedRatio

		slot7.material:SetTextureOffset("_SeaTex", slot8)
	end
end

function slot1.Dispose(slot0)
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

function slot1.GetMapResNames(slot0, slot1)
	return string.split(pg.map_data[slot0][slot1 .. "_shot"], ";")
end

function slot1.setActive(slot0, slot1)
	SetActive(slot0._go, slot1)
end
