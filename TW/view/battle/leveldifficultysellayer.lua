slot0 = class("LevelDifficultySelLayer", import("..base.BaseUI"))

slot0.getUIName = function (slot0)
	return "LevelDifficultySelUI"
end

slot0.setPlayerVO = function (slot0, slot1)
	slot0.playerVO = slot1
end

slot0.setMaps = function (slot0, slot1)
	slot0.maps = slot1
end

slot0.init = function (slot0)
	slot0.easyBtn = slot0:findTF("bg/frame/option_easy")
	slot0.difficultyBtn = slot0:findTF("bg/frame/option_difficulty")
end

slot0.isClearEasyMaps = function (slot0)
	for slot4, slot5 in pairs(slot0.maps) do
		if slot5:getConfig("type") == Map.ACTIVITY_EASY and not slot5:isClearForActivity() then
			return false
		end
	end

	return true
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0:findTF("top/back"), function ()
		slot0:emit(slot1.ON_CLOSE)
	end)
	onButton(slot0, slot0.easyBtn, function ()
		if ActivityConst.SWITCH_ACT_MAP_LIMIT then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				content = i18n("activity_level_easy_tip"),
				onYes = function ()
					slot0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_EASY)
				end
			})
		else
			slot0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_EASY)
		end
	end)
	onButton(slot0, slot0.difficultyBtn, function ()
		if ActivityConst.SWITCH_ACT_MAP_LIMIT then
			if slot0.playerVO.level >= 50 or slot0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					content = i18n("activity_level_difficulty_tip"),
					onYes = function ()
						slot0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_HARD)
					end
				})
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("activity_level_limit_tip")
				})
			end
		else
			slot0:emit(LevelDifficultySelMediator.GO_LEVEL_SENCE, Map.ACTIVITY_HARD)
		end
	end)
end

return slot0
