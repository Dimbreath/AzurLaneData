pg = pg or {}
pg.SendWindow = class("SendWindow")
slot2 = nil
slot3 = false

function pg.SendWindow.Ctor(slot0, slot1, slot2)
	slot0.connectionMgr = slot1
	slot0.packetIdx = defaultValue(slot2, 0)

	if Application.isEditor and not slot0 then
		slot0 = true

		DebugMgr.Inst.onRequestResend:AddListener(slot1.onRequestResend)
	end

	slot0.isSending = false
	slot0.toSends = {}
	slot0.retryCount = 0
	slot2 = {}
end

function pg.SendWindow.setPacketIdx(slot0, slot1)
	slot0.packetIdx = slot1
end

function pg.SendWindow.getPacketIdx(slot0)
	return slot0.packetIdx
end

function pg.SendWindow.incPacketIdx(slot0)
	slot0.packetIdx = slot0.packetIdx + 1
end

if Application.isEditor then
	function slot1.serialize(slot0)
		slot1 = ""

		if type(slot0) == "number" then
			slot1 = slot1 .. slot0
		elseif slot2 == "boolean" then
			slot1 = slot1 .. tostring(slot0)
		elseif slot2 == "string" then
			slot1 = slot1 .. string.format("%q", slot0)
		elseif slot2 == "table" then
			slot1 = slot1 .. "{\n"

			for slot6, slot7 in pairs(slot0) do
				slot1 = slot1 .. "[" .. slot0.serialize(slot6) .. "]=" .. slot0.serialize(slot7) .. ",\n"
			end

			if getmetatable(slot0) ~= nil and type(slot3.__index) == "table" then
				for slot7, slot8 in pairs(slot3.__index) do
					slot1 = slot1 .. "[" .. slot0.serialize(slot7) .. "]=" .. slot0.serialize(slot8) .. ",\n"
				end
			end

			slot1 = slot1 .. "}"
		elseif slot2 == "nil" then
			return nil
		else
			warning("can not serialize a " .. slot2 .. " type.")

			return nil
		end

		return slot1
	end

	function slot1.unserialize(slot0)
		if type(slot0) == "nil" or slot0 == "" then
			return nil
		elseif slot1 == "number" or slot1 == "string" or slot1 == "boolean" then
			slot0 = tostring(slot0)
		else
			warning("can not unserialize a " .. slot1 .. " type.")

			return nil
		end

		if loadstring("return " .. slot0) == nil then
			return nil
		end

		return slot2()
	end
end

function slot1.Queue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	table.insert(slot0.toSends, {
		slot1,
		slot2,
		slot3,
		slot4 and function (slot0)
			table.remove(slot0.toSends, 1)

			if Application.isEditor then
				slot1(slot2, slot3, slot2.serialize(DebugMgr.Inst.PushProtoSent) or "", )
			end

			slot5(slot0)

			if slot0 and slot0.result and slot0.result == 0 then
				slot6.SeriesGuideMgr.GetInstance():receiceProtocol(slot4, , slot0)
			end
		end,
		slot5,
		slot6,
		slot7
	})

	if slot0.isSending then
		return
	end

	slot0:StartSend()
end

function slot1.StartSend(slot0)
	if #slot0.toSends > 0 then
		slot0:Send(unpack(slot0.toSends[1]))
	else
		warning("No more packets to send.")
	end
end

function slot1.Send(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0.isSending = true
	slot0.currentCS = slot1

	if slot0.connectionMgr:isConnecting() then
		slot0.connectionMgr.needStartSend = true

		return
	end

	if not slot0.connectionMgr:getConnection() then
		slot0.connectionMgr.needStartSend = true

		slot0.connectionMgr:Reconnect(function ()
			return
		end)

		return
	end

	slot5 = defaultValue(slot5, true)
	slot6 = defaultValue(slot6, true)
	slot7 = defaultValue(slot7, SEND_TIMEOUT)
	slot9 = slot0:getPacketIdx()

	if slot3 ~= nil then
		slot0.UIMgr.GetInstance():LoadingOn()

		slot10 = nil

		slot1[(slot5 and slot3 .. "_" .. slot9) or slot3] = function (slot0)
			slot0.isSending = false

			slot0.UIMgr.GetInstance():LoadingOff()
			slot0.connectionMgr:resetHBTimer()

			if slot0.timer then
				slot0.timer:Stop()

				slot0.timer = nil
			end

			slot2(slot0)

			if slot3 and not slot0.isSending and #slot0.toSends > 0 then
				slot0:StartSend()
			end
		end

		slot0.timer = Timer.New(function ()
			slot0.UIMgr.GetInstance():LoadingOff()

			slot0.UIMgr.GetInstance()[slot2] = nil

			slot3:setPacketIdx(slot4)

			if slot3.retryCount > 3 then
				slot3.connectionMgr.onDisconnected(false, DISCONNECT_TIME_OUT)

				slot3.retryCount = 0
			end

			warning("Network is timedOut, resend: " .. slot4 .. ", protocal: " .. slot5)

			slot3.retryCount = slot3.retryCount + 1

			slot3:StartSend()
		end, slot7, 1)

		slot0.timer:Start()
	else
		slot5 = false
	end

	function (slot0, slot1)
		for slot5, slot6 in pairs(slot1) do
			if type(slot6) == "table" then
				for slot10, slot11 in ipairs(slot6) do
					if slot0[slot5].add then
						slot0(slot0[slot5]:add(), slot11)
					else
						slot0[slot5]:append(slot11)
					end
				end
			else
				slot0[slot5] = slot6
			end
		end
	end(slot0.Packer.GetInstance():GetProtocolWithName("cs_" .. slot1).GetMessage(slot10), slot2)

	if slot5 then
		slot8:Send(slot0.Packer.GetInstance():Pack(slot9, slot10:GetId(), slot12))
		print("Network sent protocol: " .. slot1 .. " with idx: " .. slot9)
		slot0:incPacketIdx()
	else
		slot8:Send(slot0.Packer.GetInstance():Pack(0, slot10:GetId(), slot12))
		print("Network sent protocol: " .. slot1 .. " without idx")
	end

	if not slot3 then
		table.remove(slot0.toSends, 1)

		if Application.isEditor then
			DebugMgr.Inst:PushProtoSent(slot1, slot2:serialize() or "", 0)
		end

		if #slot0.toSends > 0 then
			slot0:StartSend()
		else
			slot0.isSending = false
		end
	end
end

function slot1.stopTimer(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

function slot1.onData(slot0)
	print("Network Receive idx: " .. slot0.idx .. " cmd: " .. slot0.cmd)

	if slot1[slot0.cmd .. "_" .. slot0.idx] then
		slot1[slot2](slot1)

		slot1[slot2] = nil
	elseif slot1[slot0.cmd] then
		slot1[slot0.cmd](slot1)

		slot1[slot0.cmd] = nil
	end
end

if Application.isEditor then
	function slot1.onRequestResend(slot0)
		if slot0.unserialize(slot0.sndState) then
			if slot0.scProNr > 0 then
				slot1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1, slot0.scProNr, function (slot0)
					return
				end)
			else
				slot1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1)
			end
		end
	end
end

return
