slot0 = class("NetFleetUpdate", import("....BaseEntity"))
slot0.Fields = {
	id = "number",
	buffs = "table"
}

function slot0.Setup(slot0, slot1)
	slot0.id = slot1.id
	slot0.buffs = WorldConst.ParsingBuffs(slot1.buff_list)
end

function slot0.Dispose(slot0)
	slot0:Clear()
end

function slot0.GetBuffByTrap(slot0, slot1)
	for slot5, slot6 in pairs(slot0.buffs) do
		if slot6:GetFloor() > 0 and slot6:GetTrapType() == slot1 then
			return slot6
		end
	end
end

return slot0
