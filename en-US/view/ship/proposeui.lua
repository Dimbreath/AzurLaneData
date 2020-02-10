slot0 = class
slot1 = "ProposeSceneUI"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = {
	1,
	2,
	3,
	4,
	4,
	5,
	5,
	7,
	7,
	7,
	7,
	6,
	7
}
slot2 = {
	us = 1,
	de = 4,
	cm = 0,
	cn = 5,
	np = 9,
	um = 11,
	en = 2,
	jp = 3,
	mnf = 8,
	bili = 10,
	ff = 7,
	sn = 6
}
slot0.nationSpriteIndex = slot2

function slot2(slot0)
	slot1 = "ProposeUI"

	return slot1
end

slot0.getUIName = slot2

function slot2(slot0, slot1)
	slot0.shipVO = slot1
	slot3 = slot0
	slot2 = slot0.setShipGroupID
	slot4 = slot0.shipVO
	slot5 = slot4
	slot4 = slot4.getGroupId

	slot2(slot3, slot4(slot5))
end

slot0.setShip = slot2

function slot2(slot0, slot1)
	slot0.shipGroupID = slot1
end

slot0.setShipGroupID = slot2

function slot2(slot0, slot1)
	slot0.reviewSkinID = slot1
end

slot0.setWeddingReviewSkinID = slot2

function slot2(slot0, slot1)
	slot0.bagProxy = slot1
end

slot0.setBagProxy = slot2

function slot2(slot0, slot1)
	slot0.player = slot1
end

slot0.setPlayer = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "close/bg"
	slot1 = slot1(slot2, slot3)
	slot0.storybg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "add"
	slot1 = slot1(slot2, slot3)
	slot0.bgAdd = slot1
	slot1 = setActive
	slot2 = slot0.storybg
	slot3 = false

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.bgAdd
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "actor_middle"
	slot1 = slot1(slot2, slot3)
	slot0.targetActorTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mask"
	slot1 = slot1(slot2, slot3)
	slot0.maskTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "skip_button"
	slot1 = slot1(slot2, slot3)
	slot0.skipBtn = slot1
	slot1 = nil
	slot0.actorPainting = slot1
	slot1 = slot0.contextData
	slot1 = slot1.review
	slot0.weddingReview = slot1
	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "OverlayCamera/Overlay/UIMain/common"
	slot1 = slot1(slot2)
	slot0.commonTF = slot1
end

slot0.init = slot2

