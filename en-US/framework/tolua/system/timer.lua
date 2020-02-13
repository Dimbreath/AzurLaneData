slot0 = setmetatable
slot1 = UpdateBeat
slot2 = CoUpdateBeat
slot3 = Time
Timer = {
	loop = 1,
	running = false,
	time = 0,
	duration = 1,
	scale = false
}
slot5 = {
	__index = Timer
}

function Timer.New(slot0, slot1, slot2, slot3)
	return slot0({
		running = false,
		func = slot0,
		duration = slot1,
		time = slot1,
		loop = slot2 or 1,
		scale = slot3 or false
	}, slot1)
end

function Timer.Start(slot0)
	slot0.running = true
	slot0.paused = nil

	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0:AddListener(slot0.handle)
end

function Timer.Reset(slot0, slot1, slot2, slot3, slot4)
	slot0.duration = slot2 or slot0.duration
	slot0.loop = slot3 or slot0.loop
	slot0.scale = slot4 or slot0.scale
	slot0.func = slot1 or slot0.func
	slot0.time = slot2 or slot0.time
	slot0.running = false
	slot0.paused = nil
end

function Timer.SetScale(slot0, slot1)
	slot0.scale = slot1
end

function Timer.Stop(slot0)
	if not slot0.running then
		return
	end

	slot0.running = false
	slot0.paused = nil
	slot0.time = 0

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

function Timer.Pause(slot0)
	slot0.paused = true
end

function Timer.Resume(slot0)
	slot0.paused = nil
end

function Timer.Update(slot0)
	if not slot0.running or slot0.paused then
		return
	end

	slot0.time = slot0.time - ((slot0.scale and slot0.deltaTime) or slot0.unscaledDeltaTime)
	slot2 = 0

	while slot0.time <= 0 and slot2 < 6 do
		slot2 = slot2 + 1

		slot0:func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
			slot0.time = slot0.time + slot0.duration
		end

		if slot0.loop == 0 then
			slot0:Stop()

			return
		end
	end
end

FrameTimer = {}
slot7 = {
	__index = FrameTimer
}

function FrameTimer.New(slot0, slot1, slot2)
	return slot1({
		running = false,
		func = slot0,
		loop = slot2 or 1,
		duration = slot1,
		count = slot0.frameCount + slot1
	}, slot2 or 1)
end

function FrameTimer.Reset(slot0, slot1, slot2, slot3)
	slot0.func = slot1
	slot0.duration = slot2
	slot0.loop = slot3
	slot0.count = slot0.frameCount + slot2
end

function FrameTimer.Start(slot0)
	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0:AddListener(slot0.handle)

	slot0.running = true
end

function FrameTimer.Stop(slot0)
	slot0.running = false

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

function FrameTimer.Update(slot0)
	if not slot0.running then
		return
	end

	if slot0.count <= slot0.frameCount then
		slot0.func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
		end

		if slot0.loop == 0 then
			slot0:Stop()
		else
			slot0.count = slot0.frameCount + slot0.duration
		end
	end
end

CoTimer = {}
slot9 = {
	__index = CoTimer
}

function CoTimer.New(slot0, slot1, slot2)
	return slot0({
		running = false,
		duration = slot1,
		loop = slot2 or 1,
		func = slot0,
		time = slot1
	}, slot1)
end

function CoTimer.Start(slot0)
	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0.running = true

	slot0:AddListener(slot0.handle)
end

function CoTimer.Reset(slot0, slot1, slot2, slot3)
	slot0.duration = slot2
	slot0.loop = slot3 or 1
	slot0.func = slot1
	slot0.time = slot2
end

function CoTimer.Stop(slot0)
	slot0.running = false

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

function CoTimer.Update(slot0)
	if not slot0.running then
		return
	end

	if slot0.time <= 0 then
		slot0.func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
			slot0.time = slot0.time + slot0.duration
		end

		if slot0.loop == 0 then
			slot0:Stop()
		elseif slot0.loop < 0 then
			slot0.time = slot0.time + slot0.duration
		end
	end

	slot0.time = slot0.time - slot0.deltaTime
end

return
