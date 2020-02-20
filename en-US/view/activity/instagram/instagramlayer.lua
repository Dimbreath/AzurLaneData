slot0 = class
slot1 = "InstagramLayer"
slot2 = import
slot3 = "...base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))

function slot1(slot0)
	slot1 = "InstagramUI"

	return slot1
end

slot0.getUIName = slot1

function slot1(slot0, slot1)
	slot0.proxy = slot1
	slot3 = slot1
	slot2 = slot1.GetData
	slot2 = slot2(slot3)
	slot0.instagramVOById = slot2
	slot3 = slot1
	slot2 = slot1.GetMessages
	slot2 = slot2(slot3)
	slot0.messages = slot2
end

slot0.SetProxy = slot1

function slot1(slot0, slot1)
	slot2 = slot0.contextData
	slot2 = slot2.instagram

	if slot2 then
		slot2 = slot0.contextData
		slot2 = slot2.instagram
		slot2 = slot2.id

		if slot2 == slot1 then
			slot2 = slot0.contextData
			slot3 = slot0.instagramVOById
			slot3 = slot3[slot1]
			slot2.instagram = slot3
			slot3 = slot0
			slot2 = slot0.UpdateCommentList

			slot2(slot3)
		end
	end
end

slot0.UpdateSelectedInstagram = slot1

function slot1(slot0)
	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "MainObject"
	slot1 = slot1(slot2)
	slot2 = BulletinBoardMgr
	slot2 = slot2.Inst
	slot0.downloadmgr = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "list"
	slot2 = slot2(slot3, slot4)
	slot0.listTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main"
	slot2 = slot2(slot3, slot4)
	slot0.mainTF = slot2
	slot2 = setActive
	slot3 = slot0.listTF
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.mainTF
	slot4 = false

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "close_btn"
	slot2 = slot2(slot3, slot4)
	slot0.closeBtn = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "list/bg/help"
	slot2 = slot2(slot3, slot4)
	slot0.helpBtn = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "list/bg/no_msg"
	slot2 = slot2(slot3, slot4)
	slot0.noMsgTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "list/bg/scrollrect"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = "LScrollRect"
	slot2 = slot2(slot3, slot4)
	slot0.list = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/Image"
	slot2 = slot2(slot3, slot4)
	slot0.imageTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/heart"
	slot2 = slot2(slot3, slot4)
	slot0.likeBtn = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/bubble"
	slot2 = slot2(slot3, slot4)
	slot0.bubbleTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/plane"
	slot2 = slot2(slot3, slot4)
	slot0.planeTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/zan"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Text
	slot2 = slot2(slot3, slot4(slot5))
	slot0.likeCntTxt = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/left_panel/time"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Text
	slot2 = slot2(slot3, slot4(slot5))
	slot0.pushTimeTxt = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/top/head/icon"
	slot2 = slot2(slot3, slot4)
	slot0.iconTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/top/name"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Text
	slot2 = slot2(slot3, slot4(slot5))
	slot0.nameTxt = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/center"
	slot2 = slot2(slot3, slot4)
	slot0.centerTF = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/center/Text/Text"
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.GetComponent
	slot4 = typeof
	slot5 = Text
	slot2 = slot2(slot3, slot4(slot5))
	slot0.contentTxt = slot2
	slot2 = UIItemList
	slot2 = slot2.New
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "main/right_panel/center/bottom/scroll/content"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "main/right_panel/center/bottom/scroll/content/tpl"
	slot2 = slot2(slot3, slot4(slot5, slot6))
	slot0.commentList = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/last/bg2"
	slot2 = slot2(slot3, slot4)
	slot0.commentPanel = slot2
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "main/right_panel/last/bg2/option"
	slot2 = slot2(slot3, slot4)
	slot0.optionalPanel = slot2
	slot2 = {}
	slot0.sprites = slot2
	slot2 = {}
	slot0.timers = slot2
	slot2 = pg
	slot2 = slot2.UIMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot0.UIMgr = slot2
	slot2 = slot0.UIMgr
	slot3 = slot2
	slot2 = slot2.BlurPanel
	slot4 = slot0._tf

	slot2(slot3, slot4)
end

slot0.init = slot1

