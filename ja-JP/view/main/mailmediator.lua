slot0 = class("MailMediator", import("..base.ContextMediator"))
slot0.ON_OPEN = "MailMediator:ON_OPEN"
slot0.ON_TAKE = "MailMediator:ON_TAKE"
slot0.ON_DELETE = "MailMediator:ON_DELETE"
slot0.ON_TAKE_ALL = "MailMediator:ON_TAKE_ALL"
slot0.ON_DELETE_ALL = "MailMediator:ON_DELETE_ALL"
slot0.ON_MORE_OLDER = "MailMediator:ON_MORE_OLDER"
slot0.ON_MORE_NEWER = "MailMediator:ON_MORE_NEWER"
slot0.ON_CHANGE_IMP = "MailMediator:ON_CHANGE_IMP"

function slot0.register(slot0)
	slot1 = getProxy(MailProxy)

	slot0:bind(uv0.ON_OPEN, function (slot0, slot1)
		uv0:sendNotification(GAME.OPEN_MAIL, slot1)
	end)
	slot0:bind(uv0.ON_TAKE, function (slot0, slot1)
		uv0:sendNotification(GAME.TAKE_ATTACHMENT, slot1)
	end)
	slot0:bind(uv0.ON_TAKE_ALL, function (slot0)
		slot1 = uv0

		if #slot1:getMailAttachments() > 0 then
			slot5.content = i18n("take_all_mail", #slot1)

			function slot5.onYes()
				uv0:sendNotification(GAME.TAKE_ALL_ATTACHMENT)
			end

			slot5.items = uv1:getAllAttachment()

			uv1.viewComponent:showMsgBox({})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("take_nothing"))
		end
	end)
	slot0:bind(uv0.ON_DELETE, function (slot0, slot1)
		uv0:sendNotification(GAME.DELETE_MAIL, slot1)
	end)
	slot0:bind(uv0.ON_DELETE_ALL, function (slot0)
		uv0:sendNotification(GAME.DELETE_ALL_MAIL)
	end)
	slot0:bind(uv0.ON_MORE_NEWER, function (slot0)
		slot1 = uv0
		slot2 = uv1
		slot5.splitId = slot1:getNewestMail() and slot1.id or 0
		slot5.type = slot1 and 1 or 0

		slot2.sendNotification(slot2, GAME.GET_MAIL_LIST, {})
	end)
	slot0:bind(uv0.ON_MORE_OLDER, function (slot0)
		slot1 = uv0
		slot2 = uv1
		slot5.splitId = slot1:getOldestMail() and slot1.id or 0
		slot5.type = slot1 and 2 or 0

		slot2.sendNotification(slot2, GAME.GET_MAIL_LIST, {})
	end)
	slot0:bind(uv0.ON_CHANGE_IMP, function (slot0, slot1, slot2)
		slot6.id = slot1
		slot6.flag = slot2

		uv0:sendNotification(GAME.CHANGE_MAIL_IMP_FLAG, {})
	end)
	slot0.viewComponent:setUnreadMailCount(slot1.unread)
	slot0.viewComponent:setMailCount(slot1.total)
	slot0.viewComponent:setMailData(slot1:getMails())
	slot0.viewComponent:updateMailList()

	if not slot1.init then
		slot0:sendNotification(GAME.GET_MAIL_LIST, {
			type = 0,
			split_id = 0
		})
	elseif slot1.dirty then
		slot6.splitId = slot1:getNewestMail() and slot2.id or 0
		slot6.type = slot2 and 1 or 0

		slot0.sendNotification(slot0, GAME.GET_MAIL_LIST, {})
	end
end

function slot0.getAllAttachment(slot0)
	slot1 = {}
	slot1 = _.map(getProxy(MailProxy):getAllAttachment(), function (slot0)
		slot1.type = slot0.dropType
		slot1.id = slot0.id
		slot1.count = slot0.count

		return {}
	end)

	table.sort(slot1, function (slot0, slot1)
		if getDropRarity(slot0) == getDropRarity(slot1) then
			return slot1.id < slot0.id
		else
			return slot3 < slot2
		end
	end)

	return slot1
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = GAME.OPEN_MAIL_DONE
	slot1[2] = GAME.DELETE_MAIL_DONE
	slot1[3] = GAME.DELETE_ALL_MAIL_DONE
	slot1[4] = GAME.TAKE_ATTACHMENT_FULL_SHIP
	slot1[5] = GAME.TAKE_ATTACHMENT_FULL_EQUIP
	slot1[6] = MailProxy.MAIL_ADDED
	slot1[7] = MailProxy.MAIL_TOTAL
	slot1[8] = MailProxy.MAIL_UPDATED
	slot1[9] = MailProxy.MAIL_REMOVED
	slot1[10] = BayProxy.SHIP_ADDED
	slot1[11] = GAME.OPEN_MAIL_ATTACHMENT_DONE
	slot1[12] = GAME.CHANGE_MAIL_IMP_FLAG_DONE

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == MailProxy.MAIL_ADDED then
		slot0.viewComponent:addMail(slot1:getBody())
	elseif slot2 == MailProxy.MAIL_UPDATED then
		slot0.viewComponent:updateMail(slot3)
	elseif slot2 == MailProxy.MAIL_REMOVED then
		slot0.viewComponent:removeMail(slot3)
	elseif slot2 == MailProxy.MAIL_TOTAL then
		slot0.viewComponent:setMailCount(slot3)
	elseif slot2 == GAME.OPEN_MAIL_DONE then
		slot0.viewComponent:openMail(slot3)
	elseif slot2 == GAME.DELETE_MAIL_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailMediator_mailDelete"))
	elseif slot2 == GAME.DELETE_ALL_MAIL_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailMediator_mailDelete"))
	elseif slot2 == GAME.OPEN_MAIL_ATTACHMENT_DONE then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3.items, slot3.callback)
	elseif slot2 == GAME.TAKE_ATTACHMENT_FULL_EQUIP then
		slot0.viewComponent:UnblurMailBox()
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
	elseif slot2 == GAME.TAKE_ATTACHMENT_FULL_SHIP then
		slot0.viewComponent:UnblurMailBox()
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)
	elseif slot2 == GAME.CHANGE_MAIL_IMP_FLAG_DONE then
		slot0.viewComponent:updateMailList()
	end
end

return slot0
