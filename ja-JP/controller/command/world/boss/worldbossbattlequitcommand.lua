slot0 = class("WorldBossBattleQuitCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if not slot1:getBody().id then
		return
	end

	if nowWorld:GetBossProxy():GetBossById(slot3) and not slot5:IsSelfBoss(slot6) then
		slot5:RemoveCacheBoss(slot3)

		for slot12, slot13 in ipairs(getProxy(ChatProxy):GetMessagesByUniqueId(slot3)) do
			slot13.args.isDeath = true

			slot7:UpdateMsg(slot13)
		end
	end
end

return slot0
