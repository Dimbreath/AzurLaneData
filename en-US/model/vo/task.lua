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

function slot0.Ctor(slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.progress = slot1.progress or 0
	slot0.acceptTime = slot1.accept_time
	slot0.submitTime = slot1.submit_time or 0
end

function slot0.isClientTrigger(slot0)
	return slot0:getConfig("sub_type") > 2000 and slot0:getConfig("sub_type") < 3000
end

function slot0.bindConfigTable(slot0)
	return pg.task_data_template
end

function slot0.isFinish(slot0)
	return slot0:getConfig("target_num") <= slot0:getProgress()
end

function slot0.getProgress(slot0)
	slot1 = slot0.progress

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		slot1 = getProxy(BagProxy):getItemCountById(tonumber(slot0:getConfig("target_id_for_client")))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PT then
		slot2 = getProxy(ActivityProxy)
		slot1 = slot2:getActivityById(tonumber(slot0:getConfig("target_id_2"))) and slot2.data1 or 0
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		slot1 = getProxy(PlayerProxy):getData():getResById(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		slot1 = getProxy(ActivityProxy):getVirtualItemNumber(slot0:getConfig("target_id_for_client"))
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_BOSS_PT then
		slot1 = getProxy(PlayerProxy):getData():getResById(tonumber(slot0:getConfig("target_id")))
	elseif slot0:getConfig("sub_type") == TASK_SUB_STROY then
		slot2 = getProxy(PlayerProxy):getRawData()

		_.each(_.map(slot0:getConfig("target_id"), function (slot0)
			return uv0:getStoryByIndexID(slot0)
		end), function (slot0)
			if uv0:IsPlayed(slot0) then
				uv1 = uv1 + 1
			end
		end)

		slot1 = 0
	elseif slot0:getConfig("sub_type") == TASK_SUB_TYPE_TECHNOLOGY_POINT then
		slot1 = math.min(getProxy(TechnologyNationProxy):getNationPoint(tonumber(slot0:getConfig("target_id"))), slot0:getConfig("target_num"))
	end

	return slot1 or 0
end

function slot0.isReceive(slot0)
	return slot0.submitTime > 0
end

function slot0.getTaskStatus(slot0)
	if slot0:isReceive() then
		return 2
	end

	if slot0:isFinish() then
		return 1
	end

	return 0
end

function slot0.onAdded(slot0)
	if slot0:getConfig("story_id") and slot2 ~= "" then
		pg.StoryMgr.GetInstance():PlayOnTaskAdded(slot2, function ()
			if uv0:getConfig("sub_type") == 29 then
				if _.any(getProxy(SkirmishProxy):getRawData(), function (slot0)
					return slot0:getConfig("task_id") == uv0.id
				end) then
					return
				end

				slot4.taskVO = uv0

				pg.m02:sendNotification(GAME.TASK_GO, {})
			elseif uv0:getConfig("added_tip") > 0 then
				slot0 = nil

				if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= TaskMediator.__cname then
					function slot0()
						slot4.page = uv0[uv1:getConfig("type")]

						pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK, {})
					end
				end

				slot5.content = i18n("tip_add_task", HXSet.hxLan(uv0:getConfig("name")))
				slot5.onYes = slot0

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					noText = "text_iknow",
					yesText = "text_forward"
				})
			end
		end, true, true)
	else
		slot1()
	end
end

function slot0.updateProgress(slot0, slot1)
	slot0.progress = slot1
end

function slot0.isSelectable(slot0)
	return slot0:getConfig("award_choice") ~= nil and type(slot1) == "table" and #slot1 > 0
end

function slot0.confirmForSubmit(slot0)
	slot0.confirmSetting = {}
	slot1 = getProxy(PlayerProxy):getData()
	slot2 = {}

	for slot8, slot9 in ipairs(slot0:getConfig("award_display")) do
		if slot9[1] == DROP_TYPE_ITEM and slot9[2] == ITEM_ID_REACT_CHAPTER_TICKET then
			slot3 = 0 + slot9[3]
		end

		if slot9[1] == DROP_TYPE_RESOURCE then
			if slot9[2] == PlayerConst.ResGold then
				if slot1.gold + slot9[3] - pg.gameset.max_gold.key_value > 0 then
					slot13.type = DROP_TYPE_RESOURCE
					slot13.id = PlayerConst.ResGold
					slot13.count = slot10

					table.insert(slot2, {})
				end
			elseif slot9[2] == PlayerConst.ResOil and slot1.oil + slot9[3] - pg.gameset.max_oil.key_value > 0 then
				slot13.type = DROP_TYPE_RESOURCE
				slot13.id = PlayerConst.ResOil
				slot13.count = slot10

				table.insert(slot2, {})
			end
		end
	end

	if pg.gameset.reactivity_ticket_max.key_value < getProxy(ChapterProxy).remasterTickets + slot3 then
		slot8.content = i18n("tack_tickets_max_warning", math.max(slot6 - slot5, 0))
		slot0.confirmSetting.overFlow = {}
	end

	if #slot2 > 0 then
		slot8.type = MSGBOX_TYPE_ITEM_BOX
		slot8.content = i18n("award_max_warning")
		slot8.items = slot2
		slot0.confirmSetting.overFlow = {}
	end

	if slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM or slot0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM or slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		slot7 = DROP_TYPE_ITEM

		if slot0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
			slot7 = DROP_TYPE_RESOURCE
		end

		slot9.type = MSGBOX_TYPE_ITEM_BOX
		slot9.content = i18n("sub_item_warning")
		slot11.type = slot7
		slot11.id = slot0:getConfig("target_id_for_client")
		slot11.count = slot0:getConfig("target_num")
		slot10[1] = {}
		slot9.items = {}
		slot0.confirmSetting.sub = {}
	end

	if slot0:isSelectable() then
		slot8 = {}

		for slot12, slot13 in ipairs(taskVO:getConfig("award_choice")) do
			slot15.type = DROP_TYPE_ITEM
			slot15.id = slot13[2]
			slot15.count = slot13[3]
			slot15.index = slot12
			slot8[#slot8 + 1] = {}
		end

		slot10.type = MSGBOX_TYPE_ITEM_BOX
		slot10.content = i18n("select_award_warning")
		slot10.items = slot8

		function slot10.itemFunc(slot0)
			print("选中的序号为" .. slot0.index, "选中的id为" .. slot0.id)

			uv0.index = slot0.index
		end

		function slot10.onNo()
			uv0.index = nil
		end

		slot0.confirmSetting.choice = {}
	end
end

function slot0.getConfirmSetting(slot0)
	return Clone(slot0.confirmSetting)
end

return slot0
