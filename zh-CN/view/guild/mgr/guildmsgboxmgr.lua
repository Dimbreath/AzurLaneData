pg = pg or {}
pg.GuildMsgBoxMgr = singletonClass("GuildMsgBoxMgr")
slot0 = pg.GuildMsgBoxMgr

function slot0.Ctor(slot0)
	slot0.ignores = {}
	slot0.refreshTime = pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.Init(slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI("GuildMsgBoxUI", true, function (slot0)
		pg.DelegateInfo.New(uv0)

		uv0._go = slot0

		uv0._go:SetActive(false)

		uv0._tf = uv0._go.transform
		uv0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		uv0._go.transform:SetParent(uv0.UIOverlay.transform, false)

		uv0.confirmBtn = findTF(uv0._go, "frame/confirm_btn")
		uv0.cancelBtn = findTF(uv0._go, "frame/cancel_btn")

		setText(uv0.cancelBtn:Find("Text"), i18n("text_iknow"))
		setText(uv0.confirmBtn:Find("Text"), i18n("text_forward"))

		uv0.contextTxt = findTF(uv0._go, "frame/content/Text"):GetComponent(typeof(Text))

		onButton(uv0, uv0.cancelBtn, function ()
			uv0:Hide()
		end, SFX_PANEL)
		onButton(uv0, uv0._tf, function ()
			uv0:Hide()
		end, SFX_PANEL)
		onButton(uv0, findTF(uv0._go, "frame/close"), function ()
			uv0:Hide()
		end, SFX_PANEL)
		pg.UIMgr.GetInstance():LoadingOff()

		uv0.isInited = true

		if uv1 then
			uv1()
		end
	end)
end

function slot0.Notification(slot0, slot1)
	if slot1.condition() then
		if not slot0.isInited then
			slot0:Init(function ()
				uv0:RefreshView(uv1)
			end)
		else
			slot0:RefreshView(slot1)
		end
	end
end

function slot0.RefreshView(slot0, slot1)
	slot0.settings = slot1

	setActive(slot0._tf, true)

	slot0.contextTxt.text = slot1.content or ""

	onButton(slot0, slot0.confirmBtn, function ()
		if uv0.OnYes then
			uv0.OnYes()
		end

		uv1:Hide()
	end, SFX_PANEL)
	pg.UIMgr:GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.TOP_LAYER,
		blurCamList = slot1.blurCamList
	})
	slot0._tf:SetAsLastSibling()
end

function slot0.Hide(slot0)
	if slot0._tf and isActive(slot0._tf) then
		if slot0.settings.OnHide then
			slot0.settings.OnHide()
		end

		slot0.settings = nil

		pg.UIMgr:GetInstance():UnblurPanel(slot0._tf, slot0.UIOverlay)
		setActive(slot0._tf, false)
	end
end

function slot0.Destroy(slot0)
	if slot0.isInited then
		pg.DelegateInfo.Dispose(slot0)

		slot0.isInited = nil

		Destroy(slot0._go)
	end
end

function slot0.NotificationForGuildEvent(slot0, slot1)
	if getProxy(GuildProxy):getRawData() then
		if slot2:GetActiveWeeklyTask() and slot1.id == slot3:GetPresonTaskId() then
			slot0:Notification({
				condition = function ()
					return uv0:SamePrivateTaskType(GuildTask.PRIVATE_TASK_TYPE_EVENT) and uv0:PrivateBeFinished()
				end,
				content = i18n("guild_mission_complate", slot3:GetPrivateTaskName()),
				OnYes = function ()
					pg.m02:sendNotification(GuildMainMediator.SWITCH_TO_OFFICE)
				end
			})
		end
	end
end

function slot0.OnBeginBattle(slot0)
	print("record.......................")

	if not getProxy(GuildProxy) then
		return
	end

	if getProxy(GuildProxy):getRawData() then
		slot0.taskFinished = slot1:GetActiveWeeklyTask() and slot2:PrivateBeFinished() and slot2:SamePrivateTaskType(GuildTask.PRIVATE_TASK_TYPE_BATTLE)

		print("taskFinished : ", slot0.taskFinished)
	end
end

