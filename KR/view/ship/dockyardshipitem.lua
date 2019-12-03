slot0 = class("DockyardShipItem")
slot0.DetailType0 = 0
slot0.DetailType1 = 1
slot0.DetailType2 = 2
slot0.DetailType3 = 3
slot0.SKILL_COLOR = {
	COLOR_RED,
	COLOR_BLUE,
	COLOR_YELLOW
}
slot1 = 0.8

function slot0.Ctor(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.showTagNoBlock = slot2 or false
	slot0.tr = slot1.transform
	slot0.btn = GetOrAddComponent(slot1, "Button")
	slot0.content = findTF(slot0.tr, "content").gameObject

	setActive(findTF(slot0.content, "dockyard"), true)
	setActive(findTF(slot0.content, "collection"), false)

	slot0.quit = findTF(slot0.tr, "quit_button").gameObject
	slot0.detail = findTF(slot0.tr, "content/dockyard/detail").gameObject
	slot0.detailLayoutTr = findTF(slot0.detail, "layout")
	slot0.imageQuit = slot0.quit:GetComponent("Image")
	slot0.imageFrame = findTF(slot0.tr, "content/front/frame"):GetComponent("Image")
	slot0.nameTF = findTF(slot0.tr, "content/info/name_mask/name")
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
	slot0.duang6tuzhi = findTF(slot0.tr, "content/duang_6_tuzhi")
	slot0.expBuff = findTF(slot0.tr, "content/expbuff")
	slot0.detailType = slot0.DetailType0

	if slot0.proposeTF.childCount > 0 then
		slot0.proposeModel = slot0.proposeTF:GetChild(0)

		if slot0.proposeModel then
			slot0.sg = GetComponent(slot0.proposeModel, "SkeletonGraphic")
		end
	end

	slot0.activityProxy = getProxy(ActivityProxy)
end

function slot0.update(slot0, slot1)
	TweenItemAlphaAndWhite(slot0.go)

	if slot0.proposeModel then
		LeanTween.cancel(slot0.proposeModel)
		LeanTween.value(go(slot0.proposeModel), 0, 1, 0.4):setOnUpdate(System.Action_float(function (slot0)
			slot0.sg.color = Color.New(1, 1, 1, slot0)
		end))
	end

	if slot1 then
		slot0.go.name = slot1.configId
	end

	if slot0.shipVO ~= slot1 then
		slot0.shipVO = slot1

		slot0:flush()
		slot0:flushDetail()
	end
end

function slot0.updateDetail(slot0, slot1)
	slot0.detailType = slot1

	slot0:flushDetail()
end

function slot0.updateSelected(slot0, slot1)
	slot0.selected = slot1

	slot0.selectedGo:SetActive(slot0.selected)

	if slot0.selected then
		if not slot0.selectedTwId then
			slot0.selectedTwId = LeanTween.alpha(slot0.selectedGo.transform, 0.5, slot0):setFrom(0):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId
		end
	elseif slot0.selectedTwId then
		LeanTween.cancel(slot0.selectedTwId)

		slot0.selectedTwId = nil
	end
end

function slot0.flush(slot0)
	if tobool(slot0.shipVO) then
		if not slot1:getConfigTable() then
			return

			slot5 = slot1.bindingData and slot4.class == WorldMapShip

			flushShipCard(slot0.tr, slot1, function (slot0, slot1)
				if slot0.shipVO.configId == slot1 then
					findTF(slot0.tr, "content/ship_icon"):GetComponent("Image").sprite = slot0
				end
			end)
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
		setText(slot0.nameTF, shortenString(slot1:getName(), 7))

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
						if slot0.iconStatus then
							slot0.iconStatus.sprite = slot0

							slot0.iconStatus:SetNativeSize()

							slot0.iconStatusTxt.text = ""
						end
					end)
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

		slot0:updateBlackBlock()

		if LOCK_PROPOSE then
			return
		end

		slot10, slot11, slot12 = slot1:getIntimacyDetail()

		if slot11 <= slot12 and not slot1.propose and not slot6 then
			if slot0.proposeTF.childCount == 0 then
				slot0.proposeModel = LoadAndInstantiateSync("UI", "heartShipCard")
				slot0.sg = GetComponent(slot0.proposeModel, "SkeletonGraphic")

				slot0.proposeModel.transform:SetParent(slot0.proposeTF, false)

				slot14 = GetComponent(slot0.proposeModel, typeof(RectTransform))
				slot14.localScale = Vector3(0.5, 0.5, 0.5)
				slot14.rect.height = 40
				slot14.rect.width = 40
				slot14.localPosition = Vector3(0, 0, 0)
				slot14.localRotation = Vector3(0, 0, 0)
			end

			slot0.sg.enabled = true
		elseif slot0.proposeTF.childCount ~= 0 then
			slot0.sg.enabled = false
		end

		if slot5 then
			setActive(slot0.hpBar, true)
			setActive(slot13, slot4:IsHpSafe())
			setActive(slot14, not slot4:IsHpSafe())

			slot0.hpBar:GetComponent(typeof(Slider)).fillRect = (slot4:IsHpSafe() and slot13) or slot14

			setSlider(slot0.hpBar, 0, 10000, slot4.hpRant)

			if slot0.maskStatusOb then
				setActive(slot0.maskStatusOb, not slot4:IsAlive())
			end
		elseif slot0.hpBar then
			setActive(slot0.hpBar, false)
		end

		slot0:UpdateExpBuff()
	end

	slot0.content:SetActive(slot2)
	slot0.quit:SetActive(not slot2)

	slot0.btn.targetGraphic = (slot2 and slot0.imageFrame) or slot0.imageQuit
