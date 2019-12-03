slot0 = class("JavelinComicSkinPage", import(".TemplatePage.SkinTemplatePage"))
slot0.FADE_OUT_TIME = 1

slot0.OnInit = function (slot0)
	slot0.super.OnInit(slot0)

	slot0.helpBtn = slot0:findTF("HelpBtn", slot0.bg)

	onButton(slot0, slot0.helpBtn, function ()
		if pg.gametip.comic_help then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.comic_help.tip,
				weight = LayerWeightConst.TOP_LAYER
			})
		end
	end, SFX_PANEL)

	slot0.puzzle = slot0:findTF("Puzzle", slot0.bg)
	slot0.activityProxy = getProxy(ActivityProxy)
	slot0.chargeIDList = Clone(slot0.activityProxy:getActivityById(ActivityConst.JAVELIN_COMIC_PUZZLE_TASK).data1_list)
	slot0.puzzleIDList = Clone(pg.activity_template[ActivityConst.JAVELIN_COMIC_PUZZLE_TASK].config_data)

	slot0:checkAward()
end

slot0.OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot1 = slot0.activityProxy:getActivityById(ActivityConst.JAVELIN_COMIC_PUZZLE_TASK)
	slot0.animeChild = nil

	for slot5 = 1, #slot0.puzzleIDList, 1 do
		slot9 = nil

		slot0:updatePiece((not table.contains(slot1.data1_list, slot0.puzzleIDList[slot5]) and 0) or 1, slot0.puzzle:GetChild(slot5 - 1))

		if slot9 == 1 and not table.contains(slot0.chargeIDList, slot7) then
			table.insert(slot0.chargeIDList, slot7)

			slot0.animeChild = slot6
		end
	end

	if slot0.animeChild then
		if LeanTween.isTweening(slot0.animeChild) then
			LeanTween.cancel(go(slot0.animeChild), true)
		end

		LeanTween.alpha(slot0.animeChild, 1, slot0.FADE_OUT_TIME):setFrom(0):setOnComplete(System.Action(function ()
			slot0:checkAward()
		end))
	end

	slot2 = nil

	setText(slot0.dayTF, (#slot0.chargeIDList == #slot0.taskGroup and "<color=#00FF00><size=48>" .. #slot0.chargeIDList .. "</size></color><color=#00B8FF><size=28>     " .. #slot0.taskGroup .. "</size></color>") or "<color=#E75198><size=48>" .. #slot0.chargeIDList .. "</size></color><color=#00B8FF><size=28>     " .. #slot0.taskGroup .. "</size></color>")
end

slot0.OnDestroy = function (slot0)
	slot0.super.OnDestroy(slot0)

	if slot0.animeChild and LeanTween.isTweening(slot0.animeChild) then
		LeanTween.cancel(go(slot0.animeChild), true)
	end
end

slot0.updatePiece = function (slot0, slot1, slot2)
	setActive(slot2, slot1 == 1)
end

slot0.checkAward = function (slot0)
	if #slot0.activityProxy:getActivityById(ActivityConst.JAVELIN_COMIC_PUZZLE_TASK).data1_list == #slot0.puzzleIDList and slot1.data1 == 0 then
		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = ActivityConst.JAVELIN_COMIC_PUZZLE_TASK
		})
	end
end

return slot0