function slot2(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.review

	if slot1 then
		-- Nothing
	end

	slot1 = slot0.commonTF

	if slot1 then
		slot1 = setActive
		slot2 = slot0.commonTF
		slot3 = false

		slot1(slot2, slot3)
	end

	slot1 = slot0.contextData
	slot1 = slot1.review
	slot0.weddingReview = slot1
	slot1 = slot0.weddingReview

	if slot1 then
		slot1 = slot0.contextData
		slot1 = slot1.group
		slot2 = slot1
		slot1 = slot1.getNation
		slot1 = slot1(slot2)
		slot2 = Nation
		slot2 = slot2.Nation2BG
		slot3 = slot1
		slot2 = slot2(slot3)
		slot0.bgName = slot2
		slot2 = slot0.bgName

		if not slot2 then
			slot2 = Nation
			slot2 = slot2.Nation2BG
			slot3 = 0
			slot2 = slot2(slot3)
			slot0.bgName = slot2
		end

		slot2 = setActive
		slot3 = slot0.skipBtn
		slot4 = true

		slot2(slot3, slot4)

		slot2 = onButton
		slot3 = slot0
		slot4 = slot0.skipBtn

		function slot5()
			slot0 = LeanTween
			slot0 = slot0.cancelAll
			slot1 = false

			slot0(slot1)

			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = uv1
			slot2 = slot2.ON_CLOSE

			slot0(slot1, slot2)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot3 = slot0
		slot2 = slot0.setMask
		slot4 = true

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.showProposePanel

		slot2(slot3)

		slot2 = pg
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._tf

		slot2(slot3, slot4)
	else
		slot1 = onButton
		slot2 = slot0
		slot4 = slot0
		slot3 = slot0.findTF
		slot5 = "close0"
		slot3 = slot3(slot4, slot5)

		function slot4()
			slot0 = uv0
			slot0 = slot0.proposeEndFlag

			if slot0 then
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.DisplayRenamePanel

				slot0(slot1)
			else
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = uv1
				slot2 = slot2.ON_CLOSE

				slot0(slot1, slot2)
			end
		end

		slot5 = SFX_CANCEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = onButton
		slot2 = slot0
		slot4 = slot0
		slot3 = slot0.findTF
		slot5 = "close_end"
		slot3 = slot3(slot4, slot5)

		function slot4()
			slot0 = uv0
			slot0 = slot0.proposeEndFlag

			if slot0 then
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.DisplayRenamePanel

				slot0(slot1)
			else
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = uv1
				slot2 = slot2.ON_CLOSE

				slot0(slot1, slot2)
			end
		end

		slot5 = SFX_CANCEL

		slot1(slot2, slot3, slot4, slot5)

		slot1 = slot0.shipVO
		slot2 = slot1
		slot1 = slot1.getConfigTable
		slot1 = slot1(slot2)
		slot1 = slot1.nationality
		slot2 = "Propose"
		slot3 = Nation
		slot3 = slot3.Nation2Side
		slot4 = slot1
		slot3 = slot3(slot4)
		slot4 = "UI"
		slot2 = slot2 .. slot3 .. slot4
		slot3 = Nation
		slot3 = slot3.Nation2BG
		slot4 = slot1
		slot3 = slot3(slot4)
		slot0.bgName = slot3
		slot3 = PoolMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetUI
		slot5 = slot2
		slot6 = true

		function slot7(slot0)
			slot1 = pg
			slot1 = slot1.UIMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.LoadingOff

			slot1(slot2)

			slot1 = uv0
			slot1 = slot1.exited

			if slot1 then
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ReturnUI
				slot3 = uv1
				slot4 = slot0

				slot1(slot2, slot3, slot4)

				return
			end

			slot1 = uv0
			slot2 = tf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot1.window = slot2
			slot1 = setParent
			slot2 = tf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot3 = uv0
			slot4 = slot3
			slot3 = slot3.findTF
			slot5 = "window"

			slot1(slot2, slot3(slot4, slot5))

			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "intimacy/icon"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "intimacy/value"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyValueTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "button"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.button = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "desc"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyDesc = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "descPic/desc_time"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacydescTime = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "descPic"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyDescPic = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "desc_buff"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyBuffDesc = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "paintMask/paint"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1._paintingTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "intimacy/achieved"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyAchieved = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "intimacy/no_achieved"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.intimacyNoAchieved = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "ringCount/achieved"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.ringAchieved = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "ringCount/no_achieved"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.ringNoAchieved = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "ringCount/value"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.ringValue = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "title1/Text"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.nameTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "title2/Text"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.shipNameTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "Camp"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.campTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "done"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.doneTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "CampSprite"
			slot5 = uv0
			slot5 = slot5.window
			slot2 = slot2(slot3, slot4, slot5)
			slot1.CampSprite = slot2
			slot1 = setActive
			slot2 = uv0
			slot2 = slot2.window
			slot3 = true

			slot1(slot2, slot3)

			slot1 = setText
			slot2 = uv0
			slot2 = slot2.nameTF
			slot3 = uv0
			slot3 = slot3.player
			slot3 = slot3.name

			slot1(slot2, slot3)

			slot1 = setText
			slot2 = uv0
			slot2 = slot2.shipNameTF
			slot3 = uv0
			slot3 = slot3.shipVO
			slot4 = slot3
			slot3 = slot3.getName

			slot1(slot2, slot3(slot4))

			slot1 = uv0
			slot1 = slot1.CampSprite

			if slot1 then
				slot1 = getImageSprite
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.findTF
				slot4 = Nation
				slot4 = slot4.Nation2Print
				slot5 = uv2
				slot4 = slot4(slot5)
				slot5 = uv0
				slot5 = slot5.CampSprite
				slot1 = slot1(slot2(slot3, slot4, slot5))

				if not slot1 then
					slot2 = warning
					slot3 = "找不到印花, shipConfigId: "
					slot4 = uv0
					slot4 = slot4.shipVO
					slot4 = slot4.configId
					slot3 = slot3 .. slot4

					slot2(slot3)

					slot2 = setActive
					slot3 = uv0
					slot3 = slot3.campTF
					slot4 = false

					slot2(slot3, slot4)
				else
					slot2 = setImageSprite
					slot3 = uv0
					slot3 = slot3.campTF
					slot4 = slot1
					slot5 = false

					slot2(slot3, slot4, slot5)

					slot2 = setActive
					slot3 = uv0
					slot3 = slot3.campTF
					slot4 = true

					slot2(slot3, slot4)
				end
			end

			slot1 = uv0
			slot1 = slot1.shipVO
			slot2 = slot1
			slot1 = slot1.getIntimacyDetail
			slot1, slot2, slot3 = slot1(slot2)
			slot4 = GetSpriteFromAtlas
			slot5 = "energy"
			slot6 = slot1
			slot4 = slot4(slot5, slot6)
			slot5 = setImageSprite
			slot6 = uv0
			slot6 = slot6.intimacyTF
			slot7 = slot4
			slot8 = true

			slot5(slot6, slot7, slot8)

			slot5 = setActive
			slot6 = uv0
			slot6 = slot6.intimacyTF
			slot7 = true

			slot5(slot6, slot7)

			slot5 = setText
			slot6 = uv0
			slot6 = slot6.intimacyValueTF
			slot7 = i18n
			slot8 = "propose_intimacy_tip"
			slot9 = slot3

			slot5(slot6, slot7(slot8, slot9))

			slot5 = 100

			if slot3 >= slot5 then
				slot5 = setTextColor
				slot6 = uv0
				slot6 = slot6.intimacyValueTF
				slot7 = Color
				slot7 = slot7.white

				slot5(slot6, slot7)
			else
				slot5 = setTextColor
				slot6 = uv0
				slot6 = slot6.intimacyValueTF
				slot7 = Color
				slot7 = slot7.New
				slot8 = 0.5843137254901961
				slot9 = 0.5215686274509804
				slot10 = 0.40784313725490196

				slot5(slot6, slot7(slot8, slot9, slot10))
			end

			slot5 = not uv0.shipVO.propose and slot2 <= slot3

			setActive(uv0.button, not uv0.shipVO.propose)

			slot6 = setActive
			slot7 = uv0.intimacyAchieved

			if not uv0.shipVO.propose then
				slot8 = slot3 >= 100
			end

			slot6(slot7, slot8)

			slot6 = setActive
			slot7 = uv0
			slot7 = slot7.intimacyNoAchieved
			slot8 = 100

			if slot3 < slot8 then
				slot8 = uv0
				slot8 = slot8.shipVO
				slot8 = slot8.propose
				slot8 = not slot8
			else
				slot8 = false

				if false then
					slot8 = true
				end
			end

			slot6(slot7, slot8)

			slot6 = uv0
			slot6 = slot6.bagProxy
			slot7 = slot6
			slot6 = slot6.getItemCountById
			slot8 = ITEM_ID_FOR_PROPOSE
			slot6 = slot6(slot7, slot8)
			slot7 = setActive
			slot8 = uv0
			slot8 = slot8.ringAchieved
			slot9 = uv0
			slot9 = slot9.shipVO
			slot9 = slot9.propose

			if not slot9 then
				slot9 = slot6 > 0
			end

			slot7(slot8, slot9)

			slot7 = setActive
			slot8 = uv0
			slot8 = slot8.ringNoAchieved
			slot9 = 0

			if slot6 <= slot9 then
				slot9 = uv0
				slot9 = slot9.shipVO
				slot9 = slot9.propose
				slot9 = not slot9
			else
				slot9 = false

				if false then
					slot9 = true
				end
			end

			slot7(slot8, slot9)

			slot7 = uv0
			slot7 = slot7.shipVO
			slot7 = slot7.propose

			if not slot7 then
				slot7 = 0

				if slot6 > slot7 then
					slot7 = setTextColor
					slot8 = uv0
					slot8 = slot8.ringValue
					slot9 = Color
					slot9 = slot9.white

					slot7(slot8, slot9)
				else
					slot7 = setTextColor
					slot8 = uv0
					slot8 = slot8.ringValue
					slot9 = Color
					slot9 = slot9.New
					slot10 = 0.5843137254901961
					slot11 = 0.5215686274509804
					slot12 = 0.40784313725490196

					slot7(slot8, slot9(slot10, slot11, slot12))
				end
			end

			setActive(uv0.doneTF, uv0.shipVO.propose)

			slot7 = uv0.button
			slot7.GetComponent(slot7, typeof(Button)).interactable = slot6 > 0 and slot5
			slot7 = uv0.shipVO
			slot7, slot8 = slot7.getInitmacyInfo(slot7)

			if uv0.shipVO.propose then
				slot9 = uv0
				slot9 = slot9.intimacyDescPic

				if slot9 then
					slot9 = setActive
					slot10 = uv0
					slot10 = slot10.intimacyDescPic
					slot11 = true

					slot9(slot10, slot11)

					slot9 = setActive
					slot10 = uv0
					slot10 = slot10.intimacyDesc
					slot11 = false

					slot9(slot10, slot11)

					slot9 = setText
					slot10 = uv0
					slot10 = slot10.intimacydescTime
					slot11 = pg
					slot11 = slot11.TimeMgr
					slot11 = slot11.GetInstance
					slot11 = slot11()
					slot12 = slot11
					slot11 = slot11.STimeDescS
					slot13 = uv0
					slot13 = slot13.shipVO
					slot13 = slot13.proposeTime
					slot14 = "%B %d, %Y"

					slot9(slot10, slot11(slot12, slot13, slot14))
				else
					slot9 = uv0
					slot9 = slot9.intimacyDesc

					if slot9 then
						slot9 = setActive
						slot10 = uv0
						slot10 = slot10.intimacyDesc
						slot11 = true

						slot9(slot10, slot11)

						slot9 = GetComponent
						slot10 = uv0
						slot10 = slot10.intimacyDesc
						slot11 = "VerticalText"
						slot9 = slot9(slot10, slot11)
						slot10 = IsNil
						slot11 = slot9
						slot10 = slot10(slot11)

						if not slot10 then
							slot10 = true
							slot9.enabled = slot10
							slot10 = setText
							slot11 = uv0
							slot11 = slot11.intimacyDesc
							slot12 = i18n
							slot13 = "intimacy_desc_propose_vertical"
							slot14 = pg
							slot14 = slot14.TimeMgr
							slot14 = slot14.GetInstance
							slot14 = slot14()
							slot15 = slot14
							slot14 = slot14.ChieseDescTime
							slot16 = uv0
							slot16 = slot16.shipVO
							slot16 = slot16.proposeTime
							slot17 = true

							slot10(slot11, slot12(slot13, slot14(slot15, slot16, slot17)))
						else
							slot10 = setText
							slot11 = uv0
							slot11 = slot11.intimacyDesc
							slot12 = i18n
							slot13 = "intimacy_desc_propose"
							slot14 = pg
							slot14 = slot14.TimeMgr
							slot14 = slot14.GetInstance
							slot14 = slot14()
							slot15 = slot14
							slot14 = slot14.STimeDescS
							slot16 = uv0
							slot16 = slot16.shipVO
							slot16 = slot16.proposeTime
							slot17 = "%m/%d/%Y"
							slot18 = true

							slot10(slot11, slot12(slot13, slot14(slot15, slot16, slot17, slot18)))
						end
					end
				end
			else
				slot9 = uv1

				if slot9 == "ProposeJpUI" then
					slot9 = GetComponent
					slot10 = uv0
					slot10 = slot10.intimacyDesc
					slot11 = "VerticalText"
					slot9 = slot9(slot10, slot11)
					slot10 = IsNil
					slot11 = slot9
					slot10 = slot10(slot11)

					if not slot10 then
						slot10 = false
						slot9.enabled = slot10
					end
				end

				slot9 = uv0
				slot9 = slot9.intimacyDescPic

				if slot9 then
					slot9 = setActive
					slot10 = uv0
					slot10 = slot10.intimacyDescPic
					slot11 = false

					slot9(slot10, slot11)
				end

				slot9 = uv0
				slot9 = slot9.intimacyDesc

				if slot9 then
					slot9 = setActive
					slot10 = uv0
					slot10 = slot10.intimacyDesc
					slot11 = true

					slot9(slot10, slot11)

					slot9 = setText
					slot10 = uv0
					slot10 = slot10.intimacyDesc
					slot11 = i18n
					slot12 = slot8
					slot13 = uv0
					slot13 = slot13.shipVO
					slot13 = slot13.name

					slot9(slot10, slot11(slot12, slot13))
				end
			end

			slot9 = setText
			slot10 = uv0
			slot10 = slot10.intimacyBuffDesc
			slot11 = "*"
			slot12 = i18n
			slot13 = slot8
			slot14 = "_buff"
			slot13 = slot13 .. slot14
			slot12 = slot12(slot13)
			slot11 = slot11 .. slot12

			slot9(slot10, slot11)

			slot9 = uv0
			slot10 = slot9
			slot9 = slot9.loadChar

			slot9(slot10)

			slot9 = pg
			slot9 = slot9.UIMgr
			slot9 = slot9.GetInstance
			slot9 = slot9()
			slot10 = slot9
			slot9 = slot9.BlurPanel
			slot11 = uv0
			slot11 = slot11._tf

			slot9(slot10, slot11)

			slot9 = onButton
			slot10 = uv0
			slot11 = uv0
			slot11 = slot11.button

			function slot12()
				slot0 = uv0

				if slot0 then
					slot0 = uv1
					slot1 = 1

					if slot0 < slot1 then
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot0 = slot0.GetInstance
						slot0 = slot0()
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = "common_no_item_1"

						slot0(slot1, slot2(slot3))

						return
					end

					slot0 = Ship
					slot0 = slot0.canProposeShip
					slot1 = uv2
					slot1 = slot1.shipVO
					slot0, slot1 = slot0(slot1)

					if not slot0 then
						slot2 = pg
						slot2 = slot2.TipsMgr
						slot2 = slot2.GetInstance
						slot2 = slot2()
						slot3 = slot2
						slot2 = slot2.ShowTips
						slot4 = slot1

						slot2(slot3, slot4)

						return
					end

					slot2 = pg
					slot2 = slot2.MsgboxMgr
					slot2 = slot2.GetInstance
					slot2 = slot2()
					slot3 = slot2
					slot2 = slot2.ShowMsgBox
					slot4 = {}
					slot5 = i18n
					slot6 = "word_propose_cost_tip"
					slot7 = uv1
					slot5 = slot5(slot6, slot7)
					slot4.content = slot5

					function slot5()
						slot0 = uv0
						slot0 = slot0.intimacydescTime

						if slot0 then
							slot0 = pg
							slot0 = slot0.TimeMgr
							slot0 = slot0.GetInstance
							slot0 = slot0()
							slot1 = slot0
							slot0 = slot0.GetServerTime
							slot0 = slot0(slot1)
							slot1 = setText
							slot2 = uv0
							slot2 = slot2.intimacydescTime
							slot3 = pg
							slot3 = slot3.TimeMgr
							slot3 = slot3.GetInstance
							slot3 = slot3()
							slot4 = slot3
							slot3 = slot3.STimeDescS
							slot5 = slot0
							slot6 = "%B %d, %Y"

							slot1(slot2, slot3(slot4, slot5, slot6))
						end

						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.setMask
						slot2 = true

						slot0(slot1, slot2)

						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.hideWindow

						slot0(slot1)

						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.showProposePanel

						slot0(slot1)

						slot0 = setActive
						slot1 = uv0
						slot1 = slot1.window
						slot2 = false

						slot0(slot1, slot2)
					end

					slot4.onYes = slot5

					slot2(slot3, slot4)
				else
					slot0 = uv2
					slot1 = slot0
					slot0 = slot0.emit
					slot2 = uv3
					slot2 = slot2.ON_CLOSE

					slot0(slot1, slot2)
				end
			end

			slot13 = SFX_PANEL

			slot9(slot10, slot11, slot12, slot13)
		end

		slot3(slot4, slot5, slot6, slot7)
	end
end

slot0.didEnter = slot2

function slot2(slot0)
	slot1 = isActive
	slot2 = slot0.window
	slot1 = slot1(slot2)

	if slot1 then
		slot1 = playSoundEffect
		slot2 = SFX_CANCEL

		slot1(slot2)

		slot1 = triggerButton
		slot3 = slot0
		slot2 = slot0.findTF
		slot4 = "close_end"

		slot1(slot2(slot3, slot4))
	end
end

slot0.onBackPressed = slot2

function slot2(slot0)
	slot1 = slot0.delayTId

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.delayTId

		slot1(slot2)
	end

	slot1 = slot0.commonTF

	if slot1 then
		slot1 = setActive
		slot2 = slot0.commonTF
		slot3 = true

		slot1(slot2, slot3)
	end

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._tf

	slot1(slot2, slot3)

	slot1 = slot0.l2dChar

	if slot1 then
		slot1 = slot0.l2dChar
		slot2 = slot1
		slot1 = slot1.ClearPics

		slot1(slot2)

		slot1 = pg
		slot1 = slot1.Live2DMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.TryReleaseLive2dRes
		slot3 = slot0.l2dChar
		slot3 = slot3.name

		slot1(slot2, slot3)

		slot1 = nil
		slot0.l2dChar = slot1
	end

	slot1 = slot0._delayVoiceTweenID

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0._delayVoiceTweenID

		slot1(slot2)

		slot1 = nil
		slot0._delayVoiceTweenID = slot1
	end

	slot1 = slot0.contextData
	slot1 = slot1.shipId

	if not slot1 then
		slot1 = LeanTween
		slot1 = slot1.cancelAll

		slot1()
	end

	slot1 = pg
	slot1 = slot1.CriMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.resumeNormalBGM

	slot1(slot2)

	slot1 = slot0.contextData
	slot1 = slot1.callback

	if slot1 then
		slot1 = slot0.contextData
		slot1 = slot1.callback

		slot1()
	end
end

slot0.willExit = slot2

function slot2(slot0, slot1)
	slot2 = setActive
	slot3 = slot0.maskTF
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.setMask = slot2

function slot2(slot0, slot1)
	slot2 = setActive
	slot3 = slot0.storybg
	slot4 = true

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.showbgAdd
	slot4 = true
	slot5 = slot1

	slot2(slot3, slot4, slot5)
end

slot0.bgAddAnimation = slot2

function slot2(slot0)
	slot1 = LeanTween
	slot1 = slot1.scale
	slot2 = slot0.storybg
	slot3 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 1
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = 6

	slot1(slot2, slot3, slot4)

	slot1 = setActive
	slot2 = slot0.churchLight
	slot3 = true

	slot1(slot2, slot3)

	slot1 = LeanTween
	slot1 = slot1.delayedCall
	slot2 = 6
	slot3 = System
	slot3 = slot3.Action

	function slot4()
		slot0 = setActive
		slot1 = uv0
		slot1 = slot1.churchLight
		slot2 = false

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3(slot4))
end

