slot0 = class("GuildShowAssultShipPage", import(".GuildEventBasePage"))

function slot0.getUIName(slot0)
	return "GuildShowAssultShipPage"
end

function slot0.OnLoaded(slot0)
	slot0.scrollrect = slot0:findTF("frame/scrollrect"):GetComponent("LScrollRect")
	slot0.closeBtn = slot0:findTF("frame/close")
	slot0.progress = slot0:findTF("frame/progress"):GetComponent(typeof(Text))
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0.closeBtn, function ()
		uv0:Hide()
	end, SFX_PANEL)

	slot0.cards = {}

	function slot0.scrollrect.onInitItem(slot0)
		uv0:OnInitItem(slot0)
	end

	function slot0.scrollrect.onUpdateItem(slot0, slot1)
		uv0:OnUpdateItem(slot0, slot1)
	end
end

function slot0.OnInitItem(slot0, slot1)
	slot0.cards[slot1] = GuildBossAssultCard.New(slot1)
end

function slot0.OnUpdateItem(slot0, slot1, slot2)
	if not slot0.cards[slot2] then
		slot0:OnInitItem(slot2)

		slot3 = slot0.cards[slot2]
	end

	slot4 = slot0.displays[slot1 + 1]

	slot3:Flush(slot4.member, slot4.ship)

	slot5 = slot0.totalPageCnt
	slot0.progress.text = math.ceil((slot0.scrollrect.value + 0.001) * slot5) .. "/" .. slot5
end

function slot0.OnShow(slot0)
	slot0:emit(GuildEventMediator.ON_GET_ALL_ASSULT_FLEET, function ()
		uv0:InitList()
	end)
end

function slot0.InitList(slot0)
	slot0.displays = {}

	for slot7, slot8 in pairs(slot0.guild:GetMembers()) do
		if slot0.player.id ~= slot8.id then
			for slot14, slot15 in pairs(slot8:GetAssaultFleet():GetShipList()) do
				table.insert(slot0.displays, {
					ship = slot15,
					member = slot8
				})
			end
		end
	end

	slot0.totalPageCnt = math.ceil(#slot0.displays / 9)

	slot0.scrollrect:SetTotalCount(#slot0.displays)
end

function slot0.OnDestroy(slot0)
	uv0.super.OnDestroy(slot0)

	for slot4, slot5 in pairs(slot0.cards) do
		slot5:Dispose()
	end
end

return slot0
