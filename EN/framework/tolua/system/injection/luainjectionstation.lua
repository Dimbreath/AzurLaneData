slot0 = pcall
slot1 = pairs
slot2 = error
slot3 = rawset
slot4 = rawget
slot5 = string
slot6 = tolua_tag
slot7 = getmetatable
slot8 = nil
slot9 = require("System.Injection.InjectionBridgeInfo")

function slot10(slot0)
	if slot1(slot0(slot0), slot1) ~= 1 then
		slot3("Can't Inject")
	end

	return slot1
end

function slot11()
	if slot0 == nil then
		slot0 = LuaInterface.LuaInjectionStation
	end
end

function slot12(slot0, slot1)
	slot2 = slot0.__index
	slot3 = {}

	for slot7, slot8 in slot0(slot1) do
		slot9, slot10 = slot8()

		if slot10 == LuaInterface.InjectType.Replace or slot10 == LuaInterface.InjectType.ReplaceWithPostInvokeBase or slot10 == LuaInterface.InjectType.ReplaceWithPreInvokeBase then
			slot1(slot3, slot7, slot9)
		end
	end

	function slot0.__index(slot0, slot1)
		if slot0(slot1, slot1) ~= nil then
			return slot2
		end

		slot3, slot4 = slot2(slot2, slot0, slot1)

		if slot3 then
			return slot4
		else
			slot4(slot4)

			return nil
		end
	end
end

function InjectByModule(slot0, slot1)
	InjectByName(slot3, slot1)
	slot1(slot0(slot0), slot1)
end

function InjectByName(slot0, slot1)
	slot0()

	if slot1(slot1, slot0) == nil then
		slot3(slot4.format("Module %s Can't Inject", slot0))
	end

	for slot6, slot7 in slot5(slot1) do
		slot8, slot9 = slot7()

		if slot1(slot2, slot6) == nil then
			slot3(slot4.format("Function %s Doesn't Exist In Module %s", slot6, slot0))
		end

		slot6.CacheInjectFunction(slot10, slot9:ToInt(), slot8)
	end
end

require("System.Injection.LuaInjectionBus")

return
