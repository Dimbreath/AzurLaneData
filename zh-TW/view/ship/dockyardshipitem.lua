slot0 = class
slot1 = "DockyardShipItem"
slot0 = slot0(slot1)
slot1 = 0
slot0.DetailType0 = slot1
slot1 = 1
slot0.DetailType1 = slot1
slot1 = 2
slot0.DetailType2 = slot1
slot1 = 3
slot0.DetailType3 = slot1
slot1 = {}
slot2 = COLOR_RED
slot1[1] = slot2
slot2 = COLOR_BLUE
slot1[2] = slot2
slot2 = COLOR_YELLOW
slot1[3] = slot2
slot0.SKILL_COLOR = slot1
slot1 = 0.8

function slot2(slot0, slot1, slot2)
	slot0.go = slot1
	slot0.showTagNoBlock = slot2 or false
	slot3 = slot1.transform
	slot0.tr = slot3
	slot3 = GetOrAddComponent
	slot4 = slot1
	slot5 = "Button"
	slot3 = slot3(slot4, slot5)
	slot0.btn = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content"
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.gameObject
	slot0.content = slot3
	slot3 = setActive
	slot4 = findTF
	slot5 = slot0.content
	slot6 = "dockyard"
	slot4 = slot4(slot5, slot6)
	slot5 = true

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = findTF
	slot5 = slot0.content
	slot6 = "collection"
	slot4 = slot4(slot5, slot6)
	slot5 = false

	slot3(slot4, slot5)

	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "quit_button"
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.gameObject
	slot0.quit = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/detail"
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.gameObject
	slot0.detail = slot3
	slot3 = findTF
	slot4 = slot0.detail
	slot5 = "layout"
	slot3 = slot3(slot4, slot5)
	slot0.detailLayoutTr = slot3
	slot3 = slot0.quit
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot0.imageQuit = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/front/frame"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot0.imageFrame = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/info/name_mask/name"
	slot3 = slot3(slot4, slot5)
	slot0.nameTF = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/npc"
	slot3 = slot3(slot4, slot5)
	slot0.npc = slot3
	slot3 = setActive
	slot4 = slot0.npc
	slot5 = false

	slot3(slot4, slot5)

	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/container/lock"
	slot3 = slot3(slot4, slot5)
	slot0.lock = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/front/status_mask"
	slot3 = slot3(slot4, slot5)
	slot0.maskStatusOb = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/status"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot0.iconStatus = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/status/Text"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Text"
	slot3 = slot3(slot4, slot5)
	slot0.iconStatusTxt = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/front/selected"
	slot3 = slot3(slot4, slot5)
	slot3 = slot3.gameObject
	slot0.selectedGo = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/container/energy"
	slot3 = slot3(slot4, slot5)
	slot0.energyTF = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/propose"
	slot3 = slot3(slot4, slot5)
	slot0.proposeTF = slot3
	slot3 = slot0.selectedGo
	slot4 = slot3
	slot3 = slot3.SetActive
	slot5 = false

	slot3(slot4, slot5)

	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/dockyard/blood"
	slot3 = slot3(slot4, slot5)
	slot0.hpBar = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/duang_6_tuzhi"
	slot3 = slot3(slot4, slot5)
	slot0.duang6tuzhi = slot3
	slot3 = findTF
	slot4 = slot0.tr
	slot5 = "content/expbuff"
	slot3 = slot3(slot4, slot5)
	slot0.expBuff = slot3
	slot3 = slot0
	slot3 = slot3.DetailType0
	slot0.detailType = slot3
	slot3 = slot0.proposeTF
	slot3 = slot3.childCount
	slot4 = 0

	if slot3 > slot4 then
		slot3 = slot0.proposeTF
		slot4 = slot3
		slot3 = slot3.GetChild
		slot5 = 0
		slot3 = slot3(slot4, slot5)
		slot0.proposeModel = slot3
		slot3 = slot0.proposeModel

		if slot3 then
			slot3 = GetComponent
			slot4 = slot0.proposeModel
			slot5 = "SkeletonGraphic"
			slot3 = slot3(slot4, slot5)
			slot0.sg = slot3
		end
	end

	slot3 = getProxy
	slot4 = ActivityProxy
	slot3 = slot3(slot4)
	slot0.activityProxy = slot3
