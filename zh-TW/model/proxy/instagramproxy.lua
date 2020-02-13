slot0 = class("InstagramProxy", import(".NetProxy"))

function slot0.register(slot0)
	slot0.messages = {}

	slot0:on(11700, function (slot0)
		for slot4, slot5 in ipairs(slot0.ins_message_list) do
			slot0.messages[Instagram.New(slot5).id] = Instagram.New(slot5)
		end
	end)
end

function slot0.GetMessages(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.messages) do
		table.insert(slot1, slot6)
	end

	return slot1
end

function slot0.ExistMessage(slot0)
	return table.getCount(slot0.messages) > 0
end

function slot0.GetData(slot0)
	return Clone(slot0.messages)
end

function slot0.GetMessageById(slot0, slot1)
	return slot0.messages[slot1]
end

function slot0.AddMessage(slot0, slot1)
	slot0.messages[slot1.id] = slot1
end

function slot0.UpdateMessage(slot0, slot1)
	if not slot0.messages[slot1.id] then
		slot0:AddMessage(slot1)
	else
		slot0.messages[slot1.id] = slot1
	end
end

function slot0.ShouldShowTip(slot0)
	return _.any(slot0:GetMessages(), function (slot0)
		return slot0:ShouldShowTip()
	end)
end

function slot0.ExistMsg(slot0)
	return slot0.messages and table.getCount(slot0.messages) > 0
end

function slot0.ExistGroup(slot0, slot1)
	for slot5, slot6 in pairs(slot0.messages) do
		if slot6:getConfig("group_id") == slot1 then
			return true
		end
	end

	return false
end

return slot0