function slot1(slot0, slot1, slot2)
	slot4 = slot2
	slot3 = slot2.GetComponent
	slot5 = typeof
	slot6 = Image
	slot3 = slot3(slot4, slot5(slot6))

	if not slot1 or slot1 == "" then
		slot4 = LoadSprite
		slot5 = "bg/bg_night"
		slot4 = slot4(slot5)
		slot3.sprite = slot4
	else
		slot4 = slot0.sprites
		slot4 = slot4[slot1]

		if slot4 then
			slot3.sprite = slot4
		else
			slot5 = false
			slot3.enabled = slot5
			slot5 = slot0.downloadmgr
			slot6 = slot5
			slot5 = slot5.GetSprite
			slot7 = "ins"
			slot8 = "1"
			slot9 = slot1
			slot10 = UnityEngine
			slot10 = slot10.Events
			slot10 = slot10.UnityAction_UnityEngine_Sprite

			function slot11(slot0)
				slot1 = slot0
				slot1 = slot1.sprites

				if not slot1 then
					return
				end

				slot1 = slot0
				slot1 = slot1.sprites
				slot2 = slot1
				slot1[slot2] = slot0
				slot1 = slot2
				slot1.sprite = slot0
				slot1 = slot2
				slot2 = true
				slot1.enabled = slot2
			end

			slot5(slot6, slot7, slot8, slot9, slot10(slot11))
		end
	end
end

slot0.SetImageByUrl = slot1

function slot1(slot0)
	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.closeBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.inDetail

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.ExitDetail

			slot0(slot1)
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_CLOSE

			slot0(slot1, slot2)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

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
		slot3 = slot3.music_juus
		slot3 = slot3.tip
		slot2.helps = slot3

		slot0(slot1, slot2)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0._tf

	function slot4()
		slot0 = slot0
		slot0 = slot0.inDetail

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.ExitDetail

			slot0(slot1)
		else
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = slot1
			slot2 = slot2.ON_CLOSE

			slot0(slot1, slot2)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = {}
	slot0.cards = slot1
	slot1 = slot0.list

	function slot2(slot0)
		slot1 = InstagramCard
		slot1 = slot1.New
		slot2 = slot0
		slot3 = slot0
		slot1 = slot1(slot2, slot3)
		slot2 = onButton
		slot3 = slot0
		slot4 = slot1._go

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.EnterDetail
			slot2 = slot1
			slot2 = slot2.instagram

			slot0(slot1, slot2)
		end

		slot6 = SFX_PANEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot0
		slot2 = slot2.cards
		slot2[slot0] = slot1
	end

	slot1.onInitItem = slot2
	slot1 = slot0.list

	function slot2(slot0, slot1)
		slot2 = slot0
		slot2 = slot2.cards
		slot2 = slot2[slot1]

		if not slot2 then
			slot3 = InstagramCard
			slot3 = slot3.New
			slot4 = slot1
			slot3 = slot3(slot4)
			slot2 = slot3
			slot3 = slot0
			slot3 = slot3.cards
			slot3[slot1] = slot2
		end

		slot3 = slot0
		slot3 = slot3.display
		slot4 = slot0 + 1
		slot3 = slot3[slot4]
		slot4 = slot0
		slot4 = slot4.instagramVOById
		slot5 = slot3.id
		slot4 = slot4[slot5]
		slot6 = slot2
		slot5 = slot2.Update
		slot7 = slot4

		slot5(slot6, slot7)
	end

	slot1.onUpdateItem = slot2
	slot2 = slot0
	slot1 = slot0.InitList

	slot1(slot2)
end

slot0.didEnter = slot1