slot0.showbgChurch = slot2

function slot2(slot0, slot1, slot2)
	slot6 = LeanTween.alphaCanvas(GetOrAddComponent(slot0.bgAdd, typeof(CanvasGroup)), slot1 and 0 or 1, slot2)

	slot6.setFrom(slot6, slot1 and 1 or 0)
	setActive(slot0.bgAdd, true)
end

slot0.showbgAdd = slot2

function slot2(slot0, slot1, slot2)
	slot6 = LeanTween.alphaCanvas(GetOrAddComponent(slot0.blackBG, typeof(CanvasGroup)), slot1 and 0 or 1, slot2)
	slot6 = slot6.setFrom(slot6, slot1 and 1 or 0)

	slot6.setOnComplete(slot6, System.Action(function ()
		if uv0 then
			setActive(uv1.blackBG, false)
		end
	end))
	setActive(slot0.blackBG, true)
end

slot0.showBlackBG = slot2

function slot2(slot0, slot1, slot2)
	slot3 = false

	function slot4()
		slot0 = uv0

		if slot0 then
			return
		end

		uv0 = true
		slot3 = LeanTween.alphaCanvas(GetOrAddComponent(uv2.targetActorTF, typeof(CanvasGroup)), uv1 and 1 or 0, uv3)

		slot3.setFrom(slot3, uv1 and 0 or 1)
	end

	if slot1 then
		slot6 = slot0
		slot5 = slot0.loadChar
		slot7 = slot0.targetActorTF
		slot8 = "duihua"

		function slot9()
			slot0 = uv0

			slot0()
		end

		slot5(slot6, slot7, slot8, slot9)
	end

	slot5 = slot4

	slot5()
end

slot0.showPainting = slot2

function slot2(slot0, slot1)
	slot2 = setActive
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "fitter"
	slot6 = slot0.targetActorTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "live2d"
	slot6 = slot0.targetActorTF
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = GetOrAddComponent
	slot3 = slot0.targetActorTF
	slot4 = typeof
	slot5 = CanvasGroup
	slot2 = slot2(slot3, slot4(slot5))
	slot3 = LeanTween
	slot3 = slot3.alphaCanvas
	slot4 = slot2
	slot5 = 1
	slot6 = 2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setFrom
	slot5 = 0
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.setOnComplete
	slot5 = System
	slot5 = slot5.Action

	function slot6()
		slot0 = uv0
		slot0 = slot0.l2dChar
		slot1 = slot0
		slot0 = slot0.SetAction
		slot2 = pg
		slot2 = slot2.AssistantInfo
		slot2 = slot2.action2Id
		slot3 = uv1
		slot2 = slot2[slot3]

		slot0(slot1, slot2)
	end

	slot3(slot4, slot5(slot6))
end

slot0.showLive2D = slot2

function slot2(slot0)
	slot1 = GetOrAddComponent
	slot2 = slot0.window
	slot3 = typeof
	slot4 = CanvasGroup
	slot1 = slot1(slot2, slot3(slot4))
	slot2 = false
	slot1.interactable = slot2
	slot2 = LeanTween
	slot2 = slot2.alphaCanvas
	slot3 = slot1
	slot4 = 0
	slot5 = 0.2
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setFrom
	slot4 = 1
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.setOnComplete
	slot4 = System
	slot4 = slot4.Action

	function slot5()
		slot0 = uv0
		slot1 = true
		slot0.interactable = slot1
	end

	slot2(slot3, slot4(slot5))
end

slot0.hideWindow = slot2

function slot2(slot0)
	slot1 = true
	slot0.proposeEndFlag = slot1
	slot2 = slot0
	slot1 = slot0.loadChar

	slot1(slot2)

	slot1 = setActive
	slot2 = slot0.window
	slot3 = true

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.button
	slot3 = false

	slot1(slot2, slot3)

	slot1 = nil
	slot2 = slot0.intimacyDescPic

	if slot2 then
		slot2 = setActive
		slot3 = slot0.intimacyDesc
		slot4 = false

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = slot0.intimacyDescPic
		slot4 = true

		slot2(slot3, slot4)

		slot2 = GetOrAddComponent
		slot3 = slot0.intimacyDescPic
		slot4 = typeof
		slot5 = CanvasGroup
		slot2 = slot2(slot3, slot4(slot5))
		slot1 = slot2
	else
		slot2 = slot0.intimacyDesc

		if slot2 then
			slot2 = GetComponent
			slot3 = slot0.intimacyDesc
			slot4 = typeof
			slot5 = Text
			slot2 = slot2(slot3, slot4(slot5))

			if slot2 then
				slot2 = GetComponent
				slot3 = slot0.intimacyDesc
				slot4 = "VerticalText"
				slot2 = slot2(slot3, slot4)

				if slot2 then
					slot2 = setText
					slot3 = slot0.intimacyDesc
					slot4 = i18n
					slot5 = "intimacy_desc_propose_vertical"
					slot6 = pg
					slot6 = slot6.TimeMgr
					slot6 = slot6.GetInstance
					slot6 = slot6()
					slot7 = slot6
					slot6 = slot6.ChieseDescTime
					slot8 = slot0.shipVO
					slot8 = slot8.proposeTime
					slot9 = true

					slot2(slot3, slot4(slot5, slot6(slot7, slot8, slot9)))
				else
					slot2 = setText
					slot3 = slot0.intimacyDesc
					slot4 = i18n
					slot5 = "intimacy_desc_propose"
					slot6 = pg
					slot6 = slot6.TimeMgr
					slot6 = slot6.GetInstance
					slot6 = slot6()
					slot7 = slot6
					slot6 = slot6.STimeDescS
					slot8 = slot0.shipVO
					slot8 = slot8.proposeTime
					slot9 = "%m/%d/%Y"
					slot10 = true

					slot2(slot3, slot4(slot5, slot6(slot7, slot8, slot9, slot10)))
				end

				slot2 = GetOrAddComponent
				slot3 = slot0.intimacyDesc
				slot4 = typeof
				slot5 = CanvasGroup
				slot2 = slot2(slot3, slot4(slot5))
				slot1 = slot2
			end
		end
	end

	slot2 = setText
	slot3 = slot0.intimacyBuffDesc
	slot4 = ""

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.doneTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = 0
	slot1.alpha = slot2
	slot2 = GetOrAddComponent
	slot3 = slot0.window
	slot4 = typeof
	slot5 = CanvasGroup
	slot2 = slot2(slot3, slot4(slot5))
	slot3 = false
	slot2.interactable = slot3
	slot3 = LeanTween
	slot3 = slot3.alphaCanvas
	slot4 = slot2
	slot5 = 1
	slot6 = 0.8
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setFrom
	slot5 = 0

	slot3(slot4, slot5)

	slot3 = LeanTween
	slot3 = slot3.delayedCall
	slot4 = 1.5
	slot5 = System
	slot5 = slot5.Action

	function slot6()
		slot0 = LeanTween
		slot0 = slot0.alphaCanvas
		slot1 = uv0
		slot2 = 1
		slot3 = 2
		slot0 = slot0(slot1, slot2, slot3)
		slot1 = slot0
		slot0 = slot0.setFrom
		slot2 = 0

		slot0(slot1, slot2)
	end

	slot3(slot4, slot5(slot6))

	slot3 = LeanTween
	slot3 = slot3.delayedCall
	slot4 = 5
	slot5 = System
	slot5 = slot5.Action

	function slot6()
		slot0 = uv0

		if not slot0 then
			return
		end

		slot0 = uv0
		slot1 = true
		slot0.interactable = slot1
		slot0 = setActive
		slot1 = uv1
		slot1 = slot1.doneTF
		slot2 = true

		slot0(slot1, slot2)

		slot0 = uv1
		slot1 = slot0
		slot0 = slot0.setMask
		slot2 = false

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = uv1
		slot2 = slot1
		slot1 = slot1.findTF
		slot3 = "close_end"
		slot1 = slot1(slot2, slot3)
		slot2 = true

		slot0(slot1, slot2)

		slot0 = playSoundEffect
		slot1 = SFX_UI_SEAL

		slot0(slot1)
	end

	slot3 = slot3(slot4, slot5(slot6))
	slot4 = slot3.id
	slot0.delayTId = slot4
