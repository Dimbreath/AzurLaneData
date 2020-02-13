class("FetchVoteInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(17203, {
		type = slot1:getBody().voteId
	}, 17204, function (slot0)
		slot0:callback()
	end)
end

return class("FetchVoteInfoCommand", pm.SimpleCommand)