function slot1(slot0)
	slot0.display = _.map(slot0.messages, function (slot0)
		return {
			time = slot0:GetLasterUpdateTime(),
			id = slot0.id
		}
	end)

	table.sort(slot0.display, function (slot0, slot1)
		return slot1.id < slot0.id
	end)
	slot0.list:SetTotalCount(#slot0.display)
	setActive(slot0.noMsgTF, #slot0.display == 0)
end

slot0.InitList = slot1

function slot1(slot0, slot1, slot2)
	slot3 = pairs
	slot4 = slot0.cards
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.instagram

		if slot8 then
			slot8 = slot7.instagram
			slot8 = slot8.id

			if slot8 == slot1 then
				slot9 = slot7
				slot8 = slot7.Update
				slot10 = slot0.instagramVOById
				slot10 = slot10[slot1]
				slot11 = slot2

				slot8(slot9, slot10, slot11)
			end
		end
	end
end

slot0.UpdateInstagram = slot1

function slot1(slot0, slot1)
	slot2 = slot0.contextData
	slot2.instagram = slot1
	slot2 = setActive
	slot3 = slot0.mainTF
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.listTF
	slot4 = false

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.InitDetailPage

	slot2(slot3)

	slot2 = true
	slot0.inDetail = slot2
	slot2 = pg
	slot2 = slot2.SystemGuideMgr
	slot3 = slot2
	slot2 = slot2.GetInstance
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.Play
	slot4 = slot0

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.RefreshInstagram

	slot2(slot3)
end

slot0.EnterDetail = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram

	if slot1 then
		slot3 = slot1
		slot2 = slot1.IsReaded
		slot2 = slot2(slot3)

		if not slot2 then
			slot3 = slot0
			slot2 = slot0.emit
			slot4 = InstagramMediator
			slot4 = slot4.ON_READED
			slot5 = slot1.id

			slot2(slot3, slot4, slot5)
		end
	end

	slot2 = slot0.contextData
	slot3 = nil
	slot2.instagram = slot3
	slot2 = setActive
	slot3 = slot0.mainTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.listTF
	slot4 = true

	slot2(slot3, slot4)

	slot2 = false
	slot0.inDetail = slot2
	slot3 = slot0
	slot2 = slot0.CloseCommentPanel

	slot2(slot3)
end

slot0.ExitDetail = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram
	slot3 = slot1
	slot2 = slot1.GetFastestRefreshTime
	slot2 = slot2(slot3)

	if slot2 then
		slot3 = pg
		slot3 = slot3.TimeMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.GetServerTime
		slot3 = slot3(slot4)
		slot4 = slot2 - slot3
		slot5 = 0

		if slot4 <= slot5 then
			slot6 = slot0
			slot5 = slot0.emit
			slot7 = InstagramMediator
			slot7 = slot7.ON_REPLY_UPDATE
			slot8 = slot1.id

			slot5(slot6, slot7, slot8)
		end
	end
end

slot0.RefreshInstagram = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram
	slot3 = slot0
	slot2 = slot0.SetImageByUrl
	slot5 = slot1
	slot4 = slot1.GetImage
	slot4 = slot4(slot5)
	slot5 = slot0.imageTF

	slot2(slot3, slot4, slot5)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0.planeTF

	function slot5()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = InstagramMediator
		slot2 = slot2.ON_SHARE
		slot3 = slot1
		slot3 = slot3.id

		slot0(slot1, slot2, slot3)
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)

	slot2 = slot0.pushTimeTxt
	slot4 = slot1
	slot3 = slot1.GetPushTime
	slot3 = slot3(slot4)
	slot2.text = slot3
	slot2 = setImageSprite
	slot3 = slot0.iconTF
	slot4 = LoadSprite
	slot5 = "qicon/"
	slot7 = slot1
	slot6 = slot1.GetIcon
	slot6 = slot6(slot7)
	slot5 = slot5 .. slot6
	slot4 = slot4(slot5)
	slot5 = false

	slot2(slot3, slot4, slot5)

	slot2 = slot0.nameTxt
	slot3 = HXSet
	slot3 = slot3.hxLan
	slot5 = slot1
	slot4 = slot1.GetName
	slot3 = slot3(slot4(slot5))
	slot2.text = slot3
	slot2 = slot0.contentTxt
	slot3 = HXSet
	slot3 = slot3.hxLan
	slot5 = slot1
	slot4 = slot1.GetContent
	slot3 = slot3(slot4(slot5))
	slot2.text = slot3
	slot2 = onToggle
	slot3 = slot0
	slot4 = slot0.commentPanel

	function slot5(slot0)
		if slot0 then
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.OpenCommentPanel

			slot1(slot2)
		else
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.CloseCommentPanel

			slot1(slot2)
		end
	end

	slot6 = SFX_PANEL

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot0
	slot2 = slot0.UpdateLikeBtn

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.UpdateCommentList

	slot2(slot3)
end

slot0.InitDetailPage = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram
	slot3 = slot1
	slot2 = slot1.IsLiking
	slot2 = slot2(slot3)

	if not slot2 then
		slot3 = onButton
		slot4 = slot0
		slot5 = slot0.likeBtn

		function slot6()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = InstagramMediator
			slot2 = slot2.ON_LIKE
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)
		end

		slot7 = SFX_PANEL

		slot3(slot4, slot5, slot6, slot7)
	else
		slot3 = removeOnButton
		slot4 = slot0.likeBtn

		slot3(slot4)
	end

	slot3 = setActive
	slot4 = slot0.likeBtn
	slot5 = slot4
	slot4 = slot4.Find
	slot6 = "heart"
	slot4 = slot4(slot5, slot6)
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = slot0.likeBtn
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Image
	slot3 = slot3(slot4, slot5(slot6))
	slot4 = not slot2
	slot3.enabled = slot4
	slot3 = slot0.likeCntTxt
	slot4 = i18n
	slot5 = "ins_word_like"
	slot7 = slot1
	slot6 = slot1.GetLikeCnt
	slot4 = slot4(slot5, slot6(slot7))
	slot3.text = slot4
