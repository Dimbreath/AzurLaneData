slot0 = class("SNPTPage", import(".TemplatePage.PtTemplatePage"))

function slot0.OnFirstFlush(slot0)
	slot0.super.OnFirstFlush(slot0)

	slot0.gameBtn = slot0:findTF("game_btn", slot0.bg)

	onButton(slot0, slot0.gameBtn, function ()
		pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
			type = MiniGameRequestCommand.REQUEST_HUB_DATA,
			callback = function ()
				pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)
			end
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot0.super.OnUpdateFlush(slot0)

	slot1, slot2, slot3 = slot0.ptData:GetResProgress()

	setText(slot0.progress, ((slot3 >= 1 and setColorStr(slot1, "#0A79FFFF")) or slot1) .. "/" .. slot2)
end

return slot0
