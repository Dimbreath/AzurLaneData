slot0 = class("ModifyGuildInfoCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot2 = slot1:getBody()

	if type == 1 and getProxy(PlayerProxy):getData():getTotalGem() < pg.gameset.modify_guild_cost.key_value then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

		return
	end

	function slot6()
		slot3.type = uv0.type
		slot3.int = uv0.int
		slot3.str = uv0.string

		pg.ConnectionMgr.GetInstance():Send(60026, {}, 60027, function (slot0)
			if slot0.result == 0 then
				if uv0.type == 1 then
					slot3.gem = uv2

					uv1:consume({})
					uv3:updatePlayer(uv1)
				end

				uv4:sendNotification(GAME.MODIFY_GUILD_INFO_DONE)
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_info_update"))
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("guild_modify_erro", slot0.result))
			end
		end)
	end

	if slot2.type == 1 then
		slot9.content = i18n("guild_modify_info_tip", slot5)

		function slot9.onYes()
			uv0()
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({})
	else
		slot6()
	end
end

return slot0
