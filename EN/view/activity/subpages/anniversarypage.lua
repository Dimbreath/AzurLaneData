slot0 = class("AnniversaryPage", import("...base.BaseActivityPage"))

slot0.OnInit = function (slot0)
	slot0.btnShop = slot0:findTF("BtnShop")
	slot0.charListTF = slot0:findTF("list")
	slot0.charTF = slot0:findTF("Image", slot0.charListTF)

	slot0:scrollAnim()
end

slot0.OnFirstFlush = function (slot0)
	onButton(slot0, slot0.btnShop, function ()
		slot0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end, SFX_PANEL)
end

slot0.scrollAnim = function (slot0)
	slot0._tf:GetComponent(typeof(DftAniEvent)):SetTriggerEvent(function (slot0)
		slot0.charListTF:GetChild(0):SetAsLastSibling()

		slot1 = 0

		eachChild(slot0.charListTF, function (slot0)
			slot1(slot0.charListTF:GetChild(setActive), setActive ~= 6)

			slot1 = slot1 + 1
		end)
		slot0.charTF:SetSiblingIndex(6)
	end)
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
