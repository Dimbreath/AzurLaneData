slot0 = class("BackYardDecorationMsgBox", import("....base.BaseSubView"))

function slot0.getUIName(slot0)
	return "BackYardDecorationMsgBox"
end

function slot0.OnLoaded(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.cancelBtn = slot0:findTF("frame/control/cancel_btn")
	slot0.deleteBtn = slot0:findTF("frame/control/delete_btn")
	slot0.saveBtn = slot0:findTF("frame/control/save_btn")
	slot0.applyBtn = slot0:findTF("frame/control/set_btn")
	slot0.input = slot0:findTF("frame/bound/input")
	slot0.name = slot0:findTF("frame/bound/Name")
	slot0.nameText = slot0:findTF("Text", slot0.name):GetComponent(typeof(Text))
	slot0.desc = slot0:findTF("frame/bound/desc"):GetComponent(typeof(Text))
	slot0.icon = slot0:findTF("frame/bound/Icon"):GetComponent(typeof(Image))
	slot0.iconRaw = slot0:findTF("frame/bound/Icon_raw"):GetComponent(typeof(RawImage))
	slot0.innerMsgbox = slot0:findTF("msg")
	slot0.innerMsgboxContent = slot0.innerMsgbox:Find("bound/Text"):GetComponent(typeof(Text))
	slot0.innerMsgboxComfirmBtn = slot0.innerMsgbox:Find("save_btn")
end

function slot0.OnInit(slot0)
	onButton(slot0, slot0._tf, function ()
		uv0:Hide()
	end)
	onButton(slot0, slot0.cancelBtn, function ()
		uv0:Hide()
	end)
	onButton(slot0, slot0.deleteBtn, function ()
		uv0:emit(BackYardDecorationMediator.DELETE_THEME, uv0.theme.id)
		uv0:Hide()
	end)
	onButton(slot0, slot0.saveBtn, function ()
		if wordVer(getInputText(uv0.input)) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_theme_name_forbid"))

			return
		end

		uv0:emit(BackYardDecorationMediator.SAVE_THEME, uv0.theme.id, slot0)
		uv0:Hide()
	end)
	onButton(slot0, slot0.applyBtn, function ()
		uv0:emit(BackYardDecorationMediator.APPLY_THEME, uv0.theme, function (slot0, slot1)
			if slot0 then
				uv0:emit(BackYardDecorationMediator.ADD_FURNITURES, slot1)
				uv0:Hide()
			else
				uv0:ShowInnerMsgBox(i18n("backyarad_theme_replace", uv0.theme:getName()), function ()
					uv0:emit(BackYardDecorationMediator.ADD_FURNITURES, uv1)
					uv0:HideInnerMsgBox()
					uv0:Hide()
				end)
			end
		end)
	end)
	onInputChanged(slot0, slot0.input, function ()
		if not uv0.unEmpty then
			setText(uv0.desc, i18n("backyard_theme_save_tip", getInputText(uv0.input)))
		end
	end)
end

function slot0.Show(slot0, slot1, slot2)
	uv0.super.Show(slot0)

	slot0.theme = slot1
	slot0.unEmpty = slot2

	if slot2 then
		slot0:ApplyTheme()
	else
		slot0:NewTheme()
	end

	setActive(slot0._tf, true)
	setActive(slot0.innerMsgbox, false)
	setActive(slot0.input, not slot2)
	setActive(slot0.name, slot2)
	setActive(slot0.cancelBtn, not slot2)
	setActive(slot0.deleteBtn, slot2 and slot1.type == BackYardTheme.TYPE_USER)
	setActive(slot0.applyBtn, slot2)
	setActive(slot0.saveBtn, not slot2)
end

function slot0.ApplyTheme(slot0)
	slot1 = slot0.theme
	slot0.nameText.text = slot1:getName()
	slot0.desc.text = i18n("backyard_theme_set_tip", slot1:getName())

	if not (slot1.type == BackYardTheme.TYPE_SYSTEM) and (BackYardThemeTempalteUtil.FileExists(slot1:GetTextureIconName()) or slot1:IsPushed()) then
		setActive(slot0.iconRaw.gameObject, false)
		setActive(slot0.icon.gameObject, false)
		BackYardThemeTempalteUtil.GetTexture(slot1:GetTextureIconName(), function (slot0)
			if slot0 then
				setActive(uv0.iconRaw.gameObject, true)

				uv0.iconRaw.texture = slot0
			end
		end)
	else
		setActive(slot0.iconRaw.gameObject, false)
		setActive(slot0.icon.gameObject, true)

		slot0.icon.sprite = LoadSprite("furnitureicon/" .. slot1:getIcon())
	end
end

function slot0.NewTheme(slot0)
	slot2 = slot0.theme.id

	setInputText(slot0.input, i18n("backyard_theme_defaultname") .. slot2)

	slot0.desc.text = i18n("backyard_theme_save_tip", i18n("backyard_theme_defaultname") .. slot2)
	slot0.icon.sprite = LoadSprite("furnitureicon/default_theme")
end

function slot0.ShowInnerMsgBox(slot0, slot1, slot2)
	setActive(slot0.frame, false)
	setActive(slot0.innerMsgbox, true)

	slot0.innerMsgboxContent.text = slot1

	onButton(slot0, slot0.innerMsgboxComfirmBtn, function ()
		if uv0 then
			uv0()
		end
	end, SFX_PANEL)
end

function slot0.HideInnerMsgBox(slot0)
	setActive(slot0.frame, true)
	setActive(slot0.innerMsgbox, false)
end

function slot0.OnDestroy(slot0)
end

return slot0
