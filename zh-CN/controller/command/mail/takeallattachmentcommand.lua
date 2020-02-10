slot0 = class("TakeAllAttachmentCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6 = getProxy(BayProxy):getShipCount()
	slot7 = getProxy(EquipmentProxy):getCapacity()
	slot8 = getConfigFromLevel1(pg.user_level, getProxy(PlayerProxy):getData().level)

	if getProxy(MailProxy):getAttatchmentsCount(DROP_TYPE_RESOURCE, 1) > 0 and slot3:GoldMax(slot10) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	if slot9:getAttatchmentsCount(DROP_TYPE_RESOURCE, 2) > 0 and slot3:OilMax(slot11) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	if #slot9:getAttatchmentMailIds() <= 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(30004, {
		id = slot12
	}, 30005, function (slot0)
		for slot5, slot6 in ipairs(uv0:getMails()) do
			if slot6.readFlag == 0 then
				uv0:removeMail(slot6)
			elseif slot6.attachFlag == slot6.ATTACHMENT_EXIST then
				slot6.readFlag = 2
				slot6.attachFlag = slot6.ATTACHMENT_TAKEN

				uv0:updateMail(slot6)
			end
		end

		for slot6, slot7 in ipairs(slot0.attachment_list) do
			table.insert({}, Item.New(slot7))
			uv1:sendNotification(GAME.ADD_ITEM, MailAttachment.New(slot7))
		end

		uv0:unpdateExistAttachment(math.max(uv0._existAttachmentCount - #slot0.attachment_list, 0))
		uv1:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {
			items = slot2
		})
		uv1:sendNotification(GAME.TAKE_ALL_ATTACHMENT_DONE)
	end)
end

return slot0