function slot0.OnFinishBattle(slot0, slot1)
	if not getProxy(GuildProxy) then
		return
	end

	if getProxy(GuildProxy):getRawData() and slot1 and SYSTEM_SCENARIO <= slot1.system and slot1.system <= SYSTEM_WORLD then
		if not slot0.taskFinished and (slot2:GetActiveWeeklyTask() and slot3:PrivateBeFinished() and slot3:SamePrivateTaskType(GuildTask.PRIVATE_TASK_TYPE_BATTLE)) then
			slot0.shouldShowBattleTip = true
		end

		print("shouldShowBattleTip : ", slot0.shouldShowBattleTip)
	end

	slot0.taskFinished = nil
end

function slot0.NotificationForBattle(slot0, slot1)
	print("shouldShowBattleTip 2 :", slot0.shouldShowBattleTip)

	if slot0.shouldShowBattleTip then
		if getProxy(GuildProxy):getRawData() and slot2:GetActiveWeeklyTask() then
			slot5 = {
				pg.UIMgr.CameraLevel
			}

			if getProxy(ChapterProxy):getActiveChapter() and slot4:CheckChapterWin() then
				slot5 = nil
			end

			slot0:Notification({
				condition = function ()
					return true
				end,
				content = i18n("guild_mission_complate", slot3:GetPrivateTaskName()),
				OnYes = function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GUILD, {
						page = "office"
					})
				end,
				blurCamList = slot5,
				OnHide = slot1
			})
		elseif slot1 then
			slot1()
		end
	elseif slot1 then
		slot1()
	end

	slot0.shouldShowBattleTip = nil
end

function slot0.NotificationForDailyBattle(slot0)
	if slot0.shouldShowBattleTip and getProxy(GuildProxy):getRawData() and slot1:GetActiveWeeklyTask() then
		slot0:Notification({
			condition = function ()
				return true
			end,
			content = i18n("guild_mission_complate", slot2:GetPrivateTaskName()),
			OnYes = function ()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GUILD, {
					page = "office"
				})
			end
		})
	end

	slot0.shouldShowBattleTip = nil
end

function slot0.NotificationForWorld(slot0, slot1)
	if slot0.shouldShowBattleTip then
		if getProxy(GuildProxy):getRawData() and slot2:GetActiveWeeklyTask() then
			slot0:Notification({
				condition = function ()
					return true
				end,
				content = i18n("guild_mission_complate", slot3:GetPrivateTaskName()),
				OnYes = function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GUILD, {
						page = "office"
					})
				end,
				OnHide = slot1
			})
		elseif slot1 then
			slot1()
		end
	elseif slot1 then
		slot1()
	end

	slot0.shouldShowBattleTip = nil
end

function slot0.NotificationForMain(slot0)
	if not getProxy(GuildProxy):getRawData() then
		return
	end

	if not slot1:GetActiveEvent() or not slot2:IsParticipant() then
		return
	end

	function slot3()
		uv0:Notification({
			condition = function ()
				slot2, slot3 = getProxy(GuildProxy):getRawData():GetActiveEvent():AnyMissionFirstFleetCanFroamtion()

				if slot2 and not table.contains(uv0.ignores, slot3.id) then
					table.insert(uv0.ignores, slot3.id)

					return true
				end

				return false
			end,
			content = i18n("guild_operation_event_occurrence"),
			OnYes = function ()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.GUILD, {
					page = "battle"
				})
			end
		})
	end

	function slot4(slot0, slot1)
		pg.m02:sendNotification(GAME.GUILD_REFRESH_MISSION, {
			force = true,
			id = slot0,
			callback = slot1
		})

		uv0.refreshTime = pg.TimeMgr.GetInstance():GetServerTime()
	end

	slot5 = pg.TimeMgr.GetInstance():GetServerTime() - slot0.refreshTime > 900
	slot6, slot7 = slot2:AnyMissionFirstFleetCanFroamtion()

	if slot6 and slot7 and table.contains(slot0.ignores, slot7.id) then
		return
	end

	if slot6 then
		slot3()
	elseif slot5 then
		if slot2:GetUnlockMission() then
			slot4(slot8.id, function ()
				if uv0:GetUnlockMission() and slot0.id ~= uv1 then
					uv2(slot0.id, uv3)
				else
					uv3()
				end
			end)

			return
		end

		slot3()
	else
		slot3()
	end
end

function slot0.GetShouldShowBattleTip(slot0)
	return slot0.shouldShowBattleTip
end

function slot0.CancelShouldShowBattleTip(slot0)
	slot0.shouldShowBattleTip = nil
end
