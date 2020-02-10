slot0 = class("InstagramComment", import("..BaseVO"))

function slot0.Ctor(slot0, slot1, slot2, slot3)
	slot0.time = slot1.time
	slot0.text = slot1.text
	slot0.instagram = slot2
	slot0.parentComment = slot3
	slot0.id = slot1.id
	slot0.isRoot = false

	if not slot0.parentComment then
		slot0.isRoot = true
	end

	slot0.allReply = slot2:GetAllReply()
	slot0.replyList = {}
end

function slot0.GetLasterUpdateTime(slot0)
	slot1 = {}

	function (slot0)
		if slot0 <= pg.TimeMgr.GetInstance():GetServerTime() then
			table.insert(uv0, slot0)
		end
	end(slot0.time)

	for slot6, slot7 in pairs(slot0.replyList) do
		slot2(slot7.time)
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1 < slot0
	end)

	return slot1[1] or 0
end

function slot0.GetName(slot0)
end

function slot0.GetPainting(slot0)
end

function slot0.GetType(slot0)
end

function slot0.GetFasterRefreshTime(slot0)
	if slot0:ShouldWaitForShow() then
		table.insert({}, slot0.time)
	end

	for slot5, slot6 in ipairs(slot0.replyList) do
		if slot6:ShouldWaitForShow() then
			table.insert(slot1, slot6.time)
		end
	end

	if #slot1 > 0 then
		table.sort(slot1, function (slot0, slot1)
			return slot0 < slot1
		end)

		return slot1[1]
	end
end

function slot0.AnyReplyTimeOut(slot0)
	return _.any(slot0.replyList, function (slot0)
		return slot0:TimeOutAndTxtIsEmpty()
	end) or slot0:TimeOutAndTxtIsEmpty()
end

function slot0.TimeOutAndTxtIsEmpty(slot0)
	return slot0.time <= pg.TimeMgr.GetInstance():GetServerTime() and slot0.text == ""
end

function slot0.ShouldWaitForShow(slot0)
	return pg.TimeMgr.GetInstance():GetServerTime() < slot0.time or slot0:TimeOutAndTxtIsEmpty()
end

function slot0.GetReplyTimeOffset(slot0)
	return slot0.time - pg.TimeMgr.GetInstance():GetServerTime()
end

function slot0.GetReplyList(slot0)
	return slot0.replyList
end

function slot0.GetCanDisplayReply(slot0)
	for slot6, slot7 in ipairs(slot0.replyList) do
		if not slot7:ShouldWaitForShow() then
			table.insert({}, slot7)

			slot2 = 0 + 1
		end
	end

	return slot1, slot2
end

function slot0.GetParentCommentName(slot0)
	return slot0.parentComment:GetName()
end

function slot0.HasReply(slot0)
	return _.any(slot0.replyList, function (slot0)
		return not slot0:ShouldWaitForShow()
	end) and #slot0.replyList > 0
end

function slot0.GetContent(slot0)
	if slot0.isRoot then
		return string.format("<color=#000000FF>%s.</color>%s", slot0:GetName(), slot0.text)
	else
		slot2 = slot0:GetParentCommentName()

		return string.format("<color=#000000FF>%s.</color>%s", slot1, slot0.text)
	end
end

function slot0.GetReplyCnt(slot0)
	for slot5, slot6 in ipairs(slot0.replyList) do
		if not slot6:ShouldWaitForShow() then
			slot1 = 0 + 1
		end
	end

	return slot1
end

function slot0.GetTime(slot0)
	return InstagramReplyTimeStamp(slot0.time) .. " reply"
end

function slot0.GetIcon(slot0)
	return slot0:GetPainting()
end

function slot0.GetReplyBtnTxt(slot0)
	return "reply"
end

return slot0