end

slot0.stampWindow = slot2

function slot2(slot0)
	slot1 = ShipGroup
	slot1 = slot1.getProposeSkin
	slot2 = slot0.shipGroupID
	slot1 = slot1(slot2)
	slot0.proposeSkin = slot1
	slot1 = slot0.proposeSkin

	if slot1 then
		slot1 = slot0.actorPainting

		if slot1 then
			slot1 = PoolMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.ReturnPainting
			slot3 = slot0.paintingName
			slot4 = slot0.actorPainting

			slot1(slot2, slot3, slot4)

			slot1 = nil
			slot0.actorPainting = slot1
		end
	end

	function slot1()
		function slot0()
			slot0 = uv0
			slot0 = slot0.handTF
			slot1 = slot0
			slot0 = slot0.GetComponent
			slot2 = typeof
			slot3 = Image
			slot0 = slot0(slot1, slot2(slot3))
			slot1 = Color
			slot1 = slot1.New
			slot2 = 1
			slot3 = 1
			slot4 = 1
			slot5 = 0
			slot1 = slot1(slot2, slot3, slot4, slot5)
			slot0.color = slot1
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.bgAddAnimation
			slot2 = 2

			slot0(slot1, slot2)

			slot0 = LeanTween
			slot0 = slot0.delayedCall
			slot1 = 2
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.showPainting
				slot2 = true
				slot3 = 1.5

				slot0(slot1, slot2, slot3)
			end

			slot0(slot1, slot2(slot3))

			slot0 = LeanTween
			slot0 = slot0.delayedCall
			slot1 = 5
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.showPainting
				slot2 = false
				slot3 = 1

				slot0(slot1, slot2, slot3)
			end

			slot0(slot1, slot2(slot3))

			slot0 = LeanTween
			slot0 = slot0.delayedCall
			slot1 = 6
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = setAnchoredPosition
				slot1 = uv0
				slot1 = slot1.handTF
				slot2 = {}
				slot3 = uv0
				slot3 = slot3.handTF
				slot3 = slot3.rect
				slot3 = slot3.height
				slot2.y = slot3

				slot0(slot1, slot2)

				slot0 = setAnchoredPosition
				slot1 = uv0
				slot1 = slot1.ringTF
				slot2 = {
					x = -195,
					y = 0
				}

				slot0(slot1, slot2)

				slot0 = setActive
				slot1 = uv0
				slot1 = slot1.proposePanel
				slot2 = true

				slot0(slot1, slot2)

				slot0 = setActive
				slot1 = uv0
				slot1 = slot1.transHand
				slot2 = true

				slot0(slot1, slot2)

				slot0 = uv0
				slot0 = slot0.ringBoxCG
				slot1 = 0
				slot0.alpha = slot1
				slot0 = LeanTween
				slot0 = slot0.alpha
				slot1 = rtf
				slot2 = uv0
				slot2 = slot2.handTF
				slot1 = slot1(slot2)
				slot2 = 1
				slot3 = 1.2

				slot0(slot1, slot2, slot3)

				slot0 = LeanTween
				slot0 = slot0.moveY
				slot1 = rtf
				slot2 = uv0
				slot2 = slot2.handTF
				slot1 = slot1(slot2)
				slot2 = 0
				slot3 = 2
				slot0 = slot0(slot1, slot2, slot3)
				slot1 = slot0
				slot0 = slot0.setOnComplete
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = LeanTween
					slot0 = slot0.alphaCanvas
					slot1 = uv0
					slot1 = slot1.ringBoxCG
					slot2 = 1
					slot3 = 1.5
					slot0 = slot0(slot1, slot2, slot3)
					slot1 = slot0
					slot0 = slot0.setFrom
					slot2 = 0
					slot0 = slot0(slot1, slot2)
					slot1 = slot0
					slot0 = slot0.setOnComplete
					slot2 = System
					slot2 = slot2.Action

					function slot3()
						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.setMask
						slot2 = false

						slot0(slot1, slot2)

						slot0 = triggerButton
						slot1 = uv0
						slot1 = slot1.ringBoxTF

						slot0(slot1)
					end

					slot0(slot1, slot2(slot3))
				end

				slot0(slot1, slot2(slot3))
			end

			slot0(slot1, slot2(slot3))

			slot0 = LeanTween
			slot0 = slot0.delayedCall
			slot1 = 5
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.showBlackBG
				slot2 = false
				slot3 = 1.2

				slot0(slot1, slot2, slot3)
			end

			slot0(slot1, slot2(slot3))

			slot0 = LeanTween
			slot0 = slot0.delayedCall
			slot1 = 6.2
			slot2 = System
			slot2 = slot2.Action

			function slot3()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.showBlackBG
				slot2 = true
				slot3 = 1.2

				slot0(slot1, slot2, slot3)
			end

			slot0(slot1, slot2(slot3))
		end

		slot1 = LeanTween
		slot1 = slot1.scale
		slot2 = uv0
		slot2 = slot2.door
		slot3 = Vector3
		slot4 = 2.1
		slot5 = 2.1
		slot6 = 2.1
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = 4

		slot1(slot2, slot3, slot4)

		slot1 = uv0
		slot1 = slot1.doorAni
		slot2 = slot1
		slot1 = slot1.SetActionCallBack

		function slot3(slot0)
			if slot0 == "FINISH" then
				slot1 = uv0
				slot1 = slot1.doorAni
				slot2 = slot1
				slot1 = slot1.SetActionCallBack
				slot3 = nil

				slot1(slot2, slot3)

				slot1 = setActive
				slot2 = uv0
				slot2 = slot2.door
				slot3 = false

				slot1(slot2, slot3)

				slot1 = uv0
				slot2 = slot1
				slot1 = slot1.showBlackBG
				slot3 = true
				slot4 = 0.1

				slot1(slot2, slot3, slot4)

				slot1 = setActive
				slot2 = uv0
				slot2 = slot2.doorLightBG
				slot3 = false

				slot1(slot2, slot3)

				slot1 = uv1

				slot1()
			end
		end

		slot1(slot2, slot3)

		slot1 = LeanTween
		slot1 = slot1.delayedCall
		slot2 = 2
		slot3 = System
		slot3 = slot3.Action

		function slot4()
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.showbgAdd
			slot2 = false
			slot3 = 2

			slot0(slot1, slot2, slot3)
		end

		slot1(slot2, slot3(slot4))

		slot1 = LeanTween
		slot1 = slot1.alpha
		slot2 = rtf
		slot3 = uv0
		slot3 = slot3.doorLightBG
		slot2 = slot2(slot3)
		slot3 = 1
		slot4 = 2
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot1
		slot1 = slot1.setFrom
		slot3 = 0

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = slot1
		slot1 = slot1.showBlackBG
		slot3 = false
		slot4 = 0.1

		slot1(slot2, slot3, slot4)

		slot1 = uv0
		slot1 = slot1.doorAni
		slot2 = slot1
		slot1 = slot1.SetAction
		slot3 = "OPEN"
		slot4 = 0

		slot1(slot2, slot3, slot4)

		slot1 = playSoundEffect
		slot2 = SFX_UI_DOOR

		slot1(slot2)
	end

	slot2 = pg
	slot2 = slot2.CriMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.PlayBGM
	slot4 = "wedding"
	slot5 = true

	slot2(slot3, slot4, slot5)

	slot2 = slot0.proposePanel

	if not slot2 then
		slot2 = "ProposeRingUI"
		slot3 = PoolMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetUI
		slot5 = slot2
		slot6 = true

		function slot7(slot0)
			slot1 = pg
			slot1 = slot1.UIMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.LoadingOff

			slot1(slot2)

			slot1 = uv0
			slot1 = slot1.exited

			if slot1 then
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ReturnUI
				slot3 = uv1
				slot4 = slot0

				slot1(slot2, slot3, slot4)

				return
			end

			slot1 = uv0
			slot2 = tf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot1.proposePanel = slot2
			slot1 = uv0
			slot1 = slot1.weddingReview

			if slot1 then
				slot1 = uv0
				slot1 = slot1.reviewSkinID

				if not slot1 then
					slot1 = uv0
					slot1 = slot1.shipVO
					slot1 = slot1.skinId
				end
			end

			slot2 = uv0
			slot3 = pg
			slot3 = slot3.ship_skin_template
			slot3 = slot3[slot1]
			slot3 = slot3.hand_id
			slot2.handId = slot3
			slot2 = pg
			slot2 = slot2.TimeMgr
			slot2 = slot2.GetInstance
			slot2 = slot2()
			slot3 = slot2
			slot2 = slot2.CurrentSTimeDesc
			slot4 = "%m/%d/%Y"
			slot5 = true
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = SPECIAL_PROPOSE

			if slot3 then
				slot3 = SPECIAL_PROPOSE
				slot3 = slot3[1]

				if slot3 == slot2 then
					slot3 = ipairs
					slot4 = SPECIAL_PROPOSE
					slot4 = slot4[2]
					slot3, slot4, slot5 = slot3(slot4)

					for slot6, slot7 in slot3, slot4, slot5 do
						slot8 = slot7[1]

						if slot8 == slot1 then
							slot8 = uv0
							slot9 = slot7[2]
							slot8.handId = slot9
						end
					end
				end
			end

			slot3 = uv0
			slot4 = "ProposeHand_"
			slot5 = uv0
			slot5 = slot5.handId
			slot4 = slot4 .. slot5
			slot3.handName = slot4
			slot3 = PoolMgr
			slot3 = slot3.GetInstance
			slot3 = slot3()
			slot4 = slot3
			slot3 = slot3.GetUI
			slot5 = uv0
			slot5 = slot5.handName
			slot6 = true

			function slot7(slot0)
				slot1 = uv0
				slot2 = tf
				slot3 = slot0
				slot2 = slot2(slot3)
				slot1.transHand = slot2
				slot1 = setParent
				slot2 = uv0
				slot2 = slot2.transHand
				slot3 = uv0
				slot3 = slot3.proposePanel

				slot1(slot2, slot3)

				slot1 = uv0
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.findTF
				slot4 = "hand"
				slot5 = uv0
				slot5 = slot5.transHand
				slot2 = slot2(slot3, slot4, slot5)
				slot1.handTF = slot2
				slot1 = uv0
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.findTF
				slot4 = "ring"
				slot5 = uv0
				slot5 = slot5.transHand
				slot2 = slot2(slot3, slot4, slot5)
				slot1.ringTF = slot2
				slot1 = uv0
				slot2 = uv0
				slot2 = slot2.ringTF
				slot3 = slot2
				slot2 = slot2.GetComponent
				slot4 = typeof
				slot5 = Animator
				slot2 = slot2(slot3, slot4(slot5))
				slot1.ringAnim = slot2
				slot1 = uv0
				slot1 = slot1.ringAnim
				slot2 = false
				slot1.enabled = slot2
				slot1 = uv0
				slot2 = uv0
				slot3 = slot2
				slot2 = slot2.findTF
				slot4 = "ring_light"
				slot5 = uv0
				slot5 = slot5.ringTF
				slot2 = slot2(slot3, slot4, slot5)
				slot1.ringLight = slot2
				slot1 = uv0
				slot2 = GetOrAddComponent
				slot3 = uv0
				slot3 = slot3.ringLight
				slot4 = typeof
				slot5 = CanvasGroup
				slot2 = slot2(slot3, slot4(slot5))
				slot1.ringLightCG = slot2
				slot1 = uv0
				slot2 = GetOrAddComponent
				slot3 = uv0
				slot3 = slot3.ringTF
				slot4 = typeof
				slot5 = CanvasGroup
				slot2 = slot2(slot3, slot4(slot5))
				slot1.ringCG = slot2
			end

			slot3(slot4, slot5, slot6, slot7)

			slot3 = setParent
			slot4 = tf
			slot5 = slot0
			slot4 = slot4(slot5)
			slot5 = uv0
			slot6 = slot5
			slot5 = slot5.findTF
			slot7 = "contain"

			slot3(slot4, slot5(slot6, slot7))

			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "ringBox"
			slot7 = uv0
			slot7 = slot7.proposePanel
			slot4 = slot4(slot5, slot6, slot7)
			slot3.ringBoxTF = slot4
			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "full"
			slot7 = uv0
			slot7 = slot7.ringBoxTF
			slot4 = slot4(slot5, slot6, slot7)
			slot3.ringBoxFull = slot4
			slot3 = uv0
			slot4 = GetOrAddComponent
			slot5 = uv0
			slot5 = slot5.ringBoxTF
			slot6 = typeof
			slot7 = CanvasGroup
			slot4 = slot4(slot5, slot6(slot7))
			slot3.ringBoxCG = slot4
			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "before"
			slot7 = uv0
			slot7 = slot7.proposePanel
			slot4 = slot4(slot5, slot6, slot7)
			slot3.churchBefore = slot4
			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "light"
			slot7 = uv0
			slot7 = slot7.churchBefore
			slot4 = slot4(slot5, slot6, slot7)
			slot3.churchLight = slot4
			slot3 = setParent
			slot4 = uv0
			slot4 = slot4.churchLight
			slot5 = uv0
			slot5 = slot5._tf

			slot3(slot4, slot5)

			slot3 = uv0
			slot3 = slot3.churchLight
			slot4 = slot3
			slot3 = slot3.SetSiblingIndex
			slot5 = 2

			slot3(slot4, slot5)

			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "blackbg"
			slot7 = uv0
			slot7 = slot7.churchBefore
			slot4 = slot4(slot5, slot6, slot7)
			slot3.blackBG = slot4
			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "door_light"
			slot7 = uv0
			slot7 = slot7.churchBefore
			slot4 = slot4(slot5, slot6, slot7)
			slot3.doorLightBG = slot4
			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "door"
			slot7 = uv0
			slot7 = slot7.churchBefore
			slot4 = slot4(slot5, slot6, slot7)
			slot3.door = slot4
			slot3 = uv0
			slot4 = GetOrAddComponent
			slot5 = uv0
			slot5 = slot5.door
			slot6 = "SpineAnimUI"
			slot4 = slot4(slot5, slot6)
			slot3.doorAni = slot4
			slot3 = setParent
			slot4 = uv0
			slot4 = slot4.churchBefore
			slot5 = uv0
			slot6 = slot5
			slot5 = slot5.findTF
			slot7 = "contain"

			slot3(slot4, slot5(slot6, slot7))

			slot3 = uv0
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "tip"
			slot7 = uv0
			slot7 = slot7.proposePanel
			slot4 = slot4(slot5, slot6, slot7)
			slot3.ringTipTF = slot4
			slot3 = uv0
			slot4 = GetOrAddComponent
			slot5 = uv0
			slot5 = slot5.ringTipTF
			slot6 = typeof
			slot7 = CanvasGroup
			slot4 = slot4(slot5, slot6(slot7))
			slot3.ringTipCG = slot4
			slot3 = setText
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "Text"
			slot7 = uv0
			slot7 = slot7.ringTipTF
			slot4 = slot4(slot5, slot6, slot7)
			slot5 = i18n
			slot6 = "word_propose_ring_tip"

			slot3(slot4, slot5(slot6))

			slot3 = setActive
			slot4 = uv0
			slot5 = slot4
			slot4 = slot4.findTF
			slot6 = "finger"
			slot7 = uv0
			slot7 = slot7.ringTipTF
			slot4 = slot4(slot5, slot6, slot7)
			slot5 = false

			slot3(slot4, slot5)

			slot3 = onButton
			slot4 = uv0
			slot5 = uv0
			slot5 = slot5.ringBoxTF

			function slot6()
				slot0 = uv0
				slot0 = slot0.ringBoxClicked

				if slot0 then
					return
				end

				slot0 = uv0
				slot1 = true
				slot0.ringBoxClicked = slot1
				slot0 = LeanTween
				slot0 = slot0.alpha
				slot1 = rtf
				slot2 = uv0
				slot2 = slot2.ringBoxFull
				slot1 = slot1(slot2)
				slot2 = 0
				slot3 = 0.6
				slot0 = slot0(slot1, slot2, slot3)
				slot1 = slot0
				slot0 = slot0.setOnComplete
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = LeanTween
					slot0 = slot0.delayedCall
					slot1 = 0.1
					slot2 = System
					slot2 = slot2.Action

					function slot3()
						slot0 = uv0
						slot0 = slot0.ringAnim
						slot1 = true
						slot0.enabled = slot1
						slot0 = uv0
						slot0 = slot0.ringAnim
						slot1 = slot0
						slot0 = slot0.Play
						slot2 = "movein"

						slot0(slot1, slot2)

						slot0 = LeanTween
						slot0 = slot0.delayedCall
						slot1 = 0.5
						slot2 = System
						slot2 = slot2.Action

						function slot3()
							slot0 = uv0
							slot0 = slot0.ringAnim
							slot1 = slot0
							slot0 = slot0.Play
							slot2 = "blink"

							slot0(slot1, slot2)

							slot0 = LeanTween
							slot0 = slot0.alphaCanvas
							slot1 = uv0
							slot1 = slot1.ringTipCG
							slot2 = 1
							slot3 = 1.5
							slot0 = slot0(slot1, slot2, slot3)
							slot1 = slot0
							slot0 = slot0.setFrom
							slot2 = 0
							slot0 = slot0(slot1, slot2)
							slot1 = slot0
							slot0 = slot0.setOnComplete
							slot2 = System
							slot2 = slot2.Action

							function slot3()
								slot0 = setActive
								slot1 = uv0
								slot2 = slot1
								slot1 = slot1.findTF
								slot3 = "finger"
								slot4 = uv0
								slot4 = slot4.ringTipTF
								slot1 = slot1(slot2, slot3, slot4)
								slot2 = true

								slot0(slot1, slot2)

								slot0 = uv0
								slot1 = slot0
								slot0 = slot0.enableRingDrag
								slot2 = true

								slot0(slot1, slot2)
							end

							slot0(slot1, slot2(slot3))
						end

						slot0(slot1, slot2(slot3))
					end

					slot0(slot1, slot2(slot3))
				end

				slot0(slot1, slot2(slot3))
			end

			slot3(slot4, slot5, slot6)

			slot3 = LoadImageSpriteAsync
			slot4 = uv0
			slot4 = slot4.bgName
			slot5 = uv0
			slot5 = slot5.storybg

			slot3(slot4, slot5)

			slot3 = uv0
			slot3 = slot3.storybg
			slot4 = Vector3
			slot5 = 1.2
			slot6 = 1.2
			slot7 = 1.2
			slot4 = slot4(slot5, slot6, slot7)
			slot3.localScale = slot4
			slot3 = onNextTick

			function slot4()
				slot0 = uv0
				slot0 = slot0.exited

				if slot0 then
					return
				end

				slot0 = uv1

				slot0()
			end

			slot3(slot4)
		end

		slot3(slot4, slot5, slot6, slot7)

		return
	end

	slot2 = slot1

	slot2()
