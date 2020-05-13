slot0 = class("XiefeierIdolMusicPage", import("...base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.masklist = slot0.bg:Find("maskList")
end

function slot0.OnDataSetting(slot0)
	slot0.HubID = slot0.activity:getConfig("config_id")

	print("self.HubID:" .. slot0.HubID)

	slot0.mgProxy = getProxy(MiniGameProxy)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	onButton(slot0, slot0.bg:Find("battle_btn"), function ()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 6)
	end, SFX_PANEL)
	onButton(slot0, slot0.bg:Find("get_btn"), function ()
		uv0:emit(ActivityMediator.MUSIC_GAME_OPERATOR, {
			hubid = uv0.HubID,
			cmd = MiniGameOPCommand.CMD_ULTIMATE,
			args1 = {}
		})
		setActive(uv0.bg:Find("get_btn"), false)
		setActive(uv0.bg:Find("battle_btn"), true)
		setActive(uv0.bg:Find("got_icon"), true)
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot0.hubData = slot0.mgProxy:GetHubByHubId(slot0.HubID)
	slot0.finish_times = slot0.hubData.usedtime
	slot0.all_times = slot0.hubData.usedtime + slot0.hubData.count

	for slot4 = 1, 7 do
		setActive(slot0.masklist:Find("mask" .. slot4 .. "/frame"), slot4 <= slot0.all_times)
		setActive(slot0.masklist:Find("mask" .. slot4 .. "/dot"), slot4 <= slot0.finish_times)
	end

	setActive(slot0.bg:Find("get_btn"), slot0.hubData:getConfig("reward_need") <= slot0.finish_times and slot0.hubData.ultimate == 0)
	setActive(slot0.bg:Find("battle_btn"), slot0.finish_times < slot0.hubData:getConfig("reward_need") or slot0.hubData.ultimate ~= 0)
	setActive(slot0.bg:Find("got_icon"), slot0.hubData.ultimate ~= 0)
end

function slot0.OnDestroy(slot0)
	clearImageSprite(slot0.bg)
end

return slot0
