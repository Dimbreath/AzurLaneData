pg = pg or {}
slot0 = pg
slot0.CriMgr = singletonClass("CriMgr")
slot1 = slot0.CriMgr
slot1.Category_CV = "Category_CV"
slot1.Category_BGM = "Category_BGM"
slot1.Category_SE = "Category_SE"

function slot1.Init(slot0, slot1)
	print("initializing cri manager...")
	seriesAsync({
		function (slot0)
			uv0:InitCri(slot0)
		end,
		function (slot0)
			uv0:LoadCueSheet("se-ui", slot0)

			uv0.seuiPlayer.cueSheet = "se-ui"
		end,
		function (slot0)
			uv0:LoadCueSheet("se-battle", slot0)

			uv0.sebattlePlayer.cueSheet = "se-battle"
		end
	}, slot1)
end

function slot1.InitCri(slot0, slot1)
	WWWLoader.Inst:LoadFile("cue/sound.f", function (slot0)
		GCHandle.Alloc(slot0, GCHandleType.Pinned)

		uv0.acf = slot0
		slot1 = GameObject.Find("CRIWARE")
		uv0.criErrorHandler = slot1:GetComponent(typeof(CriWareErrorHandler))
		uv0.criErrorHandler.enabled = true
		uv0.criInitializer = slot1:GetComponent(typeof(CriWareInitializer))
		uv0.criInitializer.fileSystemConfig.numberOfLoaders = 255
		uv0.criInitializer.manaConfig.numberOfDecoders = 255

		uv0.criInitializer:Initialize()

		uv0.criAtom = slot1:GetComponent(typeof(CriAtom))
		uv0.criAtom.enabled = true

		CriAtomEx.RegisterAcf(uv0.acf)
		_.each({
			"bgm",
			"cv",
			"story",
			"seui",
			"sebattle"
		}, function (slot0)
			slot1 = GameObject.New(slot0)

			slot1.transform:SetParent(uv0.transform, false)

			uv1[slot0 .. "Player"] = slot1:AddComponent(typeof(CriAtomSource))
		end)
		CriAtom.SetCategoryVolume(uv1.Category_CV, uv0:getCVVolume())
		CriAtom.SetCategoryVolume(uv1.Category_SE, uv0:getSEVolume())
		CriAtom.SetCategoryVolume(uv1.Category_BGM, uv0:getBGMVolume())
		uv2()
	end)
end

function slot1.Play(slot0, slot1, slot2, slot3)
	if CriAtom.GetCueSheet(slot2) and slot4.acb then
		slot5, slot6 = slot4.acb:GetCueInfo(slot3, nil)

		if slot5 and slot6 then
			slot1.cueSheet = slot2

			return slot1:Play(slot3), slot6
		end
	end
end

function slot1.PlaySE(slot0, slot1)
	if CriAtom.GetCueSheet(slot0.seuiPlayer.cueSheet) and slot2.acb and slot2.acb:Exists(slot1) then
		return slot0:Play(slot0.seuiPlayer, slot0.seuiPlayer.cueSheet, slot1)
	end

	if CriAtom.GetCueSheet(slot0.sebattlePlayer.cueSheet) and slot3.acb and slot3.acb:Exists(slot1) then
		return slot0:Play(slot0.sebattlePlayer, slot0.sebattlePlayer.cueSheet, slot1)
	end
end

function slot1.PlayCV(slot0, slot1, slot2)
	return slot0:Play(slot0.cvPlayer, slot1, slot2)
end

function slot1.StopCV(slot0)
	print("CV track --> StopCV")

	slot0.onStopCV = true

	slot0.cvPlayer:Stop()
end

function slot1.StopSEUI(slot0)
	slot0.seuiPlayer:Stop()
end

function slot1.StopSEBattle(slot0)
	slot0.sebattlePlayer:Stop()
end

function slot1.ResumeCV(slot0)
	print("CV track --> ResumeCV")

	slot0.onStopCV = false
end

function slot1.setStoryBGM(slot0, slot1)
	slot0.storyBGMName = slot1
end

function slot1.setNormalBGM(slot0, slot1)
	slot0.normalBGMName = slot1
end

function slot1.resumeNormalBGM(slot0)
	if slot0.normalBGMName then
		slot0:PlayBGM(slot0.normalBGMName)
	end
end

function slot1.resumeStoryBGM(slot0)
	if slot0.storyBGMName then
		slot0:PlayBGM(slot0.storyBGMName)
	end
