slot0 = _G
slot1 = require
slot2 = "table"
slot1 = slot1(slot2)
slot2 = require
slot3 = "string"
slot2 = slot2(slot3)
slot3 = require
slot4 = "math"
slot3 = slot3(slot4)
slot4 = require
slot5 = "socket"
slot4 = slot4(slot5)
slot5 = require
slot6 = "socket.url"
slot5 = slot5(slot6)
slot6 = require
slot7 = "socket.tp"
slot6 = slot6(slot7)
slot7 = require
slot8 = "ltn12"
slot7 = slot7(slot8)
slot8 = {}
slot4.ftp = slot8
slot8 = slot4.ftp
slot9 = 60
slot8.TIMEOUT = slot9
slot9 = 21
slot10 = "ftp"
slot8.USER = slot10
slot10 = "anonymous@anonymous.org"
slot8.PASSWORD = slot10
slot10 = {}
slot11 = {}
slot10.__index = slot11

function slot11(slot0, slot1, slot2)
	slot4 = slot1.connect.setmetatable
	slot5 = {
		tp = slot0.try(slot1.connect(slot0, slot1 or slot2, slot3.TIMEOUT, slot2))
	}
	slot6 = slot5
	slot4 = slot4(slot5, slot6)
	slot5 = slot0
	slot5 = slot5.newtry

	function slot6()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.close

		slot0(slot1)
	end

	slot5 = slot5(slot6)
	slot4.try = slot5

	return slot4
end

slot8.open = slot11
slot11 = slot10.__index

function slot12(slot0)
	slot1 = slot0.try
	slot2 = slot0.server
	slot3 = slot2
	slot2 = slot2.settimeout
	slot4 = slot0
	slot4 = slot4.TIMEOUT

	slot1(slot2(slot3, slot4))

	slot1 = slot0.try
	slot2 = slot0.server
	slot3 = slot2
	slot2 = slot2.accept
	slot1 = slot1(slot2(slot3))
	slot0.data = slot1
	slot1 = slot0.try
	slot2 = slot0.data
	slot3 = slot2
	slot2 = slot2.settimeout
	slot4 = slot0
	slot4 = slot4.TIMEOUT

	slot1(slot2(slot3, slot4))
end

slot11.portconnect = slot12
slot11 = slot10.__index

function slot12(slot0)
	slot1 = slot0.try
	slot2 = slot0
	slot2 = slot2.tcp
	slot1 = slot1(slot2())
	slot0.data = slot1
	slot1 = slot0.try
	slot2 = slot0.data
	slot3 = slot2
	slot2 = slot2.settimeout
	slot4 = slot1
	slot4 = slot4.TIMEOUT

	slot1(slot2(slot3, slot4))

	slot1 = slot0.try
	slot2 = slot0.data
	slot3 = slot2
	slot2 = slot2.connect
	slot4 = slot0.pasvt
	slot4 = slot4.address
	slot5 = slot0.pasvt
	slot5 = slot5.port

	slot1(slot2(slot3, slot4, slot5))
end

slot11.pasvconnect = slot12
slot11 = slot10.__index

function slot12(slot0, slot1, slot2)
	slot3 = slot0.try
	slot4 = slot0.tp
	slot5 = slot4
	slot4 = slot4.command
	slot6 = "user"

	if not slot1 then
		slot7 = slot0
		slot7 = slot7.USER
	end

	slot3(slot4(slot5, slot6, slot7))

	slot3 = slot0.try
	slot4 = slot0.tp
	slot5 = slot4
	slot4 = slot4.check
	slot6 = {
		"2..",
		331
	}
	slot3, slot4 = slot3(slot4(slot5, slot6))

	if slot3 == 331 then
		slot5 = slot0.try
		slot6 = slot0.tp
		slot7 = slot6
		slot6 = slot6.command
		slot8 = "pass"

		if not slot2 then
			slot9 = slot0
			slot9 = slot9.PASSWORD
		end

		slot5(slot6(slot7, slot8, slot9))

		slot5 = slot0.try
		slot6 = slot0.tp
		slot7 = slot6
		slot6 = slot6.check
		slot8 = "2.."

		slot5(slot6(slot7, slot8))
	end

	slot5 = 1

	return slot5
end

