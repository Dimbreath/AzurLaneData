slot0 = class("TestUpload2ResServerLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TestUpload2ResServerUI"
end

function slot0.init(slot0)
	slot0.takePhotoBtn = slot0:findTF("take_photo_btn")

	setText(slot0.takePhotoBtn:Find("Text"), "1.截图")

	slot0.asynUploadBtn = slot0:findTF("asyn_upload_btn")

	setText(slot0.asynUploadBtn:Find("Text"), "2.异步上传")

	slot0.synUploadBtn = slot0:findTF("syn_upload_btn")

	setText(slot0.synUploadBtn:Find("Text"), "3.同步上传")

	slot0.deleteBtn = slot0:findTF("delete_btn")

	setText(slot0.deleteBtn:Find("Text"), "5.删除文件")

	slot0.getBtn = slot0:findTF("get_btn")

	setText(slot0.getBtn:Find("Text"), "4.获取图片")

	slot0.img = slot0:findTF("img"):GetComponent(typeof(Image))

	setAnchoredPosition(slot0.takePhotoBtn, {
		x = 0,
		y = 200
	})
	setAnchoredPosition(slot0.asynUploadBtn, {
		x = 0,
		y = 100
	})
	setAnchoredPosition(slot0.synUploadBtn, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0.deleteBtn, {
		x = 0,
		y = -200
	})
	setAnchoredPosition(slot0.getBtn, {
		x = 0,
		y = -100
	})

	slot0.returnBtn = slot0:findTF("return")
	slot0.savePath = Application.persistentDataPath .. "/screen_scratch/upload_img.jpg"
	slot0.save1Path = Application.persistentDataPath .. "/screen_scratch/download_img.jpg"
end

function slot0.didEnter(slot0)
	slot1 = GameObject.Find("/UICamera"):GetComponent(typeof(Camera))

	onButton(slot0, slot0.takePhotoBtn, function ()
		ScreenShooter.New(Screen.width, Screen.height, TextureFormat.ARGB32):Take(uv0, uv1.savePath)
		pg.TipsMgr.GetInstance():ShowTips(i18n("截图成功"))
		print(uv1.savePath)
	end, SFX_PANEL)
	onButton(slot0, slot0.synUploadBtn, function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.OSSMgr:GetInstance():UpdateLoad("upload_img_syn.jpg", uv0.savePath, function (slot0)
			if slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("同步上传成功"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("同步上传失败"))
			end

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.asynUploadBtn, function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.OSSMgr:GetInstance():AsynUpdateLoad("upload_img_asyn.jpg", uv0.savePath, function (slot0)
			if slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("异步上传成功"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("异步上传失败"))
			end

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.deleteBtn, function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.OSSMgr:GetInstance():DeleteObject("upload_img_asyn.jpg", function (slot0)
			if slot0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("删除成功"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("删除失败"))
			end

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		pg.UIMgr.GetInstance():LoadingOn()
		pg.OSSMgr:GetInstance():GetSprite("upload_img_asyn.jpg", uv0.save1Path, true, 128, 128, function (slot0, slot1)
			if slot0 then
				uv0.img.sprite = slot1

				pg.TipsMgr.GetInstance():ShowTips(i18n("获取成功"))
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("失败成功"))
			end

			pg.UIMgr.GetInstance():LoadingOff()
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.returnBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_PANEL)
	setParent(slot0._tf, pg.UIMgr:GetInstance().OverlayMain)
end

function slot0.willExit(slot0)
end

return slot0
