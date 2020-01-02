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
