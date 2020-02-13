slot0 = class("ShipDialog")
slot1 = 0.3
slot2 = 2

function slot0.Ctor(slot0, slot1, slot2)
	slot0.dialog = slot1
	slot0.label = slot0.dialog.gameObject:GetComponentInChildren(typeof(Text))
	slot0.content = slot2
	slot0.started = false
end

function slot0.loop(slot0, slot1, slot2, slot3)
	slot0.timer = Timer.New(function ()
		slot0:display()
	end, slot2 + slot3 * math.random(), slot1)
end

function slot0.display(slot0)
	if slot0.chatOn then
		return
	end

	slot0.chatOn = true
	rtf(slot0.dialog).localScale = Vector3.New(0, 0, 1)
	slot0.label.text = slot0.content
	slot0.label.alignment = (CHAT_POP_STR_LEN < #slot0.content and TextAnchor.MiddleLeft) or TextAnchor.MiddleCenter

	LeanTween.scale(rtf(slot0.dialog), Vector3.New(1, 1, 1), slot0):setEase(LeanTweenType.easeOutBack)
	LeanTween.scale(rtf(slot0.dialog), Vector3.New(0, 0, 1), slot0):setOnComplete(System.Action(function ()
		slot0.chatOn = false
	end)):setDelay(slot0 + LeanTween.scale(rtf(slot0.dialog), Vector3.New(0, 0, 1), slot0).setOnComplete(System.Action(function ()
		slot0.chatOn = false
	end)).setDelay):setEase(LeanTweenType.easeInBack)
end

function slot0.play(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.started then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot0.started = true

		slot0.timer:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot0.timer:Resume()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-15, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.pause(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.started then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.timer:Pause()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.stop(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.timer:Stop()

	slot0.started = false

	return
	--- END OF BLOCK #0 ---



end

return slot0
