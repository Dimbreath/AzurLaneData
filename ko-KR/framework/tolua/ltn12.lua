slot0 = require
slot1 = "string"
slot0 = slot0(slot1)
slot1 = require
slot2 = "table"
slot1 = slot1(slot2)
slot2 = unpack

if not slot2 then
	slot2 = slot1.unpack
end

slot3 = _G
slot4 = {}
slot5 = module

if slot5 then
	ltn12 = slot4
end

slot5 = {}
slot6 = {}
slot7 = {}
slot8 = {}
slot4.filter = slot5
slot4.source = slot6
slot4.sink = slot7
slot4.pump = slot8
slot9 = slot2 or slot1.unpack
slot10 = slot3.select
slot11 = 2048
slot4.BLOCKSIZE = slot11
slot11 = "LTN12 1.0.3"
slot4._VERSION = slot11

function slot11(slot0, slot1, slot2)
	slot3 = uv0
	slot3 = slot3.assert
	slot4 = slot0

	slot3(slot4)

	function slot3(slot0)
		slot1 = nil
		slot2 = uv1
		slot3 = uv0
		slot4 = slot0
		slot5 = uv2
		slot2, slot3 = slot2(slot3, slot4, slot5)
		uv0 = slot3
		slot1 = slot2

		return slot1
	end

	return slot3
end

slot5.cycle = slot11

function slot11(...)
	slot0 = {
		...
	}
	slot0[MULTRES] = ...
	slot1 = uv0
	slot1 = slot1.select
	slot2 = "#"
	slot1 = slot1(slot2, ...)
	slot2 = 1
	slot3 = 1
	slot4 = ""

	function slot5(slot0)
		if slot0 then
			slot1 = uv0
		end

		uv0 = slot1

		while true do
			slot1 = uv1
			slot2 = uv2

			if slot1 == slot2 then
				slot1 = uv3
				slot2 = uv1
				slot1 = slot1[slot2]
				slot2 = slot0
				slot1 = slot1(slot2)
				slot0 = slot1

				if slot0 ~= "" then
					slot1 = uv2
					slot2 = uv4

					if slot1 == slot2 then
						return slot0
					elseif slot0 then
						slot1 = uv1
						slot1 = slot1 + 1
						uv1 = slot1
					else
						slot1 = uv2
						slot1 = slot1 + 1
						uv2 = slot1
						slot1 = uv2
						uv1 = slot1
					end
				end
			else
				slot1 = uv3
				slot2 = uv1
				slot1 = slot1[slot2]

				if not slot0 then
					slot2 = ""
				end

				slot1 = slot1(slot2)
				slot0 = slot1

				if slot0 == "" then
					slot1 = uv1
					slot1 = slot1 - 1
					uv1 = slot1
					slot0 = uv0
				elseif slot0 then
					slot1 = uv1
					slot2 = uv4

					if slot1 == slot2 then
						return slot0
					else
						slot1 = uv1
						slot1 = slot1 + 1
						uv1 = slot1
					end
				else
					slot1 = uv5
					slot1 = slot1.error
					slot2 = "filter returned inappropriate nil"

					slot1(slot2)
				end
			end
		end
	end

	return slot5
end

slot5.chain = slot11

function slot11()
	slot0 = nil

	return slot0
end

function slot12()
	slot0 = uv0

	return slot0
end

slot6.empty = slot12

function slot12(slot0)
	function slot1()
		slot0 = nil
		slot1 = uv0

		return slot0, slot1
	end

	return slot1
end

slot6.error = slot12

function slot12(slot0, slot1)
	if slot0 then
		function slot2()
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.read
			slot2 = uv1
			slot2 = slot2.BLOCKSIZE
			slot0 = slot0(slot1, slot2)

			if not slot0 then
				slot1 = uv0
				slot2 = slot1
				slot1 = slot1.close

				slot1(slot2)
			end

			return slot0
		end

		return slot2
	else
		slot2 = uv1
		slot2 = slot2.error

		if not slot1 then
			slot3 = "unable to open file"
		end

		return slot2(slot3)
	end
end

slot6.file = slot12

function slot12(slot0)
	slot1 = uv0
	slot1 = slot1.assert
	slot2 = slot0

	slot1(slot2)

	function slot1()
		slot0 = uv0
		slot0, slot1 = slot0()

		if not slot1 then
			slot2 = uv0
		end

		uv0 = slot2

		if not slot0 then
			slot2 = nil
			slot3 = slot1

			return slot2, slot3
		else
			return slot0
		end
	end

	return slot1
end

