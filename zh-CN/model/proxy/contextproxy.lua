slot0 = class("ContextProxy", pm.Proxy)

function slot0.getCurrentContext(slot0)
	return slot0.data[#slot0.data]
end

function slot0.pushContext(slot0, slot1)
	table.insert(slot0.data, slot1)
end

function slot0.popContext(slot0)
	return table.remove(slot0.data)
end

function slot0.cleanContext(slot0)
	slot0.data = {}
end

function slot0.getContextCount(slot0)
	return #slot0.data
end

function slot0.getContextByMediator(slot0, slot1)
	for slot5 = #slot0.data, 1, -1 do
		slot6 = slot0.data[slot5]

		if slot6:getContextByMediator(slot1) then
			return slot7, slot6
		end
	end

	return nil
end

function slot0.onRegister(slot0)
	slot0.delegateOnces = {}
	slot0.lastContext = nil
end

function slot0.AddDelegateOnce(slot0, slot1, slot2)
	slot0.delegateOnces[slot1] = slot2
end

function slot0.TriggerDelegate(slot0, slot1, slot2)
	if not slot1 then
		return
	end

	if not slot0.delegateOnces[slot1.mediator.__cname .. slot2] then
		return
	end

	slot0.delegateOnces[slot3] = nil

	slot4(slot1)
end

function slot0.TriggerInterjectedDelegate(slot0, slot1, slot2, slot3)
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