end

slot0.Ctor = slot2

function slot2(slot0, slot1)
	slot2 = TweenItemAlphaAndWhite
	slot3 = slot0.go

	slot2(slot3)

	slot2 = slot0.proposeModel

	if slot2 then
		slot2 = LeanTween
		slot2 = slot2.cancel
		slot3 = slot0.proposeModel

		slot2(slot3)

		slot2 = LeanTween
		slot2 = slot2.value
		slot3 = go
		slot4 = slot0.proposeModel
		slot3 = slot3(slot4)
		slot4 = 0
		slot5 = 1
		slot6 = 0.4
		slot2 = slot2(slot3, slot4, slot5, slot6)
		slot3 = slot2
		slot2 = slot2.setOnUpdate
		slot4 = System
		slot4 = slot4.Action_float

		function slot5(slot0)
			slot1 = slot0
			slot1 = slot1.sg
			slot2 = Color
			slot2 = slot2.New
			slot3 = 1
			slot4 = 1
			slot5 = 1
			slot6 = slot0
			slot2 = slot2(slot3, slot4, slot5, slot6)
			slot1.color = slot2
		end

		slot2(slot3, slot4(slot5))
	end

	if slot1 then
		slot2 = slot0.go
		slot3 = slot1.configId
		slot2.name = slot3
	end

	slot2 = slot0.shipVO

	if slot2 ~= slot1 then
		slot0.shipVO = slot1
		slot3 = slot0
		slot2 = slot0.flush

		slot2(slot3)

		slot3 = slot0
		slot2 = slot0.flushDetail

		slot2(slot3)
	end
end

slot0.update = slot2

function slot2(slot0, slot1)
	slot0.detailType = slot1
	slot3 = slot0
	slot2 = slot0.flushDetail

	slot2(slot3)
end

slot0.updateDetail = slot2

function slot2(slot0, slot1)
	slot0.selected = slot1
	slot2 = slot0.selectedGo
	slot3 = slot2
	slot2 = slot2.SetActive
	slot4 = slot0.selected

	slot2(slot3, slot4)

	slot2 = slot0.selected

	if slot2 then
		slot2 = slot0.selectedTwId

		if not slot2 then
			slot2 = LeanTween
			slot2 = slot2.alpha
			slot3 = slot0.selectedGo
			slot3 = slot3.transform
			slot4 = 0.5
			slot5 = slot0
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = slot2
			slot2 = slot2.setFrom
			slot4 = 0
			slot2 = slot2(slot3, slot4)
			slot3 = slot2
			slot2 = slot2.setEase
			slot4 = LeanTweenType
			slot4 = slot4.easeInOutSine
			slot2 = slot2(slot3, slot4)
			slot3 = slot2
			slot2 = slot2.setLoopPingPong
			slot2 = slot2(slot3)
			slot2 = slot2.uniqueId
			slot0.selectedTwId = slot2
		end
	else
		slot2 = slot0.selectedTwId

		if slot2 then
			slot2 = LeanTween
			slot2 = slot2.cancel
			slot3 = slot0.selectedTwId

			slot2(slot3)

			slot2 = nil
			slot0.selectedTwId = slot2
		end
	end
end

slot0.updateSelected = slot2

