slot0 = class("GuildRequestLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "GuildRequestUI"
end

function slot0.setRequest(slot0, slot1)
	slot0.requestVOs = slot1
end

function slot0.init(slot0)
	slot0.viewRect = slot0:findTF("request_panel/view")
	slot0.listEmptyTF = slot0:findTF("main/frame/empty")
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_guildrequestui"))
end

function slot0.didEnter(slot0)
end

function slot0.initRequests(slot0)
	slot0.isInit = true
	slot0.scrollRect = slot0.viewRect:GetComponent("LScrollRect")

	function slot0.scrollRect.onInitItem(slot0)
		uv0:onInitItem(slot0)
	end

	function slot0.scrollRect.onUpdateItem(slot0, slot1)
		uv0:onUpdateItem(slot0, slot1)
	end

	slot0.requestCards = {}

	slot0:sortRequest()
end

function slot0.createRequestCard(slot0, slot1)
	slot2 = {
		go = slot1,
		tf = tf(slot1),
		nameTF = slot2.tf:Find("frame/request_info/name"):GetComponent(typeof(Text)),
		levelTF = slot2.tf:Find("frame/request_info/level"):GetComponent(typeof(Text)),
		dateTF = slot2.tf:Find("frame/request_info/date"):GetComponent(typeof(Text)),
		msg = slot2.tf:Find("frame/request_content/Text"):GetComponent(typeof(Text)),
		iconTF = slot2.tf:Find("frame/shipicon/icon"):GetComponent(typeof(Image)),
		starsTF = slot2.tf:Find("frame/shipicon/stars"),
		circle = slot2.tf:Find("frame/shipicon/frame"),
		starTF = slot2.tf:Find("frame/shipicon/stars/star"),
		rejectBtn = slot2.tf:Find("frame/refuse_btn"),
		accpetBtn = slot2.tf:Find("frame/accpet_btn"),
		update = function (slot0, slot1)
			slot0:clear()

			slot0.requestVO = slot1
			uv0.nameTF.text = slot1.player.name
			uv0.levelTF.text = "Lv." .. slot1.player.level
			uv0.dateTF.text = getOfflineTimeStamp(slot1.timestamp)
			uv0.msg.text = slot1.content
			slot3 = slot1.player
			slot4 = AttireFrame.attireFrameRes(slot3, false, AttireConst.TYPE_ICON_FRAME, slot3.propose)

			PoolMgr.GetInstance():GetPrefab("IconFrame/" .. slot4, slot4, true, function (slot0)
				if IsNil(uv0.tf) then
					return
				end

				if uv0.circle then
					slot0.name = uv1
					findTF(slot0.transform, "icon"):GetComponent(typeof(Image)).raycastTarget = false

					setParent(slot0, uv0.circle, false)
				else
					PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. uv1, uv1, slot0)
				end
			end)

			if pg.ship_data_statistics[slot1.player.icon] then
				LoadSpriteAsync("qicon/" .. slot1.player:getPainting(), function (slot0)
					uv0.iconTF.sprite = slot0
				end)

				for slot11 = slot0.starsTF.childCount, slot5.star - 1, 1 do
					cloneTplTo(slot0.starTF, slot0.starsTF)
				end

				for slot11 = 1, slot7, 1 do
					setActive(slot0.starsTF:GetChild(slot11 - 1), slot11 <= slot5.star)
				end
			end
		end,
		clear = function (slot0)
			if slot0.circle.childCount > 0 then
				slot1 = slot0.circle:GetChild(0)
				slot2 = slot1.gameObject.name

				PoolMgr.GetInstance():ReturnPrefab("IconFrame/" .. slot2, slot2, slot1.gameObject)
			end
		end,
		dispose = function (slot0)
			slot0:clear()
		end
	}

	return slot2
end

function slot0.onInitItem(slot0, slot1)
	slot2 = slot0:createRequestCard(slot1)

	onButton(slot0, slot2.accpetBtn, function ()
		uv0:emit(GuildRequestMediator.ACCPET, uv1.requestVO.player.id)
	end, SFX_PANEL)
	onButton(slot0, slot2.rejectBtn, function ()
		uv0:emit(GuildRequestMediator.REJECT, uv1.requestVO.player.id)
	end, SFX_PANEL)

	slot0.requestCards[slot1] = slot2
end

function slot0.onUpdateItem(slot0, slot1, slot2)
	if not slot0.requestCards[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.requestCards[slot2]
	end

	slot3:update(slot0.requestVOs[slot1 + 1])
end

function slot0.sortRequest(slot0)
	table.sort(slot0.requestVOs, function (slot0, slot1)
		return slot0.timestamp < slot1.timestamp
	end)
	slot0.scrollRect:SetTotalCount(#slot0.requestVOs, 0)
	setActive(slot0.listEmptyTF, #slot0.requestVOs <= 0)
end

function slot0.addRequest(slot0, slot1)
	table.insert(slot0.requestVOs, slot1)
	slot0:sortRequest()
end

function slot0.deleteRequest(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.requestVOs) do
		if slot6.player.id == slot1 then
			table.remove(slot0.requestVOs, slot5)

			break
		end
	end

	slot0:sortRequest()
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	slot0:emit(uv0.ON_BACK)
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.requestCards) do
		slot5:dispose()
	end
end

return slot0
