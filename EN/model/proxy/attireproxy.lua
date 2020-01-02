slot0 = class("AttireProxy", import(".NetProxy"))
slot0.ATTIREFRAME_UPDATED = "AttireProxy:ATTIREFRAME_UPDATED"
slot0.ATTIREFRAME_ADDED = "AttireProxy:ATTIREFRAME_ADDED"
slot0.ATTIREFRAME_EXPIRED = "AttireProxy:ATTIREFRAME_EXPIRED"
slot1 = pg.item_data_frame
slot2 = pg.item_data_chat
slot3 = false

function slot0.register(slot0)
	slot0.data = {}
	slot0.timers = {}
	slot0.expiredChaces = {}
	slot0.data.iconFrames = {}
	slot0.data.chatFrames = {}

	for slot4, slot5 in ipairs(slot0.all) do
		if slot5 == 0 then
			slot0.data.iconFrames[slot5] = IconFrame.New({
				end_time = 0,
				id = slot5
			})
		else
			slot0.data.iconFrames[slot5] = IconFrame.New({
				id = slot5
			})
		end
	end

	for slot4, slot5 in ipairs(slot1.all) do
		if slot5 == 0 then
			slot0.data.chatFrames[slot5] = ChatFrame.New({
				end_time = 0,
				id = slot5
			})
		else
			slot0.data.chatFrames[slot5] = ChatFrame.New({
				id = slot5
			})
		end
	end

	slot0:on(11003, function (slot0)
		for slot4, slot5 in ipairs(slot0.icon_frame_list) do
			slot0.data.iconFrames[slot5.id].updateData(slot6, slot5)
			slot0:updateAttireFrame(slot6)
			slot0:addExpiredTimer(slot0.data.iconFrames[slot5.id])
		end

		slot1 = ipairs
		slot2 = slot0.chat_frame_list or {}

		for slot4, slot5 in slot1(slot2) do
			slot0.data.chatFrames[slot5.id].updateData(slot6, slot5)
			slot0:updateAttireFrame(slot6)
			slot0:addExpiredTimer(slot0.data.chatFrames[slot5.id])
		end
	end)

	if slot0 then
		slot0.timer = Timer.New(function ()
			slot0 = {}
			slot1 = {
				101,
				102,
				201,
				301
			}

			for slot5 = 1, 5, 1 do
				slot0:sendNotification(GAME.ADD_ITEM, Item.New({
					count = 1,
					type = (slot5 % 2 == 0 and DROP_TYPE_ICON_FRAME) or DROP_TYPE_CHAT_FRAME,
					id = slot1[math.random(1, 4)]
				}))
				table.insert(slot0, Item.New())
			end

			table.insert(slot0, slot2)
			slot0:sendNotification(GAME.ACT_NEW_PT_DONE, {
				awards = slot0
			})
		end, 10, 1)

		slot0.timer:Start()
	end
end

function slot0.getDataAndTrophys(slot0, slot1)
	slot2 = slot0:getData()

	if slot1 then
		slot0:clearNew()
	end

	slot2.trophys = getProxy(CollectionProxy):getTrophys()

	return slot2
end

function slot0.clearNew(slot0)
	for slot4, slot5 in pairs(slot0.data.iconFrames) do
		slot5:clearNew()
	end

	for slot4, slot5 in pairs(slot0.data.chatFrames) do
		slot5:clearNew()
	end
end

function slot0.getExpiredChaces(slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.expiredChaces) do
		table.insert(slot1, slot6)
	end

	slot0.expiredChaces = {}

	return slot1
end

function slot0.getAttireFrame(slot0, slot1, slot2)
	slot3 = nil

	if slot1 == AttireConst.TYPE_ICON_FRAME then
		slot3 = slot0.data.iconFrames[slot2]
	elseif slot1 == AttireConst.TYPE_CHAT_FRAME then
		slot3 = slot0.data.chatFrames[slot2]
	end

	return slot3
end

function slot0.addAttireFrame(slot0, slot1)
	slot3 = slot0:getAttireFrame(slot2, slot1.id)

	if slot1:expiredType() and slot3 and not slot3:isExpired() then
		slot1:updateEndTime(slot3:getExpiredTime() + slot1:getConfig("time_second"))
	end

	if slot2 == AttireConst.TYPE_ICON_FRAME then
		slot0.data.iconFrames[slot1.id] = slot1
	elseif slot2 == AttireConst.TYPE_CHAT_FRAME then
		slot0.data.chatFrames[slot1.id] = slot1
	end

	slot0:addExpiredTimer(slot1)
	slot0:sendNotification(slot0.ATTIREFRAME_ADDED, slot1:clone())
end

function slot0.updateAttireFrame(slot0, slot1)
	if slot1:getType() == AttireConst.TYPE_ICON_FRAME then
		slot0.data.iconFrames[slot1.id] = slot1
	elseif slot2 == AttireConst.TYPE_CHAT_FRAME then
		slot0.data.chatFrames[slot1.id] = slot1
	end

	slot0:sendNotification(slot0.ATTIREFRAME_UPDATED, slot1:clone())
end

function slot0.addExpiredTimer(slot0, slot1)
	if not slot1:expiredType() then
		return
	end

	function slot2()
		slot0 = getProxy(PlayerProxy)

		if slot0:getData().getAttireByType(slot1, slot0:getType()) == slot0.id then
			slot1:updateAttireFrame(slot2, 0)
			slot0:updatePlayer(slot1)
		end

		table.insert(slot1.expiredChaces, slot0)
		slot1:sendNotification(slot2.ATTIREFRAME_EXPIRED, slot0:clone())
	end

	if slot1:getExpiredTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
		slot0.timers[slot1:getTimerKey()] = Timer.New(function ()
			slot0()
			slot1:removeExpiredTimer(slot2)
		end, slot4, 1)

		slot0.timers[slot1.getTimerKey()]:Start()
	else
		slot2()
	end
end

function slot0.removeExpiredTimer(slot0, slot1)
	if slot0.timers[slot1:getTimerKey()] then
		slot0.timers[slot2]:Stop()

		slot0.timers[slot2] = nil
	end
end

function slot0.remove(slot0)
	for slot4, slot5 in pairs(slot0.timers) do
		slot5:Stop()
	end

	slot0.timers = nil
end

function slot0.needTip(slot0)
	slot1 = {}
	slot2 = slot0:getDataAndTrophys()

	function slot4(slot0)
		slot1 = false

		for slot5, slot6 in pairs(slot0) do
			if slot6:isNew() then
				slot1 = true

				break
			end
		end

		return slot1
	end

	for slot8, slot9 in ipairs(slot3) do
		if slot8 == 1 or slot8 == 2 then
			table.insert(slot1, slot4(slot9))
		else
			table.insert(slot1, false)
		end
	end

	return slot1
end

return slot0
