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
	for slot6, slot7 in pairs(slot0.timers or {}) do
		slot7:Stop()
	end

	function slot3(slot0)
		slot1 = uv0.STATE_LOCK

		if uv1 < slot0 then
			slot1 = uv0.STATE_LOCK
		elseif slot0 > #uv2 then
			return uv0.STATE_EMPTY
		elseif uv2[slot0].state == EventInfo.StateFinish then
			return uv0.STATE_FINISHED
		elseif uv2[slot0].state == EventInfo.StateActive then
			return uv0.STATE_ACTIVE
		end

		return slot1
	end

	slot0.uilist:make(function (slot0, slot1, slot2)
		if uv0(slot1 + 1) == uv1.STATE_LOCK then
			setText(slot2:Find("lock/Text"), i18n("commission_no_open") .. "\n" .. i18n("commission_open_tip", uv2:getChapterByCount(slot3).chapter_name))
		elseif slot4 == uv1.STATE_EMPTY then
			setText(slot2:Find("unlock/name_bg/Text"), i18n("commission_idle"))
			onButton(uv2, slot2:Find("unlock/leisure/go_btn"), function ()
				uv0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_EVENT)
			end, SFX_PANEL)
			onButton(uv2, slot2, function ()
				triggerButton(uv0:Find("unlock/leisure/go_btn"))
			end, SFX_PANEL)
		elseif slot4 == uv1.STATE_FINISHED then
			setText(slot2:Find("unlock/name_bg/Text"), uv3[slot3].template.title)
			onButton(uv2, slot2:Find("unlock/finished/finish_btn"), function ()
				uv0._viewComponent:emit(CommissionInfoMediator.FINISH_EVENT, uv1)
			end, SFX_PANEL)
			onButton(uv2, slot2, function ()
				triggerButton(uv0:Find("unlock/finished/finish_btn"))
			end, SFX_PANEL)
		elseif slot4 == uv1.STATE_ACTIVE then
			slot5 = uv3[slot3]

			setText(slot2:Find("unlock/name_bg/Text"), slot5.template.title)

			slot6 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))
			slot7 = slot5.finishTime + 2

			if uv2.timers[slot5.id] then
				uv2.timers[slot5.id]:Stop()

				uv2.timers[slot5.id] = nil
			end

			uv2.timers[slot5.id] = Timer.New(function ()
				if uv0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
					uv1.timers[uv2.id]:Stop()

					uv1.timers[uv2.id] = nil

					uv1._parent:update()
				else
					uv3.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
				end
			end, 1, -1)

			uv2.timers[slot5.id]:Start()
			uv2.timers[slot5.id].func()
		end

		setActive(slot2:Find("unlock"), slot4 ~= uv1.STATE_LOCK)
		setActive(slot2:Find("lock"), slot4 == uv1.STATE_LOCK)
		setActive(slot2:Find("unlock/leisure"), slot4 == uv1.STATE_EMPTY)
		setActive(slot2:Find("unlock/ongoging"), slot4 == uv1.STATE_ACTIVE)
		setActive(slot2:Find("unlock/finished"), slot4 == uv1.STATE_FINISHED)
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
	for slot6, slot7 in pairs(slot0.timers or {}) do
		slot7:Stop()
	end

	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot3 = false

			if uv0[slot1 + 1] then
				slot2:Find("unlock/name_bg").sizeDelta = Vector2(267, 45)
				slot8 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))
				slot9 = slot4:getShipVO()
				slot10 = nil

				setText(slot2:Find("unlock/name_bg/Text"), slot4:getSkillName())

				if pg.TimeMgr.GetInstance():GetServerTime() < slot4:getFinishTime() then
					uv1.timers[slot4.id] = Timer.New(function ()
						if uv0 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
							uv1._parent:update()
							uv1.timers[uv2.id]:Stop()
						else
							uv3.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
						end
					end, 1, -1)

					uv1.timers[slot4.id]:Start()
					uv1.timers[slot4.id]:func()

					slot10 = slot2:Find("unlock/ongoging/shipicon")
				else
					slot3 = true

					onButton(uv1, slot2:Find("unlock/finished/finish_btn"), function ()
						uv0._viewComponent:emit(CommissionInfoMediator.FINISH_CLASS, uv1.id, Student.CANCEL_TYPE_AUTO)
					end, SFX_PANEL)
					onButton(uv1, slot2, function ()
						triggerButton(uv0:Find("unlock/finished/finish_btn"))
					end, SFX_PANEL)

					slot10 = slot2:Find("unlock/finished/shipicon")
				end

				updateShip(slot10, slot9)
			else
				slot5.sizeDelta = Vector2(400, 45)

				setText(slot2:Find("unlock/name_bg/Text"), i18n("commission_idle"))
				onButton(uv1, slot2:Find("unlock/leisure/go_btn"), function ()
					uv0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_CLASS)
				end, SFX_PANEL)
				onButton(uv1, slot2, function ()
					triggerButton(uv0:Find("unlock/leisure/go_btn"))
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
	for slot6, slot7 in pairs(slot0.timers or {}) do
		slot7:Stop()
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.state < slot0.state
	end)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			function slot5()
				setText(uv0:Find("unlock/desc/name_bg/Text"), uv1:getConfig("name"))

				if uv1:hasCondition() then
					slot1 = getProxy(TaskProxy):getTaskById(uv1:getTaskId()) or getProxy(TaskProxy):getFinishTaskById(slot0)

					setText(uv0:Find("unlock/desc/task_bg/Text"), slot1:getConfig("desc") .. "(" .. slot1:getProgress() .. "/" .. slot1:getConfig("target_num") .. ")")
				end
			end

			if uv0[slot1 + 1].state == Technology.STATE_IDLE then
				setText(slot2:Find("unlock/desc/name_bg/Text"), i18n("commission_idle"))
				onButton(uv1, slot2:Find("unlock/leisure/go_btn"), function ()
					uv0._viewComponent:emit(CommissionInfoMediator.ON_ACTIVE_TECH)
				end, SFX_PANEL)
				onButton(uv1, slot2, function ()
					triggerButton(uv0:Find("unlock/leisure/go_btn"))
				end, SFX_PANEL)
			elseif slot4 == Technology.STATE_FINISHED then
				slot5()
				onButton(uv1, slot2:Find("unlock/finished/finish_btn"), function ()
					uv0._viewComponent:emit(CommissionInfoMediator.ON_TECH_FINISHED, {
						id = uv1.id,
						pool_id = uv1.poolId
					})
				end, SFX_PANEL)
				onButton(uv1, slot2, function ()
					triggerButton(uv0:Find("unlock/finished/finish_btn"))
				end, SFX_PANEL)
			elseif slot4 == Technology.STATE_STARTING then
				slot5()

				slot6 = slot2:Find("unlock/ongoging/time"):GetComponent(typeof(Text))

				if pg.TimeMgr.GetInstance():GetServerTime() < slot3:getFinishTime() then
					uv1.timers[slot3.id] = Timer.New(function ()
						if uv0:getFinishTime() - pg.TimeMgr.GetInstance():GetServerTime() > 0 then
							uv1.text = pg.TimeMgr.GetInstance():DescCDTime(slot0)
						else
							uv2.timers[uv0.id]:Stop()
							uv2._parent:update()
						end
					end, 1, -1)

					uv1.timers[slot3.id]:Start()
					uv1.timers[slot3.id].func()
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
	for slot4, slot5 in pairs(slot0.timers or {}) do
		slot5:Stop()
	end

	pg.DelegateInfo.Dispose(slot0)
end

return slot0
