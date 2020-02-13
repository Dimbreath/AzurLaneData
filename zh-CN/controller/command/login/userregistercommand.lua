class("UserRegisterCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if slot1:getBody().type ~= 2 then
		print("用户类型错误")

		return
	end

	print("connect to gateway - " .. NetConst.GATEWAY_HOST .. ":" .. NetConst.GATEWAY_PORT)
	pg.ConnectionMgr.GetInstance():Connect(NetConst.GATEWAY_HOST, NetConst.GATEWAY_PORT, function ()
		pg.ConnectionMgr.GetInstance():Send(10001, {
			account = slot0.arg1,
			password = slot0.arg2,
			mail_box = slot0.arg3
		}, 10002, function (slot0)
			print("disconnect from gateway...")
			pg.ConnectionMgr.GetInstance():Disconnect()

			if slot0.result == 0 then
				slot0.facade:sendNotification(GAME.USER_REGISTER_SUCCESS, slot0.facade.sendNotification)
			else
				slot0.facade:sendNotification(GAME.USER_REGISTER_FAILED, slot0.result)
			end
		end, false)
	end)
end

return class("UserRegisterCommand", pm.SimpleCommand)
