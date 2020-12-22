slot0 = class("WorldMapCell", import("...BaseEntity"))
slot0.Fields = {
	row = "number",
	flagLight = "boolean",
	fog = "boolean",
	isSairenFog = "boolean",
	dir = "number",
	column = "number",
	walkable = "boolean",
	terrainDir = "number",
	discovered = "boolean",
	attachments = "table",
	terrain = "number",
	inLight = "number",
	terrainStrong = "number",
	infov = "number"
}
slot0.EventAddAttachment = "WorldMapCell.EventAddAttachment"
slot0.EventRemoveAttachment = "WorldMapCell.EventRemoveAttachment"
slot0.EventUpdateInFov = "WorldMapCell.EventUpdateInFov"
slot0.EventUpdateDiscovered = "WorldMapCell.EventUpdateDiscovered"
slot0.EventUpdateFog = "WorldMapCell.EventUpdateFog"
slot0.EventUpdateFogImage = "WorldMapCell.EventUpdateFogImage"
slot0.EventUpdateTerrain = "WorldMapCell.EventUpdateTerrain"

function slot0.GetName(slot0, slot1)
	return "cell_" .. slot0 .. "_" .. slot1
end

slot0.TerrainNone = 0
slot0.TerrainStream = 1
slot0.TerrainIce = 2
slot0.TerrainWind = 3
slot0.TerrainFog = 4
slot0.TerrainFire = 5
slot0.TerrainPoison = 6

function slot0.Build(slot0)
	slot0.attachments = {}
	slot0.dir = 0
	slot0.infov = 0
	slot0.inLight = 0
	slot0.flagLight = false
end

function slot0.Setup(slot0, slot1)
	slot0.row = slot1[1]
	slot0.column = slot1[2]
	slot0.walkable = slot1[3]
end

function slot0.Dispose(slot0)
	WPool:ReturnArray(slot0.attachments)
	slot0:Clear()
end

function slot0.AddAttachment(slot0, slot1)
	slot3 = #slot0.attachments + 1

	for slot7, slot8 in ipairs(slot0.attachments) do
		if WorldMapAttachment.SortOrder[slot8.type] < WorldMapAttachment.SortOrder[slot1.type] then
			slot3 = slot7

			break
		end
	end

	table.insert(slot0.attachments, slot3, slot1)
	slot0:DispatchEvent(uv0.EventAddAttachment, slot1)

	if not slot0.discovered and slot1:ShouldMarkAsLurk() then
		slot1:UpdateLurk(true)
	end
end

function slot0.RemoveAttachment(slot0, slot1)
	if slot1 == nil or type(slot1) == "number" then
		slot1 = slot1 or #slot0.attachments
		slot2 = slot0.attachments[slot1]

		table.remove(slot0.attachments, slot1)
		slot0:DispatchEvent(uv0.EventRemoveAttachment, slot2)
		WPool:Return(slot2)
	elseif slot1.class == WorldMapAttachment then
		for slot5 = #slot0.attachments, 1, -1 do
			if slot0.attachments[slot5] == slot1 then
				slot0:RemoveAttachment(slot5)

				break
			end
		end
	end
end

function slot0.ContainsAttachment(slot0, slot1)
	return _.any(slot0.attachments, function (slot0)
		return slot0 == uv0
	end)
end

function slot0.GetInFOV(slot0)
	return slot0.infov > 0 or slot0.flagLight and slot0.inLight > 0
end

function slot0.UpdateInFov(slot0, slot1, slot2)
	slot2 = slot2 or slot0.flagLight

	if slot0.infov ~= (slot1 or slot0.infov) or slot0.flagLight ~= slot2 then
		slot0.infov = slot1
		slot0.flagLight = slot2

		if slot0:GetInFOV() ~= slot0:GetInFOV() then
			slot0:DispatchEvent(uv0.EventUpdateInFov)
		end
	end
end

function slot0.ChangeInLight(slot0, slot1)
	slot0.inLight = slot0.inLight + (slot1 and 1 or -1)

	if slot0:GetInFOV() ~= slot0:GetInFOV() then
		slot0:DispatchEvent(uv0.EventUpdateInFov)
	end
end

function slot0.UpdateDiscovered(slot0, slot1)
	if slot0.discovered ~= slot1 then
		slot0.discovered = slot1

		slot0:DispatchEvent(uv0.EventUpdateDiscovered)
	end
end

function slot0.UpdateFog(slot0, slot1, slot2)
	if tobool(slot0.isSairenFog) ~= tobool(slot2) then
		slot0.isSairenFog = slot2

		slot0:DispatchEvent(uv0.EventUpdateFogImage)
	end

	if tobool(slot0.fog) ~= tobool(slot1) then
		slot0.fog = slot1

		slot0:DispatchEvent(uv0.EventUpdateFog)
	end
end

function slot0.GetTerrain(slot0)
	return slot0.terrain or uv0.TerrainNone
end

function slot0.UpdateTerrain(slot0, slot1, slot2, slot3)
	slot0.terrain = slot1

	if slot0.terrain == uv0.TerrainStream then
		slot0.terrainDir = slot2
	elseif slot0.terrain == uv0.TerrainWind then
		slot0.terrainDir = slot2
		slot0.terrainStrong = slot3
	elseif slot0.terrain == uv0.TerrainFog then
		slot0.terrainStrong = slot3
	elseif slot0.terrain == uv0.TerrainPoison then
		slot0.terrainStrong = slot3
	end

	slot0:DispatchEvent(uv0.EventUpdateTerrain)
