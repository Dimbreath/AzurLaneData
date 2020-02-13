function slot1()
	return FileTool.GetCurrentDirectiory() .. "\\"
end

function slot2(slot0)
	if slot0:gsub("/", "\\"):find(":") == nil then
		slot0 = slot0() .. slot0
	end

	if slot0:sub(#slot0, ) == "\\" then
		slot0 = slot0:sub(1, slot1 - 1)
	end

	slot2 = {}

	for slot6 in slot0:gmatch("[^\\]+") do
		if slot6 == ".." and #slot2 ~= 0 then
			table.remove(slot2)
		elseif slot6 ~= "." then
			table.insert(slot2, slot6)
		end
	end

	return table.concat(slot2, "\\")
end

return {
	FailNotify = function (...)
		if slot0.NotifyFunc then
			slot0.NotifyFunc(...)
		end
	end,
	DebugNofity = function (...)
		if slot0.DebugNofityFunc then
			slot0.DebugNofityFunc(...)
		end
	end,
	InitFileMap = function (slot0)
		for slot4, slot5 in pairs(slot0) do
			slot1.NotifyFunc("root path: " .. slot5)
			print("count " .. FileTool.GetAllFiles(slot5).Count)

			for slot10 = 0, FileTool.GetAllFiles(slot5).Count - 1, 1 do
				if string.match(slot6:get_Item(slot10), ".*\\(.[_a-zA-Z][_a-zA-Z0-9]*)%.lua") ~= nil then
					if slot1.FileMap[slot12] == nil then
						slot1.FileMap[slot12] = {}
					end

					slot1.LuaPathToSysPath[string.gsub(string.sub(slot11, #slot5 + 2, #slot11 - 4), "\\", ".")] = SysPath

					table.insert(slot1.FileMap[slot12], {
						SysPath = slot11,
						LuaPath = string.gsub(string.sub(slot11, #slot5 + 2, #slot11 - 4), "\\", ".")
					})
				end
			end

			slot1.NotifyFunc("load module count: " .. table.getn(slot1.FileMap))
		end
	end,
	InitFakeTable = function ()
		slot0.Meta = {
			__index = function (slot0, slot1)
				if slot1 == "setmetatable" then
					return slot0
				elseif slot1 == "pairs" or slot1 == "ipairs" then
					return slot1
				elseif slot1 == "next" then
					return slot2
				elseif slot1 == "require" then
					return slot3
				else
					rawset(slot0, slot1, slot4())

					return slot4()
				end
			end,
			__newindex = function (slot0, slot1, slot2)
				rawset(slot0, slot1, slot2)
			end,
			__call = function ()
				slot0 = slot0()

				return slot0, slot0(), slot0()
			end,
			__add = function ()
				return slot0.__call()
			end,
			__sub = function ()
				return slot0.__call()
			end,
			__mul = function ()
				return slot0.__call()
			end,
			__div = function ()
				return slot0.__call()
			end,
			__mod = function ()
				return slot0.__call()
			end,
			__pow = function ()
				return slot0.__call()
			end,
			__unm = function ()
				return slot0.__call()
			end,
			__concat = function ()
				return slot0.__call()
			end,
			__eq = function ()
				return slot0.__call()
			end,
			__lt = function ()
				return slot0.__call()
			end,
			__le = function ()
				return slot0.__call()
			end,
			__len = function ()
				return slot0.__call()
			end
		}

		function slot2()
			return
		end

		function slot3()
			return slot0
		end

		function slot4(slot0, slot1)
			slot0.MetaMap[slot0] = slot1

			return slot0
		end

		function slot5(slot0)
			if not slot0.RequireMap[slot0] then
				slot0.RequireMap[slot0] = slot1()
			end

			return slot0.RequireMap[slot0]
		end

		return function ()
			return setmetatable({}, setmetatable)
		end
	end,
	InitProtection = function ()
		slot0.Protection = {
			[setmetatable] = true
		}
		slot0.Protection.Protection[pairs] = true
		slot0.Protection.Protection.Protection[ipairs] = true
		slot0.Protection.Protection.Protection.Protection[next] = true
		slot0.Protection.Protection.Protection.Protection.Protection[require] = true
		slot0.Protection.Protection.Protection.Protection.Protection.Protection[] = true
		slot0.Protection.Protection.Protection.Protection.Protection.Protection.Protection[slot0.Meta] = true
		slot0.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection[math] = true
		slot0.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection[string] = true
		slot0.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection.Protection[table] = true
	end,
	AddFileFromHUList = function ()
		package.loaded[slot0.UpdateListFile] = nil
		slot0 = require(slot0.UpdateListFile)
		slot0.ALL = false
		slot0.HUMap = {}

		for slot4, slot5 in pairs(slot0) do
			if slot5 == "_ALL_" then
				slot0.ALL = true

				for slot9, slot10 in pairs(slot0.FileMap) do
					for slot14, slot15 in pairs(slot10) do
						slot0.HUMap[slot15.LuaPath] = slot15.SysPath
					end
				end

				return
			end

			if slot0.FileMap[slot5] then
				for slot9, slot10 in pairs(slot0.FileMap[slot5]) do
					slot0.HUMap[slot10.LuaPath] = slot10.SysPath
				end
			else
				slot0.FailNotify("HotUpdate can't not find " .. slot5)
			end
		end
	end,
	ErrorHandle = function (slot0)
		slot0.FailNotify("HotUpdate Error\n" .. tostring(slot0))

		slot0.ErrorHappen = true
	end,
	BuildNewCode = function (slot0, slot1)
		io.input(slot0)

		slot2 = io.read("*all")

		if slot0.ALL and slot0.OldCode[slot0] == nil then
			slot0.OldCode[slot0] = slot2

			io.input():close()

			return
		end

		if slot0.OldCode[slot0] == slot2 then
			io.input():close()

			return false
		end

		io.input():close()
		io.input(slot0)
		io.input():close()

		if not loadstring("--[[" .. slot1 .. "]] " .. slot2) then
			slot0.FailNotify(slot0 .. " has syntax error.")
			collectgarbage("collect")

			return false
		else
			slot0.FakeENV = slot0.FakeT()
			slot0.MetaMap = {}
			slot0.RequireMap = {}

			setfenv(slot4, slot0.FakeENV)

			slot5 = nil
			slot0.ErrorHappen = false

			xpcall(function ()
				slot0 = slot1()
			end, slot0.ErrorHandle)

			if not slot0.ErrorHappen then
				slot0.OldCode[slot0] = slot2

				return true, slot5
			else
				collectgarbage("collect")

				return false
			end
		end
	end,
	Travel_G = function ()
		slot1(_G)

		slot2 = debug.getregistry()

		for slot6, slot7 in ipairs(slot0.ChangedFuncList) do
			for slot11, slot12 in pairs(slot2) do
				if slot12 == slot7[1] then
					slot2[slot11] = slot7[2]
				end
			end
		end

		for slot6, slot7 in ipairs(slot0.ChangedFuncList) do
			if slot7[3] == "HUDebug" then
				slot7[4]:HUDebug()
			end
		end
	end,
	ReplaceOld = function (slot0, slot1, slot2, slot3, slot4)
		if type(slot0) == type(slot1) then
			if type(slot1) == "table" then
				slot0:UpdateAllFunction(slot1, slot2, slot3, "")
			elseif type(slot1) == "function" then
				slot0:UpdateOneFunction(slot1, slot2, nil, slot3, "")
			end
		end
	end,
	HotUpdateCode = function (slot0, slot1)
		if package.loaded[slot0] ~= nil then
			slot0.VisitedSig = {}
			slot0.ChangedFuncList = {}
			slot3, slot4 = slot0.BuildNewCode(slot1, slot0)

			if slot3 then
				slot0.NotifyFunc("update module " .. slot0)
				slot0.ReplaceOld(slot2, slot4, slot0, "Main", "")

				for slot8, slot9 in pairs(slot0.RequireMap) do
					slot0.ReplaceOld(package.loaded[slot8], slot9, slot8, "Main_require", "")
				end

				setmetatable(slot0.FakeENV, nil)
				slot0.UpdateAllFunction(slot0.ENV, slot0.FakeENV, " ENV ", "Main", "")

				if #slot0.ChangedFuncList > 0 then
					slot0.Travel_G()
				end

				collectgarbage("collect")
			end
		elseif slot0.OldCode[slot1] == nil then
			io.input(slot1)

			slot0.OldCode[slot1] = io.read("*all")

			io.input():close()
		end
	end,
	ResetENV = function (slot0, slot1, slot2, slot3)
		slot4 = {}


		-- Decompilation error in this vicinity:
		function (slot0, slot1)
			if not slot0 or slot0[slot0] then
				return
			end

			slot0[slot0] = true

			if type(slot0) == "function" then
				slot1.DebugNofity(slot2 .. "HU.ResetENV", slot1, "  from:" .. slot2 .. "HU.ResetENV")
				xpcall(function ()
					setfenv(setfenv, slot1.ENV)
				end, slot1.FailNotify)
			elseif type(slot0) == "table" then
				slot1.DebugNofity(slot2 .. "HU.ResetENV", slot1, "  from:" .. slot2 .. "HU.ResetENV")

				for slot5, slot6 in pairs(slot0) do
					slot4(slot5, tostring(slot5) .. "__key", " HU.ResetENV ", slot2 .. "    ")
					slot4(slot6, tostring(slot5), " HU.ResetENV ", slot2 .. "    ")
				end
			end
		end(slot0, slot1)
	end,
	UpdateUpvalue = function (slot0, slot1, slot2, slot3, slot4)
		slot0.DebugNofity(slot4 .. "HU.UpdateUpvalue", slot2, "  from:" .. slot3)

		slot5 = {}
		slot6 = {}

		for slot10 = 1, math.huge, 1 do
			slot11, slot12 = debug.getupvalue(slot0, slot10)

			if not slot11 then
				break
			end

			slot5[slot11] = slot12
			slot6[slot11] = true
		end

		for slot10 = 1, math.huge, 1 do
			slot11, slot12 = debug.getupvalue(slot1, slot10)

			if not slot11 then
				break
			end

			if slot6[slot11] then
				if type(slot13) ~= type(slot12) then
					debug.setupvalue(slot1, slot10, slot13)
				elseif type(slot13) == "function" then
					slot0.UpdateOneFunction(slot13, slot12, slot11, nil, "HU.UpdateUpvalue", slot4 .. "    ")
				elseif type(slot13) == "table" then
					slot0.UpdateAllFunction(slot13, slot12, slot11, "HU.UpdateUpvalue", slot4 .. "    ")
					debug.setupvalue(slot1, slot10, slot13)
				else
					debug.setupvalue(slot1, slot10, slot13)
				end
			else
				slot0.ResetENV(slot12, slot11, "HU.UpdateUpvalue", slot4 .. "    ")
			end
		end
	end,
	UpdateOneFunction = function (slot0, slot1, slot2, slot3, slot4, slot5)
		if slot0.Protection[slot0] or slot0.Protection[slot1] then
			return
		end

		if slot0 == slot1 then
			return
		end

		if slot0.VisitedSig[tostring(slot0) .. tostring(slot1)] then
			return
		end

		slot0.VisitedSig[slot6] = true

		slot0.DebugNofity(slot5 .. "HU.UpdateOneFunction " .. slot2 .. "  from:" .. slot4)

		if pcall(debug.setfenv, slot1, getfenv(slot0)) then
			slot0:UpdateUpvalue(slot1, slot2, "HU.UpdateOneFunction", slot5 .. "    ")

			slot0.ChangedFuncList[#slot0.ChangedFuncList + 1] = {
				slot0,
				slot1,
				slot2,
				slot3
			}
		end
	end,
	UpdateAllFunction = function (slot0, slot1, slot2, slot3, slot4)
		if slot0.Protection[slot0] or slot0.Protection[slot1] then
			return
		end

		if slot0 == slot1 then
			return
		end

		if slot0.VisitedSig[tostring(slot0) .. tostring(slot1)] then
			return
		end

		slot0.VisitedSig[slot5] = true

		slot0.DebugNofity(slot4 .. "HU.UpdateAllFunction " .. slot2 .. "  from:" .. slot3)

		for slot9, slot10 in pairs(slot1) do
			if type(slot10) == type(slot0[slot9]) then
				if type(slot10) == "function" then
					slot0.UpdateOneFunction(slot11, slot10, slot9, slot0, "HU.UpdateAllFunction", slot4 .. "    ")
				elseif type(slot10) == "table" then
					slot0.UpdateAllFunction(slot11, slot10, slot9, "HU.UpdateAllFunction", slot4 .. "    ")
				end
			elseif slot11 == nil and type(slot10) == "function" and pcall(setfenv, slot10, slot0.ENV) then
				slot0[slot9] = slot10
			end
		end

		slot7 = slot0.MetaMap[slot1]

		if type(debug.getmetatable(slot0)) == "table" and type(slot7) == "table" then
			slot0.UpdateAllFunction(slot6, slot7, slot2 .. "'s Meta", "HU.UpdateAllFunction", slot4 .. "    ")
		end
	end,
	Init = function (slot0, slot1, slot2, slot3)
		slot0.UpdateListFile = slot0
		slot0.HUMap = {}
		slot0.FileMap = {}
		slot0.NotifyFunc = slot2
		slot0.OldCode = {}
		slot0.ChangedFuncList = {}
		slot0.VisitedSig = {}
		slot0.FakeENV = nil
		slot0.ENV = slot3 or _G
		slot0.LuaPathToSysPath = {}

		slot0.InitFileMap(slot1)

		slot0.FakeT = slot0.InitFakeTable()

		slot0.InitProtection()

		slot0.ALL = false
	end,
	Update = function ()
		slot0.AddFileFromHUList()

		for slot3, slot4 in pairs(slot0.HUMap) do
			slot0.HotUpdateCode(slot3, slot4)
		end
	end
}
