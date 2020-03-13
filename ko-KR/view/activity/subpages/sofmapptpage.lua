slot0 = class
slot1 = "SofmapPTPage"
slot2 = import
slot3 = ".TemplatePage.PtTemplatePage"
slot0 = slot0(slot1, slot2(slot3))
slot1 = 0.5
slot0.FADE_TIME = slot1
slot1 = 1
slot0.SHOW_TIME = slot1
slot1 = 0.5
slot0.FADE_OUT_TIME = slot1
slot1 = {
	4,
	8,
	12,
	16,
	20
}
slot0.SpineActionByStep = slot1

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnFirstFlush
	slot2 = slot0

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "shop"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shop = slot1
	slot1 = GetComponent
	slot2 = slot0.shop
	slot3 = "SpineAnimUI"
	slot1 = slot1(slot2, slot3)
	slot0.shopAnim = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "sdcontainer"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.sdContainer = slot1
	slot1 = nil
	slot0.spine = slot1
	slot1 = GetSpineRequestPackage
	slot1 = slot1.New
	slot2 = "mingshi_5"

	function slot3(slot0)
		slot1 = SetParent
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.sdContainer

		slot1(slot2, slot3)

		slot1 = slot0
		slot1.spine = slot0
		slot1 = slot0
		slot1 = slot1.spine
		slot1 = slot1.transform
		slot2 = Vector3
		slot2 = slot2.one
		slot1.localScale = slot2
		slot1 = slot0
		slot1 = slot1.spine
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = "SpineAnimUI"
		slot1 = slot1(slot2, slot3)

		if slot1 then
			slot3 = slot1
			slot2 = slot1.SetAction
			slot4 = "stand"
			slot5 = 0

			slot2(slot3, slot4, slot5)
		end

		slot2 = slot0
		slot3 = nil
		slot2.spineLRQ = slot3
	end

	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.Start
	slot1 = slot1(slot2)
	slot0.spineLRQ = slot1
	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "sdBtn"
	slot6 = slot0.bg
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.showBubble

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "level_btn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.levelBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "pt_btn"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.ptBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bubble"
	slot4 = slot0.bg
	slot1 = slot1(slot2, slot3, slot4)
	slot0.bubble = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "Text"
	slot4 = slot0.bubble
	slot1 = slot1(slot2, slot3, slot4)
	slot0.bubbleText = slot1
	slot1 = GetComponent
	slot2 = slot0.bubble
	slot3 = "CanvasGroup"
	slot1 = slot1(slot2, slot3)
	slot0.bubbleCG = slot1
	slot1 = false
	slot0.showBubbleTag = slot1
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.getBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.ptData
		slot1 = slot0
		slot0 = slot0.GetResProgress
		slot0, slot1 = slot0(slot1)
		slot2 = slot0
		slot3 = slot2
		slot2 = slot2.emit
		slot4 = ActivityMediator
		slot4 = slot4.EVENT_PT_OPERATION
		slot5 = {
			cmd = 1
		}
		slot6 = slot0
		slot6 = slot6.ptData
		slot7 = slot6
		slot6 = slot6.GetId
		slot6 = slot6(slot7)
		slot5.activity_id = slot6
		slot5.arg1 = slot1

		function slot6()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showBubble
			slot2 = i18n
			slot3 = "sofmapsd_3"

			slot0(slot1, slot2(slot3))
		end

		slot5.callback = slot6

		slot2(slot3, slot4, slot5)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.levelBtn

	function slot4()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_HELP
		slot2.type = slot3
		slot3 = pg
		slot3 = slot3.gametip
		slot3 = slot3.sofmap_attention
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = {
		count = 0
	}
	slot2 = DROP_TYPE_RESOURCE
	slot1.type = slot2
	slot2 = slot0.ptData
	slot2 = slot2.resId
	slot1.id = slot2
	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.ptBtn

	function slot5()
		slot0 = pg
		slot0 = slot0.MsgboxMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.ShowMsgBox
		slot2 = {}
		slot3 = MSGBOX_TYPE_SINGLE_ITEM
		slot2.type = slot3
		slot3 = slot0
		slot2.drop = slot3

		slot0(slot1, slot2)
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)
end

