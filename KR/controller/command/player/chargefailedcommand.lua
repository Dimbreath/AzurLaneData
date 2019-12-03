class("ChargeFailedCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().code

	if not slot1.getBody().payId then
		return
	end

	if not slot4 or type(slot4) ~= "number" then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11510, {
		pay_id = tostring(slot3),
		code = math.abs(slot4)
	})
end

return class("ChargeFailedCommand", pm.SimpleCommand)
