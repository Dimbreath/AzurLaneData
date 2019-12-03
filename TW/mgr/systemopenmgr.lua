pg = pg or {}
pg.SystemOpenMgr = singletonClass("SystemOpenMgr")
slot1 = true
slot2 = pg.open_systems_limited

function pg.SystemOpenMgr.Init(slot0, slot1)
	print("initializing SystemOpenMgr manager...")
	slot1()
end

slot3 = pm.Facade.sendNotification

function pm.Facade.sendNotification(slot0, slot1, slot2, slot3)
	if slot0 and slot1 == GAME.LOAD_SCENE and getProxy(PlayerProxy) then
		slot6 = slot2.context.mediator.__cname

		if slot4:getData() then
			slot7, slot8 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot5.level, slot6)

			if not slot7 then
				pg.TipsMgr.GetInstance():ShowTips(slot8)

				return
			end
		end
	end

	slot1(slot0, slot1, slot2, slot3)
end

function pg.SystemOpenMgr.isOpenSystem(slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.all) do
		if slot0[slot7].mediator == slot2 and slot1 < slot0[slot7].level then
			return false, i18n("no_open_system_tip", slot0[slot7].name, slot0[slot7].level)
		end
	end

	return true
end

function slot4(slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		if slot0[slot7].level <= slot0 then
			return slot8
		end
	end
end

function pg.SystemOpenMgr.notification(slot0, slot1)
	if not slot0 then
		return
	end

	if slot1(slot1, getProxy(PlayerProxy).getData(slot2)) and not pg.MsgboxMgr.GetInstance()._go.activeSelf and slot4.story_id and slot4.story_id ~= "" and not slot0.active and not pg.StoryMgr.GetInstance():IsPlayed(slot4.story_id) and not pg.SeriesGuideMgr.GetInstance():isNotFinish() then
		slot0.active = true

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("open_system_tip", slot4.name),
			weight = LayerWeightConst.TOP_LAYER,
			onYes = function ()
				slot0:doSystemGuide(slot1.id)
			end
		})
	end
end

function pg.SystemOpenMgr.doSystemGuide(slot0, slot1)
	if Application.isEditor and not ENABLE_GUIDE then
		return
	end

	if pg.open_systems_limited[slot1].story_id and slot3 ~= "" then
		if getProxy(ContextProxy):getCurrentContext().scene ~= SCENE[slot2.scene] then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE[slot2.scene])
		end

		if slot1 == 4 and getProxy(ChapterProxy):getActiveChapter() then
			pg.m02:sendNotification(GAME.CHAPTER_OP, {
				type = ChapterConst.OpRetreat
			})
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(slot3, {}, function ()
			slot0.active = nil
		end)
	end
end

return
