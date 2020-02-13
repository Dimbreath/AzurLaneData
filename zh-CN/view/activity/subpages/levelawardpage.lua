slot0 = class("LevelAwardPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("bg")
	slot0.award = slot0:findTF("scroll/award")
	slot0.content = slot0:findTF("scroll/content")
	slot0.scrollTF = slot0:findTF("scroll")
	slot0.pageSignDownTF = slot0:findTF("sign")
	slot0.pageSignUpTF = slot0:findTF("sign_up")
end

function slot0.OnDataSetting(slot0)
	slot0.config = pg.activity_level_award[slot0.activity:getConfig("config_id")]
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	setActive(slot0.award, false)

	for slot4 = 1, #slot0.config.front_drops, 1 do
		slot7 = cloneTplTo(slot0.award, slot0.content, "award" .. tostring(slot4))
		slot9 = slot0:findTF("btnAchieve", slot7)
		slot10 = slot0:findTF("items", slot7)

		setActive(slot11, false)
		GetImageSpriteFromAtlasAsync("ui/activityuipage/level_award_atlas", tostring(slot6) .. ".png", slot8, true)

		for slot15 = 2, #slot0.config.front_drops[slot4], 1 do
			updateDrop(slot16, slot18)
			onButton(slot0, cloneTplTo(slot11, slot10), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
		end

		onButton(slot0, slot9, function ()
			slot0:emit(ActivityMediator.EVENT_OPERATION, {
				cmd = 1,
				activity_id = slot0.activity.id,
				arg1 = slot0
			})
		end, SFX_PANEL)
		onScroll(slot0, slot0.scrollTF, function (slot0)
			setActive(slot0.pageSignDownTF, slot0.y > 0.01)
			setActive(slot0.pageSignUpTF, slot0.y < 0.99)
		end)
	end
end

function slot0.OnUpdateFlush(slot0)
	for slot4 = 1, #slot0.config.front_drops, 1 do
		slot7 = slot0:findTF("btnAchieve", slot6)
		slot8 = slot0:findTF("achieve_sign", slot6)

		if _.include(slot0.activity.data1_list, slot0.config.front_drops[slot4][1]) then
			slot6.transform:SetAsLastSibling()
		end

		setGray(slot0:findTF("limit_label", slot6), slot9)
		setGray(slot0:findTF("items", slot6), slot9)
		setActive(slot8, slot9)
		setActive(slot7, slot5[1] <= slot0.shareData.player.level and not slot9)
	end
end

function slot0.OnDestroy(slot0)
	return
end

return slot0