end

slot0.showProposePanel = slot2

function slot2(slot0)
	slot1 = slot0.isRingOn

	if slot1 then
		return
	end

	slot1 = setActive
	slot2 = slot0.ringTipTF
	slot3 = false

	slot1(slot2, slot3)

	slot1 = true
	slot0.isRingOn = slot1
	slot1 = slot0.ringTF
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "DftAniEvent"
	slot1 = slot1(slot2, slot3)
	slot3 = slot1
	slot2 = slot1.SetEndEvent

	function slot4(slot0)
		slot1 = uv0
		slot1 = slot1.ringAnim
		slot2 = false
		slot1.enabled = slot2
		slot1 = uv0
		slot2 = false
		slot1.isRingOn = slot2
		slot1 = uv0
		slot1 = slot1.weddingReview

		if not slot1 then
			slot1 = uv0
			slot2 = slot1
			slot1 = slot1.emit
			slot3 = ProposeMediator
			slot3 = slot3.ON_PROPOSE
			slot4 = uv0
			slot4 = slot4.shipVO
			slot4 = slot4.id

			slot1(slot2, slot3, slot4)
		else
			slot1 = uv0
			slot2 = slot1
			slot1 = slot1.RingFadeout

			function slot3()
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.displayShipWord
				slot2 = "propose"

				slot0(slot1, slot2)
			end

			slot1(slot2, slot3)
		end
	end

	slot2(slot3, slot4)

	slot2 = slot0.ringAnim
	slot3 = true
	slot2.enabled = slot3
	slot2 = slot0.ringAnim
	slot3 = slot2
	slot2 = slot2.Play
	slot4 = "wear"

	slot2(slot3, slot4)
