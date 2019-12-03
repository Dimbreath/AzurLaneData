slot0 = class("ShipDetailCard")
slot1 = 0.5

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.showTagNoBlock = slot2 or false
	slot0.tr = slot1.transform
	slot0.toggle = GetOrAddComponent(slot0.tr, typeof(Toggle))
	slot0.content = findTF(slot0.tr, "content").gameObject
	slot0.quit = findTF(slot0.tr, "quit_button").gameObject
	slot0.detail = findTF(slot0.tr, "content/dockyard/detail").gameObject
	slot0.detailLayoutTr = findTF(slot0.detail, "layout")
	slot0.imageQuit = slot0.quit:GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/front/frame"):GetComponent("Image")
	slot0.labelName = ScrollTxt.New(findTF(slot0.tr, "content/info/name_mask"), findTF(slot0.tr, "content/info/name_mask/name"))
	slot0.npc = findTF(slot0.tr, "content/dockyard/npc")

	setActive(slot0.npc, false)

	slot0.lock = findTF(slot0.tr, "content/dockyard/container/lock")
	slot0.maskStatusOb = findTF(slot0.tr, "content/front/status_mask")
	slot0.iconStatus = findTF(slot0.tr, "content/dockyard/status"):GetComponent("Image")
	slot0.iconStatusTxt = findTF(slot0.tr, "content/dockyard/status/Text"):GetComponent("Text")
	slot0.selectedGo = findTF(slot0.tr, "content/front/selected").gameObject
	slot0.energyTF = findTF(slot0.tr, "content/dockyard/container/energy")
	slot0.proposeTF = findTF(slot0.tr, "content/dockyard/propose")

	slot0.selectedGo:SetActive(false)

	slot0.hpBar = findTF(slot0.tr, "content/dockyard/blood")
end

function slot0.update(slot0, slot1)
	if slot0.shipVO ~= slot1 then
		slot0.shipVO = slot1

		slot0:flush()
	end
end

function slot0.updateSelected(slot0, slot1)
	slot0.selected = slot1

	slot0.selectedGo:SetActive(slot0.selected)

	if slot0.selected then
		if not slot0.selectedTw then
			slot0.selectedTw = LeanTween.alpha(slot0.selectedGo.transform, 1, slot0):setFrom(0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
		end
	elseif slot0.selectedTw then
		LeanTween.cancel(slot0.selectedTw.uniqueId)

		slot0.selectedTw = nil
	end
end

function slot0.flush(slot0)
	if tobool(slot0.shipVO) then
		if not slot1:getConfigTable() then
			return

			slot5 = slot1.bindingData and slot4.class == WorldMapShip

			flushShipCard(slot0.tr, slot1)
			setActive(slot0.npc, slot1:isActivityNpc())

			if slot0.lock then
				slot0.lock.gameObject:SetActive(slot1:GetLockState() == Ship.LOCK_STATE_LOCK)
			end
		end

		if slot1.energy <= Ship.ENERGY_MID then
			if not GetSpriteFromAtlas("energy", slot1:getEnergyPrint()) then
				warning("找不到疲劳")
			end

			setImageSprite(slot0.energyTF, slot8)
		end

		setActive(slot0.energyTF, slot7)
		slot0.labelName:setText(slot1:getName())

		slot8 = slot1:getFleetId() == FleetProxy.PVP_FLEET_ID

		if ShipStatus.ShipStatu2Bg(slot1) then
			slot0.iconStatus.sprite = GetSpriteFromAtlas("shipstatus", slot9)

			slot0.iconStatus.gameObject:SetActive(true)

			if slot1.inWorld then
				if slot5 then
					if slot4.fleetId ~= nil then
						tf(slot0.iconStatus).sizeDelta = Vector2(105, 36)
						slot0.iconStatusTxt.text = Fleet.DEFAULT_NAME_FOR_DOCKYARD[slot4.fleetId]
						slot0.iconStatusTxt.fontSize = 22
					else
						slot0.iconStatus.gameObject:SetActive(false)
					end
				else
					tf(slot0.iconStatus).sizeDelta = Vector2(105, 36)
					slot0.iconStatusTxt.text = i18n("ship_formationUI_fleetName_world")
					slot0.iconStatusTxt.fontSize = 22
				end
			elseif slot1.inFleet and not slot8 and not slot1.inChapter and not slot1.inElite and not slot1.shamInFleet and not slot1.inSham and not slot1.inChallenge and slot1:getFleetId() ~= nil then
				if math.fmod(slot1:getFleetId(), 10) >= 1 and slot10 <= 6 then
					GetSpriteFromAtlasAsync("ui/dockyardui_atlas", "biandui0" .. slot10, function (slot0)
						if not IsNil(slot0.iconStatus) then
							slot0.iconStatus.sprite = slot0
						end
					end)
					slot0.iconStatus:SetNativeSize()

					slot0.iconStatusTxt.text = ""
				else
					tf(slot0.iconStatus).sizeDelta = Vector2(195, 36)
					slot0.iconStatusTxt.text = Fleet.DEFAULT_NAME_FOR_DOCKYARD[slot1:getFleetId()]
					slot0.iconStatusTxt.fontSize = 30
				end
			else
				tf(slot0.iconStatus).sizeDelta = Vector2(195, 36)
				slot0.iconStatusTxt.fontSize = 30
				slot0.iconStatusTxt.text = ShipStatus.ShipStatu2Name(slot1)
			end
		else
			slot0.iconStatus.gameObject:SetActive(false)
		end

		slot10, slot11, slot12 = slot1:getIntimacyDetail()

		if slot11 <= slot12 and not slot1.propose and not slot6 then
			setActive(slot0.proposeTF, true)
		else
			setActive(slot0.proposeTF, false)
		end
	end

	slot0.content:SetActive(slot2)
end

function slot0.clear(slot0)
	if slot0.selectedTw then
		LeanTween.cancel(slot0.selectedTw.uniqueId)

		slot0.selectedTw = nil
	end

	slot0.iconType.sprite = nil
	slot0.imageFrame.sprite = nil
	slot0.iconShip.sprite = nil
	slot0.iconStatus.sprite = nil
	slot0.shipVO = nil

	slot0.labelName:clear()
end

return slot0
