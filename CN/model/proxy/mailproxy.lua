slot0 = class("MailProxy", import(".NetProxy"))
slot0.MAIL_TOTAL = "mail total"
slot0.MAIL_ADDED = "mail added"
slot0.MAIL_OPENNED = "mail openned"
slot0.MAIL_ATTACHMENT_TAKEN = "mail attachment taken"
slot0.MAIL_UPDATED = "mail updated"
slot0.MAIL_REMOVED = "mail removed"
slot0.UPDATE_ATTACHMENT_COUNT = "UPDATE_ATTACHMENT_COUNT"

slot0.register = function (slot0)
	slot0.init = false
	slot0.dirty = false
	slot0.unread = 0
	slot0.total = 0

	slot0:on(30001, function (slot0)
		if slot0.init then
			slot0.dirty = true
		end

		slot0:unpdateExistAttachment(slot0.unread_number)
		slot0:updateTotal(slot0.total_number)
	end)
end

slot0.addMail = function (slot0, slot1)
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("added")
	slot0.facade:sendNotification(slot0.MAIL_ADDED, slot1:clone())
end

slot0.getMails = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.data) do
		table.insert(slot1, slot6)
	end

	return Clone(slot1)
end

slot0.getMailById = function (slot0, slot1)
	if slot0.data[slot1] ~= nil then
		return slot0.data[slot1]:clone()
	end
end

slot0.GetAttachmentCount = function (slot0)
	return slot0._existAttachmentCount
end

slot0.getOldestMail = function (slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.data) do
		if not slot1 or slot6.id < slot1.id then
			slot1 = slot6
		end
	end

	return slot1 and slot1:clone()
end

slot0.getNewestMail = function (slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.data) do
		if not slot1 or slot1.id < slot6.id then
			slot1 = slot6
		end
	end

	return slot1 and slot1:clone()
end

slot0.takeMailAttachment = function (slot0, slot1)
	slot1.isTaken = true

	slot0:updateMail(slot1)
	slot0.facade:sendNotification(slot0.MAIL_ATTACHMENT_TAKEN, slot1:clone())
end

slot0.updateMail = function (slot0, slot1)
	slot2 = slot0.data[slot1.id].readFlag
	slot0.data[slot1.id] = slot1:clone()

	slot0.data[slot1.id]:display("updated")
	slot0.facade:sendNotification(slot0.MAIL_UPDATED, slot1:clone())
end

slot0.removeMail = function (slot0, slot1)
	slot0:removeMailById(slot1.id)
end

slot0.removeMailById = function (slot0, slot1)
	slot3 = slot0.data[slot0.data[slot1].id].readFlag

	slot0.data[slot0.data[slot1].id]:display("removed")

	slot0.data[slot0.data[slot1].id] = nil

	slot0:updateTotal(slot0.total - 1)
	slot0.facade:sendNotification(slot0.MAIL_REMOVED, slot0.data[slot1])
end

slot0.hasMailById = function (slot0, slot1)
	return slot0.data[slot1] ~= nil
end

slot0.unpdateExistAttachment = function (slot0, slot1)
	slot0._existAttachmentCount = slot1

	slot0:sendNotification(slot0.UPDATE_ATTACHMENT_COUNT)
end

slot0.updateTotal = function (slot0, slot1)
	slot0.total = slot1

	slot0:sendNotification(slot0.MAIL_TOTAL, slot0.total)
end

slot0.getUnreadCount = function (slot0)
	return slot0.unread
end

slot0.hasAttachmentsType = function (slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		if slot7.attachFlag == Mail.ATTACHMENT_EXIST and slot7:hasAttachmentsType(slot1) then
			return slot7:hasAttachmentsType(slot1)
		end
	end
end

slot0.getAttatchmentsCount = function (slot0, slot1, slot2)
	slot3 = 0

	for slot8, slot9 in ipairs(slot4) do
		if slot9.attachFlag == Mail.ATTACHMENT_EXIST then
			slot3 = slot3 + slot9:getAttatchmentsCount(slot1, slot2)
		end
	end

	return slot3
end

slot0.getAttatchmentMailIds = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		if slot7.attachFlag == Mail.ATTACHMENT_EXIST then
			table.insert(slot1, slot7.id)
		end
	end

	return slot1
end

slot0.getMailAttachments = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		if slot7.attachFlag == Mail.ATTACHMENT_EXIST then
			table.insert(slot1, slot7)
		end
	end

	return slot1
end

slot0.getAllAttachment = function (slot0)
	_.each(slot2, function (slot0)
		_.each(slot0.attachments or {}, function (slot0)
			if not slot0[slot0.id .. "_" .. slot0.dropType] then
				slot0[slot1] = slot0
			else
				slot0[slot1].count = slot0[slot1].count + slot0.count
			end
		end)
	end)

	slot3 = {}

	for slot7, slot8 in pairs(slot1) do
		table.insert(slot3, slot8)
	end

	return slot3
end

return slot0
