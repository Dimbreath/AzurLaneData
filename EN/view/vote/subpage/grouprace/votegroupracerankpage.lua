slot0 = class("VoteGroupRaceRankPage", import("....base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "GroupRaceRank"
end

slot0.OnInit = function (slot0)
	slot0.title1 = slot0:findTF("stages/title1")
	slot0.title2 = slot0:findTF("stages/title2")
	slot0.uilist = UIItemList.New(slot0:findTF("scrollrect/content"), slot0:findTF("scrollrect/content/tpl"))
	slot0.webBtn = slot0:findTF("web")

	onButton(slot0, slot0.webBtn, function ()
		if slot0.phase == VoteGroup.DISPLAY_STAGE then
			Application.OpenURL(pg.gameset.vote_web_url.description)
		else
			slot0:emit(VoteMediator.ON_WEB)
		end
	end, SFX_PANEL)
	setActive(slot0._tf, true)
end

slot0.Update = function (slot0, slot1)
	slot0.voteGroup = slot1
	slot0.phase = slot1:GetStage()

	setActive(slot0.title1, slot0.phase == VoteGroup.VOTE_STAGE or slot0.phase == VoteGroup.STTLEMENT_STAGE)
	setActive(slot0.title2, slot0.phase == VoteGroup.DISPLAY_STAGE)
	slot0:UpdateList()
end

slot0.UpdateList = function (slot0)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("number"), slot1 + 1)
			setText(slot2:Find("name"), shortenString(slot0[slot1 + 1].getShipName(slot3), 6))
			setText(slot2:Find("Text"), slot1.voteGroup:GetVotes(slot0[slot1 + 1]))
		end
	end)
	slot0.uilist:align(#slot0.voteGroup:getList())
end

slot0.OnDestroy = function (slot0)
	return
end

return slot0