end

slot0.ringOn = slot2

function slot2(slot0, slot1)
	slot2 = slot0.press

	if not slot2 then
		slot3 = slot0
		slot2 = slot0.addRingDragListenter

		slot2(slot3)
	end

	slot2 = slot0.press
	slot2.enabled = slot1
end

slot0.enableRingDrag = slot2

function slot2(slot0)
	slot1 = GetOrAddComponent
	slot2 = slot0.proposePanel
	slot3 = "EventTriggerListener"
	slot1 = slot1(slot2, slot3)
	slot0.press = slot1
	slot1 = nil
	slot2 = slot0.press
	slot3 = slot2
	slot2 = slot2.AddBeginDragFunc

	function slot4()
	end

	slot2(slot3, slot4)

	slot2 = slot0.press
	slot3 = slot2
	slot2 = slot2.AddDragFunc

	function slot4(slot0, slot1)
		slot2 = slot1.position
		slot3 = uv0

		if not slot3 then
			uv0 = slot2
		end

		slot3 = slot2.y
		slot4 = uv0
		slot4 = slot4.y
		slot3 = slot3 - slot4
		slot4 = 100

		if slot3 > slot4 then
			slot3 = uv1
			slot4 = slot3
			slot3 = slot3.setMask
			slot5 = true

			slot3(slot4, slot5)

			slot3 = uv1
			slot4 = slot3
			slot3 = slot3.ringOn

			slot3(slot4)

			slot3 = uv1
			slot4 = slot3
			slot3 = slot3.enableRingDrag
			slot5 = false

			slot3(slot4, slot5)
		end
	end

	slot2(slot3, slot4)

	slot2 = slot0.press
	slot3 = slot2
	slot2 = slot2.AddDragEndFunc

	function slot4(slot0, slot1)
	end

	slot2(slot3, slot4)
end

slot0.addRingDragListenter = slot2

function slot2(slot0, slot1)
	slot2 = LeanTween
	slot2 = slot2.alphaCanvas
	slot3 = slot0.ringLightCG
	slot4 = 0.7
	slot5 = 0.5
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setFrom
	slot4 = 0

	slot2(slot3, slot4)

	slot2 = LeanTween
	slot2 = slot2.scale
	slot3 = slot0.ringLight
	slot4 = Vector3
	slot5 = 8
	slot6 = 8
	slot7 = 8
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = 1

	slot2(slot3, slot4, slot5)

	slot2 = LeanTween
	slot2 = slot2.rotate
	slot3 = slot0.ringLight
	slot4 = 90
	slot5 = 3

	slot2(slot3, slot4, slot5)

	slot2 = LeanTween
	slot2 = slot2.delayedCall
	slot3 = 3.5
	slot4 = System
	slot4 = slot4.Action

	function slot5()
		slot0 = uv0

		if slot0 then
			slot0 = uv0

			slot0()
		end
	end

	slot2(slot3, slot4(slot5))

	slot2 = LeanTween
	slot2 = slot2.delayedCall
	slot3 = 1.2
	slot4 = System
	slot4 = slot4.Action

	function slot5()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.showbgAdd
		slot2 = false
		slot3 = 1.8

		slot0(slot1, slot2, slot3)
	end

	slot2(slot3, slot4(slot5))

	slot2 = LeanTween
	slot2 = slot2.delayedCall
	slot3 = 3.2
	slot4 = System
	slot4 = slot4.Action

	function slot5()
		slot0 = setActive
		slot1 = uv0
		slot1 = slot1.proposePanel
		slot2 = false

		slot0(slot1, slot2)

		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.showbgAdd
		slot2 = true
		slot3 = 2

		slot0(slot1, slot2, slot3)
	end

	slot2(slot3, slot4(slot5))
end

slot0.RingFadeout = slot2

function slot2(slot0, slot1)
	slot2 = ShipGroup
	slot2 = slot2.getDefaultSkin
	slot3 = slot0.shipGroupID
	slot2 = slot2(slot3)
	slot3 = Ship
	slot3 = slot3.getWords
	slot4 = slot2.id
	slot5 = slot1
	slot3, slot4, slot5 = slot3(slot4, slot5)
	slot6 = nil
	slot7 = slot0.reviewSkinID

	if slot7 then
		slot6 = slot0.reviewSkinID
	else
		slot7 = slot0.proposeSkin

		if slot7 then
			slot7 = slot0.proposeSkin
			slot6 = slot7.id
		else
			slot7 = slot0.shipVO
			slot6 = slot7.skinId
		end
	end

	slot7 = Ship
	slot7 = slot7.getCVCalibrate
	slot8 = slot6
	slot9 = slot1
	slot7 = slot7(slot8, slot9)
	slot9 = slot0
	slot8 = slot0.showStoryUI
	slot10 = slot3

	slot8(slot9, slot10)

	if slot4 then
		function slot8()
			slot0 = uv0
			slot0 = slot0._currentVoice

			if slot0 then
				slot0 = uv0
				slot0 = slot0._currentVoice
				slot1 = slot0
				slot0 = slot0.Stop
				slot2 = true

				slot0(slot1, slot2)
			end

			slot0 = uv0
			slot1 = playSoundEffect
			slot2 = uv1
			slot1 = slot1(slot2)
			slot0._currentVoice = slot1
		end

		slot9 = slot0.l2dChar

		if slot9 and slot7 and slot7 ~= 0 then
			slot9 = LeanTween
			slot9 = slot9.delayedCall
			slot10 = slot7
			slot11 = System
			slot11 = slot11.Action

			function slot12()
				slot0 = uv0

				slot0()

				slot0 = uv1
				slot1 = nil
				slot0._delayVoiceTweenID = slot1
			end

			slot9 = slot9(slot10, slot11(slot12))
			slot10 = slot9.id
			slot0._delayVoiceTweenID = slot10
		else
			slot9 = slot8

			slot9()
		end
	end
end

slot0.displayShipWord = slot2