slot6.simplify = slot12

function slot12(slot0)
	if slot0 then
		slot1 = 1

		function slot2()
			slot0 = uv0
			slot0 = slot0.sub
			slot1 = uv1
			slot2 = uv2
			slot3 = uv2
			slot4 = uv3
			slot4 = slot4.BLOCKSIZE
			slot3 = slot3 + slot4
			slot3 = slot3 - 1
			slot0 = slot0(slot1, slot2, slot3)
			slot1 = uv2
			slot2 = uv3
			slot2 = slot2.BLOCKSIZE
			slot1 = slot1 + slot2
			uv2 = slot1

			if slot0 ~= "" then
				return slot0
			else
				slot1 = nil

				return slot1
			end
		end

		return slot2
		return
	end

	slot1 = uv2
	slot1 = slot1.empty

	return slot1()
end

slot6.string = slot12

function slot12(slot0)
	slot1 = uv0
	slot1 = slot1.assert
	slot2 = slot0

	slot1(slot2)

	slot1 = {}

	function slot2(slot0)
		if not slot0 then
			slot1 = uv0
			slot1 = slot1.remove
			slot2 = uv1
			slot1 = slot1(slot2)
			slot0 = slot1

			if not slot0 then
				slot1 = uv2

				return slot1()
			else
				return slot0
			end
		else
			slot1 = uv0
			slot1 = slot1.insert
			slot2 = uv1
			slot3 = slot0

			slot1(slot2, slot3)
		end
	end

	return slot2
end

slot6.rewind = slot12

function slot12(slot0, slot1, ...)
	slot2 = ...

	if slot2 then
		slot2 = uv0
		slot2 = slot2.chain
		slot3 = slot1
		slot2 = slot2(slot3, ...)
		slot1 = slot2
	end

	slot2 = uv1
	slot2 = slot2.assert

	if slot0 then
		slot3 = slot1
	end

	slot2(slot3)

	slot2 = ""
	slot3 = ""
	slot4 = "feeding"
	slot5 = nil

	function slot6()
		slot0 = uv0

		if not slot0 then
			slot0 = uv1
			slot0 = slot0.error
			slot1 = "source is empty!"
			slot2 = 2

			slot0(slot1, slot2)
		end

		while true do
			slot0 = uv2

			if slot0 == "feeding" then
				slot0 = uv5
				slot0, slot1 = slot0()
				uv4 = slot1
				uv3 = slot0
				slot0 = uv4

				if slot0 then
					slot0 = nil
					slot1 = uv4

					return slot0, slot1
				end

				slot0 = uv6
				slot1 = uv3
				slot0 = slot0(slot1)
				uv0 = slot0
				slot0 = uv0

				if not slot0 then
					slot0 = uv3

					if slot0 then
						slot0 = uv1
						slot0 = slot0.error
						slot1 = "filter returned inappropriate nil"

						slot0(slot1)
					else
						slot0 = nil

						return slot0
					end
				else
					slot0 = uv0

					if slot0 ~= "" then
						uv2 = "eating"
						slot0 = uv3

						if slot0 then
							uv3 = ""
						end

						slot0 = uv0

						return slot0
					end
				end
			else
				slot0 = uv6
				slot1 = uv3
				slot0 = slot0(slot1)
				uv0 = slot0
				slot0 = uv0

				if slot0 == "" then
					slot0 = uv3

					if slot0 == "" then
						uv2 = "feeding"
					else
						slot0 = uv1
						slot0 = slot0.error
						slot1 = "filter returned \"\""

						slot0(slot1)
					end
				else
					slot0 = uv0

					if not slot0 then
						slot0 = uv3

						if slot0 then
							slot0 = uv1
							slot0 = slot0.error
							slot1 = "filter returned inappropriate nil"

							slot0(slot1)
						else
							slot0 = nil

							return slot0
						end
					else
						slot0 = uv0

						return slot0
					end
				end
			end
		end
	end

	return slot6
end

slot6.chain = slot12

function slot12(...)
	slot0 = {
		...
	}
	slot0[MULTRES] = ...
	slot1 = uv0
	slot1 = slot1.remove
	slot2 = slot0
	slot3 = 1
	slot1 = slot1(slot2, slot3)

	function slot2()
		slot0 = uv0

		while slot0 do
			slot0 = uv0
			slot0, slot1 = slot0()

			if slot0 then
				return slot0
			end

			if slot1 then
				slot2 = nil
				slot3 = slot1

				return slot2, slot3
			end

			slot2 = uv1
			slot2 = slot2.remove
			slot3 = uv2
			slot4 = 1
			slot2 = slot2(slot3, slot4)
			uv0 = slot2
		end
	end

	return slot2
