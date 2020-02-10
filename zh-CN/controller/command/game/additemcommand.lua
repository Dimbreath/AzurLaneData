slot0 = class("AddItemCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if slot1:getBody().dropType == DROP_TYPE_RESOURCE then
		slot4 = getProxy(PlayerProxy)
		slot5 = slot4:getData()

		slot5:addResources({
			[id2res(slot2.id)] = slot2.count
		})
		slot4:updatePlayer(slot5)
	elseif slot2.dropType == DROP_TYPE_ITEM then
		slot3 = getProxy(BagProxy)
		slot4 = Item.New({
			id = slot2.id,
			count = slot2.count
		})

		if slot4:isVirtualItem() then
			if slot4:getConfig("virtual_type") == 0 then
				getProxy(ActivityProxy):addVitemById(slot2.id, slot2.count)
			elseif slot5 == 1 then
				if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) and not slot7:isEnd() then
					if not table.contains(slot7.data1_list, slot2.id) then
						table.insert(slot7.data1_list, slot2.id)
					end

					slot6:updateActivity(slot7)
				end
			elseif slot5 == 2 or slot5 == 3 then
				slot6 = getProxy(VoteProxy)

				if slot5 == 2 then
					slot8 = getProxy(ActivityProxy):GetVoteActivity()
					slot8.data1 = slot8.data1 + slot4.count
					slot6.votes = slot6.votes + slot4.count
				end
			elseif slot5 == 4 then
				slot7[slot4.id] = (getProxy(ColoringProxy):getColorItems()[slot4.id] or 0) + slot4.count
			elseif slot5 == 6 then
				slot6 = getProxy(ActivityProxy)

				if slot6:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) then
					slot7.data3 = slot7.data3 + slot2.count

					slot6:updateActivity(slot7)
				end
			elseif slot5 == 7 then
				slot6 = getProxy(ChapterProxy)
				slot6.remasterTickets = math.min(slot6.remasterTickets + slot2.count, pg.gameset.reactivity_ticket_max.key_value)
			elseif slot5 == 9 then
				slot7 = getProxy(ActivityProxy)

				if slot7:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY) then
					slot7.data1_list[1] = slot7.data1_list[1] + slot2.count

					getProxy(ActivityProxy):updateActivity(slot7)
				end
			elseif slot5 == 10 then
				slot6 = getProxy(ActivityProxy)

				if slot6:getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) and not slot7:isEnd() then
					slot7.data1 = slot7.data1 + slot2.count

					slot6:updateActivity(slot7)
					slot0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
						activity = slot7
					})
				end
			elseif slot5 == 11 then
				if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS) and not slot7:isEnd() then
					slot7.data1 = slot7.data1 + 1
				end
			end
		else
			slot3:addItemById(slot2.id, slot2.count)
		end
	elseif slot2.dropType == DROP_TYPE_EQUIP then
		getProxy(EquipmentProxy):addEquipmentById(slot2.id, slot2.count)
	elseif slot2.dropType == DROP_TYPE_SHIP then
		-- Nothing
	elseif slot2.dropType == DROP_TYPE_SIREN_EQUIP then
		-- Nothing
	elseif slot2.dropType == DROP_TYPE_FURNITURE then
		slot3 = getProxy(DormProxy)
		slot4 = Furniture.New({
			id = slot2.id,
			count = slot2.count
		})

		if slot4:isRecordTime() then
			slot4.date = pg.TimeMgr.GetInstance():GetServerTime()
		end

		slot3:addFurniture(slot4)
	elseif slot2.dropType == DROP_TYPE_SKIN then
		getProxy(ShipSkinProxy):addSkin(ShipSkin.New({
			id = slot2.id
		}))
	elseif slot2.dropType == DROP_TYPE_EQUIPMENT_SKIN then
		getProxy(EquipmentProxy):addEquipmentSkin(slot2.id, slot2.count)
	elseif slot2.dropType == DROP_TYPE_NPC_SHIP then
		slot3 = getProxy(BayProxy)

		if slot3:getShipById(slot2.id) then
			slot4:unlockActivityNpc(0)
			slot3:updateShip(slot4)
			getProxy(CollectionProxy):flushCollection(slot4)
		end
	elseif slot2.dropType == DROP_TYPE_WORLD_ITEM then
		slot4 = getProxy(WorldProxy):GetWorld()

		slot4:getInventoryProxy():AddItem(slot2.id, slot2.count)
		slot4:AddLog(WorldLog.TypeDrop, {
			item = slot2.id,
			itemnum = slot2.count
		})
	elseif slot2.dropType == DROP_TYPE_ICON_FRAME then
		slot5 = IconFrame.New({
			id = slot2.id
		})

		slot5:updateData({
			isNew = true,
			end_time = pg.TimeMgr.GetInstance():GetServerTime() + slot5:getConfig("time_second")
		})
		getProxy(AttireProxy):addAttireFrame(slot5)
		pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, slot5)
	elseif slot2.dropType == DROP_TYPE_CHAT_FRAME then
		slot5 = ChatFrame.New({
			id = slot2.id
		})

		slot5:updateData({
			isNew = true,
			end_time = pg.TimeMgr.GetInstance():GetServerTime() + slot5:getConfig("time_second")
		})
		getProxy(AttireProxy):addAttireFrame(slot5)
		pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_ATTIRE, slot5)
	elseif slot2.dropType == DROP_TYPE_EMOJI then
		getProxy(EmojiProxy):addNewEmojiID(slot2.id)
	else
		print("can not handle this type>>" .. slot2.dropType)
	end
end

return slot0