end

function slot0.flushDetail(slot0)
	if tobool(slot0.shipVO) and slot0.DetailType0 < slot0.detailType then
		slot3 = slot1:getShipProperties()
		slot4 = {
			{
				AttributeType.Durability,
				AttributeType.Cannon,
				AttributeType.Torpedo,
				AttributeType.Air,
				AttributeType.Reload,
				AttributeType.Intimacy
			},
			{
				AttributeType.ArmorType,
				AttributeType.AntiAircraft,
				AttributeType.Dodge,
				AttributeType.AntiSub,
				AttributeType.Expend
			},
			{}
		}
		slot5 = slot1:getShipCombatPower()
		slot6, slot7 = nil

		if slot0.detailType == slot0.DetailType3 then
			slot6 = slot1:getDisplaySkillIds()
			slot7 = pg.skill_data_template
		end

		function slot8(slot0)
			if not ShipModAttr.ATTR_TO_INDEX[slot0] then
				return true
			elseif slot0:getModAttrTopLimit(slot0) == 0 then
				return true
			else
				return (slot0.level >= 100 or slot0.level == slot0:getMaxLevel()) and slot0:getModAttrBaseMax(slot0) <= slot0.level >= 100 or slot0.level == slot0.getMaxLevel()[slot0]
			end
		end

		for slot12 = 1, 6, 1 do
			slot13 = slot0.detailLayoutTr:GetChild(slot12 - 1)
			slot14 = true
			slot13:GetChild(0):GetComponent("Text").alignment = TextAnchor.MiddleLeft
			slot13:GetChild(1):GetComponent("Text").alignment = TextAnchor.MiddleRight
			slot17 = slot4[slot0.detailType][slot12]

			if slot0.detailType == slot0.DetailType1 then
				if slot12 == 6 then
					slot18, slot19, slot22 = slot0.shipVO:getIntimacyDetail()
					slot15.text = AttributeType.Type2Name(slot17)
					slot16.text = setColorStr(slot22, (slot19 <= slot20 and COLOR_GREEN) or COLOR_WHITE)
				else
					slot15.text = AttributeType.Type2Name(slot17)
					slot16.text = setColorStr(tostring(math.floor(slot3[slot17])), (slot8(slot17) and COLOR_GREEN) or COLOR_WHITE)
				end
			elseif slot0.detailType == slot0.DetailType2 then
				if slot12 == 1 then
					slot15.alignment = TextAnchor.MiddleCenter
					slot15.text = slot1:getShipArmorName()
					slot16.text = ""
				elseif slot12 == 5 then
					slot15.text = AttributeType.Type2Name(AttributeType.Expend)
					slot16.text = tostring(math.floor(slot1:getBattleTotalExpend()))
				elseif slot12 == 6 then
					slot15.text = setColorStr(i18n("word_synthesize_power"), COLOR_GREEN)
					slot16.text = tostring(math.floor(slot5))
				else
					slot15.text = AttributeType.Type2Name(slot17)
					slot16.text = tostring(math.floor(slot3[slot17]))
				end
			elseif slot0.detailType == slot0.DetailType3 then
				if slot6[slot12] and slot1.skills[slot18] and slot7[slot18].max_level ~= 1 then
					slot15.alignment = TextAnchor.MiddleLeft
					slot15.text = setColorStr(i18n("skill") .. slot12, slot0.SKILL_COLOR[pg.skill_data_template[slot1.skills[slot18].id].type] or COLOR_WHITE)
					slot16.text = setColorStr((slot19.level == slot7[slot18].max_level and "Lv.Max") or "Lv." .. slot19.level, slot0.SKILL_COLOR[pg.skill_data_template[slot1.skills[slot18].id].type] or COLOR_WHITE)
				else
					slot14 = false
				end
			end

			setActive(slot13, slot14)
		end
	end

	slot0.detail:SetActive(slot2 and slot0.DetailType0 < slot0.detailType)
end

function slot0.updateBlackBlock(slot0)
	slot2 = slot0.shipVO.blackBlock

	if slot0.maskStatusOb then
		setActive(slot0.maskStatusOb, slot2)
	end
end

function slot0.UpdateExpBuff(slot0)
	setActive(slot0.expBuff, slot0.activityProxy:getBuffShipList()[slot0.shipVO.getGroupId(slot1)] ~= nil)

	if slot3 then
		slot6 = tostring(slot4)

		if slot3 % 100 > 0 then
			slot6 = slot6 .. "." .. tostring(slot5)
		end

		setText(slot0.expBuff:Find("text"), string.format("EXP +%s%%", slot6))
	end
end

function slot0.clear(slot0)
	if slot0.selectedTwId then
		LeanTween.cancel(slot0.selectedTwId)

		slot0.selectedTwId = nil
	end
end

return slot0
