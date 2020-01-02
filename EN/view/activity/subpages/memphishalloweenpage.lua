class("MemphisHalloweenPage", import(".TemplatePage.PtTemplatePage")).OnFirstFlush = function (slot0)
	slot0.super.OnFirstFlush(slot0)
	onButton(slot0, slot0.battleBtn, function ()
		slot0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
end

return class("MemphisHalloweenPage", import(".TemplatePage.PtTemplatePage"))
