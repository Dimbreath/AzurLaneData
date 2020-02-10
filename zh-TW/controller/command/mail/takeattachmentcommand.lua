slot0 = class("TakeAttachmentCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if getProxy(MailProxy):getMailById(slot1:getBody()) == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noMail", slot2))

		return
	end

	if slot4.attachFlag ~= slot4.ATTACHMENT_EXIST then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noAttach"))

		return
	end

	slot9 = getProxy(BayProxy):getShipCount()
	slot10 = getProxy(EquipmentProxy):getCapacity()
	slot11 = getConfigFromLevel1(pg.user_level, getProxy(PlayerProxy):getData().level)

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 1) > 0 and slot6:GoldMax(slot12) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 2) > 0 and slot6:OilMax(slot13) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	slot18[1] = slot4.id
	slot17.id = {}

	pg.ConnectionMgr.GetInstance():Send(30004, {}, 30005, function (slot0)
		if uv0.readFlag == 0 then
			uv1:removeMail(uv0)
		else
			uv0.readFlag = 2
			uv0.attachFlag = uv0.ATTACHMENT_TAKEN

			uv1:updateMail(uv0)
		end

		for slot5, slot6 in ipairs(slot0.attachment_list) do
			table.insert({}, Item.New(slot6))
			uv2:sendNotification(GAME.ADD_ITEM, MailAttachment.New(slot6))
		end

		uv1:unpdateExistAttachment(uv1:GetAttachmentCount() - 1)

		slot6.items = slot1

		uv2:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {})
		uv2:sendNotification(GAME.TAKE_ATTACHMENT_DONE)
	end)
end

return slot0