slot11.login = slot12
slot11 = slot10.__index

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.command
	slot4 = "pasv"

	slot1(slot2(slot3, slot4))

	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.check
	slot4 = "2.."
	slot1, slot2 = slot1(slot2(slot3, slot4))
	slot3 = "(%d+)%D(%d+)%D(%d+)%D(%d+)%D(%d+)%D(%d+)"
	slot4 = slot0
	slot4 = slot4.skip
	slot5 = 2
	slot6 = slot1
	slot6 = slot6.find
	slot7 = slot2
	slot8 = slot3
	slot4, slot5, slot6, slot7, slot8, slot9 = slot4(slot5, slot6(slot7, slot8))
	slot10 = slot0.try
	slot11 = slot4 and slot5 and slot6 and slot7 and slot8 and slot9
	slot12 = slot2

	slot10(slot11, slot12)

	slot10 = {}
	slot11 = slot1
	slot11 = slot11.format
	slot12 = "%d.%d.%d.%d"
	slot13 = slot4
	slot14 = slot5
	slot15 = slot6
	slot16 = slot7
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	slot10.address = slot11
	slot11 = slot8 * 256
	slot11 = slot11 + slot9
	slot10.port = slot11
	slot0.pasvt = slot10
	slot10 = slot0.server

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-29, warpins: 1 ---
	if slot5 and slot6 and slot7 and slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-36, warpins: 1 ---
		slot11 = slot9
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-55, warpins: 6 ---
	if slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-61, warpins: 1 ---
		slot10 = slot0.server
		slot11 = slot10
		slot10 = slot10.close

		slot10(slot11)

		slot10 = nil
		slot0.server = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 62-66, warpins: 2 ---
	slot10 = slot0.pasvt
	slot10 = slot10.address
	slot11 = slot0.pasvt
	slot11 = slot11.port

	return slot10, slot11
	--- END OF BLOCK #3 ---



end

slot11.pasv = slot12
slot11 = slot10.__index

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.command
	slot4 = "epsv"

	slot1(slot2(slot3, slot4))

	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.check
	slot4 = "229"
	slot1, slot2 = slot1(slot2(slot3, slot4))
	slot3 = "%((.)(.-)%1(.-)%1(.-)%1%)"
	slot4 = slot0
	slot4 = slot4.match
	slot5 = slot2
	slot6 = slot3
	slot4, slot5, slot6, slot7 = slot4(slot5, slot6)
	slot8 = slot0.try
	slot9 = slot7
	slot10 = "invalid epsv response"

	slot8(slot9, slot10)

	slot8 = {}
	slot9 = slot0.tp
	slot10 = slot9
	slot9 = slot9.getpeername
	slot9 = slot9(slot10)
	slot8.address = slot9
	slot8.port = slot7
	slot0.pasvt = slot8
	slot8 = slot0.server

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 1 ---
		slot8 = slot0.server
		slot9 = slot8
		slot8 = slot8.close

		slot8(slot9)

		slot8 = nil
		slot0.server = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 42-46, warpins: 2 ---
	slot8 = slot0.pasvt
	slot8 = slot8.address
	slot9 = slot0.pasvt
	slot9 = slot9.port

	return slot8, slot9
	--- END OF BLOCK #1 ---



end

slot11.epsv = slot12
slot11 = slot10.__index

