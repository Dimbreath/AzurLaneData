class("ModifyGuildInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = getProxy(PlayerProxy).getData(slot3)
	slot5 = pg.gameset.modify_guild_cost.key_value

	if type == 1 and slot4:getTotalGem() < slot5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

		return
	end

	function slot6()
		pg.ConnectionMgr.GetInstance():Send(60026, {
			type = slot0.type,
			int = slot0.int,
			str = slot0.string
		}, 60027, function (slot0)
			if slot0.result == 0 then
				if slot0.type == 1 then
					slot1:consume({
						gem = slot1
					})
					slot3:updatePlayer(slot3.updatePlayer)
				end

				slot4:sendNotification(GAME.MODIFY_GUILD_INFO_DONE)
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_info_update"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_modify_erro", slot0.result))
			end
		end)
	end

	if slot2.type == 1 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("guild_modify_info_tip", slot5),
			onYes = function ()
				slot0()
			end
		})
	else
		slot6()
	end
end

return class("ModifyGuildInfoCommand", pm.SimpleCommand)
