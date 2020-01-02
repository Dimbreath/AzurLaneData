slot0 = class("AvroraTWCBTPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.get = slot0:findTF("get", slot0.bg)
	slot0.go = slot0:findTF("go", slot0.bg)
end

function slot0.OnFirstFlush(slot0)
	onButton(slot0, slot0.go, function ()
		slot0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
	setActive(slot0.go, not getProxy(ChapterProxy).isClear(slot1, 304))
	setActive(slot0.get, getProxy(ChapterProxy).isClear(slot1, 304))
end

return slot0
