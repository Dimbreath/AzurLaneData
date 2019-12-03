slot0 = class("Task", import(".BaseVO"))
slot0.TYPE_SCENARIO = 1
slot0.TYPE_BRANCH = 2
slot0.TYPE_ROUTINE = 3
slot0.TYPE_WEEKLY = 4
slot0.TYPE_HIDDEN = 5
slot0.TYPE_ACTIVITY = 6
slot0.TYPE_ACTIVITY_ROUTINE = 36
slot0.TYPE_ACTIVITY_BRANCH = 26
slot1 = {
	"scenario",
	"branch",
	"routine",
	"weekly"
}
slot0.TASK_PROGRESS_UPDATE = 0
slot0.TASK_PROGRESS_APPEND = 1

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.progress = slot1.progress or 0
	slot0.acceptTime = slot1.accept_time
	slot0.submitTime = slot1.submit_time or 0
end

slot0.isClientTrigger = function (slot0)
	return slot0:getConfig("sub_type") > 2000 and slot0:getConfig("sub_type") < 3000
end

slot0.bindConfigTable = function (slot0)
	return pg.task_data_template
end

slot0.isFinish = function (slot0)
	return slot0:getConfig("target_num") <= slot0:getProgress()
end

slot0.getProgress = function (slot0)
	slot1 = slot0.progress

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		slot1 = getProxy(BagProxy):getItemCountById(tonumber(slot0:getConfig("target_id_for_client")))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PT then
		slot1 = (getProxy(ActivityProxy):getActivityById(tonumber(slot0:getConfig("target_id_2"))) and slot2.data1) or 0
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		slot1 = getProxy(PlayerProxy):getData():getResById(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		slot1 = getProxy(ActivityProxy):getVirtualItemNumber(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_BOSS_PT then
		slot1 = getProxy(PlayerProxy):getData():getResById(tonumber(slot0:getConfig("target_id")))
	elseif slot0:getConfig("sub_type") == TASK_SUB_STROY then
		slot2 = getProxy(PlayerProxy):getRawData()

		_.each(_.map(slot3, function (slot0)
			return slot0:getStoryByIndexID(slot0)
		end), function (slot0)
			slot1 = slot0:IsPlayed(slot0) and slot1 + 1
		end)

		slot1 = 0
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_TECHNOLOGY_POINT then
		slot1 = math.min(getProxy(TechnologyNationProxy):getNationPoint(tonumber(slot0:getConfig("target_id"))), slot0:getConfig("target_num"))
	end

	return slot1 or 0
end

slot0.isReceive = function (slot0)
	return slot0.submitTime > 0
end

slot0.getTaskStatus = function (slot0)
	if slot0:isReceive() then
		return 2
	end

	if slot0:isFinish() then
		return 1
	end

	return 0
end

slot0.onAdded = function (slot0)
	function slot1()
		if slot0:getConfig("sub_type") == 29 then
			if _.any(getProxy(SkirmishProxy):getRawData(), function (slot0)
				return slot0:getConfig("task_id") == slot0.id
			end) then
				return
			end

			pg.m02:sendNotification(GAME.TASK_GO, {
				taskVO = slot0
			})
		elseif slot0:getConfig("added_tip") > 0 then
			slot0 = nil

			if getProxy(ContextProxy).getCurrentContext(slot1).mediator.__cname ~= TaskMediator.__cname then
				function slot0()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {
						page = slot0[slot1:getConfig("type")]
					})
				end
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				noText = "text_iknow",
				yesText = "text_forward",
				content = i18n("tip_add_task", HXSet.hxLan(slot0:getConfig("name"))),
				onYes = slot0
			})
		end
	end

	if slot0:getConfig("story_id") and slot2 ~= "" then
		pg.StoryMgr.GetInstance():PlayOnTaskAdded(slot2, slot1, true, true)
	else
		slot1()
	end
end

slot0.updateProgress = function (slot0, slot1)
	slot0.progress = slot1
end

slot0.isSelectable = function (slot0)
	return slot0:getConfig("award_choice") ~= nil and type(slot1) == "table" and #slot1 > 0
end

slot0.confirmForSubmit = function (slot0)
	slot0.confirmSetting = {}
	slot1 = getProxy(PlayerProxy):getData()
	slot2 = {}
	slot3 = 0

	for slot8, slot9 in ipairs(slot4) do
		if slot9[1] == DROP_TYPE_ITEM and slot9[2] == ITEM_ID_REACT_CHAPTER_TICKET then
			slot3 = slot3 + slot9[3]
		end

		if slot9[1] == DROP_TYPE_RESOURCE then
			if slot9[2] == PlayerConst.ResGold then
				if (slot1.gold + slot9[3]) - pg.gameset.max_gold.key_value > 0 then
					table.insert(slot2, {
						type = DROP_TYPE_RESOURCE,
						id = PlayerConst.ResGold,
						count = slot10
					})
				end
			elseif slot9[2] == PlayerConst.ResOil and (slot1.oil + slot9[3]) - pg.gameset.max_oil.key_value > 0 then
				table.insert(slot2, {
					type = DROP_TYPE_RESOURCE,
					id = PlayerConst.ResOil,
					count = slot10
				})
			end
		end
	end

	if pg.gameset.reactivity_ticket_max.key_value < getProxy(ChapterProxy).remasterTickets + slot3 then
		slot0.confirmSetting.overFlow = {
			content = i18n("tack_tickets_max_warning", math.max(slot6 - slot5, 0))
		}
	end

	if #slot2 > 0 then
		slot0.confirmSetting.overFlow = {
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("award_max_warning"),
			items = slot2
		}
	end

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM or slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM or slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		slot7 = DROP_TYPE_ITEM

		if slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
			slot7 = DROP_TYPE_RESOURCE
		end

		slot0.confirmSetting.sub = {
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("sub_item_warning"),
			items = {
				{
					type = slot7,
					id = slot0:getConfig("target_id_for_client"),
					count = slot0:getConfig("target_num")
				}
			}
		}
	end

	if slot0:isSelectable() then
		slot8 = {}

		for slot12, slot13 in ipairs(slot7) do
			slot8[#slot8 + 1] = {
				type = DROP_TYPE_ITEM,
				id = slot13[2],
				count = slot13[3],
				index = slot12
			}
		end

		slot0.confirmSetting.choice = {
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("select_award_warning"),
			items = slot8,
			itemFunc = function (slot0)
				print("选中的序号为" .. slot0.index, "选中的id为" .. slot0.id)

				slot0.index = slot0.index
			end,
			onNo = function ()
				slot0.index = nil
			end
		}
	end
end

slot0.getConfirmSetting = function (slot0)
	return Clone(slot0.confirmSetting)
end

return slot0