end

slot0.UpdateLikeBtn = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram

	if not slot1 then
		return
	end

	slot3 = slot1
	slot2 = slot1.GetCanDisplayComments
	slot2, slot3 = slot2(slot3)
	slot4 = table
	slot4 = slot4.sort
	slot5 = slot2

	function slot6(slot0, slot1)
		return slot0.time < slot1.time
	end

	slot4(slot5, slot6)

	slot4 = slot0.commentList
	slot5 = slot4
	slot4 = slot4.make

	function slot6(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = slot0
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot5 = slot3
			slot4 = slot3.HasReply
			slot4 = slot4(slot5)
			slot5 = setText
			slot7 = slot2
			slot6 = slot2.Find
			slot8 = "main/reply"
			slot6 = slot6(slot7, slot8)
			slot8 = slot3
			slot7 = slot3.GetReplyBtnTxt

			slot5(slot6, slot7(slot8))

			slot6 = slot3
			slot5 = slot3.GetContent
			slot5 = slot5(slot6)
			slot6 = PLATFORM_CODE
			slot7 = PLATFORM_US

			if slot6 ~= slot7 then
				slot7 = slot5
				slot6 = slot5.gsub
				slot8 = "%s"
				slot9 = " "
				slot6 = slot6(slot7, slot8, slot9)
				slot5 = slot6
			end

			slot6 = setText
			slot8 = slot2
			slot7 = slot2.Find
			slot9 = "main/content"
			slot7 = slot7(slot8, slot9)
			slot8 = HXSet
			slot8 = slot8.hxLan
			slot9 = slot5

			slot6(slot7, slot8(slot9))

			slot6 = setText
			slot8 = slot2
			slot7 = slot2.Find
			slot9 = "main/bubble/Text"
			slot7 = slot7(slot8, slot9)
			slot9 = slot3
			slot8 = slot3.GetReplyCnt

			slot6(slot7, slot8(slot9))

			slot6 = setText
			slot8 = slot2
			slot7 = slot2.Find
			slot9 = "main/time"
			slot7 = slot7(slot8, slot9)
			slot9 = slot3
			slot8 = slot3.GetTime

			slot6(slot7, slot8(slot9))

			slot7 = slot3
			slot6 = slot3.GetType
			slot6 = slot6(slot7)
			slot7 = Instagram
			slot7 = slot7.TYPE_PLAYER_COMMENT

			if slot6 == slot7 then
				slot7 = slot3
				slot6 = slot3.GetIcon
				slot6, slot7 = slot6(slot7)
				slot8 = setImageSprite
				slot10 = slot2
				slot9 = slot2.Find
				slot11 = "main/head/icon"
				slot9 = slot9(slot10, slot11)
				slot10 = GetSpriteFromAtlas
				slot11 = slot6
				slot12 = slot7

				slot8(slot9, slot10(slot11, slot12))
			else
				slot6 = setImageSprite
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "main/head/icon"
				slot7 = slot7(slot8, slot9)
				slot8 = LoadSprite
				slot9 = "qicon/"
				slot11 = slot3
				slot10 = slot3.GetIcon
				slot10 = slot10(slot11)
				slot9 = slot9 .. slot10
				slot8 = slot8(slot9)
				slot9 = false

				slot6(slot7, slot8, slot9)
			end

			if slot4 then
				slot6 = onToggle
				slot7 = slot1
				slot9 = slot2
				slot8 = slot2.Find
				slot10 = "main/bubble"
				slot8 = slot8(slot9, slot10)

				function slot9(slot0)
					slot1 = setActive
					slot2 = slot0
					slot3 = slot2
					slot2 = slot2.Find
					slot4 = "replys"
					slot2 = slot2(slot3, slot4)
					slot3 = slot0

					slot1(slot2, slot3)
				end

				slot10 = SFX_PANEL

				slot6(slot7, slot8, slot9, slot10)

				slot6 = slot1
				slot7 = slot6
				slot6 = slot6.UpdateReplys
				slot8 = slot2
				slot9 = slot3

				slot6(slot7, slot8, slot9)

				slot6 = triggerToggle
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "main/bubble"
				slot7 = slot7(slot8, slot9)
				slot8 = true

				slot6(slot7, slot8)
			else
				slot6 = setActive
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "replys"
				slot7 = slot7(slot8, slot9)
				slot8 = false

				slot6(slot7, slot8)

				slot6 = triggerToggle
				slot8 = slot2
				slot7 = slot2.Find
				slot9 = "main/bubble"
				slot7 = slot7(slot8, slot9)
				slot8 = false

				slot6(slot7, slot8)
			end

			slot7 = slot2
			slot6 = slot2.Find
			slot8 = "main/bubble"
			slot6 = slot6(slot7, slot8)
			slot7 = slot6
			slot6 = slot6.GetComponent
			slot8 = typeof
			slot9 = Toggle
			slot6 = slot6(slot7, slot8(slot9))
			slot6.enabled = slot4
		end
	end

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.centerTF
	slot6 = false

	slot4(slot5, slot6)

	slot4 = setActive
	slot5 = slot0.centerTF
	slot6 = true

	slot4(slot5, slot6)

	slot4 = Canvas
	slot4 = slot4.ForceUpdateCanvases

	slot4()

	slot4 = slot0.commentList
	slot5 = slot4
	slot4 = slot4.align
	slot6 = #slot2

	slot4(slot5, slot6)
end

slot0.UpdateCommentList = slot1

function slot1(slot0, slot1, slot2)
	slot4 = slot2
	slot3 = slot2.GetCanDisplayReply
	slot3, slot4 = slot3(slot4)
	slot5 = UIItemList
	slot5 = slot5.New
	slot7 = slot1
	slot6 = slot1.Find
	slot8 = "replys"
	slot6 = slot6(slot7, slot8)
	slot8 = slot1
	slot7 = slot1.Find
	slot9 = "replys/sub"
	slot5 = slot5(slot6, slot7(slot8, slot9))
	slot6 = table
	slot6 = slot6.sort
	slot7 = slot3

	function slot8(slot0, slot1)
		slot2 = slot0.level
		slot3 = slot1.level

		if slot2 == slot3 then
			slot2 = slot0.time
			slot3 = slot1.time

			if slot2 == slot3 then
				return slot0.id < slot1.id
			else
				return slot0.time < slot1.time
			end
		else
			return slot0.level < slot1.level
		end
	end

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.make

	function slot8(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = slot0
			slot4 = slot1 + 1
			slot3 = slot3[slot4]
			slot4 = setImageSprite
			slot6 = slot2
			slot5 = slot2.Find
			slot7 = "head/icon"
			slot5 = slot5(slot6, slot7)
			slot6 = LoadSprite
			slot7 = "qicon/"
			slot9 = slot3
			slot8 = slot3.GetIcon
			slot8 = slot8(slot9)
			slot7 = slot7 .. slot8
			slot6 = slot6(slot7)
			slot7 = false

			slot4(slot5, slot6, slot7)

			slot5 = slot3
			slot4 = slot3.GetContent
			slot4 = slot4(slot5)
			slot5 = PLATFORM_CODE
			slot6 = PLATFORM_US

			if slot5 ~= slot6 then
				slot6 = slot4
				slot5 = slot4.gsub
				slot7 = "%s"
				slot8 = " "
				slot5 = slot5(slot6, slot7, slot8)
				slot4 = slot5
			end

			slot5 = setText
			slot7 = slot2
			slot6 = slot2.Find
			slot8 = "content"
			slot6 = slot6(slot7, slot8)
			slot7 = HXSet
			slot7 = slot7.hxLan
			slot8 = slot4

			slot5(slot6, slot7(slot8))
		end
	end

	slot6(slot7, slot8)

	slot7 = slot5
	slot6 = slot5.align
	slot8 = #slot3

	slot6(slot7, slot8)
end

slot0.UpdateReplys = slot1

function slot1(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.instagram
	slot3 = slot1
	slot2 = slot1.CanOpenComment
	slot2 = slot2(slot3)

	if not slot2 then
		return
	end

	slot2 = setActive
	slot3 = slot0.optionalPanel
	slot4 = true

	slot2(slot3, slot4)

	slot3 = slot1
	slot2 = slot1.GetOptionComment
	slot2 = slot2(slot3)
	slot3 = slot0.commentPanel
	slot4 = Vector2
	slot5 = 642.6
	slot6 = #slot2
	slot6 = slot6 + 1
	slot6 = slot6 * 150
	slot4 = slot4(slot5, slot6)
	slot3.sizeDelta = slot4
	slot3 = UIItemList
	slot3 = slot3.New
	slot4 = slot0.optionalPanel
	slot5 = slot0.optionalPanel
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "option1"
	slot3 = slot3(slot4, slot5(slot6, slot7))
	slot5 = slot3
	slot4 = slot3.make

	function slot6(slot0, slot1, slot2)
		slot3 = UIItemList
		slot3 = slot3.EventUpdate

		if slot0 == slot3 then
			slot3 = slot1 + 1
			slot4 = slot0
			slot4 = slot4[slot3]
			slot4 = slot4.text
			slot5 = slot0
			slot5 = slot5[slot3]
			slot5 = slot5.id
			slot6 = slot0
			slot6 = slot6[slot3]
			slot6 = slot6.index
			slot7 = setText
			slot9 = slot2
			slot8 = slot2.Find
			slot10 = "Text"
			slot8 = slot8(slot9, slot10)
			slot9 = HXSet
			slot9 = slot9.hxLan
			slot10 = slot4

			slot7(slot8, slot9(slot10))

			slot7 = onButton
			slot8 = slot1
			slot9 = slot2

			function slot10()
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = InstagramMediator
				slot2 = slot2.ON_COMMENT
				slot3 = slot1
				slot3 = slot3.id
				slot4 = slot2
				slot5 = slot3

				slot0(slot1, slot2, slot3, slot4, slot5)

				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.CloseCommentPanel

				slot0(slot1)
			end

			slot11 = SFX_PANEL

			slot7(slot8, slot9, slot10, slot11)
		end
	end

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.align
	slot6 = #slot2

	slot4(slot5, slot6)
end

slot0.OpenCommentPanel = slot1

function slot1(slot0)
	slot1 = slot0.commentPanel
	slot2 = Vector2
	slot3 = 642.6
	slot4 = 150
	slot2 = slot2(slot3, slot4)
	slot1.sizeDelta = slot2
	slot1 = setActive
	slot2 = slot0.optionalPanel
	slot3 = false

	slot1(slot2, slot3)
end

slot0.CloseCommentPanel = slot1

function slot1(slot0)
	slot1 = slot0.UIMgr
	slot2 = slot1
	slot1 = slot1.UnblurPanel
	slot3 = slot0._tf
	slot4 = slot0.UIMgr
	slot4 = slot4._normalUIMain

	slot1(slot2, slot3, slot4)

	slot2 = slot0
	slot1 = slot0.ExitDetail

	slot1(slot2)

	slot1 = nil
	slot0.sprites = slot1
	slot1 = pairs
	slot2 = slot0.cards
	slot1, slot2, slot3 = slot1(slot2)

	for slot4, slot5 in slot1, slot2, slot3 do
		slot7 = slot5
		slot6 = slot5.Dispose

		slot6(slot7)
	end

	slot1 = {}
	slot0.cards = slot1
end

slot0.willExit = slot1

return slot0
