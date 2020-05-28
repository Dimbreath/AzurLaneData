slot0 = class("BackYardThemeTempalteUtil")
slot1 = false
slot2 = true
slot3 = 1980
slot4 = 1080
slot0.TakeScale = 0.86
slot0.HideGos = {}
slot0.ScaleGos = {}
slot0.loader = {}

function slot5(...)
	if uv0 then
		print(...)
	end
end

function slot6(slot0)
	return Application.persistentDataPath .. "/screen_scratch/" .. slot0 .. ".png"
end

function slot7(slot0)
	return slot0 .. ".png"
end

function slot8(slot0)
	if PathMgr.FileExists(slot0) then
		return HashUtil.HashFile(slot0)
	else
		return ""
	end
end

function slot9(slot0, slot1, slot2)
	if not uv0.FileExists(slot0) then
		slot2()

		return
	end

	pg.OSSMgr:GetInstance():GetTexture2D(uv2(slot0), uv1(slot0), false, uv3, uv4, function (slot0, slot1)
		if slot0 and slot1 then
			uv0(slot1)
		else
			uv0()
		end
	end)
end

function slot10(slot0, slot1, slot2)
	if not uv0 then
		slot2()

		return
	end

	pg.OSSMgr:GetInstance():GetTexture2D(uv2(slot0), uv1(slot0), true, uv3, uv4, function (slot0, slot1)
		if slot0 and slot1 and uv0 == uv1(uv2) then
			uv3(slot1)
		else
			uv3()
		end
	end)
end

function slot11(slot0, slot1)
	if not uv0 then
		slot1()

		return
	end

	slot2 = uv1(slot0)

	pg.OSSMgr:GetInstance():DeleteObject(uv2(slot0), slot1)
end

function slot12(slot0, slot1)
	if not uv0 then
		slot1()

		return
	end

	pg.OSSMgr:GetInstance():AsynUpdateLoad(uv2(slot0), uv1(slot0), slot1)
end

function slot13()
	table.insert(uv0.HideGos, GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/main"))
	table.insert(uv0.HideGos, GameObject.Find("/UICamera/Canvas/UIMain/BackYardDecorationUI(Clone)"))
	table.insert(uv0.HideGos, GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/back"))
	table.insert(uv0.HideGos, GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/bg000"))

	slot0 = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui")
	slot1 = GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/bg").transform
	slot1.localScale = Vector2(uv0.TakeScale, uv0.TakeScale, 1)

	table.insert(uv0.ScaleGos, {
		go = slot1,
		scale = slot1.localScale.x
	})

	if GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui/bg/furContain/drag") then
		table.insert(uv0.HideGos, slot3)
	end

	for slot7, slot8 in ipairs(uv0.HideGos) do
		setActive(slot8, false)
	end

	slot4 = slot0:GetComponent(typeof(ScrollRect)).normalizedPosition
	uv0.normalizedPosition = slot4

	scrollTo(slot0, slot4.x, 1)
end

function slot14()
	for slot3, slot4 in ipairs(uv0.HideGos) do
		setActive(slot4, true)
	end

	for slot3, slot4 in ipairs(uv0.ScaleGos) do
		slot6 = slot4.scale
		slot4.go.localScale = Vector3(slot6, slot6, slot6)
	end

	uv0.ScaleGos = {}
	uv0.HideGos = {}

	scrollTo(GameObject.Find("/UICamera/Canvas/UIMain/BackYardUI(Clone)/backyardmainui"), uv0.normalizedPosition.x, uv0.normalizedPosition.y)

	uv0.normalizedPosition = nil
end

function slot0.FileExists(slot0)
	return PathMgr.FileExists(uv0(slot0))
end

function slot15(slot0, slot1)
	slot2 = UnityEngine.Texture2D.New(452, 324)
	slot3 = uv0 / 2 - slot2.width / 2
	slot6 = uv1 / 2 - slot2.height / 2 + slot2.height
	slot8 = 0

	for slot12 = slot3, slot3 + slot2.width do
		for slot16 = slot4, slot6 do
			slot2:SetPixel(0 + 1, 0 + 1, slot1:GetPixel(slot12, slot16))
		end
	end

	slot2:Apply()
	ScreenShooter.SaveTextureToLocal(uv2(slot0 .. "_icon"), slot2, false)
end

function slot0.TakePhoto(slot0, slot1)
	uv0()

	slot3 = ScreenShooter.TakePhoto(GameObject.Find("/UICamera"):GetComponent(typeof(Camera)), uv1, uv2)
	slot4 = uv3(slot0)

	uv4(slot4)
	uv5(slot0, slot3)
	ScreenShooter.SaveTextureToLocal(slot4, slot3, false)

	if slot1 then
		slot1()
	end

	uv6()
end

function slot0.GetTexture(slot0, slot1, slot2)
	table.insert(uv0.loader, {
		name = slot0,
		callback = slot2
	})

	if #uv0.loader ~= 1 then
		return
	end

	slot3 = nil

	function ()
		if #uv0.loader == 0 then
			return
		end

		slot0 = uv0.loader[1]

		if not uv2 or uv2 == "" then
			function (slot0)
				uv0.callback(slot0)
				table.remove(uv1.loader, 1)
				uv2()
			end(nil)
		elseif uv0.FileExists(slot0.name) and uv2 == uv3(uv4(uv5)) then
			uv6(slot0.name, uv2, slot1)
		else
			uv7(slot0.name, uv2, slot1)
		end
	end()
end

function slot0.UploadTexture(slot0, slot1)
	uv0(slot0, slot1)
end

function slot0.DeleteTexture(slot0, slot1)
	uv0(slot0, slot1)
end

function slot0.GetMd5(slot0)
	return uv1(uv0(slot0))
end

function slot0.GetIconMd5(slot0)
	return uv0.GetMd5(slot0 .. "_icon")
end

function slot0.ClearAllCache()
end

return slot0
