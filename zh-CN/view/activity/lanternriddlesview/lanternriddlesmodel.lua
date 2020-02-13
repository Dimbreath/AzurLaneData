slot0 = class("LanternRiddlesModel")
slot1 = pg.activity_event_question

function slot0.Ctor(slot0, slot1)
	slot0.controller = slot1
end

function slot0.Init(slot0)
	slot0.questiones = {}

	for slot4, slot5 in ipairs(slot0.all) do
		table.insert(slot0.questiones, slot0:WrapQuestion(slot6, slot7))
	end
end

function slot0.WrapQuestion(slot0, slot1, slot2)
	shuffle(slot3)
	table.insert(slot3, slot4, {
		slot1.answer_right,
		false
	})

	return {
		id = slot1.id,
		type = slot1.type,
		rightIndex = slot4,
		answers = slot3,
		text = slot1.question,
		nextTime = slot2 or 0,
		waitTime = slot1.wrong_time,
		isFinish = slot0:IsFinishQuestion(slot1.id),
		isUnlock = slot0.unlockCount > 0 or slot0.IsFinishQuestion(slot1.id)
	}
end

function slot0.IsFinishQuestion(slot0, slot1)
	return table.contains(slot0.finishList, slot1)
end

function slot0.GetNextTime(slot0, slot1)
	return slot0.nextTimes[slot1] or 0
end

function slot0.SetNextTime(slot0, slot1)
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.questiones) do
		if slot7.id == slot1 then
			slot7.nextTime = pg.TimeMgr.GetInstance():GetServerTime() + slot7.waitTime
			slot2 = slot7.waitTime

			break
		end
	end

	slot0.lockTime = pg.TimeMgr.GetInstance():GetServerTime() + slot2
end

function slot0.GetLockTime(slot0)
	return slot0.lockTime
end

function slot0.GetAnswerFlag(slot0, slot1, slot2)
	slot3 = getProxy(PlayerProxy):getRawData().id

	function slot4(slot0, slot1)
		return PlayerPrefs.GetInt(slot0 .. "_" .. slot1 .. "_" .. slot0, 0) > 0
	end

	return _.map(slot2, function (slot0)
		return {
			slot0[1],
			slot0(slot0, slot0[1])
		}
	end)
end

function slot0.SetAnswerFlag(slot0, slot1, slot2)
	PlayerPrefs.SetInt(slot1 .. "_" .. slot2 .. "_" .. getProxy(PlayerProxy):getRawData().id, 1)
	PlayerPrefs.Save()

	for slot7, slot8 in ipairs(slot0.questiones) do
		if slot8.id == slot1 then
			for slot12, slot13 in ipairs(slot8.answers) do
				if slot13[1] == slot2 then
					slot13[2] = true

					break
				end
			end
		end
	end
end

function slot0.UpdateWrongAnswerFlag(slot0, slot1, slot2)
	slot0:SetAnswerFlag(slot1, _.detect(slot0.questiones, function (slot0)
		return slot0.id == slot0
	end).answers[slot2][1])
	slot0:SetNextTime(slot1)
end

function slot0.UpdateRightAnswerFlag(slot0, slot1)
	if not table.contains(slot0.finishList, slot1) then
		table.insert(slot0.finishList, slot1)

		slot0.finishCount = slot0.finishCount + 1
	end

	slot0:GetQuestion(slot1).isFinish = true
	slot0.unlockCount = slot0.unlockCount - 1

	if slot0.unlockCount <= 0 then
		for slot6, slot7 in ipairs(slot0.questiones) do
			if not slot7.isFinish then
				slot7.isUnlock = false
			end
		end
	end
end

function slot0.UpdateData(slot0, slot1)
	slot0.finishCount = slot1.finishCount or 0
	slot0.unlockCount = slot1.unlockCount or 0
	slot0.nextTimes = slot1.nextTimes
	slot0.finishList = slot1.finishList
	slot0.lockTime = slot0.nextTimes[#slot0.nextTimes]

	slot0:Init()
end

function slot0.IsRight(slot0, slot1, slot2)
	return _.any(slot0.questiones, function (slot0)
		return slot0 == slot0.id and slot0.rightIndex == 
	end)
end

function slot0.GetQuestiones(slot0)
	return slot0.questiones
end

function slot0.GetQuestion(slot0, slot1)
	return _.detect(slot0.questiones, function (slot0)
		return slot0.id == slot0
	end)
end

function slot0.Dispose(slot0)
	return
end

return slot0
