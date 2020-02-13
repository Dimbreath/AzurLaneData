slot0 = class("YostarAlertView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "YostarAlertView"
end

function slot0.OnLoaded(slot0)
	return
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.OnInit(slot0)
	slot0.yostarAlert = slot0._tf
	slot0.yostarEmailTxt = slot0:findTF("email_input_txt", slot0.yostarAlert)
	slot0.yostarCodeTxt = slot0:findTF("code_input_txt", slot0.yostarAlert)
	slot0.yostarGenCodeBtn = slot0:findTF("gen_code_btn", slot0.yostarAlert)
	slot0.yostarGenTxt = slot0:findTF("Text", slot0.yostarGenCodeBtn)
	slot0.yostarSureBtn = slot0:findTF("login_btn", slot0.yostarAlert)

	slot0:InitEvent()
end

function slot0.InitEvent(slot0)
	onButton(slot0, slot0.yostarAlert, function ()
		setActive(slot0.yostarAlert, false)
	end)
	onButton(slot0, slot0.yostarGenCodeBtn, function ()
		if getInputText(slot0.yostarEmailTxt) ~= "" then
			pg.SdkMgr.GetInstance():VerificationCodeReq(slot0)
			slot0:CheckAiriGenCodeCounter()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("verification_code_req_tip1"))
		end
	end)
	onButton(slot0, slot0.yostarSureBtn, function ()
		slot1 = getInputText(slot0.yostarCodeTxt)

		if getInputText(slot0.yostarEmailTxt) ~= "" and slot1 ~= "" then
			pg.SdkMgr.GetInstance():LoginWithSocial(AIRI_PLATFORM_YOSTAR, slot0, slot1)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("verification_code_req_tip3"))
		end
	end)
	slot0:CheckAiriGenCodeCounter()
end

function slot0.CheckAiriGenCodeCounter(slot0)
	if GetAiriGenCodeTimeRemain() > 0 then
		setButtonEnabled(slot0.yostarGenCodeBtn, false)

		slot0.genCodeTimer = Timer.New(function ()
			if GetAiriGenCodeTimeRemain() > 0 then
				setText(slot0.yostarGenTxt, "(" .. slot0 .. ")")
			else
				setText(slot0.yostarGenTxt, "Generate")
				slot0:ClearAiriGenCodeTimer()
			end
		end, 1, -1):Start()
	end
end

function slot0.ClearAiriGenCodeTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	setButtonEnabled(slot0.yostarGenCodeBtn, true)

	if slot0.genCodeTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot0.genCodeTimer:Stop()

		slot0.genCodeTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.OnDestroy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

return slot0