end

slot6.cat = slot12

function slot12(slot0)
	if not slot0 then
		slot0 = {}
	end

	function slot1(slot0, slot1)
		if slot0 then
			slot2 = uv0
			slot2 = slot2.insert
			slot3 = uv1
			slot4 = slot0

			slot2(slot3, slot4)
		end

		slot2 = 1

		return slot2
	end

	slot2 = slot1
	slot3 = slot0

	return slot2, slot3
end

slot7.table = slot12

function slot12(slot0)
	slot1 = uv0
	slot1 = slot1.assert
	slot2 = slot0

	slot1(slot2)

	function slot1(slot0, slot1)
		slot2 = uv0
		slot3 = slot0
		slot4 = slot1
		slot2, slot3 = slot2(slot3, slot4)

		if not slot2 then
			slot4 = nil
			slot5 = slot3

			return slot4, slot5
		end

		if not slot3 then
			slot4 = uv0
		end

		uv0 = slot4
		slot4 = 1

		return slot4
	end

	return slot1
end

slot7.simplify = slot12

function slot12(slot0, slot1)
	if slot0 then
		function slot2(slot0, slot1)
			if not slot0 then
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.close

				slot2(slot3)

				slot2 = 1

				return slot2
			else
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.write
				slot4 = slot0

				return slot2(slot3, slot4)
			end
		end

		return slot2
	else
		slot2 = uv0
		slot2 = slot2.error

		if not slot1 then
			slot3 = "unable to open file"
		end

		return slot2(slot3)
	end
end

slot7.file = slot12

function slot12()
	slot0 = 1

	return slot0
end

function slot13()
	slot0 = uv0

	return slot0
end

slot7.null = slot13

function slot13(slot0)
	function slot1()
		slot0 = nil
		slot1 = uv0

		return slot0, slot1
	end

	return slot1
end

slot7.error = slot13

function slot13(slot0, slot1, ...)
	slot2 = ...

	if slot2 then
		slot2 = {
			slot0,
			slot1,
			...
		}
		slot2[MULTRES] = ...
		slot3 = uv0
		slot3 = slot3.remove
		slot4 = slot2
		slot5 = #slot2
		slot3 = slot3(slot4, slot5)
		slot1 = slot3
		slot3 = uv1
		slot3 = slot3.chain
		slot4 = uv2
		slot5 = slot2
		slot3 = slot3(slot4(slot5))
		slot0 = slot3
	end

	slot2 = uv3
	slot2 = slot2.assert

	if slot0 then
		slot3 = slot1
	end

	slot2(slot3)

	function slot2(slot0, slot1)
		if slot0 ~= "" then
			slot2 = uv0
			slot3 = slot0
			slot2 = slot2(slot3)

			if slot0 then
				slot3 = ""
			end

			while true do
				slot4 = uv1
				slot5 = slot2
				slot6 = slot1
				slot4, slot5 = slot4(slot5, slot6)

				if not slot4 then
					slot6 = nil
					slot7 = slot5

					return slot6, slot7
				end

				if slot2 == slot3 then
					slot6 = 1

					return slot6
				end

				slot6 = uv0
				slot7 = slot3
				slot6 = slot6(slot7)
				slot2 = slot6
			end
		else
			slot2 = 1

			return slot2
		end
	end

	return slot2
end

slot7.chain = slot13

function slot13(slot0, slot1)
	slot2 = slot0
	slot2, slot3 = slot2()
	slot4 = slot1
	slot5 = slot2
	slot6 = slot3
	slot4, slot5 = slot4(slot5, slot6)

	if slot2 and slot4 then
		slot6 = 1

		return slot6
	else
		slot6 = nil

		if not slot3 then
			slot7 = slot5
		end

		return slot6, slot7
	end
end

slot8.step = slot13

function slot13(slot0, slot1, slot2)
	slot3 = uv0
	slot3 = slot3.assert

	if slot0 then
		slot4 = slot1
	end

	slot3(slot4)

	if not slot2 then
		slot3 = uv1
		slot2 = slot3.step
	end

	while true do
		slot3 = slot2
		slot4 = slot0
		slot5 = slot1
		slot3, slot4 = slot3(slot4, slot5)

		if not slot3 then
			if slot4 then
				slot5 = nil
				slot6 = slot4

				return slot5, slot6
			else
				slot5 = 1

				return slot5
			end
		end
	end
end

slot8.all = slot13

return slot4
