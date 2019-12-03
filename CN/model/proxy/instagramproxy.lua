slot0 = class("InstagramProxy", import(".NetProxy"))

slot0.register = function (slot0)
	slot0.messages = {}

	slot0:on(11700, function (slot0)
		for slot4, slot5 in ipairs(slot0.ins_message_list) do
			slot0.messages[Instagram.New(slot5).id] = Instagram.New(slot5)
		end
	end)
end

slot0.GetMessages = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.messages) do
		table.insert(slot1, slot6)
	end

	return slot1
end

slot0.ExistMessage = function (slot0)
	return table.getCount(slot0.messages) > 0
end

slot0.GetData = function (slot0)
	return Clone(slot0.messages)
end

slot0.GetMessageById = function (slot0, slot1)
	return slot0.messages[slot1]
end

slot0.AddMessage = function (slot0, slot1)
	slot0.messages[slot1.id] = slot1
end

slot0.UpdateMessage = function (slot0, slot1)
	if not slot0.messages[slot1.id] then
		slot0:AddMessage(slot1)
	else
		slot0.messages[slot1.id] = slot1
	end
end

slot0.ShouldShowTip = function (slot0)
	return _.any(slot0:GetMessages(), function (slot0)
		return slot0:ShouldShowTip()
	end)
end

slot0.ExistMsg = function (slot0)
	return slot0.messages and table.getCount(slot0.messages) > 0
end

slot0.ExistGroup = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.messages) do
		if slot6:getConfig("group_id") == slot1 then
			return true
		end
	end

	return false
end

return slot0