function slot2(slot0)
	slot1 = slot0.shipVO
	slot2 = tobool
	slot3 = slot1
	slot2 = slot2(slot3)

	if slot2 then
		slot4 = slot1
		slot3 = slot1.getConfigTable
		slot3 = slot3(slot4)

		if not slot3 then
			return
		end

		slot4 = slot1.bindingData

		if slot4 then
			slot5 = slot4.class == WorldMapShip

			flushShipCard(slot0.tr, slot1, function (slot0, slot1)
				if slot0.shipVO.configId == slot1 then
					findTF(slot0.tr, "content/ship_icon"):GetComponent("Image").sprite = slot0
				end
			end)
			setActive(slot0.npc, slot1:isActivityNpc())

			slot7 = slot0.lock
		end

		if slot7 then
			slot0.lock.gameObject:SetActive(slot1:GetLockState() == Ship.LOCK_STATE_LOCK)
		end

		slot7 = slot1.energy <= Ship.ENERGY_MID

		if slot7 then
			slot8 = GetSpriteFromAtlas
			slot9 = "energy"
			slot11 = slot1
			slot10 = slot1.getEnergyPrint
			slot8 = slot8(slot9, slot10(slot11))

			if not slot8 then
				slot9 = warning
				slot10 = "找不到疲劳"

				slot9(slot10)
			end

			slot9 = setImageSprite
			slot10 = slot0.energyTF
			slot11 = slot8

			slot9(slot10, slot11)
		end

		setActive(slot0.energyTF, slot7)
		setText(slot0.nameTF, shortenString(slot1:getName(), 7))

		slot8 = slot1:getFleetId() == FleetProxy.PVP_FLEET_ID
		slot9 = ShipStatus.ShipStatu2Bg(slot1)

		if slot9 then
			slot10 = slot0.iconStatus
			slot11 = GetSpriteFromAtlas
			slot12 = "shipstatus"
			slot13 = slot9
			slot11 = slot11(slot12, slot13)
			slot10.sprite = slot11
			slot10 = slot0.iconStatus
			slot10 = slot10.gameObject
			slot11 = slot10
			slot10 = slot10.SetActive
			slot12 = true

			slot10(slot11, slot12)

			slot10 = slot1.inWorld

			if slot10 then
				if slot5 then
					slot10 = slot4.fleetId

					if slot10 ~= nil then
						slot10 = tf
						slot11 = slot0.iconStatus
						slot10 = slot10(slot11)
						slot11 = Vector2
						slot12 = 105
						slot13 = 36
						slot11 = slot11(slot12, slot13)
						slot10.sizeDelta = slot11
						slot10 = slot0.iconStatusTxt
						slot11 = Fleet
						slot11 = slot11.DEFAULT_NAME_FOR_DOCKYARD
						slot12 = slot4.fleetId
						slot11 = slot11[slot12]
						slot10.text = slot11
						slot10 = slot0.iconStatusTxt
						slot11 = 22
						slot10.fontSize = slot11
					else
						slot10 = slot0.iconStatus
						slot10 = slot10.gameObject
						slot11 = slot10
						slot10 = slot10.SetActive
						slot12 = false

						slot10(slot11, slot12)
					end
				else
					slot10 = tf
					slot11 = slot0.iconStatus
					slot10 = slot10(slot11)
					slot11 = Vector2
					slot12 = 105
					slot13 = 36
					slot11 = slot11(slot12, slot13)
					slot10.sizeDelta = slot11
					slot10 = slot0.iconStatusTxt
					slot11 = i18n
					slot12 = "ship_formationUI_fleetName_world"
					slot11 = slot11(slot12)
					slot10.text = slot11
					slot10 = slot0.iconStatusTxt
					slot11 = 22
					slot10.fontSize = slot11
				end
			else
				slot10 = slot1.inFleet

				if slot10 and not slot8 then
					slot10 = slot1.inChapter

					if not slot10 then
						slot10 = slot1.inElite

						if not slot10 then
							slot10 = slot1.shamInFleet

							if not slot10 then
								slot10 = slot1.inSham

								if not slot10 then
									slot10 = slot1.inChallenge

									if not slot10 then
										slot11 = slot1
										slot10 = slot1.getFleetId
										slot10 = slot10(slot11)

										if slot10 ~= nil then
											slot10 = math
											slot10 = slot10.fmod
											slot12 = slot1
											slot11 = slot1.getFleetId
											slot11 = slot11(slot12)
											slot12 = 10
											slot10 = slot10(slot11, slot12)
											slot11 = 1

											if slot10 >= slot11 then
												slot11 = 6

												if slot10 <= slot11 then
													slot11 = GetSpriteFromAtlasAsync
													slot12 = "ui/dockyardui_atlas"
													slot13 = "biandui0"
													slot14 = slot10
													slot13 = slot13 .. slot14

													function slot14(slot0)
														slot1 = slot0
														slot1 = slot1.iconStatus

														if slot1 then
															slot1 = slot0
															slot1 = slot1.iconStatus
															slot1.sprite = slot0
															slot1 = slot0
															slot1 = slot1.iconStatus
															slot2 = slot1
															slot1 = slot1.SetNativeSize

															slot1(slot2)

															slot1 = slot0
															slot1 = slot1.iconStatusTxt
															slot2 = ""
															slot1.text = slot2
														end
													end

													slot11(slot12, slot13, slot14)
												end
											else
												slot11 = tf
												slot12 = slot0.iconStatus
												slot11 = slot11(slot12)
												slot12 = Vector2
												slot13 = 195
												slot14 = 36
												slot12 = slot12(slot13, slot14)
												slot11.sizeDelta = slot12
												slot11 = slot0.iconStatusTxt
												slot12 = Fleet
												slot12 = slot12.DEFAULT_NAME_FOR_DOCKYARD
												slot14 = slot1
												slot13 = slot1.getFleetId
												slot13 = slot13(slot14)
												slot12 = slot12[slot13]
												slot11.text = slot12
												slot11 = slot0.iconStatusTxt
												slot12 = 30
												slot11.fontSize = slot12
											end
										end
									end
								end
							end
						end
					end
				else
					slot10 = tf
					slot11 = slot0.iconStatus
					slot10 = slot10(slot11)
					slot11 = Vector2
					slot12 = 195
					slot13 = 36
					slot11 = slot11(slot12, slot13)
					slot10.sizeDelta = slot11
					slot10 = slot0.iconStatusTxt
					slot11 = 30
					slot10.fontSize = slot11
					slot10 = slot0.iconStatusTxt
					slot11 = ShipStatus
					slot11 = slot11.ShipStatu2Name
					slot12 = slot1
					slot11 = slot11(slot12)
					slot10.text = slot11
				end
			end
		else
			slot10 = slot0.iconStatus
			slot10 = slot10.gameObject
			slot11 = slot10
			slot10 = slot10.SetActive
			slot12 = false

			slot10(slot11, slot12)
		end

		slot11 = slot0
		slot10 = slot0.updateBlackBlock

		slot10(slot11)

		slot10 = LOCK_PROPOSE

		if slot10 then
			return
		end

		slot11 = slot1
		slot10 = slot1.getIntimacyDetail
		slot10, slot11, slot12 = slot10(slot11)

		if slot11 <= slot12 then
			slot13 = slot1.propose

			if not slot13 and not slot6 then
				slot13 = slot0.proposeTF
				slot13 = slot13.childCount

				if slot13 == 0 then
					slot13 = LoadAndInstantiateSync
					slot14 = "UI"
					slot15 = "heartShipCard"
					slot13 = slot13(slot14, slot15)
					slot0.proposeModel = slot13
					slot14 = GetComponent
					slot15 = slot0.proposeModel
					slot16 = "SkeletonGraphic"
					slot14 = slot14(slot15, slot16)
					slot0.sg = slot14
					slot14 = slot0.proposeModel
					slot14 = slot14.transform
					slot15 = slot14
					slot14 = slot14.SetParent
					slot16 = slot0.proposeTF
					slot17 = false

					slot14(slot15, slot16, slot17)

					slot14 = GetComponent
					slot15 = slot0.proposeModel
					slot16 = typeof
					slot17 = RectTransform
					slot14 = slot14(slot15, slot16(slot17))
					slot15 = Vector3
					slot16 = 0.5
					slot17 = 0.5
					slot18 = 0.5
					slot15 = slot15(slot16, slot17, slot18)
					slot14.localScale = slot15
					slot15 = slot14.rect
					slot16 = 40
					slot15.height = slot16
					slot15 = slot14.rect
					slot16 = 40
					slot15.width = slot16
					slot15 = Vector3
					slot16 = 0
					slot17 = 0
					slot18 = 0
					slot15 = slot15(slot16, slot17, slot18)
					slot14.localPosition = slot15
					slot15 = Vector3
					slot16 = 0
					slot17 = 0
					slot18 = 0
					slot15 = slot15(slot16, slot17, slot18)
					slot14.localRotation = slot15
				end

				slot13 = slot0.sg
				slot14 = true
				slot13.enabled = slot14
			end
		else
			slot13 = slot0.proposeTF
			slot13 = slot13.childCount

			if slot13 ~= 0 then
				slot13 = slot0.sg
				slot14 = false
				slot13.enabled = slot14
			end
		end

		if slot5 then
			setActive(slot0.hpBar, true)
			setActive(slot13, slot4:IsHpSafe())
			setActive(slot14, not slot4:IsHpSafe())

			slot0.hpBar:GetComponent(typeof(Slider)).fillRect = (slot4:IsHpSafe() and slot0.hpBar:Find("fillarea/green")) or slot0.hpBar:Find("fillarea/red")

			setSlider(slot0.hpBar, 0, 10000, slot4.hpRant)

			slot15 = slot0.maskStatusOb

			if slot15 then
				slot15 = setActive
				slot16 = slot0.maskStatusOb
				slot18 = slot4
				slot17 = slot4.IsAlive
				slot17 = slot17(slot18)
				slot17 = not slot17

				slot15(slot16, slot17)
			end
		else
			slot13 = slot0.hpBar

			if slot13 then
				slot13 = setActive
				slot14 = slot0.hpBar
				slot15 = false

				slot13(slot14, slot15)
			end
		end

		slot14 = slot0
		slot13 = slot0.UpdateExpBuff

		slot13(slot14)
	end

	slot3 = slot0.content
	slot4 = slot3
	slot3 = slot3.SetActive
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.quit
	slot4 = slot3
	slot3 = slot3.SetActive
	slot5 = not slot2

	slot3(slot4, slot5)

	slot3 = slot0.btn

	if slot2 then
		slot3.targetGraphic = slot0.imageFrame or slot0.imageQuit

		return
	end
