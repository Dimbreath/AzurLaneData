slot0 = class("ContextMediator", pm.Mediator)

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, nil, slot1)
end

function slot0.onRegister(slot0)
	slot0.event = {}

	slot0:bind(BaseUI.ON_BACK_PRESSED, function (slot0, slot1)
		uv0:onBackPressed(slot1)
	end)
	slot0:bind(BaseUI.AVALIBLE, function (slot0, slot1)
		uv0:onUIAvalible()
	end)
	slot0:bind(BaseUI.ON_BACK, function (slot0, slot1, slot2)
		if slot2 and slot2 > 0 then
			pg.UIMgr.GetInstance():LoadingOn(false)
			LeanTween.delayedCall(slot2, System.Action(function ()
				pg.UIMgr.GetInstance():LoadingOff()
				uv0:sendNotification(GAME.GO_BACK, nil, uv1)
			end))
		else
			uv0:sendNotification(GAME.GO_BACK, nil, slot1)
		end
	end)
	slot0:bind(BaseUI.ON_HOME, function (slot0)
		slot2 = getProxy(ContextProxy):getCurrentContext()

		if slot2:retriveLastChild() and slot3 ~= slot2 then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI)
	end)
	slot0:bind(BaseUI.ON_CLOSE, function (slot0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(uv0.class) then
			slot7.context = slot3

			uv0:sendNotification(GAME.REMOVE_LAYERS, {})
		end
	end)
	slot0:bind(BaseUI.ON_DROP, function (slot0, slot1, slot2)
		if slot1.type == DROP_TYPE_EQUIP then
			slot6.mediator = EquipmentInfoMediator
			slot6.viewComponent = EquipmentInfoLayer
			slot7.equipmentId = slot1.cfg.id
			slot7.type = EquipmentInfoMediator.TYPE_DISPLAY
			slot7.onRemoved = slot2
			slot6.data = {}

			uv0:addSubLayers(Context.New({}))
		else
			slot5.type = MSGBOX_TYPE_SINGLE_ITEM
			slot5.drop = slot1
			slot5.onNo = slot2
			slot5.onYes = slot2
			slot5.weight = LayerWeightConst.TOP_LAYER

			pg.MsgboxMgr.GetInstance():ShowMsgBox({})
		end
	end)
	slot0:bind(BaseUI.ON_DROP_LIST, function (slot0, slot1)
		slot4.type = MSGBOX_TYPE_ITEM_BOX
		slot4.items = slot1.itemList
		slot4.content = slot1.content
		slot4.item2Row = slot1.item2Row

		function slot4.itemFunc(slot0)
			uv0.viewComponent:emit(BaseUI.ON_DROP, slot0, function ()
				uv0.viewComponent:emit(BaseUI.ON_DROP_LIST, uv1)
			end)
		end

		slot4.weight = LayerWeightConst.TOP_LAYER

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true
		})
	end)
	slot0:bind(BaseUI.ON_ITEM, function (slot0, slot1)
		slot5.mediator = ItemInfoMediator
		slot5.viewComponent = ItemInfoLayer
		slot7.type = DROP_TYPE_ITEM
		slot7.id = slot1
		slot6.info = {}
		slot5.data = {
			mine = true
		}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(BaseUI.ON_SHIP, function (slot0, slot1)
		slot5.mediator = ItemInfoMediator
		slot5.viewComponent = ItemInfoLayer
		slot7.type = DROP_TYPE_SHIP
		slot7.id = slot1
		slot6.info = {}
		slot5.data = {
			mine = true
		}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(BaseUI.ON_AWARD, function (slot0, slot1, slot2, slot3)
		if _.all(slot1.items, function (slot0)
			return slot0.type == DROP_TYPE_ICON_FRAME or slot0.type == DROP_TYPE_CHAT_FRAME
		end) then
			if slot1.onYes then
				onNextTick(slot1.onYes)
			end

			return
		end

		slot7.mediator = AwardInfoMediator
		slot7.viewComponent = AwardInfoLayer
		slot8.awards = slot1
		slot8.title = slot2
		slot8.removeFunc = slot3
		slot8.animation = slot1.animation
		slot7.data = {}

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(BaseUI.ON_ACHIEVE, function (slot0, slot1, slot2)
		slot3 = nil
		slot3 = coroutine.create(function ()
			if table.getCount(uv0) > 0 then
				slot3.items = uv0
				slot3.onYes = uv2

				uv1.viewComponent:emit(BaseUI.ON_AWARD, {})
				coroutine.yield()

				slot3 = getProxy(BayProxy):getNewShip(true)

				_.each(_.filter(uv0, function (slot0)
					return slot0.type == DROP_TYPE_NPC_SHIP
				end), function (slot0)
					table.insert(uv0, uv1:getShipById(slot0.id))
				end)

				for slot7 = math.max(1, #slot3 - (#_.filter(uv0, function (slot0)
					return slot0.type == DROP_TYPE_SHIP
				end) + #slot1) + 1), #slot3, 1 do
					slot11.mediator = NewShipMediator
					slot11.viewComponent = NewShipLayer
					slot12.ship = slot3[slot7]
					slot11.data = {}
					slot11.onRemoved = uv2

					uv1:addSubLayers(Context.New({}))
					coroutine.yield()
				end

				for slot7, slot8 in pairs(uv0) do
					if slot8.type == DROP_TYPE_SKIN then
						if pg.ship_skin_template[slot8.id].skin_type == ShipSkin.SKIN_TYPE_REMAKE then
							-- Nothing
						elseif not getProxy(ShipSkinProxy):hasOldNonLimitSkin(slot8.id) then
							slot12.mediator = NewSkinMediator
							slot12.viewComponent = NewSkinLayer
							slot13.skinId = slot8.id
							slot12.data = {}
							slot12.onRemoved = uv2

							uv1:addSubLayers(Context.New({}))
						end

						coroutine.yield()
					end
				end
			end

			if uv3 then
				uv3()
			end
		end)

		function ()
			if uv0 and coroutine.status(uv0) == "suspended" then
				slot0, slot1 = coroutine.resume(uv0)
			end
		end()
	end)
	slot0:bind(BaseUI.ON_EQUIPMENT, function (slot0, slot1)
		slot1.type = defaultValue(slot1.type, EquipmentInfoMediator.TYPE_DEFAULT)
		slot5.mediator = EquipmentInfoMediator
		slot5.viewComponent = EquipmentInfoLayer
		slot5.data = slot1

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:bind(BaseUI.ON_SHIP_EXP, function (slot0, slot1, slot2)
		slot6.mediator = ShipExpMediator
		slot6.viewComponent = ShipExpLayer
		slot6.data = slot1
		slot6.onRemoved = slot2

		uv0:addSubLayers(Context.New({}))
	end)
	slot0:register()
end

function slot0.register(slot0)
end

function slot0.onUIAvalible(slot0)
end

function slot0.setContextData(slot0, slot1)
	slot0.contextData = slot1
end

function slot0.bind(slot0, slot1, slot2)
	slot0.viewComponent.event:connect(slot1, slot2)

	slot5.event = slot1
	slot5.callback = slot2

	table.insert(slot0.event, {})
end

function slot0.onRemove(slot0)
	slot0:remove()

	for slot4, slot5 in ipairs(slot0.event) do
		slot0.viewComponent.event:disconnect(slot5.event, slot5.callback)
	end

	slot0.event = {}
end

function slot0.remove(slot0)
end

function slot0.addSubLayers(slot0, slot1, slot2, slot3)
	slot6 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(slot0.class)

	if slot2 then
		while slot6.parent do
			slot6 = slot6.parent
		end
	end

	slot10.parentContext = slot6
	slot10.context = slot1

	function slot10.callback()
		if uv0 then
			uv0()
		end
	end

	slot0:sendNotification(GAME.LOAD_LAYERS, {})
end

function slot0.blockEvents(slot0)
	if slot0.event then
		for slot4, slot5 in ipairs(slot0.event) do
			slot0.viewComponent.event:block(slot5.event, slot5.callback)
		end
	end
end

function slot0.unblockEvents(slot0)
	if slot0.event then
		for slot4, slot5 in ipairs(slot0.event) do
			slot0.viewComponent.event:unblock(slot5.event, slot5.callback)
		end
	end
end

function slot0.onBackPressed(slot0, slot1)
	playSoundEffect(SFX_CANCEL)

	if slot1 then
		if getProxy(ContextProxy):getContextByMediator(slot0.class).parent then
			slot4 = pg.m02

			if slot4:retrieveMediator(slot3.mediator.__cname) and slot4.viewComponent then
				slot4.viewComponent:onBackPressed()
			end
		end
	else
		slot0.viewComponent:closeView()
	end
end

return slot0