end

function slot1.PlayBGM(slot0, slot1, slot2)
	if not slot2 then
		slot0:setNormalBGM(slot1)
	else
		slot0:setStoryBGM(slot1)
	end

	if slot0.bgmName == "bgm-" .. slot1 then
		return
	end

	slot0:stopBGM()

	slot0.bgmName = slot3

	slot0:LoadCueSheet(slot3, function ()
		uv0.bgmPlayer.loop = true
		uv0.bgmPlayer.cueSheet = uv1

		uv0.bgmPlayer:Play(0)
	end)
end

function slot1.stopBGM(slot0)
	if slot0.bgmPlayer.status ~= CriAtomSource.Status.Stop then
		slot0.bgmPlayer:Stop()
	end

	if slot0.bgmName then
		slot0:UnloadCueSheet(slot0.bgmName)

		slot0.bgmName = nil
	end
end

function slot1.playStory(slot0, slot1)
	if slot0.storySound == "bgm-story-" .. slot1 then
		return
	end

	slot0:stopStory()

	slot0.storySound = slot2

	slot0:LoadCueSheet(slot2, function ()
		uv0.storyPlayer.loop = true
		uv0.storyPlayer.cueSheet = uv1

		uv0.storyPlayer:Play(0)
	end)
end

function slot1.stopStory(slot0)
	if slot0.storyPlayer.status ~= CriAtomSource.Status.Stop then
		slot0.storyPlayer:Stop()
	end

	if slot0.storySound then
		slot0:UnloadCueSheet(slot0.storySound)

		slot0.storySound = nil
	end
end

function slot1.getCVVolume(slot0)
	return PlayerPrefs.GetFloat("cv_vol", DEFAULT_CVVOLUME)
end

function slot1.setCVVolume(slot0, slot1)
	PlayerPrefs.SetFloat("cv_vol", slot1)
	CriAtom.SetCategoryVolume(uv0.Category_CV, slot1)
end

function slot1.getBGMVolume(slot0)
	return PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME)
end

function slot1.setBGMVolume(slot0, slot1)
	PlayerPrefs.SetFloat("bgm_vol", slot1)
	CriAtom.SetCategoryVolume(uv0.Category_BGM, slot1)
end

function slot1.getSEVolume(slot0)
	return PlayerPrefs.GetFloat("se_vol", DEFAULT_SEVOLUME)
end

function slot1.setSEVolume(slot0, slot1)
	PlayerPrefs.SetFloat("se_vol", slot1)
	CriAtom.SetCategoryVolume(uv0.Category_SE, slot1)
end

slot2 = {}

function slot1.LoadCueSheet(slot0, slot1, slot2)
	if not uv0[slot1] then
		uv0[slot1] = {
			state = "loading",
			callbacks = {}
		}
	end

	if slot3.state == "loaded" then
		if slot2 then
			slot2()
		end
	else
		if slot2 then
			table.insert(slot3.callbacks, slot2)
		end

		WWWLoader.Inst:LoadFile("cue/" .. slot1 .. ".b", function (slot0)
			if uv0[uv1] then
				if slot1.state == "loading" then
					if not IsNil(slot0) then
						slot1.gch = GCHandle.Alloc(slot0, GCHandleType.Pinned)

						CriAtom.AddCueSheet(uv1, slot0, nil, )
					end

					slot1.state = "loaded"
				end

				slot1.callbacks = {}

				for slot6 = 1, #slot1.callbacks do
					slot2[slot6]()
				end
			end
		end)
	end
end

function slot1.UnloadCueSheet(slot0, slot1)
	if uv0[slot1] then
		CriAtom.RemoveCueSheet(slot1)

		if slot2.gch then
			GCHandle.Free(slot2.gch)
		end

		uv0[slot1] = nil
	end
end

function slot1.LoadCV(slot0, slot1, slot2)
	slot0:LoadCueSheet(uv0.GetCVBankName(slot1), slot2)
end

function slot1.LoadBattleCV(slot0, slot1, slot2)
	slot0:LoadCueSheet(uv0.GetBattleCVBankName(slot1), slot2)
end

function slot1.UnloadCVBank(slot0)
	uv0.GetInstance():UnloadCueSheet(slot0)
end

function slot1.GetCVBankName(slot0)
	return "cv-" .. slot0
end

function slot1.GetBattleCVBankName(slot0)
	return "cv-" .. slot0 .. "-battle"
end
