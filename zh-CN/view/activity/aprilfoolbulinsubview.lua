slot0 = class("AprilFoolBulinSubView", import("view.base.BaseSubPanel"))

function slot0.Ctor(slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1)

	slot0.pieceID = slot2
end

function slot0.GetUIName(slot0)
	return "AprilFoolBulinSubView"
end

function slot0.OnInit(slot0)
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.APRILFOOL_DISCOVERY) or slot1:isEnd() then
		slot0:Destroy()

		return
	end

	slot2 = pg.activity_event_picturepuzzle[slot1.id]
	slot0.bulin = slot0:findTF("bulin")

	onButton(slot0, slot0.bulin, function ()
		pg.m02:sendNotification(GAME.PUZZLE_PIECE_OP, {
			cmd = 2,
			actId = slot1.id,
			id = slot0.pieceID,
			callback = function ()
				slot0.pickup_picturepuzzle:emit(BaseUI.ON_ACHIEVE, {
					{
						type = slot0.awards[table.indexof(slot0.pickup_picturepuzzle, table.indexof)][1],
						id = slot0.awards[table.indexof(slot0.pickup_picturepuzzle, table.indexof)][2],
						count = slot0.awards[table.indexof(slot0.pickup_picturepuzzle, table.indexof)][3]
					}
				})
				slot0.pickup_picturepuzzle:Destroy()
			end
		})
	end)
end

function slot0.SetPosition(slot0, slot1)
	setAnchoredPosition(slot0._tf, slot1)
end

function slot0.SetParent(slot0, slot1)
	setParent(slot0._tf, slot1)
end

function slot0.ShowAprilFoolBulin(slot0, slot1, slot2)
	if not getProxy(ActivityProxy):getActivityById(ActivityConst.APRILFOOL_DISCOVERY) or slot3:isEnd() or table.contains(slot3.data2_list, slot1) then
		return
	end

	slot0:New(slot1):Load()

	if slot2 then
		slot4.buffer:SetParent(slot2)
	end

	return slot4
end

return slot0
