slot0 = class("LevelDifficultySelLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "LevelDifficultySelUI"
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setMaps(slot0, slot1)
	slot0.maps = slot1
end

function slot0.init(slot0)
	slot0.easyBtn = slot0:findTF("bg/frame/option_easy")
	slot0.difficultyBtn = slot0:findTF("bg/frame/option_difficulty")
end

function slot0.isClearEasyMaps(slot0)
	for slot4, slot5 in pairs(slot0.maps) do
		if slot5:getConfig("type") == Map.ACTIVITY_EASY and not slot5:isClearForActivity() then
			return false
		end
	end

	return true
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("top/back"), function ()
		uv0:emit(uv1.ON_CLOSE)
	end)
	onButton(slot0, slot0.easyBtn, function ()
		if ActivityConst.SWITCH_ACT_MAP_LIMIT then
			slot2.content = i18n("activity_level_easy_tip")

			function slot2.onYes()
				uv0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_EASY)
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true
			})
		else
			uv0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_EASY)
		end
	end)
	onButton(slot0, slot0.difficultyBtn, function ()
		if ActivityConst.SWITCH_ACT_MAP_LIMIT then
			if uv0.playerVO.level >= 50 or uv0:isClearEasyMaps() then
				slot3.content = i18n("activity_level_difficulty_tip")

				function slot3.onYes()
					uv0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_HARD)
				end

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true
				})
			else
				slot3.content = i18n("activity_level_limit_tip")

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true
				})
			end
		else
			uv0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_HARD)
		end
	end)
end

return slot0