end

slot0.flush = slot2

function slot2(slot0)
	slot1 = slot0.shipVO
	slot2 = tobool
	slot3 = slot1
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = slot0.detailType
		slot4 = slot0
		slot4 = slot4.DetailType0

		if slot4 < slot3 then
			slot4 = slot1
			slot3 = slot1.getShipProperties
			slot3 = slot3(slot4)
			slot4 = {}
			slot5 = {}
			slot6 = AttributeType
			slot6 = slot6.Durability
			slot5[1] = slot6
			slot6 = AttributeType
			slot6 = slot6.Cannon
			slot5[2] = slot6
			slot6 = AttributeType
			slot6 = slot6.Torpedo
			slot5[3] = slot6
			slot6 = AttributeType
			slot6 = slot6.Air
			slot5[4] = slot6
			slot6 = AttributeType
			slot6 = slot6.Reload
			slot5[5] = slot6
			slot6 = AttributeType
			slot6 = slot6.Intimacy
			slot5[6] = slot6
			slot4[1] = slot5
			slot5 = {}
			slot6 = AttributeType
			slot6 = slot6.ArmorType
			slot5[1] = slot6
			slot6 = AttributeType
			slot6 = slot6.AntiAircraft
			slot5[2] = slot6
			slot6 = AttributeType
			slot6 = slot6.Dodge
			slot5[3] = slot6
			slot6 = AttributeType
			slot6 = slot6.AntiSub
			slot5[4] = slot6
			slot6 = AttributeType
			slot6 = slot6.Expend
			slot5[5] = slot6
			slot4[2] = slot5
			slot5 = {}
			slot4[3] = slot5
			slot6 = slot1
			slot5 = slot1.getShipCombatPower
			slot5 = slot5(slot6)
			slot6, slot7 = nil
			slot8 = slot0.detailType
			slot9 = slot0
			slot9 = slot9.DetailType3

			if slot8 == slot9 then
				slot9 = slot1
				slot8 = slot1.getDisplaySkillIds
				slot8 = slot8(slot9)
				slot6 = slot8
				slot8 = pg
				slot7 = slot8.skill_data_template
			end

			slot8 = 1
			slot9 = 6
			slot10 = 1

			for slot11 = slot8, slot9, slot10 do
				slot12 = slot0.detailLayoutTr
				slot13 = slot12
				slot12 = slot12.GetChild
				slot14 = slot11 - 1
				slot12 = slot12(slot13, slot14)
				slot13 = true
				slot15 = slot12
				slot14 = slot12.GetChild
				slot16 = 0
				slot14 = slot14(slot15, slot16)
				slot15 = slot14
				slot14 = slot14.GetComponent
				slot16 = "Text"
				slot14 = slot14(slot15, slot16)
				slot16 = slot12
				slot15 = slot12.GetChild
				slot17 = 1
				slot15 = slot15(slot16, slot17)
				slot16 = slot15
				slot15 = slot15.GetComponent
				slot17 = "Text"
				slot15 = slot15(slot16, slot17)
				slot16 = TextAnchor
				slot16 = slot16.MiddleLeft
				slot14.alignment = slot16
				slot16 = TextAnchor
				slot16 = slot16.MiddleRight
				slot15.alignment = slot16
				slot16 = slot0.detailType
				slot16 = slot4[slot16]
				slot16 = slot16[slot11]
				slot17 = slot0.detailType
				slot18 = slot0
				slot18 = slot18.DetailType1

				if slot17 == slot18 then
					if slot11 == 6 then
						slot17 = slot0.shipVO
						slot18 = slot17
						slot17 = slot17.getIntimacyDetail
						slot17, slot18, slot19 = slot17(slot18)
						slot20 = AttributeType
						slot20 = slot20.Type2Name
						slot21 = slot16
						slot20 = slot20(slot21)
						slot14.text = slot20
						slot20 = setColorStr
						slot21 = slot19

						if slot18 <= slot19 then
							slot15.text = slot20(slot21, COLOR_GREEN or COLOR_WHITE)
						end
					else
						slot17 = tostring
						slot18 = math
						slot18 = slot18.floor
						slot19 = slot3[slot16]
						slot17 = slot17(slot18(slot19))
						slot18 = AttributeType
						slot18 = slot18.Type2Name
						slot19 = slot16
						slot18 = slot18(slot19)
						slot14.text = slot18
						slot18 = setColorStr
						slot19 = slot17
						slot21 = slot0
						slot20 = slot0.canModAttr
						slot22 = slot1
						slot23 = slot16
						slot24 = slot3
						slot20 = slot20(slot21, slot22, slot23, slot24)

						if slot20 then
							slot15.text = slot18(slot19, COLOR_GREEN or COLOR_WHITE)
						end
					end
				else
					slot17 = slot0.detailType
					slot18 = slot0
					slot18 = slot18.DetailType2

					if slot17 == slot18 then
						if slot11 == 1 then
							slot17 = TextAnchor
							slot17 = slot17.MiddleCenter
							slot14.alignment = slot17
							slot18 = slot1
							slot17 = slot1.getShipArmorName
							slot17 = slot17(slot18)
							slot14.text = slot17
							slot17 = ""
							slot15.text = slot17
						elseif slot11 == 5 then
							slot18 = slot1
							slot17 = slot1.getBattleTotalExpend
							slot17 = slot17(slot18)
							slot18 = AttributeType
							slot18 = slot18.Type2Name
							slot19 = AttributeType
							slot19 = slot19.Expend
							slot18 = slot18(slot19)
							slot14.text = slot18
							slot18 = tostring
							slot19 = math
							slot19 = slot19.floor
							slot20 = slot17
							slot18 = slot18(slot19(slot20))
							slot15.text = slot18
						elseif slot11 == 6 then
							slot17 = setColorStr
							slot18 = i18n
							slot19 = "word_synthesize_power"
							slot18 = slot18(slot19)
							slot19 = COLOR_GREEN
							slot17 = slot17(slot18, slot19)
							slot14.text = slot17
							slot17 = tostring
							slot18 = math
							slot18 = slot18.floor
							slot19 = slot5
							slot17 = slot17(slot18(slot19))
							slot15.text = slot17
						else
							slot17 = AttributeType
							slot17 = slot17.Type2Name
							slot18 = slot16
							slot17 = slot17(slot18)
							slot14.text = slot17
							slot17 = tostring
							slot18 = math
							slot18 = slot18.floor
							slot19 = slot3[slot16]
							slot17 = slot17(slot18(slot19))
							slot15.text = slot17
						end
					else
						slot17 = slot0.detailType
						slot18 = slot0
						slot18 = slot18.DetailType3

						if slot17 == slot18 then
							slot17 = slot6[slot11]

							if slot17 then
								slot18 = slot1.skills
								slot18 = slot18[slot17]

								if slot18 then
									slot18 = slot7[slot17]
									slot18 = slot18.max_level

									if slot18 ~= 1 then
										slot14.alignment = TextAnchor.MiddleLeft
										slot14.text = setColorStr(i18n("skill") .. slot11, slot0.SKILL_COLOR[pg.skill_data_template[slot1.skills[slot17].id].type] or COLOR_WHITE)
										slot20 = slot1.skills[slot17].level
										slot21 = slot7[slot17].max_level

										if slot20 == slot21 then
											slot20 = "Lv.Max"
										else
											slot20 = "Lv."
											slot21 = slot18.level
											slot20 = slot20 .. slot21
										end

										slot21 = setColorStr
										slot22 = slot20
										slot23 = slot19
										slot21 = slot21(slot22, slot23)
										slot15.text = slot21
									end
								end
							else
								slot13 = false
							end
						end
					end
				end

				slot17 = setActive
				slot18 = slot12
				slot19 = slot13

				slot17(slot18, slot19)
			end
		end
	end

	slot3 = slot0.detail
	slot4 = slot3
	slot3 = slot3.SetActive

	if slot2 then
		slot3(slot4, slot0.DetailType0 < slot0.detailType)

		return
	end
