pg = pg or {}
pg.ConnectionMgr = singletonClass("ConnectionMgr")
slot2 = createLog("ConnectionMgr", LOG_CONNECTION)
slot3, slot4, slot5, slot6 = nil
slot7 = false
slot8 = {}
slot9, slot10, slot11, slot12 = nil
pg.ConnectionMgr.needStartSend = false

function pg.ConnectionMgr.Connect(slot0, slot1, slot2, slot3, slot4)
	slot0.erroCode = slot4

	slot2.UIMgr.GetInstance():LoadingOn()
	slot1.onConnected:AddListener(function ()
		slot0.UIMgr.GetInstance():LoadingOff()
		slot0.UIMgr.GetInstance()("Network Connected.")

		slot2 = slot3
		slot4 = slot5
		slot0 = slot6 or slot0.SendWindow.New(slot7, 0)

		slot8.onData:AddListener(slot6.onData)

		slot9 = true
		slot10 = false

		slot11()
		slot7:resetHBTimer()
	end)
	slot1.onData:AddListener(slot0.onData)
	slot1.onError:AddListener(slot0.onError)
	slot1.onDisconnected:AddListener(slot0.onDisconnected)

	slot8 = true

	slot1:Connect()
end

function pg.ConnectionMgr.ConnectByDomain(slot0, slot1, slot2)
	slot0:Connect(LuaHelper.getHostByDomain(slot1), DEFAULT_PORT, slot2)
end

function pg.ConnectionMgr.Reconnect(slot0, slot1)
	if not slot0 or not slot1 then
		warning("Network is not connected.")

		return
	end

	if slot2 then
		warning("connecting, please wait...")

		return
	end

	slot3 = slot1

	slot0:stopHBTimer()
	slot4:stopTimer()
	print("reconnect --> " .. slot0:GetLastHost() .. ":" .. slot0:GetLastPort())
	slot0:Connect(slot0:GetLastHost(), slot0:GetLastPort(), function ()
		slot0 = getProxy(UserProxy)
		slot1 = slot0:getData()

		if slot0.SdkMgr.GetInstance():GetChannelUID() == "" then
			slot2 = PLATFORM_LOCAL
		end

		if not slot1 or not slot1:isLogin() then
			if slot1.currentCS == 10020 and slot2 ~= DISCONNECT_TIME_OUT then
				slot3.needStartSend = false

				slot1:StartSend()
			else
				slot0.m02:sendNotification(GAME.LOGOUT, {
					code = 3
				})
			end

			return
		end

		slot1:Send(10022, {
			platform = slot2,
			account_id = slot1.uid,
			server_ticket = slot1.token,
			serverid = slot1.server,
			check_key = HashUtil.CalcMD5(slot1.token .. AABBUDUD),
			device_id = slot0.SdkMgr.GetInstance():GetDeviceId()
		}, 10023, function (slot0)
			if slot0.result == 0 then
				print("reconnect success: " .. slot0.user_id, " - ", slot0.server_ticket)

				slot0.token = slot0.server_ticket

				slot0:setLastLogin(slot0)
				slot2()

				if slot0 ~= DISCONNECT_TIME_OUT and slot4:getPacketIdx() > 0 then
					slot5.needStartSend = false

					slot4:Send(11001, {
						timestamp = 1
					}, 11002, function (slot0)
						slot0.TimeMgr.GetInstance():SetServerTime(slot0.timestamp, slot0.monday_0oclock_timestamp)
						slot0.m02:sendNotification(GAME.CHANGE_CHAT_ROOM, 0)
					end)
				elseif slot5.needStartSend then
					slot5.needStartSend = false

					slot4:StartSend()
				end

				slot3 = nil

				if getProxy(PlayerProxy) and slot1:getInited() then
					slot6.SecondaryPWDMgr:GetInstance():FetchData()
				end

				slot6.GuideMgr:GetInstance():onReconneceted()
			else
				print("reconnect failed: " .. slot0.result)
				slot6.m02:sendNotification(GAME.LOGOUT, {
					code = 99,
					tip = slot0.result
				})
			end
		end, false, false)
	end)
end

function pg.ConnectionMgr.onDisconnected(slot0, slot1)
	slot0("Network onDisconnected: " .. tostring(slot0))

	slot1 = slot1

	if slot0 then
		if not slot0 then
			slot2.onDisconnected:RemoveAllListeners()
		end

		slot2:Dispose()

		slot2 = nil
	end

	if slot0 then
		slot3 = false
	end

	if slot4 then
		slot5.UIMgr.GetInstance():LoadingOff()
	end

	slot4 = false
end

