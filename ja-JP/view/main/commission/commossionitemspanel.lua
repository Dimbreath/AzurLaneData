slot0 = class("CommossionItemsPanel")
slot0.STATE_LOCK = 0
slot0.STATE_EMPTY = 1
slot0.STATE_ACTIVE = 2
slot0.STATE_FINISHED = 3

function slot0.Ctor(slot0, slot1, slot2)
	slot0._go = slot1
	slot0._parent = slot2
	slot0._viewComponent = slot2._viewComponent
	slot0.timers = {}
	slot0.uilist = UIItemList.New(slot1, slot1:GetChild(0))

	pg.DelegateInfo.New(slot0)
end

function slot0.updateEventItems(slot0, slot1, slot2)
	slot3 = pairs
	slot4 = slot0.timers or {}

	for slot6, slot7 in slot3(slot4) do
		slot7:Stop()
	end

	function slot3(slot0)
		if slot0.STATE_LOCK < slot0 then
			slot1 = slot0.STATE_LOCK
		elseif slot0 > #slot2 then
			return slot0.STATE_EMPTY
		elseif slot2[slot0].state == EventInfo.StateFinish then
			return slot0.STATE_FINISHED
		elseif slot2[slot0].state == EventInfo.StateActive then
			return slot0.STATE_ACTIVE
		end

		return slot1
	end

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0(slot3) == slot1.STATE_LOCK then
			setText(slot2:Find("lock/Text"), i18n("commission_no_open") .. "\n" .. i18n("commission_open_tip", slot2:getChapterByCount(slot3).chapter_name))
		elseif slot4 == slot1.STATE_EMPTY then
			setText(slot2:Find("unlock/name_bg/Text"), i18n("commission_idle"))
			onButton(slot2, slot2:Find("unlock/leisure/go_btn"), function ()
				slot0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_EVENT)
			end, SFX_PANEL)
			onButton(slot2, slot2, function ()
				triggerButton(slot0:Find("unlock/leisure/go_btn"))
			end, SFX_PANEL)
		elseif slot4 == slot1.STATE_FINISHED then
			setText(slot2:Find("unlock/name_bg/Text"), slot3[slot3].template.title)
			onButton(slot2, slot2:Find("unlock/finished/finish_btn"), function ()
				slot0._viewComponent:emit(CommissionInfoMediator.FINISH_EVENT, slot0._viewComponent)
			end, SFX_PANEL)
			onButton(slot2, slot2, function ()
				triggerButton(slot0:Find("unlock/finished/finish_btn"))
			end, SFX_PANEL)
		elseif slot4 == slot1.STATE_ACTIVE then
			setText(slot2:Find("unlock/name_bg/Text"), slot3[slot3].template.title)

			slot6 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))
			slot7 = slot3[slot3].finishTime + 2

			if slot2.timers[slot3[slot3].id] then
				slot2.timers[slot5.id]:Stop()

				slot2.timers[slot5.id] = nil
			end

			slot2.timers[slot5.id] = Timer.New(function ()
				if slot0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
					slot1.timers[slot2.id]:Stop()

					slot1.timers[slot2.id].Stop.timers[slot1.timers[slot2.id].id] = nil

					slot1.timers[slot2.id].Stop.timers._parent:update()
				else
					slot3.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
				end
			end, 1, -1)

			slot2.timers[slot5.id]:Start()
			slot2.timers[slot5.id].func()
		end

		setActive(slot2:Find("unlock"), slot4 ~= slot1.STATE_LOCK)
		setActive(slot2:Find("lock"), slot4 == slot1.STATE_LOCK)
		setActive(slot2:Find("unlock/leisure"), slot4 == slot1.STATE_EMPTY)
		setActive(slot2:Find("unlock/ongoging"), slot4 == slot1.STATE_ACTIVE)
		setActive(slot2:Find("unlock/finished"), slot4 == slot1.STATE_FINISHED)
	end)
	slot0.uilist:align(4)
end

function slot0.getChapterByCount(slot0, slot1)
	for slot6, slot7 in pairs(pg.chapter_template.all) do
		if slot2[slot7].collection_team == slot1 then
			return slot2[slot7]
		end
	end
end

