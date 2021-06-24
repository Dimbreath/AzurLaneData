slot0 = class("MetaSkillDetailBoxLayer", import("...base.BaseUI"))

function slot0.getUIName(slot0)
	return "MetaSkillDetailBoxUI"
end

function slot0.init(slot0)
	slot0:initUITextTips()
	slot0:initData()
	slot0:findUI()
	slot0:addListener()
end

function slot0.didEnter(slot0)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false)
	slot0:updateShipDetail()
	slot0:updateSkillList()
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
end

function slot0.initUITextTips(slot0)
	setText(slot0:findTF("Window/top/bg/infomation/title"), i18n("battle_end_subtitle2"))
	setText(slot0:findTF("Window/MetaSkillDetailBox/ExpDetail/ExpTipText"), i18n("meta_skill_dailyexp"))
	setText(slot0:findTF("Window/MetaSkillDetailBox/TipText"), i18n("meta_skill_learn"))
end

function slot0.initData(slot0)
	slot0.metaProxy = getProxy(MetaCharacterProxy)
	slot0.metaShipID = slot0.contextData.metaShipID
end

function slot0.findUI(slot0)
	slot0.bg = slot0:findTF("BG")
	slot0.window = slot0:findTF("Window")
	slot0.closeBtn = slot0:findTF("top/btnBack", slot0.window)
	slot0.panel = slot0:findTF("MetaSkillDetailBox", slot0.window)
	slot0.skillTpl = slot0:findTF("SkillTpl", slot0.panel)
	slot0.expDetailTF = slot0:findTF("ExpDetail", slot0.panel)
	slot0.shipIcon = slot0:findTF("IconTpl/Icon", slot0.expDetailTF)
	slot0.shipNameText = slot0:findTF("Name", slot0.expDetailTF)
	slot0.expProgressText = slot0:findTF("ExpProgressText", slot0.expDetailTF)
	slot0.skillContainer = slot0:findTF("ScrollView/Content", slot0.panel)
	slot0.skillUIItemList = UIItemList.New(slot0.skillContainer, slot0.skillTpl)
end

function slot0.addListener(slot0)
	onButton(slot0, slot0.bg, function ()
		uv0:closeView()
	end, SFX_PANEL)
	onButton(slot0, slot0.closeBtn, function ()
		uv0:closeView()
	end, SFX_PANEL)
end

function slot0.updateSkillTF(slot0, slot1, slot2)
	slot3 = slot0:findTF("frame", slot1)
	slot4 = slot0:findTF("skillInfo", slot3)
	slot5 = slot0:findTF("mask", slot3)
	slot6 = slot0:findTF("Slider", slot3)
	slot8 = slot0:findTF("ExpProgressText", slot4)
	slot11 = slot0:findTF("Tag/learing", slot3)
	slot12 = slot0:findTF("Tag/unlockable", slot3)
	slot15 = getSkillConfig(slot2)

	setImageSprite(slot0:findTF("icon", slot4), LoadSprite("skillicon/" .. slot15.icon))
	setText(slot0:findTF("name_contain/name", slot4), getSkillName(slot15.id))
	setText(slot0:findTF("name_contain/level_contain/Text", slot4), getProxy(BayProxy):getShipById(slot0.metaShipID):getMetaSkillLevelBySkillID(slot2))

	slot17 = slot2 == slot0.metaProxy:getMetaTacticsInfoByShipID(slot0.metaShipID).curSkillID
	slot19 = slot13:isSkillLevelMax(slot2)
	slot20 = slot16:getSkillExp(slot2)

	if not (pg.skill_data_template[slot2].max_level <= slot14) then
		if slot14 > 0 then
			slot24 = MetaCharacterConst.getMetaSkillTacticsConfig(slot2, slot14).need_exp

			setText(slot8, slot20 .. "/" .. slot24)
			setSlider(slot6, 0, slot24, slot20)
			setActive(slot8, true)
			setActive(slot6, true)
		else
			setActive(slot8, false)
			setActive(slot6, false)
		end
	else
		setText(slot8, slot20 .. "/Max")
		setSlider(slot6, 0, 1, 1)
		setActive(slot8, true)
		setActive(slot6, true)
	end

	print(tostring(slot11), tostring(slot17))
	print(tostring(slot12), tostring(not slot18))
	setActive(slot11, slot17)
	setActive(slot12, not slot18)
	setActive(slot5, not slot18)
	onToggle(slot0, slot1, function (slot0)
		if slot0 then
			if not uv0 then
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					hideYes = true,
					hideNo = true,
					type = MSGBOX_TYPE_META_SKILL_UNLOCK,
					weight = LayerWeightConst.TOP_LAYER,
					metaShipVO = uv1,
					skillID = uv2
				})
			elseif not uv3 and not uv4 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("meta_switch_skill_box_title", getSkillName(uv2)),
					onYes = function ()
						pg.m02:sendNotification(GAME.TACTICS_META_SWITCH_SKILL, {
							shipID = uv0.metaShipID,
							skillID = uv1
						})
					end,
					weight = LayerWeightConst.TOP_LAYER
				})
			end
		end
	end, SFX_PANEL)
end

function slot0.updateSkillList(slot0)
	slot0.skillUIItemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv1:updateSkillTF(slot2, uv0[slot1 + 1])
		end
	end)
	slot0.skillUIItemList:align(#MetaCharacterConst.getTacticsSkillIDListByShipConfigID(getProxy(BayProxy):getShipById(slot0.metaShipID).configId))
end

function slot0.updateShipDetail(slot0)
	slot1 = getProxy(BayProxy):getShipById(slot0.metaShipID)
	slot2 = slot1:getPainting()

	setImageSprite(slot0.shipIcon, LoadSprite("SquareIcon/" .. slot2, slot2))
	setText(slot0.shipNameText, slot1:getName())
	setText(slot0.expProgressText, setColorStr(slot0.metaProxy:getMetaTacticsInfoByShipID(slot0.metaShipID).curDayExp, "#FFF152FF") .. "/" .. pg.gameset.meta_skill_exp_max.key_value)
end

return slot0
