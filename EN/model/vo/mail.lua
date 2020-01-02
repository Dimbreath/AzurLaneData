slot0 = class("Mail", import(".BaseVO"))
slot0.ATTACHMENT_NONE = 0
slot0.ATTACHMENT_EXIST = 1
slot0.ATTACHMENT_TAKEN = 2

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.date = slot1.date
	slot0.title = string.split(HXSet.hxLan(slot1.title), "||")[1]
	slot0.sender = (#string.split(HXSet.hxLan(slot1.title), "||") > 1 and slot2[2]) or i18n("mail_sender_default")
	slot0.readFlag = slot1.read_flag
	slot0.attachFlag = slot1.attach_flag
	slot0.importantFlag = slot1.imp_flag
	slot0.attachments = {}

	for slot6, slot7 in ipairs(slot1.attachment_list) do
		table.insert(slot0.attachments, MailAttachment.New(slot7))
	end

	slot0.openned = false
end

function slot0.extend(slot0, slot1)
	slot0.content = string.gsub(HXSet.hxLan(slot1.content), "\\n", "\n")
	slot0.openned = true
end

function slot0.hasAttachmentsType(slot0, slot1)
	for slot5, slot6 in pairs(slot0.attachments) do
		if slot1 == slot6.type then
			return true, slot6.id
		end
	end
end

function slot0.getAttatchmentsCount(slot0, slot1, slot2)
	slot3 = 0

	for slot7, slot8 in pairs(slot0.attachments) do
		if slot1 == slot8.type and slot2 == slot8.id then
			slot3 = slot3 + slot8.count
		end
	end

	return slot3
end

function slot0.sortByTime(slot0, slot1)
	if slot0.readFlag == slot1.readFlag then
		if ((slot0.attachFlag == slot0.ATTACHMENT_EXIST and 1) or 0) == ((slot1.attachFlag == slot0.ATTACHMENT_EXIST and 1) or 0) then
			if slot0.date == slot1.date then
				return slot1.id < slot0.id
			else
				return slot1.date < slot0.date
			end
		else
			return slot3 < slot2
		end
	else
		return slot0.readFlag < slot1.readFlag
	end
end

function slot0.setReadFlag(slot0, slot1)
	slot0.readFlag = slot1
end

function slot0.setImportantFlag(slot0, slot1)
	slot0.importantFlag = slot1
end

return slot0
