slot0 = class("SummerFeastNavigationAgent", require("view.main.NavalAcademyStudent"))

function slot0.Ctor(slot0, slot1)
	slot0.onTransEdge = nil

	slot0.super.Ctor(slot0, slot1)
end

function slot0.init(slot0)
	return
end

slot0.normalSpeed = 150
slot0.normalScale = 0.5

function slot0.SetOnTransEdge(slot0, slot1)
	slot0.onTransEdge = slot1
end

function slot0.setCurrentIndex(slot0, slot1)
	if not slot1 then
		return
	end

	slot0.currentPoint = slot0.pathFinder:getPoint(slot1)
end

function slot0.updateStudent(slot0, slot1)
	if slot1 == nil or slot1 == "" then
		setActive(slot0._go, false)

		return
	end

	setActive(slot0._go, true)

	if slot0.prefabName ~= slot1 then
		if not IsNil(slot0.model) then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)
		end

		slot0.prefab = slot1
		slot0.currentPoint = slot0.currentPoint or slot0.pathFinder:getRandomPoint()
		slot0.targetPoint = slot0.currentPoint
		slot2 = slot0.currentPoint.id
		slot0._tf.anchoredPosition = slot0.currentPoint

		if slot0.onTransEdge then
			slot0:onTransEdge(slot2, slot2)
		end

		PoolMgr.GetInstance():GetSpineChar(slot0.prefab, true, function (slot0)
			if slot0 ~= slot1.prefab then
				PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

				return
			end

			slot1.model = slot0
			slot1.model.transform.localScale = Vector3.one
			slot1.model.transform.model.transform.localPosition = Vector3.zero

			slot1.model.transform.model.transform.model.transform:SetParent(slot1._tf, false)

			slot1.model.transform.model.transform.model.transform.SetParent.anim = slot1.model:GetComponent(typeof(SpineAnimUI))

			slot1.model.transform.model.transform.model.transform.SetParent:updateState(slot2.ShipState.Walk)
		end)
	end

	slot0.prefabName = slot1
end

function slot0.updateLogic(slot0)
	slot0:clearLogic()

	if slot0.state == slot0.ShipState.Walk then
		LeanTween.value(slot0._go, 0, 1, Vector2.Distance(slot1, slot2) / 15):setOnUpdate(System.Action_float(function (slot0)
			slot0._tf.anchoredPosition = Vector2.Lerp(slot0._tf, Vector2.Lerp, slot0)
			slot3 = slot1.scale or slot3.normalScale.scale or slot3.normalScale
			slot1.x = slot1.x * ((slot1.x < Vector2.one.x and 1) or -1)
			slot0._tf.localScale = slot1
		end)):setOnComplete(System.Action(function ()
			slot0.currentPoint = slot0.targetPoint
			slot2 = slot0.currentPoint.nexts[math.random(1, #slot0.currentPoint.nexts)]

			if slot0.onTransEdge and slot2 then
				slot0.targetPoint = slot0.pathFinder:getPoint(slot2)

				slot0:onTransEdge(slot0, slot2)
			end

			slot0:updateState(slot1.ShipState.Idle)
		end))

		return
	end

	if slot0.state == slot0.ShipState.Idle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-50, warpins: 1 ---
		if not slot0.currentPoint.isBan then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-66, warpins: 1 ---
			slot0.idleTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:updateState(slot1.ShipState.Walk)

				return
				--- END OF BLOCK #0 ---



			end, math.random(10, 20), 1)

			slot0.idleTimer:Start()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 67-78, warpins: 1 ---
			slot0.idleTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:updateState(slot1.ShipState.Walk)

				return
				--- END OF BLOCK #0 ---



			end, 0.001, 1)

			slot0.idleTimer:Start()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-84, warpins: 1 ---
		if slot0.state == slot0.ShipState.Touch then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-87, warpins: 1 ---
			slot0:onClickShip()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
end

return slot0