function slot2(slot0, slot1)
	function slot2()
		slot0 = ResourceMgr
		slot0 = slot0.Inst
		slot1 = slot0
		slot0 = slot0.AssetExist
		slot2 = "live2d/"
		slot3 = string
		slot3 = slot3.lower
		slot4 = uv0
		slot4 = slot4.paintingName
		slot3 = slot3(slot4)
		slot2 = slot2 .. slot3
		slot0 = slot0(slot1, slot2)

		if slot0 then
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.showLive2D
			slot2 = "wedding"

			slot0(slot1, slot2)
		else
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.showPainting
			slot2 = true
			slot3 = 2

			slot0(slot1, slot2, slot3)
		end

		slot0 = ShipGroup
		slot0 = slot0.getDefaultShipNameByGroupID
		slot1 = uv0
		slot1 = slot1.shipGroupID
		slot0 = slot0(slot1)
		slot1 = setText
		slot2 = uv0
		slot2 = slot2.targetNameTF
		slot3 = slot2
		slot2 = slot2.Find
		slot4 = "Text"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0

		slot1(slot2, slot3)

		slot1 = setText
		slot2 = uv0
		slot2 = slot2.storyContent
		slot3 = ""

		slot1(slot2, slot3)

		slot1 = uv0
		slot1 = slot1.storyCG
		slot2 = 0
		slot1.alpha = slot2
		slot1 = setActive
		slot2 = uv0
		slot2 = slot2.storyTF
		slot3 = true

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = false
		slot1.initStory = slot2
		slot1 = LeanTween
		slot1 = slot1.alphaCanvas
		slot2 = uv0
		slot2 = slot2.storyCG
		slot3 = 1
		slot4 = 1
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = slot1
		slot1 = slot1.setFrom
		slot3 = 0
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.setDelay
		slot3 = 1
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot1.setOnComplete
		slot3 = System
		slot3 = slot3.Action

		function slot4()
			slot0 = findTF
			slot1 = uv0
			slot1 = slot1.targetActorTF
			slot2 = "fitter"
			slot0 = slot0(slot1, slot2)
			slot0 = slot0.childCount
			slot1 = 0

			if slot0 > slot1 then
				slot0 = Ship
				slot0 = slot0.SetExpression
				slot1 = findTF
				slot2 = uv0
				slot2 = slot2.targetActorTF
				slot3 = "fitter"
				slot1 = slot1(slot2, slot3)
				slot2 = slot1
				slot1 = slot1.GetChild
				slot3 = 0
				slot1 = slot1(slot2, slot3)
				slot2 = uv0
				slot2 = slot2.paintingName
				slot3 = "propose"

				slot0(slot1, slot2, slot3)
			end

			slot0 = setTextEN
			slot1 = uv0
			slot1 = slot1.storyContent
			slot2 = uv1

			slot0(slot1, slot2)

			slot0 = uv0
			slot1 = true
			slot0.onWords = slot1
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.TypeWriter

			slot0(slot1)

			slot0 = uv0
			slot1 = true
			slot0.initStory = slot1
			slot0 = uv0
			slot1 = slot0
			slot0 = slot0.setMask
			slot2 = false

			slot0(slot1, slot2)

			slot0 = uv0
			slot0 = slot0.weddingReview

			if not slot0 then
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.showTip

				slot0(slot1)
			end
		end

		slot1(slot2, slot3(slot4))
	end

	slot3 = slot0.storyTF

	if not slot3 then
		slot3 = "ProposeStoryUI"
		slot4 = PoolMgr
		slot4 = slot4.GetInstance
		slot4 = slot4()
		slot5 = slot4
		slot4 = slot4.GetUI
		slot6 = slot3
		slot7 = true

		function slot8(slot0)
			slot1 = pg
			slot1 = slot1.UIMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.LoadingOff

			slot1(slot2)

			slot1 = uv0
			slot1 = slot1.exited

			if slot1 then
				slot1 = PoolMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.ReturnUI
				slot3 = uv1
				slot4 = slot0

				slot1(slot2, slot3, slot4)

				return
			end

			slot1 = uv0
			slot2 = tf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot1.storyTF = slot2
			slot1 = setParent
			slot2 = tf
			slot3 = slot0
			slot2 = slot2(slot3)
			slot3 = uv0
			slot4 = slot3
			slot3 = slot3.findTF
			slot5 = "contain"

			slot1(slot2, slot3(slot4, slot5))

			slot1 = uv0
			slot2 = GetOrAddComponent
			slot3 = uv0
			slot3 = slot3.storyTF
			slot4 = typeof
			slot5 = CanvasGroup
			slot2 = slot2(slot3, slot4(slot5))
			slot1.storyCG = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "dialogue/main/content"
			slot5 = uv0
			slot5 = slot5.storyTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.storyContent = slot2
			slot1 = uv0
			slot2 = uv0
			slot2 = slot2.storyContent
			slot3 = slot2
			slot2 = slot2.GetComponent
			slot4 = typeof
			slot5 = Typewriter
			slot2 = slot2(slot3, slot4(slot5))
			slot1.typeWriter = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "dialogue/main/name_left"
			slot5 = uv0
			slot5 = slot5.storyTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1.targetNameTF = slot2
			slot1 = uv0
			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "changeName_panel"
			slot5 = uv0
			slot5 = slot5.storyTF
			slot2 = slot2(slot3, slot4, slot5)
			slot1._renamePanel = slot2
			slot1 = setActive
			slot2 = uv0
			slot2 = slot2._renamePanel
			slot3 = false

			slot1(slot2, slot3)

			slot1 = onButton
			slot2 = uv0
			slot3 = uv0
			slot3 = slot3.storyTF

			function slot4()
				slot0 = uv0
				slot0 = slot0.inTypeWritter

				if slot0 then
					slot0 = uv0
					slot0 = slot0.typeWriter
					slot1 = slot0
					slot0 = slot0.setSpeed
					slot2 = uv0
					slot2 = slot2.typeWritterSpeedUp

					slot0(slot1, slot2)

					return
				end

				slot0 = uv0
				slot0 = slot0.initStory

				if not slot0 then
					return
				end

				slot0 = LeanTween
				slot0 = slot0.alphaCanvas
				slot1 = uv0
				slot1 = slot1.storyCG
				slot2 = 0
				slot3 = 1
				slot0 = slot0(slot1, slot2, slot3)
				slot1 = slot0
				slot0 = slot0.setFrom
				slot2 = 1
				slot0 = slot0(slot1, slot2)
				slot1 = slot0
				slot0 = slot0.setOnComplete
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = setActive
					slot1 = uv0
					slot1 = slot1.storyTF
					slot2 = false

					slot0(slot1, slot2)
				end

				slot0(slot1, slot2(slot3))

				slot0 = uv0
				slot0 = slot0._currentVoice

				if slot0 then
					slot0 = uv0
					slot0 = slot0._currentVoice
					slot1 = slot0
					slot0 = slot0.Stop
					slot2 = true

					slot0(slot1, slot2)
				end

				slot0 = uv0
				slot1 = nil
				slot0._currentVoice = slot1
				slot0 = uv0
				slot1 = slot0
				slot0 = slot0.setMask
				slot2 = true

				slot0(slot1, slot2)

				slot0 = LeanTween
				slot0 = slot0.delayedCall
				slot1 = 0.5
				slot2 = System
				slot2 = slot2.Action

				function slot3()
					slot0 = uv0
					slot0 = slot0.weddingReview

					if slot0 then
						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.close

						slot0(slot1)
					else
						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.initChangeNamePanel

						slot0(slot1)

						slot0 = uv0
						slot1 = slot0
						slot0 = slot0.stampWindow

						slot0(slot1)
					end
				end

				slot0(slot1, slot2(slot3))
			end

			slot1(slot2, slot3, slot4)

			slot1 = onNextTick

			function slot2()
				slot0 = uv0
				slot0 = slot0.exited

				if slot0 then
					return
				end

				slot0 = uv1

				slot0()
			end

			slot1(slot2)

			slot1 = uv0
			slot2 = true
			slot1.loadFinish = slot2
		end

		slot4(slot5, slot6, slot7, slot8)

		return
	end

	slot3 = slot2

	slot3()
end

slot0.showStoryUI = slot2

function slot2(slot0)
	slot1 = 0.1
	slot2 = true
	slot0.inTypeWritter = slot2
	slot2 = 0.01
	slot0.typeWritterSpeedUp = slot2
	slot2 = slot0.typeWriter
	slot3 = slot2
	slot2 = slot2.setSpeed
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = slot0.typeWriter
	slot3 = slot2
	slot2 = slot2.Play

	slot2(slot3)

	slot2 = slot0.typeWriter

	function slot3()
		slot0 = uv0
		slot1 = false
		slot0.inTypeWritter = slot1
		slot0 = uv0
		slot1 = nil
		slot0.typeWritterSpeedUp = slot1
	end

	slot2.endFunc = slot3
end

slot0.TypeWriter = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot1 = slot1 or slot0._paintingTF
	slot2 = slot2 or "wedding"

	function slot4()
		if not IsNil(uv0) then
			slot0 = findTF(uv0, "fitter")
			slot1 = GetOrAddComponent(slot0, "PaintingScaler")
			slot1.FrameName = uv1
			slot1.Tween = 1

			setParent(uv2.actorPainting, slot0)
		end
	end

	if not slot0.actorPainting then
		slot5 = slot0.reviewSkinID

		if slot5 then
			slot5 = pg
			slot5 = slot5.ship_skin_template
			slot6 = slot0.reviewSkinID
			slot5 = slot5[slot6]
			slot5 = slot5.painting
			slot0.paintingName = slot5
		else
			slot5 = slot0.proposeSkin

			if slot5 then
				slot5 = slot0.proposeSkin
				slot5 = slot5.painting
				slot0.paintingName = slot5
			else
				slot5 = slot0.shipVO
				slot6 = slot5
				slot5 = slot5.getPainting
				slot5 = slot5(slot6)
				slot0.paintingName = slot5
			end
		end

		slot5 = slot0.paintingName
		slot6 = PathMgr
		slot6 = slot6.FileExists
		slot7 = PathMgr
		slot7 = slot7.getAssetBundle
		slot8 = "painting/"
		slot9 = slot5
		slot10 = "_n"
		slot8 = slot8 .. slot9 .. slot10
		slot6 = slot6(slot7(slot8))

		if slot6 then
			slot6 = PlayerPrefs
			slot6 = slot6.GetInt
			slot7 = "paint_hide_other_obj_"
			slot8 = slot5
			slot7 = slot7 .. slot8
			slot8 = 0
			slot6 = slot6(slot7, slot8)

			if slot6 ~= 0 then
				slot6 = slot5
				slot7 = "_n"
				slot5 = slot6 .. slot7
			end
		end

		slot6 = PoolMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot7 = slot6
		slot6 = slot6.GetPainting
		slot8 = slot5
		slot9 = true

		function slot10(slot0)
			slot1 = findTF
			slot2 = slot0
			slot3 = "Touch"
			slot1 = slot1(slot2, slot3)
			slot2 = IsNil
			slot3 = slot1
			slot2 = slot2(slot3)

			if not slot2 then
				slot2 = setActive
				slot3 = slot1
				slot4 = false

				slot2(slot3, slot4)
			end

			slot2 = findTF
			slot3 = slot0
			slot4 = "hx"
			slot2 = slot2(slot3, slot4)

			if slot2 then
				slot3 = setActive
				slot4 = slot2
				slot5 = HXSet
				slot5 = slot5.isHx

				slot3(slot4, slot5())
			end

			slot3 = uv0
			slot3.actorPainting = slot0
			slot3 = Ship
			slot3 = slot3.SetExpression
			slot4 = uv0
			slot4 = slot4.actorPainting
			slot5 = uv0
			slot5 = slot5.paintingName

			slot3(slot4, slot5)

			slot3 = uv1

			slot3()

			slot3 = uv2

			if slot3 then
				slot3 = uv2

				slot3()
			end
		end

		slot6(slot7, slot8, slot9, slot10)

		slot6 = ResourceMgr
		slot6 = slot6.Inst
		slot7 = slot6
		slot6 = slot6.AssetExist
		slot8 = "live2d/"
		slot9 = string
		slot9 = slot9.lower
		slot10 = slot0.paintingName
		slot9 = slot9(slot10)
		slot8 = slot8 .. slot9
		slot6 = slot6(slot7, slot8)

		if slot6 then
			slot7 = slot0
			slot6 = slot0.createLive2D
			slot8 = slot0.paintingName

			slot6(slot7, slot8)
		end
	else
		slot5 = slot4

		slot5()
	end
