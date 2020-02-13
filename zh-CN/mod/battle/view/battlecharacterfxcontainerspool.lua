ys = ys or {}
slot1 = ys.Battle.BattleResourceManager
ys.Battle.BattleCharacterFXContainersPool = singletonClass("BattleCharacterFXContainersPool")
ys.Battle.BattleCharacterFXContainersPool.__name = "BattleCharacterFXContainersPool"

function ys.Battle.BattleCharacterFXContainersPool.Ctor(slot0)
	return
end

function ys.Battle.BattleCharacterFXContainersPool.Init(slot0)
	slot0._pool = {}
	slot0._templateContainer = GameObject("characterFXContainerPoolParent")
	slot0._templateContainerTf = slot0._templateContainer.transform
	slot0._templateContainerTf.position = Vector3(-10000, -10000, 0)
end

function ys.Battle.BattleCharacterFXContainersPool.Pop(slot0, slot1, slot2)
	slot3 = slot1.localEulerAngles
	slot2 = slot2 or {
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		},
		{
			0,
			0,
			0
		}
	}
	slot4 = nil

	if #slot0._pool == 0 then
		slot4 = {}

		for slot8, slot9 in ipairs(slot0.Battle.BattleConst.FXContainerIndex) do
			slot10 = GameObject()

			slot10.transform.SetParent(slot11, slot1, false)

			slot10.transform.localPosition = Vector3(slot2[slot8][1], slot2[slot8][2], slot2[slot8][3])
			slot10.transform.localEulerAngles = Vector3(slot3.x * -1, slot3.y, slot3.z)
			slot10.name = "fxContainer_" .. slot9
			slot4[slot8] = slot10
		end
	else
		slot0._pool[#slot0._pool] = nil

		for slot8, slot9 in ipairs(slot4) do
			slot9.transform.SetParent(slot11, slot1, false)

			slot9.transform.localPosition = Vector3(slot2[slot8][1], slot2[slot8][2], slot2[slot8][3])
			slot9.transform.localEulerAngles = Vector3(slot3.x * -1, slot3.y, slot3.z)
		end
	end

	return slot4
end

function ys.Battle.BattleCharacterFXContainersPool.Push(slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		slot6.transform.SetParent(slot7, slot0._templateContainerTf, false)

		for slot12 = slot6.transform.childCount - 1, 0, -1 do
			slot0.GetInstance():DestroyOb(slot7:GetChild(slot12).gameObject)
		end
	end

	slot0._pool[#slot0._pool + 1] = slot1
end

function ys.Battle.BattleCharacterFXContainersPool.Clear(slot0)
	for slot4, slot5 in ipairs(slot0._pool) do
		for slot9, slot10 in ipairs(slot5) do
			Object.Destroy(slot10)
		end
	end

	slot0._pool = nil

	Object.Destroy(slot0._templateContainer)

	slot0._templateContainer = nil
	slot0._templateContainerTf = nil
end

return