function pg.ConnectionMgr.onData(slot0)
	if slot0[slot0.cmd] then
		slot1 = slot1.Packer.GetInstance():Unpack(slot0.cmd, slot0:getLuaStringBuffer())

		for slot5, slot6 in ipairs(slot0[slot0.cmd]) do
			slot6(slot1)
		end
	end
end

function pg.ConnectionMgr.onError(slot0)
	slot0.UIMgr.GetInstance():LoadingOff()
	tostring(slot0)("Network Error: " .. tostring(slot0))

	if "Network Error: " .. tostring(slot0) then
		slot2:Dispose()

		slot2 = nil
	end

	function slot1()
		slot0.m02.sendNotification(slot1, GAME.LOGOUT, {
			code = slot1.erroCode or 3
		})
	end

	function slot2()
		return
	end

	if slot4 then
		slot4 = false
		slot2 = slot5
	end

	slot0.ConnectionMgr.GetInstance():CheckProxyCounter()

	if slot6 and slot7 then
		slot0.ConnectionMgr.GetInstance():stopHBTimer()

		if table.contains({
			"NotSocket"
		}, slot0) then
			slot0.ConnectionMgr.GetInstance():Reconnect(slot2)
		else
			slot0.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				content = i18n("reconnect_tip", slot0),
				onYes = function ()
					slot0.ConnectionMgr.GetInstance():Reconnect(slot0.ConnectionMgr.GetInstance())
				end,
				onNo = slot1,
				weight = LayerWeightConst.TOP_LAYER
			})
			slot0.GuideMgr.GetInstance():onDisconnected()
		end
	else
		slot1()
	end
end

function pg.ConnectionMgr.Send(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	if not slot0 then
		warning("Network is not connected. msgid " .. slot1)
		slot1.m02:sendNotification(GAME.LOGOUT, {
			code = 5
		})

		return
	end

	slot2:Queue(slot1, slot2, slot3, slot4, slot5, nil, slot6)
end

function pg.ConnectionMgr.setPacketIdx(slot0, slot1)
	slot0:setPacketIdx(slot1)
end

function pg.ConnectionMgr.On(slot0, slot1, slot2)
	if slot0[slot1] == nil then
		slot0[slot1] = {}
	end

	table.insert(slot0[slot1], slot2)
end

function pg.ConnectionMgr.Off(slot0, slot1, slot2)
	if slot0[slot1] == nil then
		return
	end

	if slot2 == nil then
		slot0[slot1] = nil
	else
		for slot6, slot7 in ipairs(slot0[slot1]) do
			if slot7 == slot2 then
				table.remove(slot0[slot1], slot6)

				break
			end
		end
	end
end

function pg.ConnectionMgr.Disconnect(slot0)
	slot0:stopHBTimer()

	slot0 = {}

	("Manually Disconnect !!!")

	if "Manually Disconnect !!!" then
		slot2:Dispose()

		slot2 = nil
	end

	slot3 = nil
	slot4 = nil
	lastProxyHost = nil
	lastProxyPort = nil
	slot5 = nil
	slot6 = false
end

function pg.ConnectionMgr.getConnection(slot0)
	return slot0
end

function pg.ConnectionMgr.isConnecting(slot0)
	return slot0
end

function pg.ConnectionMgr.isConnected(slot0)
	return slot0
end

function pg.ConnectionMgr.stopHBTimer(slot0)
	if slot0 then
		slot0:Stop()

		slot0 = nil
	end
end

function pg.ConnectionMgr.resetHBTimer(slot0)
	slot0:stopHBTimer()
	slot0:Start()
end

slot13 = 0
slot14 = 2
slot15, slot16 = nil

function pg.ConnectionMgr.SetProxyHost(slot0, slot1, slot2)
	print("Proxy host --> " .. slot1 .. ":" .. slot2)
end

function pg.ConnectionMgr.GetLastHost(slot0)
	if VersionMgr.Inst:OnProxyUsing() and slot0 ~= nil and slot0 ~= "" then
		return slot0
	end

	return slot1
end

function pg.ConnectionMgr.GetLastPort(slot0)
	if VersionMgr.Inst:OnProxyUsing() and slot0 ~= nil and slot0 ~= 0 then
		return slot0
	end

	return slot1
end

function pg.ConnectionMgr.CheckProxyCounter(slot0)
	slot0 = slot0 + 1

	if not VersionMgr.Inst:OnProxyUsing() then
		if slot0 ==  then
			VersionMgr.Inst:SetUseProxy(true)
		end
	else
		VersionMgr.Inst:SetUseProxy(false)

		slot0 = 0
	end
end

return