slot0.OnFirstFlush = slot1

function slot1(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.OnUpdateFlush
	slot2 = slot0

	slot1(slot2)

	slot1 = slot0.ptData
	slot2 = slot1
	slot1 = slot1.GetResProgress
	slot1, slot2, slot3 = slot1(slot2)
	slot4 = setText
	slot5 = slot0.progress
	slot6 = 1

	if slot3 >= slot6 then
		slot6 = setColorStr(slot1, "#68E9F4FF") or slot1
		slot7 = "/"
		slot8 = slot2
		slot6 = slot6 .. slot7 .. slot8

		slot4(slot5, slot6)

		slot4 = slot0.ptData
		slot5 = slot4
		slot4 = slot4.GetLevelProgress
		slot4, slot5, slot6 = slot4(slot5)
		slot7 = slot0
		slot7 = slot7.SpineActionByStep
		slot7 = slot7[1]

		if slot4 <= slot7 then
			slot7 = slot0.shopAnim
			slot8 = slot7
			slot7 = slot7.SetAction
			slot9 = "stand2"
			slot10 = 0

			slot7(slot8, slot9, slot10)
		else
			slot7 = slot0
			slot7 = slot7.SpineActionByStep
			slot7 = slot7[2]

			if slot4 <= slot7 then
				slot7 = slot0.shopAnim
				slot8 = slot7
				slot7 = slot7.SetAction
				slot9 = "stand1"
				slot10 = 0

				slot7(slot8, slot9, slot10)
			else
				slot7 = slot0
				slot7 = slot7.SpineActionByStep
				slot7 = slot7[3]

				if slot4 <= slot7 then
					slot7 = slot0.shopAnim
					slot8 = slot7
					slot7 = slot7.SetAction
					slot9 = "stand1x2"
					slot10 = 0

					slot7(slot8, slot9, slot10)
				else
					slot7 = slot0
					slot7 = slot7.SpineActionByStep
					slot7 = slot7[4]

					if slot4 <= slot7 then
						slot7 = slot0.shopAnim
						slot8 = slot7
						slot7 = slot7.SetAction
						slot9 = "stand1x4"
						slot10 = 0

						slot7(slot8, slot9, slot10)
					else
						slot7 = slot0
						slot7 = slot7.SpineActionByStep
						slot7 = slot7[5]

						if slot4 <= slot7 then
							slot7 = slot0.shopAnim
							slot8 = slot7
							slot7 = slot7.SetAction
							slot9 = "stand1x8"
							slot10 = 0

							slot7(slot8, slot9, slot10)
						end
					end
				end
			end
		end
	end

	slot7 = slot0.showBubbleTag

	if not slot7 then
		slot8 = slot0
		slot7 = slot0.showBubble

		slot7(slot8)

		slot7 = true
		slot0.showBubbleTag = slot7
	end
end

slot0.OnUpdateFlush = slot1

function slot1(slot0)
	slot1 = slot0.spineLRQ

	if slot1 then
		slot1 = slot0.spineLRQ
		slot2 = slot1
		slot1 = slot1.Stop

		slot1(slot2)

		slot1 = nil
		slot0.spineLRQ = slot1
	end

	slot1 = slot0.spine

	if slot1 then
		slot1 = slot0.spine
		slot1 = slot1.transform
		slot2 = Vector3
		slot2 = slot2.one
		slot1.localScale = slot2
		slot1 = pg
		slot1 = slot1.PoolMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.ReturnSpineChar
		slot3 = "mingshi_5"
		slot4 = slot0.spine

		slot1(slot2, slot3, slot4)

		slot1 = nil
		slot0.spine = slot1
	end
end

slot0.OnDestroy = slot1

function slot1(slot0, slot1)
	slot2 = nil

	if not slot1 then
		slot3 = isActive
		slot4 = slot0.battleBtn
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = HXSet
			slot3 = slot3.hxLan
			slot4 = i18n
			slot5 = "sofmapsd_1"
			slot3 = slot3(slot4(slot5))
			slot2 = slot3
		else
			slot3 = isActive
			slot4 = slot0.getBtn
			slot3 = slot3(slot4)

			if slot3 then
				slot3 = HXSet
				slot3 = slot3.hxLan
				slot4 = i18n
				slot5 = "sofmapsd_2"
				slot3 = slot3(slot4(slot5))
				slot2 = slot3
			else
				slot3 = isActive
				slot4 = slot0.gotBtn
				slot3 = slot3(slot4)

				if slot3 then
					slot3 = i18n
					slot4 = "sofmapsd_4"
					slot3 = slot3(slot4)
					slot2 = slot3
				end
			end
		end
	else
		slot2 = slot1
	end

	slot3 = setText
	slot4 = slot0.bubbleText
	slot5 = slot2

	slot3(slot4, slot5)

	function slot3(slot0)
		slot1 = slot0
		slot1 = slot1.bubbleCG
		slot1.alpha = slot0
		slot1 = setLocalScale
		slot2 = slot0
		slot2 = slot2.bubble
		slot3 = Vector3
		slot3 = slot3.one
		slot3 = slot3 * slot0

		slot1(slot2, slot3)
	end

	function slot4()
		slot0 = LeanTween
		slot0 = slot0.value
		slot1 = go
		slot2 = slot0
		slot2 = slot2.bubble
		slot1 = slot1(slot2)
		slot2 = 1
		slot3 = 0
		slot4 = slot1
		slot4 = slot4.FADE_OUT_TIME
		slot0 = slot0(slot1, slot2, slot3, slot4)
		slot1 = slot0
		slot0 = slot0.setOnUpdate
		slot2 = System
		slot2 = slot2.Action_float
		slot3 = slot2
		slot0 = slot0(slot1, slot2(slot3))
		slot1 = slot0
		slot0 = slot0.setOnComplete
		slot2 = System
		slot2 = slot2.Action

		function slot3()
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.bubble
			slot2 = false

			slot0(slot1, slot2)
		end

		slot0(slot1, slot2(slot3))
	end

	slot5 = LeanTween
	slot5 = slot5.cancel
	slot6 = go
	slot7 = slot0.bubble

	slot5(slot6(slot7))

	slot5 = setActive
	slot6 = slot0.bubble
	slot7 = true

	slot5(slot6, slot7)

	slot5 = LeanTween
	slot5 = slot5.value
	slot6 = go
	slot7 = slot0.bubble
	slot6 = slot6(slot7)
	slot7 = 0
	slot8 = 1
	slot9 = slot0
	slot9 = slot9.FADE_TIME
	slot5 = slot5(slot6, slot7, slot8, slot9)
	slot6 = slot5
	slot5 = slot5.setOnUpdate
	slot7 = System
	slot7 = slot7.Action_float
	slot8 = slot3
	slot5 = slot5(slot6, slot7(slot8))
	slot6 = slot5
	slot5 = slot5.setOnComplete
	slot7 = System
	slot7 = slot7.Action

	function slot8()
		slot0 = LeanTween
		slot0 = slot0.delayedCall
		slot1 = go
		slot2 = slot0
		slot2 = slot2.bubble
		slot1 = slot1(slot2)
		slot2 = slot1
		slot2 = slot2.SHOW_TIME
		slot3 = System
		slot3 = slot3.Action
		slot4 = slot2

		slot0(slot1, slot2, slot3(slot4))
	end

	slot5(slot6, slot7(slot8))
end

slot0.showBubble = slot1

return slot0
