slot0 = class("ActivityBossSPFScene", import(".ActivityBossSceneTemplate"))

function slot0.getUIName(slot0)
	return "ActivityBossSPFUI"
end

function slot0.GetPTActivityID(slot0)
	return ActivityConst.ACTIVITY_BOSS_SPF_PT
end

return slot0
