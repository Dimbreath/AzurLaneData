slot0 = setmetatable
slot1 = xpcall
slot2 = pcall
slot3 = assert
slot4 = rawget
slot5 = error
slot6 = print
slot7 = tolua.traceback
slot8 = ilist
slot9 = {
	__call = function (slot0, ...)
		if jit then
			if slot0.obj == nil then
				return slot0(slot0.func, slot0, ...)
			else
				return slot0(slot0.func, slot0, slot0.obj, ...)
			end
		else
			slot1 = {
				...
			}

			if slot0.obj == nil then
				return slot0(function ()
					slot0.func(unpack(unpack))
				end, slot1)
			else
				return slot0(function ()
					slot0.func(slot0.obj, unpack(slot0.obj))
				end, slot1)
			end
		end
	end,
	__eq = function (slot0, slot1)
		return slot0.func == slot1.func and slot0.obj == slot1.obj
	end
}

function slot10(slot0, slot1)
	return slot0({
		func = slot0,
		obj = slot1
	}, slot1)
end

slot11 = {
	__call = function (slot0, ...)
		if slot0.obj == nil then
			return slot0(slot0.func, ...)
		else
			return slot0(slot0.func, slot0.obj, ...)
		end
	end,
	__eq = function (slot0, slot1)
		return slot0.func == slot1.func and slot0.obj == slot1.obj
	end
}

function slot12(slot0, slot1)
	return slot0({
		func = slot0,
		obj = slot1
	}, slot1)
end

function event(slot0, slot1)
	return slot0({
		lock = false,
		name = slot0,
		keepSafe = slot1 or false,
		opList = {},
		list = list:new()
	}, slot1 or false)
end

UpdateBeat = event("Update", true)
LateUpdateBeat = event("LateUpdate", true)
FixedUpdateBeat = event("FixedUpdate", true)
CoUpdateBeat = event("CoUpdate")
slot14 = Time
slot15 = UpdateBeat
slot16 = LateUpdateBeat
slot17 = FixedUpdateBeat
slot18 = CoUpdateBeat

function Update(slot0, slot1)
	slot0:SetDeltaTime(slot0, slot1)
	slot1()
end

function LateUpdate()
	slot0()
	slot1()
	slot2:SetFrameCount()
end

function FixedUpdate(slot0)
	slot0:SetFixedDelta(slot0)
	slot0.SetFixedDelta()
end

function PrintEvents()
	slot0:Dump()
	slot0:Dump()
end

return
