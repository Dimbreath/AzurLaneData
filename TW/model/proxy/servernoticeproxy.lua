slot0 = class("ServerNoticeProxy", import(".NetProxy"))
slot0.SERVER_NOTICES_UPDATE = "server notices update"
slot0.KEY_NEWLY_ID = "server_notice.newly_id"
slot0.KEY_STOP_REMIND = "server_notice.stop_remind"
slot0.KEY_STOP_TIP = "server_notice.stop_tip"

function slot0.register(slot0)
	slot0.data = {}

	slot0:on(11300, function (slot0)
		slot0.data = {}

		for slot4, slot5 in ipairs(slot0.notice_list) do
			table.insert(slot0.data, ServerNotice.New(slot5))
		end

		slot0:sendNotification(slot1.SERVER_NOTICES_UPDATE)
	end)
end

function slot0.getServerNotices(slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.data) do
		if not slot1 or not slot7.isRead then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

function slot0.getStopRemind(slot0)
	slot1 = false

	if PlayerPrefs.HasKey(slot0.KEY_STOP_REMIND) then
		slot3 = PlayerPrefs.GetInt(slot0.KEY_STOP_REMIND)
		slot4 = pg.TimeMgr.GetInstance()

		if PlayerPrefs.GetInt(slot0.KEY_NEWLY_ID) == slot0:getUniqueCode() and slot4:IsSameDay(slot3, slot4:GetServerTime()) then
			slot1 = true
		end
	end

	return slot1
end

function slot0.setStopRemind(slot0, slot1)
	if slot1 then
		PlayerPrefs.SetInt(slot0.KEY_NEWLY_ID, slot0:getUniqueCode())
		PlayerPrefs.SetInt(slot0.KEY_STOP_REMIND, pg.TimeMgr.GetInstance():GetServerTime())
	else
		PlayerPrefs.DeleteKey(slot0.KEY_STOP_REMIND)
	end

	PlayerPrefs.Save()
end

function slot0.setStopMainTip(slot0)
	PlayerPrefs.SetInt(slot0.KEY_STOP_TIP, slot0:getUniqueCode())
	PlayerPrefs.Save()
end

function slot0.isStopMainTip(slot0)
	if PlayerPrefs.HasKey(slot0.KEY_STOP_TIP) and PlayerPrefs.GetInt(slot0.KEY_STOP_TIP) == slot0:getUniqueCode() then
		return true
	end

	return false
end

function slot0.getUniqueCode(slot0)
	return _.reduce(slot0.data, 0, function (slot0, slot1)
		return slot0 + slot1:getUniqueCode()
	end)
end

return slot0
