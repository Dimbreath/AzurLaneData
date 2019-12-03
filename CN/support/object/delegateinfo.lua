pg = pg or {}
slot1 = class("DelegateInfo")
pg.DelegateInfo = slot1
slot1.ClientsInfo = {}

slot1.Ctor = function (slot0, slot1)
	slot0.ClientsInfo[slot1] = slot0
	slot0.events = {}
end

slot1.Add = function (slot0, slot1)
	if slot0 == nil then
		return
	end

	if slot0.ClientsInfo[slot0] then
		slot2:AddEventOb(slot1)
	end
end

slot1.AddEventOb = function (slot0, slot1)
	slot0.events[slot1] = true
end

slot1.Dispose = function (slot0)
	if slot0.ClientsInfo[slot0] then
		slot1:Clear()
	end

	slot0.ClientsInfo[slot0] = nil
end

slot1.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0.events) do
		slot4:RemoveAllListeners()
	end

	slot0.events = nil
end

return