end

slot0.loadChar = slot2

function slot2(slot0, slot1)
	slot2 = pg
	slot2 = slot2.Live2DMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetLive2DModelAsync
	slot4 = slot1

	function slot5(slot0)
		slot1 = uv0
		slot1 = slot1.exited

		if slot1 then
			slot1 = Destroy
			slot2 = slot0

			slot1(slot2)

			return
		end

		slot1 = uv0
		slot2 = slot1
		slot1 = slot1.findTF
		slot3 = "live2d"
		slot4 = uv0
		slot4 = slot4.targetActorTF
		slot1 = slot1(slot2, slot3, slot4)
		slot2 = UIUtil
		slot2 = slot2.SetLayerRecursively
		slot3 = slot0
		slot4 = LayerMask
		slot4 = slot4.NameToLayer
		slot5 = "UI"

		slot2(slot3, slot4(slot5))

		slot2 = slot0.transform
		slot4 = slot2
		slot3 = slot2.SetParent
		slot5 = slot1
		slot6 = true

		slot3(slot4, slot5, slot6)

		slot3 = nil
		slot4 = uv0
		slot4 = slot4.reviewSkinID

		if slot4 then
			slot4 = uv0
			slot3 = slot4.reviewSkinID
		else
			slot4 = uv0
			slot4 = slot4.proposeSkin

			if slot4 then
				slot4 = uv0
				slot4 = slot4.proposeSkin
				slot3 = slot4.id
			else
				slot4 = uv0
				slot4 = slot4.shipVO
				slot3 = slot4.skinId
			end
		end

		slot4 = BuildVector3
		slot5 = pg
		slot5 = slot5.ship_skin_template
		slot5 = slot5[slot3]
		slot5 = slot5.live2d_offset
		slot4 = slot4(slot5)
		slot5 = Vector3
		slot6 = 0
		slot7 = 0
		slot8 = 100
		slot5 = slot5(slot6, slot7, slot8)
		slot4 = slot4 + slot5
		slot2.localPosition = slot4
		slot4 = Vector3
		slot4 = slot4.Scale
		slot5 = Vector3
		slot6 = 1
		slot7 = 1
		slot8 = 10
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot2.localScale
		slot4 = slot4(slot5, slot6)
		slot2.localScale = slot4
		slot4 = uv0
		slot5 = GetComponent
		slot6 = slot0
		slot7 = "Live2dChar"
		slot5 = slot5(slot6, slot7)
		slot4.l2dChar = slot5
		slot4 = uv0
		slot4 = slot4.l2dChar
		slot5 = uv1
		slot4.name = slot5
		slot4 = pg
		slot4 = slot4.AssistantInfo
		slot4 = slot4.action2Id
		slot4 = slot4.idle
		slot5 = uv0
		slot5 = slot5.l2dChar

		function slot6(slot0)
			slot1 = uv0

			if slot1 ~= slot0 then
				slot1 = uv1
				slot1 = slot1.l2dChar
				slot2 = slot1
				slot1 = slot1.SetAction
				slot3 = uv0

				slot1(slot2, slot3)
			end
		end

		slot5.FinishAction = slot6
		slot5 = uv0
		slot5 = slot5.l2dChar
		slot6 = slot5
		slot5 = slot5.SetAction
		slot7 = slot4

		slot5(slot6, slot7)

		slot5 = CSharpVersion
		slot6 = 18

		if slot5 > slot6 then
			slot5 = pg
			slot5 = slot5.ship_skin_template
			slot5 = slot5[slot3]
			slot6 = slot5.lip_sync_gain
			slot7 = slot5.lip_smoothing

			if slot6 and slot6 ~= 0 then
				slot9 = slot1
				slot8 = slot1.GetChild
				slot10 = 0
				slot8 = slot8(slot9, slot10)
				slot9 = slot8
				slot8 = slot8.GetComponent
				slot10 = "CubismCriSrcMouthInput"
				slot8 = slot8(slot9, slot10)
				slot8.Gain = slot6
			end

			if slot7 and slot7 ~= 0 then
				slot9 = slot1
				slot8 = slot1.GetChild
				slot10 = 0
				slot8 = slot8(slot9, slot10)
				slot9 = slot8
				slot8 = slot8.GetComponent
				slot10 = "CubismCriSrcMouthInput"
				slot8 = slot8(slot9, slot10)
				slot8.Smoothing = slot7
			end
		end
	end

	slot2(slot3, slot4, slot5)
end

slot0.createLive2D = slot2

function slot2(slot0)
	slot1 = slot0.proposeSkin

	if not slot1 then
		return
	end

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "tip"
	slot5 = slot0.storyTF
	slot2 = slot2(slot3, slot4, slot5)
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "Image_bg/Text"
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = setText
	slot5 = slot3
	slot6 = i18n
	slot7 = "achieve_propose_tip"
	slot8 = slot1.name

	slot4(slot5, slot6(slot7, slot8))

	slot4 = GetOrAddComponent
	slot5 = slot2
	slot6 = typeof
	slot7 = CanvasGroup
	slot4 = slot4(slot5, slot6(slot7))
	slot5 = setActive
	slot6 = slot2
	slot7 = true

	slot5(slot6, slot7)

	slot5 = LeanTween
	slot5 = slot5.alphaCanvas
	slot6 = slot4
	slot7 = 1
	slot8 = 0.01
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot5
	slot5 = slot5.setFrom
	slot7 = 0

	slot5(slot6, slot7)

	slot5 = LeanTween
	slot5 = slot5.alphaCanvas
	slot6 = slot4
	slot7 = 0
	slot8 = 1.5
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot5
	slot5 = slot5.setFrom
	slot7 = 1
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.setDelay
	slot7 = 4

	slot5(slot6, slot7)
end

slot0.showTip = slot2

function slot2(slot0)
	slot1 = setText
	slot2 = slot0._renamePanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "frame/border/title"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_propose_changename_title"
	slot5 = slot0.shipVO
	slot6 = slot5
	slot5 = slot5.getName

	slot1(slot2, slot3(slot4, slot5(slot6)))

	slot1 = setText
	slot2 = slot0._renamePanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "frame/setting_ship_name/text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_propose_changename_tip1"

	slot1(slot2, slot3(slot4))

	slot1 = setText
	slot2 = slot0._renamePanel
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "frame/text"
	slot2 = slot2(slot3, slot4)
	slot3 = i18n
	slot4 = "word_propose_changename_tip2"

	slot1(slot2, slot3(slot4))

	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/queren"
	slot1 = slot1(slot2, slot3)
	slot0._renameConfirmBtn = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/cancel"
	slot1 = slot1(slot2, slot3)
	slot0._renameCancelBtn = slot1
	slot1 = findTF
	slot2 = slot0._renamePanel
	slot3 = "frame/setting_ship_name"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Toggle
	slot1 = slot1(slot2, slot3(slot4))
	slot0._renameToggle = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/revert_button"
	slot1 = slot1(slot2, slot3)
	slot0._renameRevert = slot1
	slot1 = slot0._renamePanel
	slot2 = slot1
	slot1 = slot1.Find
	slot3 = "frame/close_btn"
	slot1 = slot1(slot2, slot3)
	slot0._closeBtn = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameConfirmBtn

	function slot4()
		slot0 = getInputText
		slot1 = findTF
		slot2 = uv0
		slot2 = slot2._renamePanel
		slot3 = "frame/name_field"
		slot0 = slot0(slot1(slot2, slot3))
		slot1 = pg
		slot1 = slot1.PushNotificationMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.setSwitchShipName
		slot3 = uv0
		slot3 = slot3._renameToggle
		slot3 = slot3.isOn

		slot1(slot2, slot3)

		slot1 = uv0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ProposeMediator
		slot3 = slot3.RENAME_SHIP
		slot4 = uv0
		slot4 = slot4.shipVO
		slot4 = slot4.id
		slot5 = slot0

		slot1(slot2, slot3, slot4, slot5)
	end

	slot5 = SFX_CONFIRM

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameRevert

	function slot4()
		slot0 = uv0
		slot0 = slot0.shipVO
		slot1 = slot0
		slot0 = slot0.isRemoulded
		slot0 = slot0(slot1)

		if slot0 then
			slot0 = HXSet
			slot0 = slot0.hxLan
			slot1 = pg
			slot1 = slot1.ship_skin_template
			slot2 = uv0
			slot2 = slot2.shipVO
			slot3 = slot2
			slot2 = slot2.getRemouldSkinId
			slot2 = slot2(slot3)
			slot1 = slot1[slot2]
			slot1 = slot1.name
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = pg
				slot0 = slot0.ship_data_statistics
				slot1 = uv0
				slot1 = slot1.shipVO
				slot1 = slot1.configId
				slot0 = slot0[slot1]
				slot0 = slot0.name
			end
		end

		slot1 = setInputText
		slot2 = findTF
		slot3 = uv0
		slot3 = slot3._renamePanel
		slot4 = "frame/name_field"
		slot2 = slot2(slot3, slot4)
		slot3 = slot0

		slot1(slot2, slot3)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._renameCancelBtn

	function slot4()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.close

		slot0(slot1)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._closeBtn

	function slot4()
		slot0 = uv0
		slot1 = slot0
		slot0 = slot0.close

		slot0(slot1)
	end

	slot5 = SFX_CANCEL

	slot1(slot2, slot3, slot4, slot5)
end

slot0.initChangeNamePanel = slot2

function slot2(slot0)
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = uv0
	slot3 = slot3.ON_CLOSE

	slot1(slot2, slot3)
end

slot0.close = slot2

function slot2(slot0)
	slot1 = setParent
	slot2 = slot0._renamePanel
	slot3 = slot0._tf

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0._renamePanel
	slot3 = true

	slot1(slot2, slot3)

	slot1 = slot0.shipVO
	slot2 = slot1
	slot1 = slot1.getName
	slot1 = slot1(slot2)
	slot2 = setInputText
	slot3 = findTF
	slot4 = slot0._renamePanel
	slot5 = "frame/name_field"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1

	slot2(slot3, slot4)
end

slot0.DisplayRenamePanel = slot2

return slot0