end

function slot0.GetAliveAttachments(slot0)
	return _.filter(slot0.attachments, function (slot0)
		return slot0:IsAlive()
	end)
end

function slot0.GetAliveAttachment(slot0)
	return _.detect(slot0.attachments, function (slot0)
		return slot0:IsAlive()
	end)
end

function slot0.GetDisplayAttachment(slot0)
	return _.detect(slot0.attachments, function (slot0)
		return slot0:IsAlive() and slot0:IsVisible()
	end)
end

function slot0.GetInterativeAttachment(slot0)
	return _.detect(slot0.attachments, function (slot0)
		return WorldMapAttachment.IsInteractiveType(slot0.type) and slot0:IsAlive() and slot0:IsVisible()
	end)
end

function slot0.GetEventAttachment(slot0)
	return _.detect(slot0.attachments, function (slot0)
		return slot0:IsAlive() and slot0.type == WorldMapAttachment.TypeEvent
	end)
end

function slot0.GetCompassAttachment(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.attachments) do
		table.insert(slot1, slot5)
	end

	return _.detect(_.sort(slot1, function (slot0, slot1)
		return (uv0.attachments[slot0].config.compass_index or 0) > (uv0.attachments[slot1].config.compass_index or 0)
	end), function (slot0)
		if uv0.attachments[slot0]:ShouldMarkAsLurk() then
			return slot1:IsAlive() and slot1:IsVisible() and uv0.discovered
		elseif slot1.type == WorldMapAttachment.TypeEvent then
			return slot1:IsAlive() and slot1.config.visuality == 0
		elseif slot1.type ~= WorldMapAttachment.TypeFleet and slot1.type ~= WorldMapAttachment.TypePort then
			return slot1:IsAlive()
		end
	end) and slot0.attachments[slot2]
end

function slot0.FindAliveAttachment(slot0, slot1)
	return _.detect(slot0.attachments, function (slot0)
		return slot0:IsAlive() and slot0.type == uv0
	end)
end

function slot0.IsTerrainCage(slot0)
	return slot0.terrain == uv0.TerrainWind
end

function slot0.IsTerrainSairenFog(slot0)
	return slot0.terrain == uv0.TerrainFog and slot0.terrainStrong == 0
end

function slot0.IsTerrainObstacle(slot0)
	return slot0.terrain == uv0.TerrainStream or slot0.terrain == uv0.TerrainIce or slot0.terrain == uv0.TerrainWind or slot0.terrain == uv0.TerrainFog
end

function slot0.IsWalkable(slot0)
	return slot0.walkable and not slot0:IsTerrainSairenFog() and not _.any(slot0.attachments, function (slot0)
		return slot0:IsAlive() and not slot0:IsWalkable()
	end)
end

function slot0.IsObstacle(slot0)
	return _.any(slot0.attachments, function (slot0)
		return slot0:IsAlive() and slot0:IsObstacle()
	end) or slot0:IsTerrainObstacle()
end

function slot0.IsCage(slot0)
	return _.any(slot0.attachments, function (slot0)
		return slot0:IsCage() and slot0:IsAlive()
	end) or slot0:IsTerrainCage()
end

function slot0.IsSign(slot0)
	return _.any(slot0.attachments, function (slot0)
		return slot0:IsSign() and slot0:IsAlive()
	end)
end

function slot0.ExistEnemy(slot0)
	return _.any(slot0.attachments, function (slot0)
		return WorldMapAttachment.IsEnemyType(slot0.type) and slot0:IsAlive()
	end)
end

function slot0.GetStageEnemy(slot0)
	return _.detect(slot0.attachments, function (slot0)
		return WorldMapAttachment.IsEnemyType(slot0.type) and slot0.flag ~= 1
	end)
end

function slot0.GetDisplayQuad(slot0)
	slot1 = nil
	slot2 = slot0:GetDisplayAttachment()

	if not slot0.fog and slot2 then
		if slot2.type == WorldMapAttachment.TypeEvent then
			if slot2.config.object_icon and #slot3 > 0 then
				slot1 = slot3
			elseif slot2:HasBattleEvent() then
				slot1 = {
					"cell_red"
				}
			end
		elseif WorldMapAttachment.IsEnemyType(slot2.type) then
			slot1 = {
				"cell_red"
			}
		elseif slot2.type == WorldMapAttachment.TypePort or slot2.type == WorldMapAttachment.TypeBox then
			slot1 = {
				"cell_yellow"
			}
		end
	end

	return slot1
end

function slot0.GetEmotion(slot0)
	return slot0.terrain == uv0.TerrainPoison and WorldConst.PoisonEffect or nil
end

function slot0.GetScannerAttachment(slot0)
	for slot7, slot8 in ipairs(slot0:GetAliveAttachments()) do
		if slot8:IsScannerAttachment() and (not nil or nil < slot9) then
			slot2 = slot8
			slot3 = slot9
		end
	end

	return slot2
end

return slot0
