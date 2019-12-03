ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = require("Mgr/Pool/PoolUtil")
ys.Battle.BattlePopNum = class("BattlePopNum")
ys.Battle.BattlePopNum.__name = "BattlePopNum"
ys.Battle.BattlePopNum.NUM_INIT_OFFSET = Vector3(0, 1.6, 0)
slot4 = Vector3(10000, 10000)
slot5 = Vector2(1, 1)

ys.Battle.BattlePopNum.Ctor = function (slot0, slot1, slot2)
	slot0.mgr = slot2.mgr
	slot0.pool = slot1
	slot3 = Object.Instantiate(slot2.template)
	slot0._go = slot3
	slot0._tf = slot3.transform

	slot0:SetParent(slot2.parentTF)

	slot0._animator = slot3:GetComponent(typeof(Animator))

	if slot0._tf:Find("text") then
		slot0.textCom = slot4:GetComponent(typeof(Text))
	end

	slot3:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		slot0:Recycle(slot0.Recycle)
	end)

	slot0._tfposition = Vector3.zero
end

ys.Battle.BattlePopNum.SetParent = function (slot0, slot1)
	slot0._tf:SetParent(slot1, false)
end

ys.Battle.BattlePopNum.SetText = function (slot0, slot1)
	slot0.textCom.text = tostring(slot1)
end

ys.Battle.BattlePopNum.Update = function (slot0)
	slot0:updatePopNumPosition()
end

ys.Battle.BattlePopNum.SetReferenceCharacter = function (slot0, slot1, slot2)
	slot0._referenceCharacter = slot1
	slot0._bulletOffset = Vector3(slot2.x, 0, 0)

	slot0:updatePopNumPosition()
end

ys.Battle.BattlePopNum.updatePopNumPosition = function (slot0)
	if not slot0._referenceCharacter:GetReferenceVector(slot0._bulletOffset) then
		return
	end

	slot0._tfposition:Set(slot1.x, slot1.y, slot1.z)
	slot0._tfposition:Add(slot0.NUM_INIT_OFFSET)

	slot0._tf.position = slot0._tfposition
end

ys.Battle.BattlePopNum.Play = function (slot0)
	slot0._animator.enabled = true
end

ys.Battle.BattlePopNum.Init = function (slot0)
	slot0._go:SetActive(true)
end

ys.Battle.BattlePopNum.SetScale = function (slot0, slot1)
	slot0._tf.localScale = Vector2(slot1, slot1)
end

ys.Battle.BattlePopNum.Recycle = function (slot0)
	slot0._animator.enabled = false

	slot0.mgr:UnloadPopNum(slot0)

	slot0._tf.position = slot0
	slot0._tf.localScale = slot0._tf
end

ys.Battle.BattlePopNum.Dispose = function (slot0)
	slot0._go:SetActive(false)

	slot0._go = nil
	slot0._tf = nil
end

return
