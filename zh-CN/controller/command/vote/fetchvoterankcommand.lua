class("FetchVoteRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(17203, {
		type = slot1:getBody().type
	}, 17204, function (slot0)
		slot0:callback()
	end)
end

return class("FetchVoteRankCommand", pm.SimpleCommand)
