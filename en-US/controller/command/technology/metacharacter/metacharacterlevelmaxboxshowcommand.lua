slot0 = class("MetaCharacterLevelMaxBoxShowCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not NEW_META_EXP then
		if not getProxy(MetaCharacterProxy) then
			return
		end

		slot2:clearMetaSkillLevelMaxInfoList()

		return
	end

	slot2 = slot1:getBody()

	if not getProxy(MetaCharacterProxy) then
		return
	end

	if not getProxy(ChapterProxy):getActiveChapter() then
		return
	end

	if slot4:GetChapterAutoFlag(slot5.id) == 1 then
		return
	end

	if slot3:getMetaSkillLevelMaxInfoList() and #slot7 > 0 then
		slot8 = ""

		for slot12, slot13 in ipairs(slot7) do
			slot15 = slot13.metaSkillID
			slot16 = setColorStr(HXSet.hxLan(slot13.metaShipVO:getName()), COLOR_RED)
			slot8 = slot12 < #slot7 and slot8 .. slot16 .. ", " or slot8 .. slot16 .. ", " .. slot16
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("meta_skill_maxtip", slot8),
			onYes = function ()
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.METACHARACTER, {
					autoOpenTactics = true,
					autoOpenShipConfigID = uv0[1].metaShipVO.configId
				})
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	end

	slot3:clearMetaSkillLevelMaxInfoList()
end

return slot0
