slot0 = class("FurnitureDescWindow")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0.descPanel = tf(slot1)
	slot0.maxFrame = findTF(slot0.descPanel, "max_panel")
	slot0.maxPanel = findTF(slot0.maxFrame, "max")
	slot0.maxIcon = findTF(slot0.maxPanel, "desc/iconframe/icon"):GetComponent(typeof(Image))
	slot0.maxName = findTF(slot0.maxPanel, "desc/Text"):GetComponent(typeof(Text))
	slot0.maxType = findTF(slot0.maxPanel, "desc/container/frame/type"):GetComponent(typeof(Text))
	slot0.maxContent = findTF(slot0.maxPanel, "desc/container/frame/content"):GetComponent(typeof(Text))
	slot0.maxComfortable = findTF(slot0.maxPanel, "desc/container/frame/comfortable_container/Text"):GetComponent(typeof(Text))
	slot0.maxApproach = findTF(slot0.maxPanel, "desc/container/frame/approach_container/Text"):GetComponent(typeof(Text))
	slot0.maxdate = findTF(slot0.maxPanel, "desc/container/frame/date_container/Text"):GetComponent(typeof(Text))
	slot0.descPanelParent = slot0.descPanel.parent
	slot0.descPanelVoiceBtn = findTF(slot0.maxPanel, "desc/container/frame/voice")
	slot0.descPanelBgVoiceBtn = findTF(slot0.maxPanel, "desc/container/frame/bg_voice")

	slot0:Init()
end

function slot0.Init(slot0)
	onButton(slot0, slot0.descPanel, function ()
		uv0:Close()
	end, SFX_PANEL)
	onButton(slot0, slot0.maxFrame, function ()
		uv0:Close()
	end, SFX_PANEL)
	onButton(slot0, slot0.maxPanel:Find("ok_btn"), function ()
		uv0:Close()
	end, SFX_PANEL)
end

function slot0.Show(slot0, slot1, slot2)
	slot0.furnitureVO = slot1
	slot4 = slot1:descVoiceType()

	setActive(slot0.descPanelVoiceBtn, slot1:existVoice() and slot4 == BackYardConst.SOUND_TYPE_EFFECT)
	setActive(slot0.descPanelBgVoiceBtn, slot3 and slot4 == BackYardConst.SOUND_TYPE_BG)
	setActive(slot0.descPanel, true)
	SetActive(slot0.maxFrame, false)

	if slot3 and slot4 == BackYardConst.SOUND_TYPE_EFFECT then
		onButton(slot0, slot0.descPanelVoiceBtn, function ()
			uv0:playFurnitureVoice(uv1)

			if uv2 then
				uv2(true)
			end
		end, SFX_PANEL)
	elseif slot3 and slot4 == BackYardConst.SOUND_TYPE_BG then
		onToggle(slot0, slot0.descPanelBgVoiceBtn, function (slot0)
			if slot0 then
				playBGM(uv0:getVoice() or "backyard")

				if uv1 then
					uv1(slot0)
				end
			end
		end, SFX_PANEL)
	end

	LoadSpriteAsync("FurnitureIcon/" .. slot1:getConfig("icon"), function (slot0)
		if not uv0.exited then
			uv0.maxIcon.sprite = slot0
		end
	end)
	setActive(slot0.maxFrame, true)

	slot0.maxName.text = shortenString(slot1:getConfig("name"), 6)
	slot0.maxdate.text = slot1:getDate()
	slot0.maxComfortable.text = "+" .. slot1:getConfig("comfortable")
	slot0.maxContent.text = slot1:getConfig("describe")
	slot0.maxApproach.text = slot1:getGainby()
	slot0.maxType.text = slot1:getChineseType()

	pg.UIMgr.GetInstance():BlurPanel(slot0.maxFrame)
end

function slot0.Close(slot0)
	slot0:stopCV()
	setActive(slot0.descPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.maxFrame, slot0.descPanel)
end

function slot0.playFurnitureVoice(slot0)
	slot2 = slot0.furnitureVO:getVoice()

	if slot0.loadedBank then
		function ()
			uv0:stopCV()

			uv0.currVoice = playSoundEffect(uv1)
		end()
	else
		pg.CriMgr.GetInstance():LoadCV("furniture", function ()
			if uv1.exited then
				pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv0))
			else
				uv2()

				if uv1.currVoice then
					uv1.loadedBank = slot0
				end
			end
		end)
	end
end

function slot0.stopCV(slot0)
	if slot0.currVoice then
		slot0.currVoice:Stop(true)
	end

	slot0.currVoice = nil
end

function slot0.Destroy(slot0)
	slot0.exited = true

	slot0:Close()
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
