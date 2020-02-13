ys = ys or {}
ys.Battle.BattleBuffStory = class("BattleBuffStory", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffStory.__name = "BattleBuffStory"

function ys.Battle.BattleBuffStory.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffStory.SetArgs(slot0, slot1, slot2)
	slot0._storyID = slot0._tempData.arg_list.story_id
	slot0._countType = slot0._tempData.arg_list.countType
end

function ys.Battle.BattleBuffStory.doOnHPRatioUpdate(slot0, slot1, slot2, slot3)
	pg.StoryMgr.GetInstance():Play(slot0._storyID)
end

return