function slot0.updateClassItems(slot0, slot1, slot2)
	slot3 = pairs
	slot4 = slot0.timers or {}

	for slot6, slot7 in slot3(slot4) do
		slot7:Stop()
	end

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = false
			slot5 = slot2:Find("unlock/name_bg")

			if slot0[slot1 + 1] then
				slot5.sizeDelta = Vector2(267, 45)
				slot8 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))
				slot9 = slot4:getShipVO()
				slot10 = nil

				setText(slot2:Find("unlock/name_bg/Text"), slot4:getSkillName())

				if pg.TimeMgr.GetInstance():GetServerTime() < slot4:getFinishTime() then
					slot1.timers[slot4.id] = Timer.New(function ()
						if slot0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
							slot1._parent:update()
							slot1._parent.update.timers[slot1._parent.id]:Stop()
						else
							slot3.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
						end
					end, 1, -1)

					slot1.timers[slot4.id]:Start()
					slot1.timers[slot4.id]:func()

					slot10 = slot2:Find("unlock/ongoging/shipicon")
				else
					slot3 = true

					onButton(slot1, slot2:Find("unlock/finished/finish_btn"), function ()
						slot0._viewComponent:emit(CommissionInfoMediator.FINISH_CLASS, slot1.id, Student.CANCEL_TYPE_AUTO)
					end, SFX_PANEL)
					onButton(slot1, slot2, function ()
						triggerButton(slot0:Find("unlock/finished/finish_btn"))
					end, SFX_PANEL)

					slot10 = slot2:Find("unlock/finished/shipicon")
				end

				updateShip(slot10, slot9)
			else
				slot5.sizeDelta = Vector2(400, 45)

				setText(slot2:Find("unlock/name_bg/Text"), i18n("commission_idle"))
				onButton(slot1, slot2:Find("unlock/leisure/go_btn"), function ()
					slot0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_CLASS)
				end, SFX_PANEL)
				onButton(slot1, slot2, function ()
					triggerButton(slot0:Find("unlock/leisure/go_btn"))
				end, SFX_PANEL)
			end

			setActive(slot2:Find("unlock"), true)
			setActive(slot2:Find("lock"), false)
			setActive(slot2:Find("unlock/leisure"), not slot4)
			setActive(slot2:Find("unlock/ongoging"), slot4 and not slot3)
			setActive(slot2:Find("unlock/finished"), slot4 and slot3)
		end
	end)
	slot0.uilist:align(slot2)
end

function slot0.updateTechItems(slot0, slot1, slot2)
	slot3 = pairs
	slot4 = slot0.timers or {}

	for slot6, slot7 in slot3(slot4) do
		slot7:Stop()
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.state < slot0.state
	end)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			function slot5()
				slot1 = slot0:Find("unlock/desc/name_bg/Text")

				setText(slot1, slot1:getConfig("name"))

				if slot1:hasCondition() then
					setText(slot0:Find("unlock/desc/task_bg/Text"), getProxy(TaskProxy):getTaskById(slot1:getTaskId()) or getProxy(TaskProxy):getFinishTaskById(slot0):getConfig("desc") .. "(" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or getProxy(TaskProxy).getFinishTaskById(slot0):getProgress() .. "/" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or getProxy(TaskProxy).getFinishTaskById(slot0):getConfig("target_num") .. ")")
				end
			end

			if slot0[slot1 + 1].state == Technology.STATE_IDLE then
				setText(slot2:Find("unlock/desc/name_bg/Text"), i18n("commission_idle"))
				onButton(slot1, slot2:Find("unlock/leisure/go_btn"), function ()
					slot0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_TECH)
				end, SFX_PANEL)
				onButton(slot1, slot2, function ()
					triggerButton(slot0:Find("unlock/leisure/go_btn"))
				end, SFX_PANEL)
			elseif slot4 == Technology.STATE_FINISHED then
				slot5()
				onButton(slot1, slot2:Find("unlock/finished/finish_btn"), function ()
					slot0._viewComponent:emit(CommissionInfoMediator.ON_TECH_FINISHED, {
						id = slot1.id,
						pool_id = slot1.poolId
					})
				end, SFX_PANEL)
				onButton(slot1, slot2, function ()
					triggerButton(slot0:Find("unlock/finished/finish_btn"))
				end, SFX_PANEL)
			elseif slot4 == Technology.STATE_STARTING then
				slot5()

				slot6 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))

				if pg.TimeMgr.GetInstance():GetServerTime() < slot3:getFinishTime() then
					slot1.timers[slot3.id] = Timer.New(function ()
						if slot0:getFinishTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
							slot1.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
						else
							slot2.timers[slot0.id]:Stop()
							slot2._parent:update()
						end
					end, 1, -1)

					slot1.timers[slot3.id]:Start()
					slot1.timers[slot3.id].func()
				else
					slot6.text = "00:00:00"
				end
			end

			setActive(slot2:Find("unlock"), true)
			setActive(slot2:Find("lock"), false)
			setActive(slot2:Find("unlock/leisure"), slot4 == Technology.STATE_IDLE)
			setActive(slot2:Find("unlock/ongoging"), slot4 == Technology.STATE_STARTING)
			setActive(slot2:Find("unlock/finished"), slot4 == Technology.STATE_FINISHED)
			setActive(slot2:Find("unlock/desc/task_bg"), slot4 ~= Technology.STATE_IDLE and slot3:hasCondition())
		end
	end)
	slot0.uilist:align(slot2)
end

function slot0.clear(slot0)
	slot1 = pairs
	slot2 = slot0.timers or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:Stop()
	end

	pg.DelegateInfo.Dispose(slot0)
end

return slot0
