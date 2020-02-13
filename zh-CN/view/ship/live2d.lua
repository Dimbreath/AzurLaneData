slot0 = class("Live2D")
slot0.STATE_LOADING = 0
slot0.STATE_INITED = 1
slot0.STATE_DISPOSE = 2

function slot0.live2dData(slot0)
	{
		SetData = function (slot0, slot1)
			slot0.ship = slot1.ship
			slot0.parent = slot1.parent
			slot0.scale = slot1.scale
			slot0.position = slot1.position + BuildVector3(slot0:GetShipSkinConfig().live2d_offset)
		end,
		GetShipName = function (slot0)
			return slot0.ship:getPainting()
		end,
		GetShipSkinConfig = function (slot0)
			return slot0.ship:GetSkinConfig()
		end,
		isEmpty = function (slot0)
			return slot0.ship == nil
		end,
		Clear = function (slot0)
			slot0.ship = nil
			slot0.parent = nil
			slot0.scale = nil
			slot0.position = nil
		end
	}:SetData(slot0)

	return 
end

slot1 = nil

function slot2(slot0)
	if CSharpVersion > 18 then
		slot3 = slot0.live2dData:GetShipSkinConfig().lip_smoothing

		if slot0.live2dData.GetShipSkinConfig().lip_sync_gain and slot2 ~= 0 then
			slot0._go:GetComponent("CubismCriSrcMouthInput").Gain = slot2
		end

		if slot3 and slot3 ~= 0 then
			slot0._go:GetComponent("CubismCriSrcMouthInput").Smoothing = slot3
		end
	end
end

function slot3(slot0)
	if CSharpVersion >= 21 and slot0.live2dData:GetShipSkinConfig().l2d_para_range ~= nil and type(slot2) == "table" then
		for slot6, slot7 in pairs(slot2) do
			slot0.liveCom:SetParaRange(slot6, slot7)
		end
	end
end

function slot4(slot0, slot1, slot2)
	if not slot0.live2dAction or slot2 then
		slot0.liveCom:SetAction(slot0.action2Id[slot1])

		if slot0.action2Id[slot1] then
			slot0.live2dAction = true
		end
	end
end

function slot5(slot0, slot1)
	slot0.liveCom:SetCenterPart("Drawables/TouchHead", Vector3.zero)

	slot0.liveCom.DampingTime = 0.3
end

function slot6(slot0, slot1)
	slot0._go = slot1
	slot0._tf = tf(slot1)

	UIUtil.SetLayerRecursively(slot0._go, LayerMask.NameToLayer("UI"))
	slot0._tf:SetParent(slot0.live2dData.parent, true)

	slot0._tf.localScale = slot0.live2dData.scale
	slot0._tf.localPosition = slot0.live2dData.position
	slot0.liveCom = slot1:GetComponent(typeof(Live2dChar))

	slot0.liveCom:SetReactMotions(slot0.idleActions)
	slot0.liveCom:SetAction(slot2)

	function slot0.liveCom.FinishAction(slot0)
		slot0.live2dAction = nil

		if slot0.finishActionCB then
			slot0.finishActionCB()

			slot0.finishActionCB = nil
		end

		slot0.liveCom:SetAction(slot1.idleActions[math.ceil(math.random(#slot1.idleActions))])
	end

	slot0.liveCom:SetTouchParts(slot0.assistantTouchParts)

	slot0.liveCom.name = slot0.live2dData:GetShipName()

	setActive(slot0.live2dData.parent, true)
	slot1(slot0)
	slot2(slot0)
	slot2(slot0)

	slot0.state = slot4.STATE_INITED
end

function slot0.Ctor(slot0, slot1, slot2)
	slot0.state = slot0.STATE_LOADING
	slot0.live2dData = slot1
	slot1 = pg.AssistantInfo

	pg.Live2DMgr.GetInstance():GetLive2DModelAsync(slot0.live2dData:GetShipName(), function (slot0)
		if slot0.state == slot1.STATE_DISPOSE then
			Destroy(slot0)
			pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(pg.Live2DMgr.GetInstance())

			return
		end

		slot3(slot0, slot0)

		if slot4 then
			slot4()
		end
	end)
end

function slot0.GetTouchPart(slot0)
	return slot0.liveCom:GetTouchPart()
end

function slot0.TriggerAction(slot0, slot1, slot2, slot3)
	if slot2 then
		slot0.finishActionCB = slot2
	else
		slot0.finishActionCB = nil
	end

	slot0(slot0, slot1, slot3)
end

function slot0.Dispose(slot0)
	if slot0.state == slot0.STATE_INITED then
		Destroy(slot0._go)

		slot0.liveCom.FinishAction = nil
	end

	slot0.state = slot0.STATE_DISPOSE

	pg.Live2DMgr.GetInstance():TryReleaseLive2dRes(slot0.live2dData:GetShipName())

	if slot0.live2dData then
		slot0.live2dData:Clear()
	end

	slot0.live2dAction = nil
end

return slot0
