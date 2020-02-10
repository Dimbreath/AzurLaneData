slot0 = class("FetchVoteRankCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	slot6.type = slot1:getBody().type

	pg.ConnectionMgr.GetInstance():Send(17203, {}, 17204, function (slot0)
		uv0.callback(slot0)
	end)
end

return slot0
