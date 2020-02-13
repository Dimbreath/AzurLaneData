slot0 = class("VoteFameHallLayer", import("..base.BaseUI"))
slot0.configs = {
	{
		"RENQIQIYE",
		31017
	},
	{
		"RENQIBEIERFASITE",
		31018
	},
	{
		"RENQIXILI",
		31019
	}
}

function slot0.getUIName(slot0)
	return "VoteFameHallUI"
end

function slot0.init(slot0)
	slot0.btns = {
		slot0:findTF("bg/qy"),
		slot0:findTF("bg/befst"),
		slot0:findTF("bg/xl")
	}
	slot0.tips = {
		slot0:findTF("bg/qy/title/tip"),
		slot0:findTF("bg/befst/title/tip"),
		slot0:findTF("bg/xl/title/tip")
	}
	slot0.tip = slot0:findTF("Text"):GetComponent(typeof(Text))
	slot0.backBtn = slot0:findTF("back")
end

function slot0.didEnter(slot0)
	for slot4, slot5 in ipairs(slot0.btns) do
		slot6 = slot0.configs[slot4][1]
		slot7 = slot0.configs[slot4][2]

		onButton(slot0, slot5, function ()
			slot0:GetAward(slot0, )
		end, SFX_PANEL)
	end

	slot0:updateTips()
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SFX_PANEL)
end

function slot0.updateTips(slot0)
	slot1 = getProxy(AttireProxy)
	slot2 = {
		false,
		false,
		false
	}

	for slot6, slot7 in ipairs(slot0.tips) do
		slot8 = slot0.configs[slot6][1]

		setActive(slot7, (getProxy(TaskProxy):getTaskById(slot0.configs[slot6][2]) or slot10:getFinishTaskById(slot9)) and getProxy(TaskProxy).getTaskById(slot0.configs[slot6][2]) or slot10.getFinishTaskById(slot9):isFinish() and not getProxy(TaskProxy).getTaskById(slot0.configs[slot6][2]) or slot10.getFinishTaskById(slot9):isReceive())

		slot2[slot6] = slot1:getAttireFrame(AttireConst.TYPE_ICON_FRAME, pg.task_data_template[slot9].award_display[1][2]) ~= nil and slot7:isOwned()
	end

	slot3 = _.map(slot2, function (slot0)
		return (slot0 and "(<color=#92fc63>" .. i18n("word_got") .. "</color>)") or ""
	end)
	slot0.tip.text = i18n("vote_fame_tip", slot3[1], slot3[2], slot3[3])
end

function slot0.GetAward(slot0, slot1, slot2)
	seriesAsync({
		function (slot0)
			pg.StoryMgr.GetInstance():Play(slot0, slot0, true)
		end,
		function (slot0)
			if (getProxy(TaskProxy):getTaskById(slot0) or slot1:getFinishTaskById(slot0)) and slot2:isFinish() and not slot2:isReceive() then
				slot1:emit(VoteFameHallMediator.ON_SUBMIT_TASK, slot2.id)
			end

			slot0()
		end
	})
end

function slot0.willExit(slot0)
	return
end

return slot0
