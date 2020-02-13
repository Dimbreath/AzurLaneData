slot0 = class("LevelAmbushView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "LevelAmbushView"
end

function slot0.OnInit(slot0)
	slot0:InitData()
	slot0:InitUI()
	setActive(slot0._tf, true)
end

function slot0.InitData(slot0)
	slot0.chapter = slot0.contextData.chapterVO
	slot0.fleet = slot0.chapter.fleet
	slot0.template = pg.expedition_data_template[slot0.chapter:getChapterCell(slot0.fleet.line.row, slot0.fleet.line.column).attachmentId]
end

function slot0.InitUI(slot0)
	GetImageSpriteFromAtlasAsync("enemies/" .. slot0.template.icon, "", slot3)
	setText(slot2, slot0.template.level)
	setText(slot4, math.floor(slot0.chapter:getAmbushDodge(slot0.fleet) * 100) .. "%")
	onButton(slot0, slot5, function ()
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 0,
			type = ChapterConst.OpAmbush,
			id = slot0.fleet.id
		})
		slot0.emit:Destroy()
	end, SFX_UI_WEIGHANCHOR_ATTACK)
	onButton(slot0, slot6, function ()
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 1,
			type = ChapterConst.OpAmbush,
			id = slot0.fleet.id
		})
		slot0.emit:Destroy()
	end, SFX_UI_WEIGHANCHOR_AVOID)

	findTF(slot0._tf, "window").localScale = Vector3(1, 0, 1)

	LeanTween.scaleY(findTF(slot0._tf, "window").gameObject, 1, 0.3):setOnComplete(System.Action(slot0.onComplete))
end

function slot0.OnDestroy(slot0)
	return
end

function slot0.SetFuncOnComplete(slot0, slot1)
	slot0.onComplete = slot1
end

return slot0
