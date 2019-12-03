slot0 = class("MonopolyLayer", import("..base.BaseUI"))
slot1 = pg.activity_event_monopoly_map
slot2 = pg.activity_event_monopoly_event
slot3 = 501041
slot4 = 501041
slot5 = 6
slot6 = 5
slot7 = {
	stateGold = "dafuweng_gold",
	stateOil = "dafuweng_oil",
	stateEvent = "dafuweng_event",
	stateWalk = "dafuweng_walk",
	stateStand = "dafuweng_stand",
	stateJump = "dafuweng_jump",
	stateRun = "dafuweng_run",
	stateTouch = "dafuweng_touch"
}
slot8 = nil

function slot8()
	return {
		onActionUpdated = function ()
			return
		end,
		currState = nil,
		ChangeState = function (slot0, slot1, slot2)
			slot2 = slot2 or function ()
				return
			end

			if slot0.currState == slot1 then
				slot2()
			end

			slot0.currState = slot1

			slot0.onActionUpdated(slot1, slot2)
		end,
		IsStandState = function (slot0)
			return slot0.currState == slot0.stateStand
		end
	}
end

function slot9(slot0)
	return {
		onMove = function ()
			return
		end,
		onJump = function ()
			return
		end,
		onUpdatePos = function ()
			return
		end,
		ship = Ship.New({
			configId = slot0,
			skin_id = slot0
		}),
		state = slot1(),
		Move = function (slot0, slot1, slot2, slot3)
			slot2 = slot2 or function ()
				return
			end

			if #slot1 == 0 then
				slot2()

				return
			end

			function slot4(slot0)
				if slot0 then
					slot0.state:ChangeState(slot1.stateWalk)
				else
					slot0.state:ChangeState(slot1.stateRun)
				end

				slot0.onMove(slot2, function ()
					if slot0:GetAction(slot1[#slot1]) then
						slot0.state:ChangeState(slot0, function ()
							slot0.state:ChangeState(slot1.stateStand)
							slot1.stateStand()
						end)
					else
						slot0.state:ChangeState(slot2.stateStand)
						slot2.stateStand()
					end
				end)
			end

			if #slot1 <= 3 and not slot3 then
				slot0:Jump(slot1, slot2)
			else
				slot4(slot3)
			end
		end,
		Jump = function (slot0, slot1, slot2)
			slot2 = slot2 or function ()
				return
			end

			if #slot1 == 0 then
				slot2()

				return
			end

			slot3 = {}

			for slot7, slot8 in pairs(slot1) do
				table.insert(slot3, function (slot0)
					slot0.state:ChangeState(slot1.stateJump)
					slot0.onJump(slot0.state, function ()
						slot0.state:ChangeState(slot1.stateStand)
						slot1.stateStand()
					end)
				end)
			end

			seriesAsync(slot3, function ()
				if slot0:GetAction(slot1[#slot1]) then
					slot0.state:ChangeState(slot0, function ()
						slot0.state:ChangeState(slot1.stateStand)
						slot1.stateStand()
					end)
				else
					slot0.state:ChangeState(slot2.stateStand)
					slot2.stateStand()
				end
			end)
		end,
		Touch = function (slot0)
			if slot0.state:IsStandState() then
				slot0.state:ChangeState(slot0.stateTouch, function ()
					slot0.state:ChangeState(slot1.stateStand)
				end)
			end
		end,
		GetAction = function (slot0, slot1)
			if slot1.config.icon == "icon_1" then
				return slot0.stateEvent
			elseif slot2 == "icon_2" then
				return slot0.stateGold
			elseif slot2 == "icon_3" then
			elseif slot2 == "icon_4" then
				return slot0.stateEvent
			elseif slot2 == "icon_5" then
				return slot0.stateOil
			elseif slot2 == "icon_6" then
				return slot0.stateEvent
			end
		end,
		InitPos = function (slot0, slot1)
			slot0:ChangePos(slot1)
			slot0.state:ChangeState(slot0.stateStand)
		end,
		ChangePos = function (slot0, slot1)
			slot0.onUpdatePos(slot1)
		end,
		Dispose = function (slot0)
			slot0.onMove = nil
			slot0.onUpdatePos = nil
		end
	}
end

function slot10(slot0)
	return {
		id = slot0,
		config = slot0[slot0],
		ExistStory = function (slot0)
			return slot0.config.story and slot0.config.story ~= "0"
		end,
		isEmpty = function (slot0)
			return slot0.config.story == "0" and slot0.config.drop == 0 and #slot0.config.effect == 0
		end,
		Dispose = function (slot0)
			slot0.config = nil
		end
	}
end

function slot11(slot0)
	for slot5, slot6 in ipairs(slot1.all) do
		if not table.contains(slot1.events, slot6) then
			table.insert(slot1.events, slot2(slot6))
		end
	end

	function slot1.GetEvent(slot0, slot1)
		for slot5, slot6 in ipairs(slot0.events) do
			if slot6.id == slot1 then
				return slot6
			end
		end
	end

	function slot1.SetNext(slot0, slot1)
		slot0.next = slot1
	end

	function slot1.Dispose(slot0)
		for slot4, slot5 in ipairs(slot0.events) do
			slot5:Dispose()
		end
	end

	return slot1
end

function slot12(slot0, slot1)
	return {
		ROW = slot0,
		COLUMN = slot1 - 2,
		cellIds = slot0,
		path = {},
		char = nil,
		index = slot1,
		onCreateCell = function (slot0)
			return
		end,
		onCreateChar = function (slot0)
			return
		end,
		Init = function (slot0)
			slot1 = 0

			for slot5 = 0, slot0.ROW - 1, 1 do
				slot0:CeateCell({
					slot1,
					slot5
				}, 0)
			end

			slot1 = slot0.ROW - 1

			for slot5 = 1, slot0.COLUMN, 1 do
				slot0:CeateCell({
					slot5,
					slot1
				}, #slot0.path)
			end

			slot1 = slot0.COLUMN + 1

			for slot5 = slot0.ROW - 1, 0, -1 do
				slot0:CeateCell({
					slot1,
					slot5
				}, #slot0.path)
			end

			slot1 = 0
			slot2 = #slot0.path - 1

			for slot6 = slot0.COLUMN, 1, -1 do
				slot0:CeateCell({
					slot6,
					slot1
				}, slot2)
			end

			slot0:CreateChar(slot1)
		end,
		CreateChar = function (slot0, slot1)
			slot0.char = slot0(slot1)

			slot0.onCreateChar(slot0.char)
			slot0.char:InitPos(slot0:GetCell(slot0.index))
		end,
		CeateCell = function (slot0, slot1, slot2)
			slot4 = slot0({
				pos = slot1,
				index = #slot0.path + 1,
				id = slot0.cellIds[#slot0.path + 1],
				flag = slot2
			})

			if #slot0.path == 0 then
				slot4:SetNext(slot4)
			else
				slot0.path[slot3].SetNext(slot5, slot4)
				slot4:SetNext(slot0.path[1])
			end

			table.insert(slot0.path, slot4)
			slot0.onCreateCell(slot4)
		end,
		GetPath = function (slot0)
			return slot0.path
		end,
		GetChar = function (slot0)
			return slot0.char
		end,
		GetPathCell = function (slot0, slot1)
			return _.map(slot1, function (slot0)
				return slot0.path[slot0]
			end)
		end,
		UpdateCharPos = function (slot0, slot1, slot2, slot3)
			slot0.char:Move(slot0:GetPathCell(slot1), slot2, slot3)

			slot0.index = slot1[#slot1]
		end,
		GetCell = function (slot0, slot1)
			return slot0.path[slot1]
		end,
		GetPos = function (slot0)
			return slot0.index
		end,
		Dispose = function (slot0)
			for slot4, slot5 in ipairs(slot0.path) do
				slot5:Dispose()
			end

			slot0.char:Dispose()

			slot0.onCreateCell = nil
			slot0.onCreateChar = nil
		end
	}
end

function slot13(slot0, slot1)
	setAnchoredPosition(slot0, {
		_tf = slot0,
		_img = slot0:GetComponent(typeof(Image)),
		cell = slot1,
		interval = Vector2(0, 0),
		startPos = Vector2(0, 0),
		offset = Vector2(slot0.rect.width * 0.5 + 2.5, slot0.rect.height * 0.5 - 2),
		GetGenPos = function (slot0)
			return Vector3(slot0.startPos.x + slot0.cell.column * slot0.offset.x + slot0.cell.row * slot0.offset.x, slot0.startPos.y + slot0.cell.column * slot0.offset.y + slot0.cell.row * -slot0.offset.y, 0)
		end,
		UpdateStyle = function (slot0)
			slot0._img.sprite = GetSpriteFromAtlas("ui/monopolyui_atlas", slot0.cell.config.icon)

			slot0._img:SetNativeSize()
		end,
		Dispose = function (slot0)
			return
		end
	}:GetGenPos())
	()["_tf"]:SetSiblingIndex(slot1.flag)

	return 
end

function slot14(slot0, slot1)
	slot3 = slot0:GetChild(0)
	tf(slot3).localScale = Vector3(0.5, 0.5, 0.5)
	slot4 = GameObject("mouseChild")

	tf(slot4):SetParent(tf(slot3))

	tf(slot4).localPosition = Vector3.zero

	setParent(slot4, slot3)

	GetOrAddComponent(slot4, "Image").color = Color.New(0, 0, 0, 0)
	slot6 = slot4:GetComponent(typeof(RectTransform))
	slot6.sizeDelta = Vector2(3, 3)
	slot6.pivot = Vector2(0.5, 0)
	slot6.anchoredPosition = Vector2(0, 0)

	onButton(self, slot4, function ()
		slot0.char:Touch()
	end)

	return {
		_tf = slot0,
		WalkSpeed = 1,
		RunSpeed = 0.5,
		jumpSpeed = 0.5,
		char = slot1,
		SpineAnimUI = slot3:GetComponent("SpineAnimUI"),
		Action = function (slot0, slot1, slot2, slot3)
			_.each(slot1, function (slot0)
				table.insert(slot0, function (slot0)
					slot0:UpdateScale(slot0.UpdateScale)

					if slot0._tf.localPosition == slot0.UpdateScale:GetGenPos() then
						slot0()
					else
						LeanTween.moveLocal(go(slot0._tf), slot1, LeanTween.moveLocal):setOnComplete(System.Action(function ()
							slot0.preCellTF = slot1

							slot2()
						end))
					end
				end)
			end)
			seriesAsync({}, function ()
				if slot0 then
					slot0()
				end
			end)
		end,
		Move = function (slot0, slot1, slot2)
			if #slot1 > 3 then
				slot0:Action(slot1, slot2, slot0.RunSpeed)
			else
				slot0:Action(slot1, slot2, slot0.WalkSpeed)
			end
		end,
		Jump = function (slot0, slot1, slot2)
			slot0:Action({
				slot1
			}, function ()
				slot0()
				playSoundEffect(SFX_STEP_MONOPOLY)
			end, slot0.jumpSpeed)
		end,
		UpdatePos = function (slot0, slot1)
			slot0.preCellTF = slot1
			slot0._tf.localPosition = slot1:GetGenPos()
		end,
		UpdateScale = function (slot0, slot1)
			slot2 = 1
			slot0.preCellTF = slot0.preCellTF or slot1

			if slot0.preCellTF.cell.row < slot1.cell.row or slot0.preCellTF.cell.column < slot1.cell.column then
				slot2 = 1
			elseif slot1.cell.row < slot0.preCellTF.cell.row or slot1.cell.column < slot0.preCellTF.cell.column then
				slot2 = -1
			end

			slot0._tf.localScale = Vector3(slot2, 1, 1)
		end,
		ChangeAction = function (slot0, slot1, slot2)
			slot0.SpineAnimUI:SetActionCallBack(nil)
			slot0.SpineAnimUI:SetAction(slot1, 0)
			slot0.SpineAnimUI:SetActionCallBack(function (slot0)
				if slot0 == "finish" then
					slot0.SpineAnimUI:SetActionCallBack(nil)
					slot0.SpineAnimUI.SetActionCallBack()
				end
			end)
		end,
		Dispose = function (slot0)
			slot0.SpineAnimUI:SetActionCallBack(nil)

			slot0.char.onMove = nil

			if slot0.timer then
				slot0.timer:Stop()

				slot0.timer = nil
			end
		end
	}
end

function slot0.getUIName(slot0)
	return "MonopolyUI"
end

function slot0.preload(slot0, slot1)
	slot0.models = {}

	parallelAsync({
		function (slot0)
			LoadSpriteAsync("clutter/monopoly_bg", function (slot0)
				slot0.sprite = slot0

				slot0()
			end)
		end,
		function (slot0)
			PoolMgr.GetInstance():GetSpineChar(Ship.New({
				configId = slot0,
				skin_id = Ship.New
			}).getPrefab(slot1), true, function (slot0)
				slot0.models[slot1.configId] = slot0

				slot1.configId()
			end)
		end
	}, slot1)
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
	slot0.useCount = slot0.activity.data1_list[2]
	slot0.pos = slot0.activity.data2
	slot0.step = slot0.activity.data3
	slot0.effectId = slot0.activity.data4
	slot0.totalCnt = math.ceil((pg.TimeMgr.GetInstance():GetServerTime() - slot0.activity.data1) / 86400) * slot0.activity:getDataConfig("daily_time") + slot0.activity.data1_list[1]
	slot0.leftCount = slot0.totalCnt - slot0.useCount
	slot0.nextredPacketStep = slot1:getDataConfig("reward_time") - slot0.useCount % slot1.getDataConfig("reward_time")
	slot0.advanceTotalCnt = #slot1:getDataConfig("reward")
	slot0.isAdvanceRp = slot0.advanceTotalCnt - slot0.activity.data2_list[2] > 0
	slot0.leftAwardCnt = slot0.activity.data2_list[1] - slot6
	slot0.advanceRpCount = math.max(0, math.min(slot0.activity.data2_list[1], slot0.advanceTotalCnt) - slot6)
	slot0.commonRpCount = math.max(0, slot0.activity.data2_list[1] - slot0.advanceTotalCnt) - math.max(0, slot6 - slot0.advanceTotalCnt)
	slot0.leftDropShipCnt = 10 - (slot0.activity.data1_list[3] - 1)
end

function slot0.updateActivity(slot0, slot1)
	slot0:setActivity(slot1)
	slot0:updateLeftCount()
	slot0:updateNextRedPacketStep()
end

function slot0.init(slot0)
	slot0.mask = slot0._tf:GetComponent(typeof(Image))

	slot0:blockAllEvent(false)

	slot0.bg = slot0:findTF("bg")
	slot0.bg:GetComponent(typeof(Image)).sprite = slot0.sprite
	slot0.mapCellTpl = slot0:getTpl("mapCell", slot0.bg)
	slot0.mapContainer = slot0:findTF("mapContainer", slot0.bg)
	slot0.charTpl = slot0:getTpl("char", slot0.bg)
	slot0.startBtn = slot0:findTF("start", slot0.bg)
	slot0.valueImg = slot0:findTF("value", slot0.bg):GetComponent(typeof(Image))
	slot0.leftCountTF = slot0:findTF("leftcount", slot0.bg):GetComponent(typeof(Text))
	slot0.nextRedPacketStepTF = slot0:findTF("nextRpStep/Text", slot0.bg):GetComponent(typeof(Text))
	slot0.advanceRp = slot0:findTF("advance_rp/rp", slot0.bg)
	slot0.advanceRpAnim = slot0.advanceRp:GetComponent(typeof(Animator))
	slot0.commonRp = slot0:findTF("common_rp/rp", slot0.bg)
	slot0.commonAnim = slot0.commonRp:GetComponent(typeof(Animator))
	slot0.advanceRpCnt = slot0:findTF("advance_rp_text/Text", slot0.bg):GetComponent(typeof(Text))
	slot0.commonRpCnt = slot0:findTF("common_rp_text/Text", slot0.bg):GetComponent(typeof(Text))
	slot0.dropShipCnt = slot0:findTF("dropshipCnt", slot0.bg):GetComponent(typeof(Text))
	slot0.dropship_get = slot0:findTF("dropship_get", slot0.bg)
	slot0.anim = slot0:findTF("bg/anim")

	setActive(slot0.anim, false)

	slot0.helpTF = slot0:findTF("bg/help")
end

function slot0.updateNextRedPacketStep(slot0)
	setActive(slot0.advanceRp.parent, slot0.isAdvanceRp)
	setActive(slot0.commonRp.parent, not slot0.isAdvanceRp)

	slot0.nextRedPacketStepTF.text = slot0.nextredPacketStep
end

function slot0.updateLeftCount(slot0)
	slot0.leftCountTF.text = slot0.leftCount
	slot0.advanceRpCnt.text = slot0.advanceRpCount
	slot0.commonRpCnt.text = slot0.commonRpCount
	slot0.dropShipCnt.text = slot0.leftDropShipCnt

	setActive(go(slot0.dropShipCnt), slot0.leftDropShipCnt > 0)
	setActive(slot0.dropship_get, slot0.leftDropShipCnt <= 0)

	if slot0.isAdvanceRp then
		slot0.advanceRpAnim:SetInteger("count", math.max(0, slot0.advanceRpCount))
	else
		slot0.commonAnim:SetInteger("count", slot0.leftAwardCnt)
	end
end

function slot0.updateValue(slot0, slot1)
	if slot1 ~= 0 then
		slot0.valueImg.sprite = GetSpriteFromAtlas("ui/monopolyui_atlas", slot1)

		slot0.valueImg:SetNativeSize()
	end

	setActive(go(slot0.valueImg), slot1 ~= 0)
end

function slot0.didEnter(slot0)
	setActive(slot0.startBtn, slot0.leftCount > 0)
	slot0:updateLeftCount()
	slot0:updateValue(0)
	slot0:updateNextRedPacketStep()

	slot0.mapVO = slot0(setActive, slot0.pos)

	slot0:createMap(slot0.mapVO)
	slot0.mapVO:Init()
	slot0:checkState()
	onButton(slot0, slot0.startBtn, function ()
		if slot0.block then
			return
		end

		if slot0.leftCount <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_count_noenough"))

			return
		end

		slot0:startAction()
	end, SFX_PANEL)
	onButton(slot0, slot0.advanceRp, function ()
		if slot0.block then
			return
		end

		if slot0.leftAwardCnt > 0 then
			slot0:emit(MonopolyMediator.ON_AWARD, slot0.activity.id)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.commonRp, function ()
		if slot0.block then
			return
		end

		if slot0.leftAwardCnt > 0 then
			slot0:emit(MonopolyMediator.ON_AWARD, slot0.activity.id)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.helpTF, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_monopoly.tip
		})
	end, SFX_PANEL)
end

function slot0.blockAllEvent(slot0, slot1)
	slot0.mask.enabled = slot1
	slot0.block = slot1
end

function slot0.triggerEvent(slot0, slot1, slot2, slot3)
	slot5 = slot0.mapVO:GetCell(slot1).GetEvent(slot4, slot2)

	function slot6(slot0, slot1)
		if slot0 and slot0:ExistStory() then
			pg.StoryMgr.GetInstance():Play(slot0.config.story, slot1, true, true, true)
		else
			slot1()
		end
	end

	seriesAsync({
		function (slot0)
			slot0(slot0, slot0)
		end,
		function (slot0)
			slot1 = nil

			function ()
				if not slot0 or slot0:isEmpty() then
					slot1()

					return
				end

				slot2:emit(MonopolyMediator.ON_TRIGGER, slot2.activity.id, function (slot0, slot1)
					if not slot0 or #slot0 == 0 then
						slot0()

						return
					end

					slot1.mapVO:UpdateCharPos(slot0, function ()
						slot2 = #slot0.mapVO:GetCell(slot0).GetEvent(slot1, )

						slot1(slot1, slot5)
					end, true)
				end)
			end()
		end
	}, slot3)
end

function slot0.checkState(slot0)
	slot1 = {}

	slot0:blockAllEvent(true)

	if slot0:getStrory() then
		table.insert(slot1, function (slot0)
			pg.StoryMgr.GetInstance():Play(slot0, slot0)
		end)
	end

	if slot0.effectId ~= 0 then
		table.insert(slot1, function (slot0)
			slot0:triggerEvent(slot0.mapVO:GetPos(), slot0.effectId, slot0)
		end)
	end

	if slot0.step ~= 0 then
		table.insert(slot1, function (slot0)
			slot0:emit(MonopolyMediator.ON_MOVE, slot0.activity.id, function (slot0, slot1, slot2)
				if not slot1 or #slot1 == 0 then
					slot0()

					return
				end

				slot1.mapVO:UpdateCharPos(slot1, function ()
					#slot0:triggerEvent(slot0[#slot0], #slot0, )
				end)
			end)
		end)
	end

	seriesAsync(slot1, function ()
		slot0:blockAllEvent(false)
	end)
end

function slot0.startAction(slot0)
	slot1 = slot0.activity.id
	slot3 = 0

	table.insert(slot2, function (slot0)
		slot0:playerAnim(slot0)
	end)
	table.insert(slot2, function (slot0)
		slot0:emit(MonopolyMediator.ON_START, slot0.emit, function (slot0)
			slot1:updateValue(slot0)
			slot1()
		end)
	end)

	for slot7 = 1, 2, 1 do
		table.insert(slot2, function (slot0)
			if slot0 == 0 then
				slot0()

				return
			end

			slot1:emit(MonopolyMediator.ON_MOVE, slot1, function (slot0, slot1, slot2)
				if not slot1 or #slot1 == 0 then
					slot0()

					return
				end

				slot2.mapVO:UpdateCharPos(slot0, function ()
					#slot0:triggerEvent(slot0[#slot0], #slot0, )
				end)
			end)
		end)
	end

	table.insert(slot2, function (slot0)
		if slot0:getStrory() then
			pg.StoryMgr.GetInstance():Play(slot1, slot0)
		else
			slot0()
		end
	end)
	setActive(slot0.startBtn, false)
	slot0:blockAllEvent(true)
	seriesAsync(slot2, function ()
		slot0:updateValue(0)
		slot0.updateValue:blockAllEvent(false)
		slot0(slot0.startBtn, slot0.leftCount > 0)
	end)
end

function slot0.getStrory(slot0)
	slot1 = slot0.useCount

	if _.detect(slot0.activity:getDataConfig("story") or {}, function (slot0)
		return slot0[1] == slot0
	end) then
		return slot4[2]
	end

	return nil
end

function slot0.createMap(slot0, slot1)
	slot0.charCard = nil
	slot0.cellTFs = {}

	function slot1.onCreateCell(slot0)
		slot2 = slot1(slot1, slot0)

		slot2:UpdateStyle()

		slot0.cellTFs[slot0.index] = slot2
	end

	function slot1.onCreateChar(slot0)
		slot1 = cloneTplTo(slot0.charTpl, slot0.mapContainer)

		setParent(slot2, slot1)

		slot0.charCard = slot1(slot1, slot0)

		function slot0.onMove(slot0, slot1)
			slot0.charCard:Move(_.map(slot0, function (slot0)
				return slot0.cellTFs[slot0.index]
			end), slot1)
		end

		function slot0.onUpdatePos(slot0)
			slot0.charCard:UpdatePos(slot0.cellTFs[slot0.index])
		end

		function slot0.state.onActionUpdated(slot0, slot1)
			slot0.charCard:ChangeAction(slot0, slot1)
		end

		function slot0.onJump(slot0, slot1)
			slot0.charCard:Jump(slot0.cellTFs[slot0.index], slot1)
		end
	end
end

function slot0.playerAnim(slot0, slot1)
	setActive(slot0.anim, true)

	if slot0.timer then
		slot0.timer:Stop()
	end

	slot0.timer = Timer.New(function ()
		slot0()
		setActive(slot1.anim, false)
	end, 1.5, 1)

	slot0.timer:Start()
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.cellTFs) do
		slot5:Dispose()
	end

	slot0.charCard:Dispose()
	slot0.mapVO:Dispose()

	slot0.cellTFs = nil
	slot0.charCard = nil
	slot0.mapVO = nil

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

return slot0