end

slot0.flushDetail = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot5 = slot1
	slot4 = slot1.isBluePrintShip
	slot4 = slot4(slot5)

	if slot4 then
		slot5 = slot1
		slot4 = slot1.getBluePrint
		slot4 = slot4(slot5)
		slot6 = slot4
		slot5 = slot4.isMaxIntensifyLevel

		return slot5(slot6)
	else
		slot4 = ShipModAttr
		slot4 = slot4.ATTR_TO_INDEX
		slot4 = slot4[slot2]

		if not slot4 then
			slot4 = true

			return slot4
		else
			slot5 = slot1
			slot4 = slot1.getModAttrTopLimit
			slot6 = slot2
			slot4 = slot4(slot5, slot6)

			if slot4 == 0 then
				slot4 = true

				return slot4
			else
				slot4 = slot1.level
				slot5 = 100

				if slot4 < slot5 then
					slot5 = slot1:getModAttrBaseMax(slot2)

					if slot1.level == slot1:getMaxLevel() then
						return slot5 <= slot3[slot2]
					end
				end
			end
		end
	end
end

slot0.canModAttr = slot2

function slot2(slot0)
	slot1 = slot0.shipVO
	slot2 = slot1.blackBlock
	slot3 = slot0.maskStatusOb

	if slot3 then
		slot3 = setActive
		slot4 = slot0.maskStatusOb
		slot5 = slot2

		slot3(slot4, slot5)
	end
