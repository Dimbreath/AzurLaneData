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

	slot0:bind(slot0.ON_OPEN, function (slot0, slot1)
		slot0:sendNotification(GAME.OPEN_MAIL, slot1)
	end)
	slot0:bind(slot0.ON_TAKE, function (slot0, slot1)
		slot0:sendNotification(GAME.TAKE_ATTACHMENT, slot1)
	end)
	slot0:bind(slot0.ON_TAKE_ALL, function (slot0)
		if #slot0:getMailAttachments() > 0 then
			slot1.viewComponent:showMsgBox({
				content = i18n("take_all_mail", #slot1),
				onYes = function ()
					slot0:sendNotification(GAME.TAKE_ALL_ATTACHMENT)
				end,
				items = slot1:getAllAttachment()
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("take_nothing"))
		end
	end)
	slot0:bind(slot0.ON_DELETE, function (slot0, slot1)
		slot0:sendNotification(GAME.DELETE_MAIL, slot1)
	end)
	slot0:bind(slot0.ON_DELETE_ALL, function (slot0)
		slot0:sendNotification(GAME.DELETE_ALL_MAIL)
	end)
	slot0:bind(slot0.ON_MORE_NEWER, function (slot0)
		slot1:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = (slot0:getNewestMail() and slot1.id) or 0,
			type = (slot1 and 1) or 0
		})
	end)
	slot0:bind(slot0.ON_MORE_OLDER, function (slot0)
		slot1:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = (slot0:getOldestMail() and slot1.id) or 0,
			type = (slot1 and 2) or 0
		})
	end)
	slot0:bind(slot0.ON_CHANGE_IMP, function (slot0, slot1, slot2)
		slot0:sendNotification(GAME.CHANGE_MAIL_IMP_FLAG, {
			id = slot1,
			flag = slot2
		})
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
		slot0:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = (slot1:getNewestMail() and slot2.id) or 0,
			type = (slot2 and 1) or 0
		})
	end
end

function slot0.getAllAttachment(slot0)
	slot1 = {}

	table.sort(_.map(slot2, function (slot0)
		return {
			type = slot0.dropType,
			id = slot0.id,
			count = slot0.count
		}
	end), function (slot0, slot1)
		if getDropRarity(slot0) == getDropRarity(slot1) then
			return slot1.id < slot0.id
		else
			return slot3 < slot2
		end
	end)

	return _.map(slot2, function (slot0)
		return 
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.OPEN_MAIL_DONE,
		GAME.DELETE_MAIL_DONE,
		GAME.DELETE_ALL_MAIL_DONE,
		GAME.TAKE_ATTACHMENT_FULL_SHIP,
		GAME.TAKE_ATTACHMENT_FULL_EQUIP,
		MailProxy.MAIL_ADDED,
		MailProxy.MAIL_TOTAL,
		MailProxy.MAIL_UPDATED,
		MailProxy.MAIL_REMOVED,
		BayProxy.SHIP_ADDED,
		GAME.OPEN_MAIL_ATTACHMENT_DONE,
		GAME.CHANGE_MAIL_IMP_FLAG_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == MailProxy.MAIL_ADDED then
		slot0.viewComponent:addMail(slot3)
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
