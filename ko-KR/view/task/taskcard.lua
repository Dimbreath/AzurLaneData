slot0 = class("TaskCard")
slot1 = 0
slot2 = 1
slot3 = 2
slot4 = 3
slot5 = 0.3

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot0._go)
	slot0.viewComponent = slot2
	slot0.descTxt = slot0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	slot0.tagTF = slot0._tf:Find("frame/tag")
	slot0.rewardPanel = slot0._tf:Find("frame/awards")
	slot0._rewardModel = slot0.rewardPanel:GetChild(0)
	slot0.progressBar = slot0._tf:Find("frame/slider"):GetComponent(typeof(Slider))
	slot0.progressNum = slot0._tf:Find("frame/slider/Text"):GetComponent(typeof(Text))
	slot0.GotoBtn = slot0._tf:Find("frame/go_btn")
	slot0.GetBtn = slot0._tf:Find("frame/get_btn")
	slot0.storyIconFrame = slot0._tf:Find("frame/storyIcon")
	slot0.storyIcon = slot0._tf:Find("frame/storyIcon/icon")
	slot0.frame = slot0._tf:Find("frame")
	slot0._modelWidth = slot0.frame.rect.width + 100
	slot0.finishBg = slot0._tf:Find("frame/finish_bg")
	slot0.unfinishBg = slot0._tf:Find("frame/unfinish_bg")
	slot0.tip = slot0._tf:Find("frame/tip")
	slot0.cg = GetOrAddComponent(slot0._tf, "CanvasGroup")
	slot0.urTag = slot0._tf:Find("frame/urTag")
end

function slot0.update(slot0, slot1)
	slot0.taskVO = slot1

	if slot1.id == 10302 then
		slot0._go.name = slot1.id
	end

	slot0.descTxt.text = HXSet.hxLan(slot1:getConfig("desc"))

	slot0.viewComponent:setSpriteTo("taskTagOb/" .. slot1:GetRealType(), slot0.tagTF)

	slot2 = slot1:getConfig("target_num")

	slot0:updateAwards(slot1)

	slot3 = slot1:getProgress()

	if slot1:isFinish() then
		slot0.progressNum.text = "COMPLETE"
	elseif slot1:getConfig("sub_type") == 1012 then
		slot0.progressNum.text = math.floor(slot3 / 100) .. "/" .. math.floor(slot2 / 100)
	else
		slot0.progressNum.text = slot3 .. "/" .. slot2
	end

	slot0.progressBar.value = slot3 / slot2

	slot0:updateBtnState(slot1)
	setActive(slot0.urTag, slot1:IsUrTask())
	setActive(slot0.storyIconFrame, slot1:getConfig("story_id") and slot4 ~= "" and not slot5)

	if slot4 and slot4 ~= "" then
		if not slot1:getConfig("story_icon") or slot6 == "" then
			slot6 = "task_icon_default"
		end

		LoadSpriteAsync("shipmodels/" .. slot6, function (slot0)
			if slot0 then
				setImageSprite(uv0.storyIcon, slot0, true)
			end
		end)
		onButton(slot0, slot0.storyIconFrame, function ()
			pg.NewStoryMgr.GetInstance():Play(uv0, nil, true)
		end, SFX_PANEL)
	else
		removeOnButton(slot0.storyIconFrame)
	end

	slot0.cg.alpha = 1

	setActive(slot0.frame, true)
end

function slot0.updateBtnState(slot0, slot1)
	slot2 = uv0

	removeOnButton(slot0.GotoBtn)
	removeOnButton(slot0.GetBtn)

	if slot1:isFinish() then
		slot2 = slot1:isReceive() and uv1 or uv2

		onButton(slot0, slot0.GetBtn, function ()
			function slot0()
				if not uv0.isClick then
					uv0.isClick = true
					slot0 = uv0.frame.localPosition

					LeanTween.alphaCanvas(uv0.cg, 0, uv1):setFrom(1)
					LeanTween.value(go(uv0.frame), slot0.x, slot0.x + uv0._modelWidth, uv1):setOnUpdate(System.Action_float(function (slot0)
						uv0.frame.transform.localPosition = Vector3(slot0, uv1.y, uv1.z)
					end)):setOnComplete(System.Action(function ()
						uv0.frame.transform.localPosition = uv1

						setActive(uv0.frame, false)

						uv0.isClick = nil

						uv0.viewComponent:onSubmit(uv2)
					end))
				end
			end

			slot1 = nil

			coroutine.wrap(function ()
				if uv0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM or uv0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM or uv0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
					slot0 = DROP_TYPE_ITEM

					if uv0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
						slot0 = DROP_TYPE_RESOURCE
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("sub_item_warning"),
						items = {
							{
								type = slot0,
								id = uv0:getConfig("target_id_for_client"),
								count = uv0:getConfig("target_num")
							}
						},
						onYes = function ()
							uv0()
						end
					})
					coroutine.yield()
				end

				slot0, slot1 = uv0:judgeOverflow()

				if slot0 then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						type = MSGBOX_TYPE_ITEM_BOX,
						content = i18n("award_max_warning"),
						items = slot1,
						onYes = function ()
							uv0()
						end
					})
					coroutine.yield()
				end

				uv2()
			end)()
		end, SFX_PANEL)
	else
		slot2 = uv4

		onButton(slot0, slot0.GotoBtn, function ()
			uv0.viewComponent:onGo(uv1)
		end, SFX_PANEL)
	end

	SetActive(slot0.GotoBtn, slot2 == uv4)
	SetActive(slot0.GetBtn, slot2 == uv2)
	setActive(slot0.finishBg, slot2 == uv2 or slot2 == uv1)
	setActive(slot0.unfinishBg, slot2 ~= uv2 and slot2 ~= BTN_STATE_FETC)
	setActive(slot0.tip, slot2 == uv2 or slot2 == uv1)
end

function slot0.updateAwards(slot0, slot1)
	for slot7 = slot0.rewardPanel.childCount, #_.slice(slot1:getConfig("award_display"), 1, 3) - 1 do
		cloneTplTo(slot0._rewardModel, slot0.rewardPanel)
	end

	for slot7 = 1, slot0.rewardPanel.childCount do
		slot9 = slot7 <= #slot2

		setActive(slot0.rewardPanel:GetChild(slot7 - 1), slot9)

		if slot9 then
			slot10 = slot2[slot7]

			updateDrop(slot8, {
				type = slot10[1],
				id = slot10[2],
				count = slot10[3]
			})
		end
	end
end

function slot0.dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
