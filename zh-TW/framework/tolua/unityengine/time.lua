slot0 = rawget
slot2 = tolua.gettime
slot4 = {
	fixedDeltaTime = function (slot0)
		slot0.fixedDeltaTime = slot0
		slot0.fixedDeltaTime = slot0
	end,
	maximumDeltaTime = function (slot0)
		slot0.maximumDeltaTime = slot0
		slot0.maximumDeltaTime = slot0
	end,
	timeScale = function (slot0)
		slot0.timeScale = slot0
		slot0.timeScale = slot0
	end,
	captureFramerate = function (slot0)
		slot0.captureFramerate = slot0
		slot0.captureFramerate = slot0
	end,
	timeSinceLevelLoad = function (slot0)
		slot0.timeSinceLevelLoad = slot0
	end
}
slot6 = 1
UnityEngine.Time = {
	SetDeltaTime = function (slot0, slot1, slot2)
		slot0.deltaTime = slot1
		slot0.unscaledDeltaTime = slot2

		if slot1 - 1 == 0 and slot2 then
			slot3.time = slot2.time
			slot3.timeSinceLevelLoad = slot2.timeSinceLevelLoad
			slot3.unscaledTime = slot2.unscaledTime
			slot3.realtimeSinceStartup = slot2.realtimeSinceStartup
			slot3.frameCount = slot2.frameCount
			slot1 = 1000000
		else
			slot3.time = slot3.time + slot1
			slot3.realtimeSinceStartup = slot3.realtimeSinceStartup + slot2
			slot3.timeSinceLevelLoad = slot3.timeSinceLevelLoad + slot1
			slot3.unscaledTime = slot3.unscaledTime + slot2
		end
	end,
	SetFixedDelta = function (slot0, slot1)
		slot0.deltaTime = slot1
		slot0.fixedDeltaTime = slot1
		slot0.fixedTime = slot0.fixedTime + slot1
	end,
	SetFrameCount = function (slot0)
		slot0.frameCount = slot0.frameCount + 1
	end,
	SetTimeScale = function (slot0, slot1)
		slot0.timeScale = slot1
		slot1.timeScale = slot1

		return slot0.timeScale
	end,
	GetTimestamp = function (slot0)
		return slot0()
	end
}

setmetatable(, {
	maximumDeltaTime = 0.3333333,
	frameCount = 1,
	time = 0,
	fixedDeltaTime = 0,
	timeScale = 1,
	unscaledTime = 0,
	timeSinceLevelLoad = 0,
	realtimeSinceStartup = 0,
	unscaledDeltaTime = 0,
	deltaTime = 0,
	fixedTime = 0,
	__index = function (slot0, slot1)
		if slot0(slot1, slot1) then
			return slot2
		end

		return slot2:__index(slot1)
	end,
	__newindex = function (slot0, slot1, slot2)
		if slot0(slot1, slot1) then
			return slot3(slot2)
		end

		error(string.format("Property or indexer `UnityEngine.Time.%s' cannot be assigned to (it is read only)", slot1))
	end
})

if UnityEngine.Time ~= nil then
	slot3.maximumDeltaTime = slot1.maximumDeltaTime
	slot3.timeScale = slot1.timeScale
end

return slot5
