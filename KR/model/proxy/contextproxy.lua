slot0 = class("ContextProxy", pm.Proxy)

slot0.getCurrentContext = function (slot0)
	return slot0.data[#slot0.data]
end

slot0.pushContext = function (slot0, slot1)
	table.insert(slot0.data, slot1)
end

slot0.popContext = function (slot0)
	return table.remove(slot0.data)
end

slot0.cleanContext = function (slot0)
	slot0.data = {}
end

slot0.getContextCount = function (slot0)
	return #slot0.data
end

slot0.getContextByMediator = function (slot0, slot1)
	for slot5 = #slot0.data, 1, -1 do
		if slot0.data[slot5]:getContextByMediator(slot1) then
			return slot7
		end
	end

	return nil
end

slot0.onRegister = function (slot0)
	slot0.delegateOnces = {}
	slot0.lastContext = nil
end

slot0.AddDelegateOnce = function (slot0, slot1, slot2)
	slot0.delegateOnces[slot1] = slot2
end

slot0.TriggerDelegate = function (slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot0.delegateOnces[slot1.mediator.__cname .. slot2] then
		return
	end

	slot0.delegateOnces[slot3] = nil

	slot4(slot1)
end

slot0.TriggerInterjectedDelegate = function (slot0, slot1, slot2, slot3)
	if not slot1 or not slot2 then
		return
	end

	if not slot0.delegateOnces[slot1.mediator.__cname .. slot3 .. slot2.mediator.__cname] then
		return
	end

	slot0.delegateOnces[slot4] = nil

	slot5(slot2, slot1)
end

return slot0
