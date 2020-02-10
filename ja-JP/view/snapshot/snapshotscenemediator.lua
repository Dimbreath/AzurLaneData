slot0 = class("SnapshotSceneMediator", import("..base.ContextMediator"))

function slot0.register(slot0)
	slot0:bind(SnapshotScene.SELECT_CHAR_PANEL, function (slot0)
		slot4.mediator = SnapshotSelectCharMediator
		slot4.viewComponent = SnapshotSelectCharLayer

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(SnapshotScene.SHARE_PANEL, function (slot0, slot1, slot2)
		slot6.mediator = SnapshotShareMediator
		slot6.viewComponent = SnapshotShareLayer
		slot7.photoTex = slot1
		slot7.photoData = slot2
		slot6.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
end

function slot0.listNotificationInterests(slot0)
	slot1[1] = SnapshotSelectCharMediator.SELECT_CHAR
	slot1[2] = PERMISSION_GRANTED
	slot1[3] = PERMISSION_REJECT
	slot1[4] = PERMISSION_NEVER_REMIND

	return {}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == SnapshotSelectCharMediator.SELECT_CHAR then
		slot0.viewComponent:setSkin(slot1:getBody())
	elseif PERMISSION_GRANTED == slot2 then
		if slot3 == ANDROID_RECORD_AUDIO_PERMISSION then
			slot0.viewComponent:changeToTakeVideo()
		end
	elseif PERMISSION_REJECT == slot2 then
		if slot3 == ANDROID_RECORD_AUDIO_PERMISSION then
			slot6.content = i18n("apply_permission_record_audio_tip3")

			function slot6.onYes()
				slot1[1] = ANDROID_RECORD_AUDIO_PERMISSION

				ApplyPermission({})
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end
	elseif PERMISSION_NEVER_REMIND and slot3 == ANDROID_RECORD_AUDIO_PERMISSION then
		slot6.content = i18n("apply_permission_record_audio_tip2")

		function slot6.onYes()
			OpenDetailSetting()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	end
end

return slot0