function slot12(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = nil
	slot0.pasvt = slot3

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-36, warpins: 1 ---
		slot3 = slot0.try
		slot4 = slot0.tp
		slot5 = slot4
		slot4 = slot4.getsockname
		slot3, slot4 = slot3(slot4(slot5))
		slot2 = slot4
		slot1 = slot3
		slot3 = slot0.try
		slot4 = slot0
		slot4 = slot4.bind
		slot5 = slot1
		slot6 = 0
		slot3 = slot3(slot4(slot5, slot6))
		slot0.server = slot3
		slot3 = slot0.try
		slot4 = slot0.server
		slot5 = slot4
		slot4 = slot4.getsockname
		slot3, slot4 = slot3(slot4(slot5))
		slot2 = slot4
		slot1 = slot3
		slot3 = slot0.try
		slot4 = slot0.server
		slot5 = slot4
		slot4 = slot4.settimeout
		slot6 = slot1
		slot6 = slot6.TIMEOUT

		slot3(slot4(slot5, slot6))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-68, warpins: 2 ---
	slot3 = slot2 % 256
	slot4 = slot2 - slot3
	slot4 = slot4 / 256
	slot5 = slot2
	slot5 = slot5.gsub
	slot6 = slot2
	slot6 = slot6.format
	slot7 = "%s,%d,%d"
	slot8 = slot1
	slot9 = slot4
	slot10 = slot3
	slot6 = slot6(slot7, slot8, slot9, slot10)
	slot7 = "%."
	slot8 = ","
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot0.try
	slot7 = slot0.tp
	slot8 = slot7
	slot7 = slot7.command
	slot9 = "port"
	slot10 = slot5

	slot6(slot7(slot8, slot9, slot10))

	slot6 = slot0.try
	slot7 = slot0.tp
	slot8 = slot7
	slot7 = slot7.check
	slot9 = "2.."

	slot6(slot7(slot8, slot9))

	slot6 = 1

	return slot6
	--- END OF BLOCK #1 ---



end

slot11.port = slot12
slot11 = slot10.__index

function slot12(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = nil
	slot0.pasvt = slot4

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-36, warpins: 1 ---
		slot4 = slot0.try
		slot5 = slot0.tp
		slot6 = slot5
		slot5 = slot5.getsockname
		slot4, slot5 = slot4(slot5(slot6))
		slot3 = slot5
		slot2 = slot4
		slot4 = slot0.try
		slot5 = slot0
		slot5 = slot5.bind
		slot6 = slot2
		slot7 = 0
		slot4 = slot4(slot5(slot6, slot7))
		slot0.server = slot4
		slot4 = slot0.try
		slot5 = slot0.server
		slot6 = slot5
		slot5 = slot5.getsockname
		slot4, slot5 = slot4(slot5(slot6))
		slot3 = slot5
		slot2 = slot4
		slot4 = slot0.try
		slot5 = slot0.server
		slot6 = slot5
		slot5 = slot5.settimeout
		slot7 = slot1
		slot7 = slot7.TIMEOUT

		slot4(slot5(slot6, slot7))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-60, warpins: 2 ---
	slot4 = slot2
	slot4 = slot4.format
	slot5 = "|%s|%s|%d|"
	slot6 = slot1
	slot7 = slot2
	slot8 = slot3
	slot4 = slot4(slot5, slot6, slot7, slot8)
	slot5 = slot0.try
	slot6 = slot0.tp
	slot7 = slot6
	slot6 = slot6.command
	slot8 = "eprt"
	slot9 = slot4

	slot5(slot6(slot7, slot8, slot9))

	slot5 = slot0.try
	slot6 = slot0.tp
	slot7 = slot6
	slot6 = slot6.check
	slot8 = "2.."

	slot5(slot6(slot7, slot8))

	slot5 = 1

	return slot5
	--- END OF BLOCK #1 ---



end

slot11.eprt = slot12
slot11 = slot10.__index

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0.try
	slot3 = slot0.pasvt

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot3 = slot0.server
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 2 ---
	slot4 = "need port or pasv first"

	slot2(slot3, slot4)

	slot2 = slot0.pasvt

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.pasvconnect

		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-16, warpins: 2 ---
	slot2 = slot1.argument

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-23, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.unescape
		slot3 = slot1
		slot3 = slot3.gsub
		slot4 = slot1.path

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-24, warpins: 1 ---
			slot4 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-28, warpins: 2 ---
		slot5 = "^[/\\]"
		slot6 = ""
		slot2 = slot2(slot3(slot4, slot5, slot6))
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-30, warpins: 2 ---
	if slot2 == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-31, warpins: 1 ---
		slot2 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-34, warpins: 2 ---
	slot3 = slot1.command

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-35, warpins: 1 ---
		slot3 = "stor"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 36-53, warpins: 2 ---
	slot4 = slot0.try
	slot5 = slot0.tp
	slot6 = slot5
	slot5 = slot5.command
	slot7 = slot3
	slot8 = slot2

	slot4(slot5(slot6, slot7, slot8))

	slot4 = slot0.try
	slot5 = slot0.tp
	slot6 = slot5
	slot5 = slot5.check
	slot7 = {
		"2..",
		"1.."
	}
	slot4, slot5 = slot4(slot5(slot6, slot7))
	slot6 = slot0.pasvt

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-56, warpins: 1 ---
		slot7 = slot0
		slot6 = slot0.portconnect

		slot6(slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 57-59, warpins: 2 ---
	slot6 = slot1.step

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-62, warpins: 1 ---
		slot6 = slot2
		slot6 = slot6.pump
		slot6 = slot6.step
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 63-87, warpins: 2 ---
	slot7 = {}
	slot8 = slot0.tp
	slot7[1] = slot8

	function slot8(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.select
		slot3 = slot1
		slot4 = nil
		slot5 = 0
		slot2 = slot2(slot3, slot4, slot5)
		slot3 = slot2
		slot3 = slot2[slot3]

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-20, warpins: 1 ---
			slot3 = slot4
			slot3 = slot3.try
			slot4 = slot4
			slot4 = slot4.tp
			slot5 = slot4
			slot4 = slot4.check
			slot6 = "2.."
			slot3 = slot3(slot4(slot5, slot6))
			slot3 = slot3
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-24, warpins: 2 ---
		slot3 = slot5
		slot4 = slot0
		slot5 = slot1

		return slot3(slot4, slot5)
		--- END OF BLOCK #1 ---



	end

	slot9 = slot3
	slot9 = slot9.sink
	slot10 = "close-when-done"
	slot11 = slot0.data
	slot9 = slot9(slot10, slot11)
	slot10 = slot0.try
	slot11 = slot2
	slot11 = slot11.pump
	slot11 = slot11.all
	slot12 = slot1.source
	slot13 = slot9
	slot14 = slot8

	slot10(slot11(slot12, slot13, slot14))

	slot10 = slot1
	slot10 = slot10.find
	slot11 = slot4
	slot12 = "1.."
	slot10 = slot10(slot11, slot12)

	if slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 88-94, warpins: 1 ---
		slot10 = slot0.try
		slot11 = slot0.tp
		slot12 = slot11
		slot11 = slot11.check
		slot13 = "2.."

		slot10(slot11(slot12, slot13))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 95-110, warpins: 2 ---
	slot10 = slot0.data
	slot11 = slot10
	slot10 = slot10.close

	slot10(slot11)

	slot10 = slot3
	slot10 = slot10.skip
	slot11 = 1
	slot12 = slot0.data
	slot13 = slot12
	slot12 = slot12.getstats
	slot10 = slot10(slot11, slot12(slot13))
	slot11 = nil
	slot0.data = slot11

	return slot10
	--- END OF BLOCK #8 ---



end

slot11.send = slot12
slot11 = slot10.__index

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0.try
	slot3 = slot0.pasvt

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot3 = slot0.server
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 2 ---
	slot4 = "need port or pasv first"

	slot2(slot3, slot4)

	slot2 = slot0.pasvt

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.pasvconnect

		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-16, warpins: 2 ---
	slot2 = slot1.argument

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-23, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.unescape
		slot3 = slot1
		slot3 = slot3.gsub
		slot4 = slot1.path

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-24, warpins: 1 ---
			slot4 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-28, warpins: 2 ---
		slot5 = "^[/\\]"
		slot6 = ""
		slot2 = slot2(slot3(slot4, slot5, slot6))
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-30, warpins: 2 ---
	if slot2 == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-31, warpins: 1 ---
		slot2 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-34, warpins: 2 ---
	slot3 = slot1.command

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-35, warpins: 1 ---
		slot3 = "retr"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 36-53, warpins: 2 ---
	slot4 = slot0.try
	slot5 = slot0.tp
	slot6 = slot5
	slot5 = slot5.command
	slot7 = slot3
	slot8 = slot2

	slot4(slot5(slot6, slot7, slot8))

	slot4 = slot0.try
	slot5 = slot0.tp
	slot6 = slot5
	slot5 = slot5.check
	slot7 = {
		"1..",
		"2.."
	}
	slot4, slot5 = slot4(slot5(slot6, slot7))
	slot6 = 200

	if slot4 >= slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-56, warpins: 1 ---
		slot6 = 299

		if slot4 <= slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-61, warpins: 1 ---
			slot6 = slot1.sink
			slot7 = slot5

			slot6(slot7)

			slot6 = 1

			return slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 62-64, warpins: 3 ---
	slot6 = slot0.pasvt

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-67, warpins: 1 ---
		slot7 = slot0
		slot6 = slot0.portconnect

		slot6(slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 68-75, warpins: 2 ---
	slot6 = slot2
	slot6 = slot6.source
	slot7 = "until-closed"
	slot8 = slot0.data
	slot6 = slot6(slot7, slot8)
	slot7 = slot1.step

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-78, warpins: 1 ---
		slot7 = slot3
		slot7 = slot7.pump
		slot7 = slot7.step
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 79-94, warpins: 2 ---
	slot8 = slot0.try
	slot9 = slot3
	slot9 = slot9.pump
	slot9 = slot9.all
	slot10 = slot6
	slot11 = slot1.sink
	slot12 = slot7

	slot8(slot9(slot10, slot11, slot12))

	slot8 = slot1
	slot8 = slot8.find
	slot9 = slot4
	slot10 = "1.."
	slot8 = slot8(slot9, slot10)

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 95-101, warpins: 1 ---
		slot8 = slot0.try
		slot9 = slot0.tp
		slot10 = slot9
		slot9 = slot9.check
		slot11 = "2.."

		slot8(slot9(slot10, slot11))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 102-109, warpins: 2 ---
	slot8 = slot0.data
	slot9 = slot8
	slot8 = slot8.close

	slot8(slot9)

	slot8 = nil
	slot0.data = slot8
	slot8 = 1

	return slot8
	--- END OF BLOCK #9 ---



end

slot11.receive = slot12
slot11 = slot10.__index

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot2 = slot0.try
	slot3 = slot0.tp
	slot4 = slot3
	slot3 = slot3.command
	slot5 = "cwd"
	slot6 = slot1

	slot2(slot3(slot4, slot5, slot6))

	slot2 = slot0.try
	slot3 = slot0.tp
	slot4 = slot3
	slot3 = slot3.check
	slot5 = 250

	slot2(slot3(slot4, slot5))

	slot2 = 1

	return slot2
	--- END OF BLOCK #0 ---



end

slot11.cwd = slot12
slot11 = slot10.__index

function slot12(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot2 = slot0.try
	slot3 = slot0.tp
	slot4 = slot3
	slot3 = slot3.command
	slot5 = "type"
	slot6 = slot1

	slot2(slot3(slot4, slot5, slot6))

	slot2 = slot0.try
	slot3 = slot0.tp
	slot4 = slot3
	slot3 = slot3.check
	slot5 = 200

	slot2(slot3(slot4, slot5))

	slot2 = 1

	return slot2
	--- END OF BLOCK #0 ---



end

slot11.type = slot12
slot11 = slot10.__index

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.check
	slot4 = {
		"1..",
		"2.."
	}
	slot1 = slot1(slot2(slot3, slot4))
	slot2 = slot0
	slot2 = slot2.find
	slot3 = slot1
	slot4 = "1.."
	slot2 = slot2(slot3, slot4)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-21, warpins: 1 ---
		slot2 = slot0.try
		slot3 = slot0.tp
		slot4 = slot3
		slot3 = slot3.check
		slot5 = "2.."

		slot2(slot3(slot4, slot5))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-23, warpins: 2 ---
	slot2 = 1

	return slot2
	--- END OF BLOCK #1 ---



end

slot11.greet = slot12
slot11 = slot10.__index

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.command
	slot4 = "quit"

	slot1(slot2(slot3, slot4))

	slot1 = slot0.try
	slot2 = slot0.tp
	slot3 = slot2
	slot2 = slot2.check
	slot4 = "2.."

	slot1(slot2(slot3, slot4))

	slot1 = 1

	return slot1
	--- END OF BLOCK #0 ---



end

slot11.quit = slot12
slot11 = slot10.__index

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.data

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot1 = slot0.data
		slot2 = slot1
		slot1 = slot1.close

		slot1(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 2 ---
	slot1 = slot0.server

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot1 = slot0.server
		slot2 = slot1
		slot1 = slot1.close

		slot1(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 2 ---
	slot1 = slot0.tp
	slot2 = slot1
	slot1 = slot1.close

	return slot1(slot2)
	--- END OF BLOCK #2 ---



end

slot11.close = slot12

function slot11(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.url

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-12, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1.parse
		slot2 = slot0.url
		slot1 = slot1(slot2)
		slot2 = slot1
		slot2 = slot2.pairs
		slot3 = slot0
		slot2, slot3, slot4 = slot2(slot3)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-15, warpins: 0 ---
		for slot5, slot6 in slot2, slot3, slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-13, warpins: 1 ---
			slot1[slot5] = slot6
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-15, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 16-17, warpins: 1 ---
		return slot1
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-18, warpins: 1 ---
		return slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot12(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot1 = slot0
	slot2 = slot0
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot1
	slot1 = slot1.try
	slot2 = slot0.host
	slot3 = "missing hostname"

	slot1(slot2, slot3)

	slot1 = slot2
	slot1 = slot1.open
	slot2 = slot0.host
	slot3 = slot0.port
	slot4 = slot0.create
	slot1 = slot1(slot2, slot3, slot4)
	slot3 = slot1
	slot2 = slot1.greet

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.login
	slot4 = slot0.user
	slot5 = slot0.password

	slot2(slot3, slot4, slot5)

	slot2 = slot0.type

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot3 = slot1
		slot2 = slot1.type
		slot4 = slot0.type

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-44, warpins: 2 ---
	slot3 = slot1
	slot2 = slot1.epsv

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.send
	slot4 = slot0
	slot2 = slot2(slot3, slot4)
	slot4 = slot1
	slot3 = slot1.quit

	slot3(slot4)

	slot4 = slot1
	slot3 = slot1.close

	slot3(slot4)

	return slot2
	--- END OF BLOCK #1 ---



end

slot13 = {
	scheme = "ftp",
	path = "/"
}

function slot14(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.try
	slot2 = slot1
	slot2 = slot2.parse
	slot3 = slot0
	slot4 = slot2
	slot1 = slot1(slot2(slot3, slot4))
	slot2 = slot0
	slot2 = slot2.try
	slot3 = slot1.scheme

	if slot3 ~= "ftp" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-15, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-30, warpins: 2 ---
	slot4 = "wrong scheme '"
	slot5 = slot1.scheme
	slot6 = "'"
	slot4 = slot4 .. slot5 .. slot6

	slot2(slot3, slot4)

	slot2 = slot0
	slot2 = slot2.try
	slot3 = slot1.host
	slot4 = "missing hostname"

	slot2(slot3, slot4)

	slot2 = "^type=(.)$"
	slot3 = slot1.params

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-45, warpins: 1 ---
		slot3 = slot0
		slot3 = slot3.skip
		slot4 = 2
		slot5 = slot3
		slot5 = slot5.find
		slot6 = slot1.params
		slot7 = slot2
		slot3 = slot3(slot4, slot5(slot6, slot7))
		slot1.type = slot3
		slot3 = slot0
		slot3 = slot3.try
		slot4 = slot1.type

		if slot4 ~= "a" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-48, warpins: 1 ---
			slot4 = slot1.type

			if slot4 ~= "i" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-50, warpins: 1 ---
				slot4 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-51, warpins: 2 ---
			slot4 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 52-56, warpins: 2 ---
		slot5 = "invalid type '"
		slot6 = slot1.type
		slot7 = "'"
		slot5 = slot5 .. slot6 .. slot7

		slot3(slot4, slot5)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 57-57, warpins: 2 ---
	return slot1
	--- END OF BLOCK #2 ---



end

slot8.genericform = slot14

function slot15(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot2 = slot0
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = slot1
	slot3 = slot3.source
	slot3 = slot3.string
	slot4 = slot1
	slot3 = slot3(slot4)
	slot2.source = slot3
	slot3 = slot2
	slot4 = slot2

	return slot3(slot4)
	--- END OF BLOCK #0 ---



end

slot16 = slot4.protect

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2.type
	slot3 = slot0
	slot2 = slot2(slot3)

	if slot2 == "string" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		slot2 = slot1
		slot3 = slot0
		slot4 = slot1

		return slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot2 = slot2
		slot3 = slot0

		return slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-15, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot16 = slot16(slot17)
slot8.put = slot16

function slot16(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot1 = slot0
	slot2 = slot0
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot1
	slot1 = slot1.try
	slot2 = slot0.host
	slot3 = "missing hostname"

	slot1(slot2, slot3)

	slot1 = slot2
	slot1 = slot1.open
	slot2 = slot0.host
	slot3 = slot0.port
	slot4 = slot0.create
	slot1 = slot1(slot2, slot3, slot4)
	slot3 = slot1
	slot2 = slot1.greet

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.login
	slot4 = slot0.user
	slot5 = slot0.password

	slot2(slot3, slot4, slot5)

	slot2 = slot0.type

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot3 = slot1
		slot2 = slot1.type
		slot4 = slot0.type

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-43, warpins: 2 ---
	slot3 = slot1
	slot2 = slot1.epsv

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.receive
	slot4 = slot0

	slot2(slot3, slot4)

	slot3 = slot1
	slot2 = slot1.quit

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.close

	return slot2(slot3)
	--- END OF BLOCK #1 ---



end

function slot17(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot1 = slot0
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = {}
	slot3 = slot1
	slot3 = slot3.sink
	slot3 = slot3.table
	slot4 = slot2
	slot3 = slot3(slot4)
	slot1.sink = slot3
	slot3 = slot2
	slot4 = slot1

	slot3(slot4)

	slot3 = slot3
	slot3 = slot3.concat
	slot4 = slot2

	return slot3(slot4)
	--- END OF BLOCK #0 ---



end

slot18 = slot4.protect

function slot19(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	slot1 = slot0
	slot2 = slot0
	slot1 = slot1(slot2)
	slot0 = slot1
	slot1 = slot1
	slot1 = slot1.try
	slot2 = slot0.host
	slot3 = "missing hostname"

	slot1(slot2, slot3)

	slot1 = slot1
	slot1 = slot1.try
	slot2 = slot0.command
	slot3 = "missing command"

	slot1(slot2, slot3)

	slot1 = slot2
	slot1 = slot1.open
	slot2 = slot0.host
	slot3 = slot0.port
	slot4 = slot0.create
	slot1 = slot1(slot2, slot3, slot4)
	slot3 = slot1
	slot2 = slot1.greet

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.login
	slot4 = slot0.user
	slot5 = slot0.password

	slot2(slot3, slot4, slot5)

	slot2 = type
	slot3 = slot0.command
	slot2 = slot2(slot3)

	if slot2 == "table" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-36, warpins: 1 ---
		slot2 = slot0.argument

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-37, warpins: 1 ---
			slot2 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-40, warpins: 2 ---
		slot3 = slot0.check

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-41, warpins: 1 ---
			slot3 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 42-45, warpins: 2 ---
		slot4 = ipairs
		slot5 = slot0.command
		slot4, slot5, slot6 = slot4(slot5)

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 46-65, warpins: 0 ---
		for slot7, slot8 in slot4, slot5, slot6 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-56, warpins: 1 ---
			slot9 = slot1.try
			slot10 = slot1.tp
			slot11 = slot10
			slot10 = slot10.command
			slot12 = slot8
			slot13 = slot2[slot7]

			slot9(slot10(slot11, slot12, slot13))

			slot9 = slot3[slot7]

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-63, warpins: 1 ---
				slot9 = slot1.try
				slot10 = slot1.tp
				slot11 = slot10
				slot10 = slot10.check
				slot12 = slot3[slot7]

				slot9(slot10(slot11, slot12))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 64-65, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 66-66, warpins: 1 ---
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-77, warpins: 1 ---
		slot2 = slot1.try
		slot3 = slot1.tp
		slot4 = slot3
		slot3 = slot3.command
		slot5 = slot0.command
		slot6 = slot0.argument

		slot2(slot3(slot4, slot5, slot6))

		slot2 = slot0.check

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 78-84, warpins: 1 ---
			slot2 = slot1.try
			slot3 = slot1.tp
			slot4 = slot3
			slot3 = slot3.check
			slot5 = slot0.check

			slot2(slot3(slot4, slot5))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 85-90, warpins: 3 ---
	slot3 = slot1
	slot2 = slot1.quit

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.close

	return slot2(slot3)
	--- END OF BLOCK #1 ---



end

slot18 = slot18(slot19)
slot8.command = slot18
slot18 = slot4.protect

function slot19(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.type
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == "string" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot1 = slot1
		slot2 = slot0

		return slot1(slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot1 = slot2
		slot2 = slot0

		return slot1(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot18 = slot18(slot19)
slot8.get = slot18

return slot8