end

slot0.updateBlackBlock = slot2

function slot2(slot0)
	setActive(slot0.expBuff, slot0.activityProxy:getBuffShipList()[slot0.shipVO.getGroupId(slot1)] ~= nil)

	if slot3 then
		slot4 = slot3 / 100
		slot5 = slot3 % 100
		slot6 = tostring
		slot7 = slot4
		slot6 = slot6(slot7)
		slot7 = 0

		if slot5 > slot7 then
			slot7 = slot6
			slot8 = "."
			slot9 = tostring
			slot10 = slot5
			slot9 = slot9(slot10)
			slot6 = slot7 .. slot8 .. slot9
		end

		slot7 = setText
		slot8 = slot0.expBuff
		slot9 = slot8
		slot8 = slot8.Find
		slot10 = "text"
		slot8 = slot8(slot9, slot10)
		slot9 = string
		slot9 = slot9.format
		slot10 = "EXP +%s%%"
		slot11 = slot6

		slot7(slot8, slot9(slot10, slot11))
	end
end

slot0.UpdateExpBuff = slot2

function slot2(slot0)
	slot1 = slot0.selectedTwId

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.selectedTwId

		slot1(slot2)

		slot1 = nil
		slot0.selectedTwId = slot1
	end
end

slot0.clear = slot2

return slot0
