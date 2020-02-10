slot0 = class("UserRegisterCommand", pm.SimpleCommand)

function slot0.execute(slot0, slot1)
	if slot1:getBody().type ~= 2 then
		print("用户类型错误")

		return
	end

	print("connect to gateway - " .. NetConst.GATEWAY_HOST .. ":" .. NetConst.GATEWAY_PORT)
	pg.ConnectionMgr.GetInstance():Connect(NetConst.GATEWAY_HOST, NetConst.GATEWAY_PORT, function ()
		slot3.account = uv0.arg1
		slot3.password = uv0.arg2
		slot3.mail_box = uv0.arg3

		pg.ConnectionMgr.GetInstance():Send(10001, {}, 10002, function (slot0)
			print("disconnect from gateway...")
			pg.ConnectionMgr.GetInstance():Disconnect()

			if slot0.result == 0 then
				uv0.facade:sendNotification(GAME.USER_REGISTER_SUCCESS, uv1)
			else
				uv0.facade:sendNotification(GAME.USER_REGISTER_FAILED, slot0.result)
			end
		end, false)
	end)
end

return slot0
