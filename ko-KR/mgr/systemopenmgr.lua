pg = pg or {}
pg.SystemOpenMgr = singletonClass("SystemOpenMgr")
slot0 = pg.SystemOpenMgr
slot1 = true
slot2 = pg.open_systems_limited

function slot0.Init(slot0, slot1)
	print("initializing SystemOpenMgr manager...")
	slot1()
end

slot3 = pm.Facade.sendNotification

function pm.Facade.sendNotification(slot0, slot1, slot2, slot3)
	if uv0 and slot1 == GAME.LOAD_SCENE and getProxy(PlayerProxy) then
		if slot4:getData() then
			slot7, slot8 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot5.level, slot2.context.mediator.__cname)

			if not slot7 then
				pg.TipsMgr.GetInstance():ShowTips(slot8)

				return
			end
		end
	end

	uv1(slot0, slot1, slot2, slot3)
end

function slot0.isOpenSystem(slot0, slot1, slot2)
	for slot6, slot7 in pairs(uv0.all) do
		if uv0[slot7].mediator == slot2 and slot1 < uv0[slot7].level then
			return false, i18n("no_open_system_tip", uv0[slot7].name, uv0[slot7].level)
		end
	end

	return true
end

function slot4(slot0, slot1)
	for slot6, slot7 in pairs(_.sort(uv0.all, function (slot0, slot1)
		return uv0[slot1].level < uv0[slot0].level
	end)) do
		if uv0[slot7].level <= slot0 then
			return slot8
		end
	end
end

function slot0.notification(slot0, slot1)
	if not uv0 then
		return
	end

	if uv1(slot1, getProxy(PlayerProxy):getData()) and not pg.MsgboxMgr.GetInstance()._go.activeSelf and slot4.story_id and slot4.story_id ~= "" and not slot0.active and not pg.StoryMgr.GetInstance():IsPlayed(slot4.story_id) and not pg.SeriesGuideMgr.GetInstance():isNotFinish() then
		slot0.active = true
		slot7.content = i18n("open_system_tip", slot4.name)
		slot7.weight = LayerWeightConst.TOP_LAYER

		function slot7.onYes()
			uv0:doSystemGuide(uv1.id)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true
		})
	end
end

function slot0.doSystemGuide(slot0, slot1)
	if Application.isEditor and not ENABLE_GUIDE then
		return
	end

	if pg.open_systems_limited[slot1].story_id and slot3 ~= "" then
		if getProxy(ContextProxy):getCurrentContext().scene ~= SCENE[slot2.scene] then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE[slot2.scene])
		end

		if slot1 == 4 and getProxy(ChapterProxy):getActiveChapter() then
			slot8.type = ChapterConst.OpRetreat

			pg.m02:sendNotification(GAME.CHAPTER_OP, {})
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(slot3, {}, function ()
			uv0.active = nil
		end)
	end
end
