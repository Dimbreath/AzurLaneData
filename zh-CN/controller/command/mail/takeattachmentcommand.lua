class("TakeAttachmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if getProxy(MailProxy):getMailById(slot1:getBody()) == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noMail", slot2))

		return
	end

	if slot4.attachFlag ~= slot4.ATTACHMENT_EXIST then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noAttach"))

		return
	end

	slot9 = getProxy(BayProxy).getShipCount(slot7)
	slot10 = getProxy(EquipmentProxy).getCapacity(slot8)
	slot11 = getConfigFromLevel1(pg.user_level, getProxy(PlayerProxy).getData(slot5).level)

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 1) > 0 and slot6:GoldMax(slot12) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 2) > 0 and slot6:OilMax(slot13) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30004, {
		id = {
			slot4.id
		}
	}, 30005, function (slot0)
		if slot0.readFlag == 0 then
			slot1:removeMail(slot0)
		else
			slot0.readFlag = 2
			slot0.attachFlag = slot0.ATTACHMENT_TAKEN

			slot0:updateMail(slot0)
		end

		slot1 = {}

		for slot5, slot6 in ipairs(slot0.attachment_list) do
			table.insert(slot1, Item.New(slot6))
			slot2:sendNotification(GAME.ADD_ITEM, MailAttachment.New(slot6))
		end

		slot2 = slot1:GetAttachmentCount()

		slot1:unpdateExistAttachment(slot2 - 1)
		slot2:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {
			items = slot1
		})
		slot2:sendNotification(GAME.TAKE_ATTACHMENT_DONE)
	end)
end

return class("TakeAttachmentCommand", pm.SimpleCommand)
