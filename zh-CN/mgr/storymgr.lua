pg = pg or {}
slot0 = pg
slot1 = singletonClass
slot2 = "StoryMgr"
slot1 = slot1(slot2)
slot0.StoryMgr = slot1
slot0 = pg
slot0 = slot0.StoryMgr
slot1 = PlayerPrefs
slot1 = slot1.GetInt
slot2 = "storyEnable"
slot1 = slot1(slot2)
slot2 = true
slot0.ENABLE = slot2

if slot1 == 1 then
	slot2 = false
	slot0.ENABLE = slot2
end

slot2 = false
slot3 = 1
slot4 = createLog
slot5 = "StoryMgr"
slot6 = LOG_STORY
slot4 = slot4(slot5, slot6)
slot5 = pg
slot5 = slot5.ship_skin_template
slot6 = {}
slot7 = {}
slot8 = {}

function slot9(slot0)
	slot1 = slot0
	slot2 = "load story: "
	slot3 = slot0.id
	slot2 = slot2 .. slot3

	slot1(slot2)

	slot1 = table
	slot1 = slot1.insert
	slot2 = slot1
	slot3 = slot0

	slot1(slot2, slot3)

	slot1 = slot2
	slot2 = slot0.id
	slot1[slot2] = slot0
end

slot10 = {
	"",
	"JP",
	"KR",
	"US"
}

function slot11(slot0, slot1)
	slot2 = slot0
	slot3 = PLATFORM_CODE
	slot2 = slot2[slot3]

	if slot1 == "index" then
		slot3 = slot1
		slot4 = slot2
		slot1 = slot3 .. slot4
	end

	slot3 = "GameCfg.story"
	slot4 = slot2
	slot5 = "."
	slot6 = slot1
	slot3 = slot3 .. slot4 .. slot5 .. slot6
	slot4 = Application
	slot4 = slot4.isEditor

	if slot4 then
		slot4 = print
		slot5 = "Story Path:"
		slot6 = slot3

		slot4(slot5, slot6)
	end

	slot4 = pcall

	function slot5()
		slot0 = require
		slot1 = slot0

		return slot0(slot1)
	end

	slot4, slot5 = slot4(slot5)

	if not slot4 then
		slot6 = errorMsg
		slot7 = "不存在剧情ID对应的Lua:"
		slot8 = slot1
		slot7 = slot7 .. slot8

		slot6(slot7)
	end

	return slot4 and slot5
end

slot0.GetStoryByName = slot11

function slot11(slot0)
	slot1 = nil
	slot0._go = slot1
end

slot0.Ctor = slot11
slot11 = {
	BG = 3,
	ASIDE = 1,
	DIALOG = 2
}
slot12 = {
	RIGHT = 1,
	CENTER = 2,
	LEFT = 0
}
slot13 = 0.3
slot14 = 1

function slot15(slot0, slot1)
	slot2 = print
	slot3 = "initializing story manager..."

	slot2(slot3)

	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "StoryUI"
	slot5 = true

	function slot6(slot0)
		slot1 = slot0
		slot1._go = slot0
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.Load

		slot1(slot2)

		slot1 = slot1

		slot1()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot0.Init = slot15

function slot15(slot0)
	slot1 = slot0._go
	slot2 = slot1
	slot1 = slot1.SetActive
	slot3 = false

	slot1(slot2, slot3)

	slot1 = GameObject
	slot1 = slot1.Find
	slot2 = "Overlay/UIOverlay"
	slot1 = slot1(slot2)
	slot0.UIOverlay = slot1
	slot1 = slot0._go
	slot1 = slot1.transform
	slot2 = slot1
	slot1 = slot1.SetParent
	slot3 = slot0.UIOverlay
	slot3 = slot3.transform
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot1 = findTF
	slot2 = slot0._go
	slot3 = "curtain"
	slot1 = slot1(slot2, slot3)
	slot0._curtain = slot1
	slot1 = slot0._curtain
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = CanvasGroup
	slot1 = slot1(slot2, slot3(slot4))
	slot0._curtainCG = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "options_panel/options/option_tpl"
	slot1 = slot1(slot2, slot3)
	slot0._option_tpl = slot1
	slot1 = slot0._option_tpl
	slot2 = slot1
	slot1 = slot1.SetParent
	slot3 = tf
	slot4 = slot0._go
	slot3 = slot3(slot4)
	slot4 = false

	slot1(slot2, slot3, slot4)

	slot1 = SetActive
	slot2 = slot0._option_tpl
	slot3 = false

	slot1(slot2, slot3)

	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue"
	slot1 = slot1(slot2, slot3)
	slot0._dialogue = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "aside"
	slot1 = slot1(slot2, slot3)
	slot0._asideContainer = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "aside_txt_tpl"
	slot1 = slot1(slot2, slot3)
	slot0._asideTpl = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "aside_2"
	slot1 = slot1(slot2, slot3)
	slot0._asideContainer2 = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "aside_txt_tpl_2"
	slot1 = slot1(slot2, slot3)
	slot0._asideTpl2 = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "aside_sign_date"
	slot1 = slot1(slot2, slot3)
	slot0._asideSignDate = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "bg"
	slot1 = slot1(slot2, slot3)
	slot0._bg = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "bg/bg_type1"
	slot1 = slot1(slot2, slot3)
	slot0._bg1 = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "bg/bg_type2"
	slot1 = slot1(slot2, slot3)
	slot0._bg2 = slot1
	slot1 = GetOrAddComponent
	slot2 = slot0._bg
	slot3 = typeof
	slot4 = CanvasGroup
	slot1 = slot1(slot2, slot3(slot4))
	slot0._bgCG = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/main"
	slot1 = slot1(slot2, slot3)
	slot0._main = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/main/content"
	slot1 = slot1(slot2, slot3)
	slot0.content = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/main/next"
	slot1 = slot1(slot2, slot3)
	slot0.nextTF = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/actor/actor_left"
	slot1 = slot1(slot2, slot3)
	slot0.actorLeft = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/main/name_left"
	slot1 = slot1(slot2, slot3)
	slot0.nameLeft = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/actor/actor_right"
	slot1 = slot1(slot2, slot3)
	slot0.actorRight = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/main/name_right"
	slot1 = slot1(slot2, slot3)
	slot0.nameRight = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "dialogue/actor/actor_middle"
	slot1 = slot1(slot2, slot3)
	slot0.actorMiddle = slot1
	slot1 = {}
	slot2 = slot0.actorLeft
	slot1[1] = slot2
	slot2 = slot0.actorRight
	slot1[2] = slot2
	slot2 = slot0.actorMiddle
	slot1[3] = slot2
	slot0.actors = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "options_panel"
	slot1 = slot1(slot2, slot3)
	slot0.options = slot1
	slot1 = slot0.options
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = CanvasGroup
	slot1 = slot1(slot2, slot3(slot4))
	slot0.optionsCg = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "options_panel/options"
	slot1 = slot1(slot2, slot3)
	slot0.optionsContainer = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "options_panel/bg"
	slot1 = slot1(slot2, slot3)
	slot0.optionsBg = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "skip_button"
	slot1 = slot1(slot2, slot3)
	slot0.skipBtn = slot1
	slot1 = slot0.content
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Typewriter
	slot1 = slot1(slot2, slot3(slot4))
	slot0.typeWriter = slot1
	slot1 = findTF
	slot2 = slot0._bg
	slot3 = "sub"
	slot1 = slot1(slot2, slot3)
	slot0._subBg = slot1
	slot1 = setActive
	slot2 = slot0._subBg
	slot3 = false

	slot1(slot2, slot3)

	slot1 = findTF
	slot2 = slot0._go
	slot3 = "effect"
	slot1 = slot1(slot2, slot3)
	slot0._effectPanel = slot1
	slot1 = GetOrAddComponent
	slot2 = slot0._effectPanel
	slot3 = "CanvasGroup"
	slot1 = slot1(slot2, slot3)
	slot0._effectCG = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "flash"
	slot1 = slot1(slot2, slot3)
	slot0._flash = slot1
	slot1 = slot0._flash
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = CanvasGroup
	slot1 = slot1(slot2, slot3(slot4))
	slot0._flashCG = slot1
	slot1 = {}
	slot0.effectObjs = slot1
	slot1 = slot0.actorLeft
	slot1 = slot1.localPosition
	slot0.posActorLeft = slot1
	slot1 = slot0.actorMiddle
	slot1 = slot1.localPosition
	slot0.posActorMiddle = slot1
	slot1 = slot0.actorRight
	slot1 = slot1.localPosition
	slot0.posActorRight = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "material1"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Image
	slot1 = slot1(slot2, slot3(slot4))
	slot1 = slot1.material
	slot0.material1 = slot1
	slot1 = findTF
	slot2 = slot0._go
	slot3 = "material2"
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Image
	slot1 = slot1(slot2, slot3(slot4))
	slot1 = slot1.material
	slot0.material2 = slot1
end

slot0.Load = slot15

function slot15(slot0, slot1, slot2)
	slot3 = getProxy
	slot4 = PlayerProxy
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = slot3
		slot4 = slot3.getData
		slot4 = slot4(slot5)
		slot5 = slot4
		slot4 = slot4.IsPlayed
		slot6 = slot1
		slot7 = slot2

		return slot4(slot5, slot6, slot7)
	end

	slot4 = false

	return slot4
end

slot0.IsPlayed = slot15

function slot15(slot0)
	return
end

slot0.Reset = slot15

function slot15(slot0)
	slot1 = 1
	slot2 = slot0._effectPanel
	slot2 = slot2.childCount
	slot3 = 1

	for slot4 = slot1, slot2, slot3 do
		slot5 = slot0._effectPanel
		slot6 = slot5
		slot5 = slot5.GetChild
		slot7 = slot4 - 1
		slot5 = slot5(slot6, slot7)

		if slot5 then
			slot6 = setActive
			slot7 = slot5
			slot8 = false

			slot6(slot7, slot8)
		end
	end
end

slot0.hideEffects = slot15
slot15 = {
	"LevelScene",
	"BattleScene",
	"EventListScene",
	"MilitaryExerciseScene",
	"DailyLevelScene"
}

function slot16(slot0, slot1, slot2, slot3, slot4, slot5)
	slot6 = getProxy
	slot7 = ContextProxy
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.getCurrentContext
	slot6 = slot6(slot7)
	slot7 = table
	slot7 = slot7.contains
	slot8 = slot0
	slot9 = slot6.viewComponent
	slot9 = slot9.__cname
	slot7 = slot7(slot8, slot9)

	if not slot7 then
		slot8 = slot0
		slot7 = slot0.Play
		slot9 = slot1
		slot10 = slot2
		slot11 = slot3
		slot12 = slot4
		slot13 = slot5

		slot7(slot8, slot9, slot10, slot11, slot12, slot13)
	end
end

slot0.PlayOnTaskAdded = slot16

function slot16()
	slot0 = getProxy
	slot1 = ContextProxy
	slot0 = slot0(slot1)
	slot2 = slot0
	slot1 = slot0.getContextByMediator
	slot3 = LevelMediator2
	slot1 = slot1(slot2, slot3)

	if slot1 then
		slot2 = slot1.data
		slot2 = slot2.chapterVO

		return slot2
	end
end

function slot17(slot0, slot1, slot2, slot3, slot4, slot5)
	slot7 = slot0
	slot6 = slot0.GetStoryByName
	slot8 = slot1
	slot6 = slot6(slot7, slot8)

	if not slot6 then
		if slot2 then
			slot6 = slot2
			slot6 = slot6()
		end

		return slot6
	end

	slot6 = slot0._effectCG
	slot7 = 1
	slot6.alpha = slot7
	slot6 = getProxy
	slot7 = ChapterProxy
	slot6 = slot6(slot7)
	slot7 = false
	slot8 = slot0
	slot8 = slot8()

	if slot8 and slot6 then
		slot9 = slot6
		slot8 = slot6.getActiveChapter
		slot8 = slot8(slot9)

		if slot8 then
			slot9 = "skip_events_on_"
			slot10 = slot8.id
			slot9 = slot9 .. slot10
			slot10 = PlayerPrefs
			slot10 = slot10.GetInt
			slot11 = slot9
			slot12 = 1
			slot10 = slot10(slot11, slot12)

			if slot10 == 0 then
				slot7 = true
			end
		end
	end

	slot0.force = slot3 or slot7
	slot8 = slot0.storyId

	if slot8 then
		slot9 = slot0
		slot8 = slot0.addQuery
		slot10 = slot1
		slot11 = slot2

		slot8(slot9, slot10, slot11)

		slot8 = false

		return slot8
	end

	slot0.storyId = slot1
	slot8 = slot1
	slot10 = slot0
	slot9 = slot0.GetStoryByName
	slot11 = slot1

	slot8(slot9(slot10, slot11))

	slot8 = slot2
	slot8 = slot8[slot1]
	slot9 = slot3

	if slot9 then
		slot9 = true
	else
		slot9 = slot8.type ~= slot4
	end

	if slot9 then
		slot10 = slot0.ENABLE

		if not slot10 then
			slot11 = slot0
			slot10 = slot0.IsPlayed
			slot12 = slot1
			slot10 = slot10(slot11, slot12)

			if slot10 then
				if slot2 then
					slot10 = slot2
					slot11 = true

					slot10(slot11)
				end

				slot10 = nil
				slot0.storyId = slot10
				slot11 = slot0
				slot10 = slot0.popQuery

				slot10(slot11)

				slot10 = false

				return slot10
			end
		end
	end

	if not slot3 then
		slot10 = slot8.once

		if slot10 then
			slot11 = slot0
			slot10 = slot0.IsPlayed
			slot12 = slot1
			slot10 = slot10(slot11, slot12)

			if slot10 then
				if slot2 then
					slot10 = slot2
					slot11 = true

					slot10(slot11)
				end

				slot10 = nil
				slot0.storyId = slot10
				slot11 = slot0
				slot10 = slot0.popQuery

				slot10(slot11)

				slot10 = false

				return slot10
			end
		end
	end

	slot11 = slot0
	slot10 = slot0.StartStory
	slot12 = slot8

	function slot13()
		slot0 = slot0
		slot1 = true
		slot0.keepSeletedOptions = slot1
		slot0 = slot0
		slot0 = slot0.nextEpisode

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.isRecall
			slot0 = slot0(slot1)

			if not slot0 then
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.Play
				slot2 = slot0
				slot2 = slot2.nextEpisode

				slot0(slot1, slot2)
			end
		end

		slot0 = slot1

		if slot0 then
			slot0 = slot1

			slot0()
		end

		slot0 = slot0
		slot1 = false
		slot0.keepSeletedOptions = slot1
	end

	slot14 = slot4
	slot15 = slot5

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = true

	return slot10
end

slot0.Play = slot17

function slot17(slot0)
	slot1 = slot0.selectedOptions

	return slot1
end

slot0.getSelectedOptions = slot17

function slot17(slot0, slot1)
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.GetStoryByName
	slot5 = slot1

	slot2(slot3(slot4, slot5))

	slot2 = slot1
	slot2 = slot2[slot1]

	if not slot2 then
		slot3 = print
		slot4 = "no story:"
		slot5 = slot1
		slot6 = "|"
		slot7 = slot1
		slot7 = #slot7
		slot4 = slot4 .. slot5 .. slot6 .. slot7

		slot3(slot4)

		slot3 = ""

		return slot3
	end

	slot3 = ""

	function slot4(slot0)
		string.gsub(slot0 or "", "{namecode:(%d+)}", function (slot0)
			return pg.name_code[tonumber(slot0)] and slot1.name
		end)
	end

	slot5 = ipairs
	slot6 = slot2.scripts
	slot5, slot6, slot7 = slot5(slot6)

	for slot8, slot9 in slot5, slot6, slot7 do
		slot10 = slot9.say

		if slot10 then
			slot10 = ""
			slot11 = slot9.actorName

			if not slot11 then
				slot11 = slot9.actor

				if not slot11 then
					slot10 = "背景音\n"
				end
			else
				slot11 = slot9.actor
				slot12 = 0

				if slot11 > slot12 then
					slot12 = slot0
					slot11 = slot0.getNameAndPainting
					slot13 = slot9
					slot11, slot12 = slot11(slot12, slot13)
					slot8 = slot12
					slot10 = slot11
				else
					slot11 = slot9.actor

					if slot11 == 0 then
						slot11 = "指挥官"

						return slot11
					else
						slot11 = slot9.actor

						if slot11 == -1 then
							slot11 = "秘书舰"

							return slot11
						end
					end
				end
			end

			slot11 = slot3
			slot12 = "\n"
			slot13 = HXSet
			slot13 = slot13.hxLan
			slot14 = slot10
			slot15 = true
			slot13 = slot13(slot14, slot15)
			slot14 = ":\n"
			slot15 = HXSet
			slot15 = slot15.hxLan
			slot16 = slot9.say
			slot17 = true
			slot15 = slot15(slot16, slot17)
			slot3 = slot11 .. slot12 .. slot13 .. slot14 .. slot15
		end

		slot10 = slot9.sequence

		if slot10 then
			slot10 = pairs
			slot11 = slot9.sequence
			slot10, slot11, slot12 = slot10(slot11)

			for slot13, slot14 in slot10, slot11, slot12 do
				if slot14 then
					slot15 = slot14[1]

					if slot15 then
						slot15 = slot3
						slot16 = "\n旁白:\n"
						slot17 = slot14[1]
						slot3 = slot15 .. slot16 .. slot17
					end
				end
			end
		end
	end

	return slot3
end

slot0.storyLog = slot17

function slot17(slot0)
	return getProxy(ContextProxy):getCurrentContext().mediator == CollectionMediator
end

slot0.isRecall = slot17

function slot17(slot0, slot1, slot2, slot3, slot4)
	slot5 = pg
	slot5 = slot5.CriMgr
	slot5 = slot5.GetInstance
	slot5 = slot5()
	slot6 = slot5
	slot5 = slot5.StopCV

	slot5(slot6)

	slot5 = slot0.keepSeletedOptions

	if not slot5 then
		slot5 = {}
		slot0.selectedOptions = slot5
	end

	slot5 = nil
	slot0.nextEpisode = slot5
	slot5 = 0
	slot0.optionFlag = slot5
	slot5 = false
	slot6 = true
	slot0.interactive = slot6
	slot6 = slot1.skippable

	if not slot6 then
		slot6 = slot0:IsPlayed(slot1.id) and not slot3

		setActive(slot0.skipBtn, not slot4)
		pg.m02:sendNotification(GAME.STORY_BEGIN, slot1.id)
		pg.DelegateInfo.New(slot0)
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = slot1.id
		})
		setText(slot0._asideSignDate, "")
		removeAllChildren(slot0.actorLeft:Find("fitter"))
		removeAllChildren(slot0.actorLeft:Find("actor_sub"))
		removeAllChildren(slot0.actorRight:Find("fitter"))
		removeAllChildren(slot0.actorRight:Find("actor_sub"))
		removeAllChildren(slot0.actorMiddle:Find("fitter"))
		removeAllChildren(slot0.actorMiddle:Find("actor_sub"))
		SetActive(slot0.options, false)

		slot0.optionsBg.transform.localPosition = Vector3(1485, 40)
		slot7 = slot0.tweenObjs

		if slot7 then
			slot7 = ipairs
			slot8 = slot0.tweenObjs
			slot7, slot8, slot9 = slot7(slot8)

			for slot10, slot11 in slot7, slot8, slot9 do
				slot12 = LeanTween
				slot12 = slot12.cancel
				slot13 = slot11

				slot12(slot13)
			end

			slot7 = {}
			slot0.tweenObjs = slot7
		end
	end

	slot7 = type
	slot8 = slot1.jumpto
	slot7 = slot7(slot8)

	if slot7 == "string" then
		slot7 = slot1.jumpto
		slot0.nextEpisode = slot7
	end

	slot7 = type
	slot8 = slot1.jumpto
	slot7 = slot7(slot8)

	if slot7 == "function" then
		slot7 = slot1.jumpto
		slot7 = slot7()
		slot0.nextEpisode = slot7
	end

	slot7 = slot1.randFlag

	if slot7 then
		slot7 = 0
		slot8 = {}
		slot9 = ipairs
		slot10 = slot1.randFlag
		slot9, slot10, slot11 = slot9(slot10)

		for slot12, slot13 in slot9, slot10, slot11 do
			slot14 = slot13[2]
			slot7 = slot7 + slot14
			slot14 = table
			slot14 = slot14.insert
			slot15 = slot8
			slot16 = {}
			slot17 = slot13[1]
			slot16[1] = slot17
			slot16[2] = slot7

			slot14(slot15, slot16)
		end

		slot9 = math
		slot9 = slot9.random
		slot10 = 1
		slot11 = slot7
		slot9 = slot9(slot10, slot11)
		slot10 = ipairs
		slot11 = slot8
		slot10, slot11, slot12 = slot10(slot11)

		for slot13, slot14 in slot10, slot11, slot12 do
			slot15 = slot14[2]

			if slot9 <= slot15 then
				slot15 = slot14[1]
				slot0.optionFlag = slot15

				break
			end
		end
	end

	slot7 = nil
	slot8 = coroutine
	slot8 = slot8.wrap

	function slot9()
		slot0 = ipairs
		slot1 = slot0
		slot1 = slot1.scripts
		slot0, slot1, slot2 = slot0(slot1)

		for slot3, slot4 in slot0, slot1, slot2 do
			slot5 = slot4.say

			if slot5 then
				slot5 = HXSet
				slot5 = slot5.hxLan
				slot6 = slot4.say
				slot5 = slot5(slot6)
				slot4.say = slot5
			end

			slot5 = slot4.optionFlag

			if slot5 then
				slot5 = slot1
				slot5 = slot5.optionFlag
				slot6 = slot4.optionFlag

				if slot5 ~= slot6 then
				end
			else
				slot5 = slot2

				if slot5 then
					slot5 = slot4.options

					if not slot5 then
						slot5 = slot4.compulsory

						if slot5 then
							slot5 = slot1
							slot6 = slot5
							slot5 = slot5.isRecall
							slot5 = slot5(slot6)

							if slot5 then
							end
						end
					end
				else
					slot2 = false
					slot5 = true
					slot6 = setActive
					slot7 = slot1
					slot7 = slot7._flash
					slot8 = false

					slot6(slot7, slot8)

					slot6 = slot1
					slot7 = false
					slot6.blackSkip = slot7
					slot6 = slot4.mode

					if not slot6 then
						slot6 = slot0
						slot6 = slot6.mode
					end

					slot7 = slot3
					slot7 = slot7.ASIDE

					if slot6 == slot7 then
						slot7 = slot4.flashout

						if slot7 then
							slot7 = slot1
							slot8 = slot7
							slot7 = slot7.flashout
							slot9 = slot4

							function slot10()
								slot0:initAside(slot0)

								slot0 = table.getCount(slot0.sequence or {})

								if slot0 == 0 then
									slot2 = nil
								end
							end

							slot7(slot8, slot9, slot10)
						else
							slot1:initAside(slot4)

							slot7 = table.getCount(slot4.sequence or {})

							if slot7 == 0 then
								slot5 = nil
							end
						end
					else
						slot7 = slot3
						slot7 = slot7.DIALOG

						if slot6 == slot7 then
							slot7 = slot4.flashout

							if slot7 then
								slot7 = slot1
								slot8 = slot7
								slot7 = slot7.flashout
								slot9 = slot4

								function slot10()
									slot0 = slot0
									slot1 = slot0
									slot0 = slot0.initDialog
									slot2 = slot1

									slot0(slot1, slot2)
								end

								slot7(slot8, slot9, slot10)
							else
								slot7 = slot1
								slot8 = slot7
								slot7 = slot7.initDialog
								slot9 = slot4

								slot7(slot8, slot9)
							end
						else
							slot7 = slot3
							slot7 = slot7.BG

							if slot6 == slot7 then
								slot7 = slot4.flashout

								if slot7 then
									slot7 = slot1
									slot8 = slot7
									slot7 = slot7.flashout
									slot9 = slot4

									function slot10()
										slot0 = slot0
										slot1 = slot0
										slot0 = slot0.initBg
										slot2 = slot1

										slot0(slot1, slot2)
									end

									slot7(slot8, slot9, slot10)
								else
									slot7 = slot1
									slot8 = slot7
									slot7 = slot7.initBg
									slot9 = slot4

									slot7(slot8, slot9)
								end
							end
						end
					end

					slot7 = slot4.options

					if slot7 then
						slot7 = slot1
						slot7 = slot7.skipBtn
						slot8 = slot7
						slot7 = slot7.GetComponent
						slot9 = typeof
						slot10 = Button
						slot7 = slot7(slot8, slot9(slot10))
						slot8 = false
						slot7.interactable = slot8
						slot7 = slot4.typewriter

						if not slot7 then
							slot7 = slot1
							slot8 = slot7
							slot7 = slot7.initOptions
							slot9 = slot4

							function slot10()
								slot0 = slot0

								slot0()
							end

							slot7(slot8, slot9, slot10)
						else
							slot7 = slot1

							function slot8()
								slot0 = slot0
								slot0 = slot0.storyId

								if slot0 == nil then
									return
								end

								slot0 = slot0
								slot1 = nil
								slot0.typeWriteCallback = slot1
								slot0 = slot0
								slot1 = slot0
								slot0 = slot0.initOptions
								slot2 = slot1

								function slot3()
									slot0 = slot0

									slot0()
								end

								slot0(slot1, slot2, slot3)
							end

							slot7.typeWriteCallback = slot8
						end
					end

					slot7 = slot4.effects

					if slot7 then
						slot7 = slot1
						slot8 = slot7
						slot7 = slot7.setEffects
						slot9 = slot4.effects

						slot7(slot8, slot9)
					end

					slot7 = SetActive
					slot8 = slot1
					slot8 = slot8.nextTF
					slot9 = true

					slot7(slot8, slot9)

					slot7 = slot4.bgm

					if slot7 then
						slot7 = slot4.bgmDelay

						if slot7 then
							slot7 = pg
							slot7 = slot7.CriMgr
							slot7 = slot7.GetInstance
							slot7 = slot7()
							slot8 = slot7
							slot7 = slot7.stopBGM
							slot9 = true

							slot7(slot8, slot9)

							slot7 = slot1
							slot8 = true
							slot7.stopBGM = slot8
							slot7 = LeanTween
							slot7 = slot7.delayedCall
							slot8 = slot4.bgmDelay
							slot9 = System
							slot9 = slot9.Action

							function slot10()
								slot0 = slot0
								slot1 = slot1
								slot1 = slot1.bgm
								slot0.bgm = slot1
								slot0 = slot0
								slot1 = nil
								slot0.stopBGM = slot1
								slot0 = pg
								slot0 = slot0.CriMgr
								slot0 = slot0.GetInstance
								slot0 = slot0()
								slot1 = slot0
								slot0 = slot0.PlayBGM
								slot2 = slot1
								slot2 = slot2.bgm
								slot3 = true

								slot0(slot1, slot2, slot3)
							end

							slot7(slot8, slot9(slot10))
						else
							slot7 = slot1
							slot8 = slot4.bgm
							slot7.bgm = slot8
							slot7 = slot1
							slot8 = nil
							slot7.stopBGM = slot8
							slot7 = pg
							slot7 = slot7.CriMgr
							slot7 = slot7.GetInstance
							slot7 = slot7()
							slot8 = slot7
							slot7 = slot7.PlayBGM
							slot9 = slot4.bgm
							slot10 = true

							slot7(slot8, slot9, slot10)
						end
					else
						slot7 = slot4.stopbgm

						if slot7 then
							slot7 = pg
							slot7 = slot7.CriMgr
							slot7 = slot7.GetInstance
							slot7 = slot7()
							slot8 = slot7
							slot7 = slot7.stopBGM
							slot9 = true

							slot7(slot8, slot9)

							slot7 = slot1
							slot8 = true
							slot7.stopBGM = slot8
						end
					end

					slot7 = slot4.flash

					if slot7 then
						slot7 = slot1
						slot7 = slot7._flash
						slot8 = slot7
						slot7 = slot7.GetComponent
						slot9 = typeof
						slot10 = Image
						slot7 = slot7(slot8, slot9(slot10))
						slot8 = slot4.flash
						slot8 = slot8.black

						if slot8 then
							slot8 = Color
							slot9 = 0
							slot10 = 0
							slot11 = 0
							slot8 = slot8(slot9, slot10, slot11)

							if not slot8 then
								slot8 = Color
								slot9 = 1
								slot10 = 1
								slot11 = 1
								slot8 = slot8(slot9, slot10, slot11)
							end
						end

						slot7.color = slot8
						slot8 = slot1
						slot8 = slot8._flashCG
						slot9 = slot4.flash
						slot9 = slot9.alpha
						slot9 = slot9[1]
						slot8.alpha = slot9
						slot8 = setActive
						slot9 = slot1
						slot9 = slot9._flash
						slot10 = true

						slot8(slot9, slot10)

						slot8 = 1
						slot9 = slot4.flash
						slot9 = slot9.number
						slot10 = 1

						for slot11 = slot8, slot9, slot10 do
							slot12 = LeanTween
							slot12 = slot12.alpha
							slot13 = rtf
							slot14 = slot1
							slot14 = slot14._flash
							slot13 = slot13(slot14)
							slot14 = slot4.flash
							slot14 = slot14.alpha
							slot14 = slot14[2]
							slot15 = slot4.flash
							slot15 = slot15.dur

							if slot15 then
								slot15 = slot4.flash
								slot15 = slot15.dur
								slot15 = slot15 / 2

								if not slot15 then
									slot15 = slot4.flash
									slot15 = slot15.dur1
								end
							end

							slot12 = slot12(slot13, slot14, slot15)
							slot13 = slot12
							slot12 = slot12.setFrom
							slot14 = slot4.flash
							slot14 = slot14.alpha
							slot14 = slot14[1]
							slot12 = slot12(slot13, slot14)
							slot13 = slot12
							slot12 = slot12.setDelay
							slot14 = slot11 - 1
							slot15 = slot4.flash
							slot15 = slot15.delay
							slot14 = slot14 * slot15
							slot12 = slot12(slot13, slot14)
							slot13 = slot12
							slot12 = slot12.setUseEstimatedTime
							slot14 = true
							slot12 = slot12(slot13, slot14)
							slot13 = slot12
							slot12 = slot12.setOnComplete
							slot14 = System
							slot14 = slot14.Action

							function slot15()
								slot0 = LeanTween
								slot0 = slot0.alpha
								slot1 = rtf
								slot2 = slot0
								slot2 = slot2._flash
								slot1 = slot1(slot2)
								slot2 = slot1
								slot2 = slot2.flash
								slot2 = slot2.alpha
								slot2 = slot2[1]
								slot3 = slot1
								slot3 = slot3.flash
								slot3 = slot3.dur

								if slot3 then
									slot3 = slot1
									slot3 = slot3.flash
									slot3 = slot3.dur
									slot3 = slot3 / 2

									if not slot3 then
										slot3 = slot1
										slot3 = slot3.flash
										slot3 = slot3.dur2
									end
								end

								slot0 = slot0(slot1, slot2, slot3)
								slot1 = slot0
								slot0 = slot0.setFrom
								slot2 = slot1
								slot2 = slot2.flash
								slot2 = slot2.alpha
								slot2 = slot2[2]
								slot0 = slot0(slot1, slot2)
								slot1 = slot0
								slot0 = slot0.setUseEstimatedTime
								slot2 = true
								slot0 = slot0(slot1, slot2)
								slot1 = slot0
								slot0 = slot0.setOnComplete
								slot2 = System
								slot2 = slot2.Action

								function slot3()
									slot0 = slot0
									slot1 = slot1
									slot1 = slot1.flash
									slot1 = slot1.number

									if slot1 <= slot0 then
										slot0 = setActive
										slot1 = slot2
										slot1 = slot1._flash
										slot2 = false

										slot0(slot1, slot2)
									end
								end

								slot0 = slot0(slot1, slot2(slot3))
								slot1 = slot0
								slot0 = slot0.setDelay
								slot2 = slot1
								slot2 = slot2.flash
								slot2 = slot2.wait

								slot0(slot1, slot2)
							end

							slot12(slot13, slot14(slot15))
						end
					end

					slot7 = slot4.flashN

					if slot7 then
						slot7 = slot1
						slot7 = slot7._flash
						slot8 = slot7
						slot7 = slot7.GetComponent
						slot9 = typeof
						slot10 = Image
						slot7 = slot7(slot8, slot9(slot10))
						slot8 = slot4.flashN
						slot8 = slot8.color

						if slot8 then
							slot8 = Color
							slot9 = slot4.flashN
							slot9 = slot9.color
							slot9 = slot9[1]
							slot10 = slot4.flashN
							slot10 = slot10.color
							slot10 = slot10[2]
							slot11 = slot4.flashN
							slot11 = slot11.color
							slot11 = slot11[3]
							slot8 = slot8(slot9, slot10, slot11)

							if not slot8 then
								slot8 = Color
								slot9 = 0
								slot10 = 0
								slot11 = 0
								slot8 = slot8(slot9, slot10, slot11)
							end
						end

						slot7.color = slot8
						slot8 = setActive
						slot9 = slot1
						slot9 = slot9._flash
						slot10 = true

						slot8(slot9, slot10)

						slot8 = ipairs
						slot9 = slot4.flashN
						slot9 = slot9.alpha
						slot8, slot9, slot10 = slot8(slot9)

						for slot11, slot12 in slot8, slot9, slot10 do
							LeanTween.value(go(slot1._flash), slot12[1], slot12[2], slot12[3]):setDelay(slot12[4] or 0):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
								slot0._flashCG.alpha = slot0
							end))
						end
					end

					slot7 = slot4.dialogShake

					if slot7 then
						slot1.interactive = false
						slot8 = LeanTween.moveX(slot1._dialogue, slot4.dialogShake.x, slot4.dialogShake.speed):setDelay(slot4.dialogShake.delay or 0):setLoopPingPong(slot4.dialogShake.number)
						slot7 = LeanTween.moveX(slot1._dialogue, slot4.dialogShake.x, slot4.dialogShake.speed).setDelay(slot4.dialogShake.delay or 0).setLoopPingPong(slot4.dialogShake.number).setOnComplete
						slot9 = System.Action

						function slot10()
							slot0 = slot0
							slot1 = true
							slot0.interactive = slot1
						end

						slot7(slot8, slot9(slot10))
					end

					slot7 = slot4.soundeffect

					if slot7 then
						slot7 = slot4.seDelay

						if slot7 then
							slot7 = LeanTween
							slot7 = slot7.delayedCall
							slot8 = slot4.seDelay
							slot9 = System
							slot9 = slot9.Action

							function slot10()
								slot0 = slot0
								slot1 = slot1
								slot1 = slot1.bgm
								slot0.bgm = slot1
								slot0 = slot0
								slot1 = nil
								slot0.stopBGM = slot1
								slot0 = playSoundEffect
								slot1 = slot1
								slot1 = slot1.soundeffect

								slot0(slot1)
							end

							slot7(slot8, slot9(slot10))
						else
							slot7 = playSoundEffect
							slot8 = slot4.soundeffect

							slot7(slot8)
						end
					end

					slot7 = slot4.movie

					if slot7 then
						slot7 = pg
						slot7 = slot7.CriMgr
						slot7 = slot7.GetInstance
						slot7 = slot7()
						slot8 = slot7
						slot7 = slot7.stopBGM

						slot7(slot8)

						slot7 = playMovie
						slot8 = slot4.movie

						function slot9()
							slot0 = onNextTick

							function slot1()
								slot0 = slot0
								slot0 = slot0.stopBGM

								if not slot0 then
									slot0 = slot0
									slot0 = slot0.bgm

									if slot0 then
										slot0 = pg
										slot0 = slot0.CriMgr
										slot0 = slot0.GetInstance
										slot0 = slot0()
										slot1 = slot0
										slot0 = slot0.resumeStoryBGM

										slot0(slot1)
									else
										slot0 = pg
										slot0 = slot0.CriMgr
										slot0 = slot0.GetInstance
										slot0 = slot0()
										slot1 = slot0
										slot0 = slot0.resumeNormalBGM

										slot0(slot1)
									end
								end

								slot0 = slot1

								slot0()
							end

							slot0(slot1)
						end

						slot7(slot8, slot9)

						slot5 = true
					end

					slot7 = type
					slot8 = slot4.jumpto
					slot7 = slot7(slot8)

					if slot7 == "string" then
						slot7 = slot1
						slot8 = slot4.jumpto
						slot7.nextEpisode = slot8

						break
					end

					slot7 = type
					slot8 = slot4.jumpto
					slot7 = slot7(slot8)

					if slot7 == "function" then
						slot7 = slot1
						slot8 = slot4.jumpto
						slot8 = slot8()
						slot7.nextEpisode = slot8

						break
					end

					if slot5 then
						slot7 = coroutine
						slot7 = slot7.yield

						slot7()
					end
				end
			end
		end

		slot0 = slot0
		slot0 = slot0.continueBgm

		if not slot0 then
			slot0 = pg
			slot0 = slot0.CriMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.resumeNormalBGM

			slot0(slot1)
		end

		slot0 = pg
		slot0 = slot0.CriMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.StopSEUI

		slot0(slot1)

		slot0 = pg
		slot0 = slot0.CriMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.StopSEBattle

		slot0(slot1)

		slot0 = slot2

		if not slot0 then
			slot0 = slot0
			slot0 = slot0.fadeOut

			if slot0 then
				slot0 = slot0
				slot0 = slot0.noWaitFade

				if slot0 then
					slot0 = slot5

					if slot0 then
						slot0 = slot5

						slot0()

						slot0 = slot1
						slot1 = slot0
						slot0 = slot0.fadeOut
						slot2 = slot0
						slot2 = slot2.fadeType
						slot3 = slot0
						slot3 = slot3.fadeOut

						slot0(slot1, slot2, slot3)
					end
				else
					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.fadeOut
					slot2 = slot0
					slot2 = slot2.fadeType
					slot3 = slot0
					slot3 = slot3.fadeOut
					slot4 = slot5

					slot0(slot1, slot2, slot3, slot4)
				end

				slot2 = true
			end
		else
			slot0 = slot2

			if not slot0 then
				slot0 = slot0
				slot0 = slot0.occlusion

				if slot0 then
					slot0 = slot1
					slot1 = true
					slot0.occlusion = slot1
					slot0 = slot1
					slot1 = Timer
					slot1 = slot1.New

					function slot2()
						slot0 = slot0
						slot1 = slot0
						slot0 = slot0.EndStory

						slot0(slot1)

						slot0 = slot0
						slot0 = slot0.blackScreenTimer
						slot1 = slot0
						slot0 = slot0.Stop

						slot0(slot1)

						slot0 = slot0
						slot1 = nil
						slot0.blackScreenTimer = slot1
						slot0 = slot0
						slot1 = nil
						slot0.occlusion = slot1
						slot0 = slot1

						if slot0 then
							slot0 = slot1

							slot0()
						end
					end

					slot3 = slot0
					slot3 = slot3.occlusion
					slot4 = 1
					slot1 = slot1(slot2, slot3, slot4)
					slot0.blackScreenTimer = slot1
					slot0 = slot1
					slot0 = slot0.blackScreenTimer
					slot1 = slot0
					slot0 = slot0.Start

					slot0(slot1)

					slot2 = true
				end
			else
				slot0 = slot1
				slot1 = slot0
				slot0 = slot0.EndStory
				slot2 = slot5

				slot0(slot1, slot2)
			end
		end
	end

	slot8 = slot8(slot9)
	slot7 = slot8
	slot8 = slot0._go
	slot8 = slot8.transform
	slot9 = slot8
	slot8 = slot8.SetAsLastSibling

	slot8(slot9)

	slot8 = SetActive
	slot9 = slot0._go
	slot10 = true

	slot8(slot9, slot10)

	slot8 = onButton
	slot9 = slot0
	slot10 = slot0.skipBtn

	function slot11()
		slot0 = slot0
		slot0 = slot0.interactive

		if slot0 then
			slot0 = slot1

			if slot0 then
				slot0 = slot0
				slot0 = slot0.blackSkip

				if not slot0 then
					return
				end
			end
		end

		function slot0()
			slot0 = slot0
			slot0 = slot0.inTypeWritter

			if slot0 then
				slot0 = slot0
				slot0 = slot0.typeWritterSpeedUp
				slot1 = Time
				slot1 = slot1.timeScale
				slot0 = slot0 * slot1
				slot1 = slot0
				slot1 = slot1.typeWriter
				slot2 = slot1
				slot1 = slot1.setSpeed
				slot3 = slot0

				slot1(slot2, slot3)
			end

			slot0 = go
			slot1 = slot0
			slot1 = slot1._go
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.GetComponentsInChildren
			slot2 = typeof
			slot3 = Transform
			slot0 = slot0(slot1, slot2(slot3))
			slot1 = 0
			slot2 = slot0.Length
			slot2 = slot2 - 1
			slot3 = 1

			for slot4 = slot1, slot2, slot3 do
				slot5 = LeanTween
				slot5 = slot5.cancel
				slot6 = go
				slot7 = slot0[slot4]
				slot6 = slot6(slot7)
				slot7 = true

				slot5(slot6, slot7)
			end

			slot1 = true
			slot1 = slot2

			slot1()
		end

		slot1 = slot3

		if slot1 then
			slot1 = slot0

			slot1()
		else
			slot1 = pg
			slot1 = slot1.MsgboxMgr
			slot1 = slot1.GetInstance
			slot1 = slot1()
			slot2 = slot1
			slot1 = slot1.ShowMsgBox
			slot3 = {}
			slot4 = rtf
			slot5 = slot0
			slot5 = slot5.UIOverlay
			slot4 = slot4(slot5)
			slot3.parent = slot4
			slot4 = GetComponent
			slot5 = slot0
			slot5 = slot5._go
			slot6 = typeof
			slot7 = Canvas
			slot4 = slot4(slot5, slot6(slot7))
			slot4 = slot4.sortingOrder
			slot4 = slot4 + 1
			slot3.canvasOrder = slot4
			slot4 = i18n
			slot5 = "story_skip_confirm"
			slot4 = slot4(slot5)
			slot3.content = slot4

			function slot4()
				slot0 = slot0

				slot0()
			end

			slot3.onYes = slot4

			slot1(slot2, slot3)
		end
	end

	slot8(slot9, slot10, slot11)

	slot8 = onButton
	slot9 = slot0
	slot10 = slot0._go

	function slot11()
		slot0 = slot0
		slot0 = slot0.inTypeWritter

		if slot0 then
			slot0 = slot0
			slot0 = slot0.typeWritterSpeedUp
			slot1 = Time
			slot1 = slot1.timeScale
			slot0 = slot0 * slot1
			slot1 = slot0
			slot1 = slot1.typeWriter
			slot2 = slot1
			slot1 = slot1.setSpeed
			slot3 = slot0

			slot1(slot2, slot3)

			return
		end

		slot0 = slot0
		slot0 = slot0.interactive

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.blankScreen

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.occlusion

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.inflashin

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.inflashout

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.inAction

		if slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.inFadeOut

		if slot0 then
			slot0 = slot0
			slot1 = false
			slot0.inFadeOut = slot1
			slot0 = LeanTween
			slot0 = slot0.cancel
			slot1 = go
			slot2 = slot0
			slot2 = slot2._curtain

			slot0(slot1(slot2))

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.EndStory
			slot2 = slot1

			slot0(slot1, slot2)

			return
		end

		slot0 = slot2

		slot0()
	end

	slot8(slot9, slot10, slot11)

	slot8 = slot7

	slot8()
end

slot0.StartStory = slot17

function slot17(slot0, slot1, slot2, slot3)
	if slot1 == 1 then
		slot4 = slot0._curtain or slot0._bg

		if slot1 == 1 then
			slot5 = slot0._curtainCG or slot0._bgCG
			slot0.inFadeOut = true

			setActive(slot4, true)
			LeanTween.value(go(slot4), 1, 0, slot2):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
				slot0._effectCG.alpha = slot0
			end)):setOnComplete(System.Action(function ()
				if slot0.inFadeOut then
					slot0:EndStory(slot0)

					slot0.EndStory.inFadeOut = false
				end
			end))
			LeanTween.alpha(rtf(slot0._go), 0, slot2):setUseEstimatedTime(true)

			slot6 = go(slot0._asideContainer).activeSelf

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 64-68, warpins: 1 ---
				slot6 = 1
				slot7 = slot0._asideContainer
				slot7 = slot7.childCount
				slot8 = 1

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 69-83, warpins: 0 ---
				for slot9 = slot6, slot7, slot8 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 69-83, warpins: 2 ---
					slot10 = LeanTween
					slot10 = slot10.textAlpha
					slot11 = slot0._asideContainer
					slot12 = slot11
					slot11 = slot11.GetChild
					slot13 = slot9 - 1
					slot11 = slot11(slot12, slot13)
					slot12 = 0
					slot13 = slot2
					slot10 = slot10(slot11, slot12, slot13)
					slot11 = slot10
					slot10 = slot10.setUseEstimatedTime
					slot12 = true

					slot10(slot11, slot12)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
		end
	end

	slot6 = go
	slot7 = slot0._asideContainer2
	slot6 = slot6(slot7)
	slot6 = slot6.activeSelf

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-94, warpins: 1 ---
		slot6 = 1
		slot7 = slot0._asideContainer2
		slot7 = slot7.childCount
		slot8 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 95-109, warpins: 0 ---
		for slot9 = slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-109, warpins: 2 ---
			slot10 = LeanTween
			slot10 = slot10.textAlpha
			slot11 = slot0._asideContainer2
			slot12 = slot11
			slot11 = slot11.GetChild
			slot13 = slot9 - 1
			slot11 = slot11(slot12, slot13)
			slot12 = 0
			slot13 = slot2
			slot10 = slot10(slot11, slot12, slot13)
			slot11 = slot10
			slot10 = slot10.setUseEstimatedTime
			slot12 = true

			slot10(slot11, slot12)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	slot6 = go
	slot7 = slot0._dialogue
	slot6 = slot6(slot7)
	slot6 = slot6.activeSelf

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-119, warpins: 1 ---
		slot6 = SetActive
		slot7 = slot0._dialogue
		slot8 = false

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---



	end
end

slot0.fadeOut = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.asideType

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		slot2 = slot1.asideType

		if slot2 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-9, warpins: 2 ---
			slot2 = slot0._asideContainer or slot0._asideContainer2
			slot3 = slot1.asideType

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-13, warpins: 2 ---
			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-16, warpins: 1 ---
				slot3 = slot1.asideType

				if slot3 == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-19, warpins: 2 ---
					slot3 = slot0._asideTpl or slot0._asideTpl2

					slot0("enter aside mode............")
					SetActive(slot2, true)
					setActive(slot0._curtain, true)

					slot0._curtainCG.alpha = slot1.alpha or 1
					slot0.interactive = false
					slot0.blackSkip = true

					removeAllChildren(slot2)
					setActive(slot0._subBg, false)

					slot4 = slot1.bgSpeed or 0.5
					slot5 = slot1.bgFade

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 21-35, warpins: 2 ---
					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 37-51, warpins: 2 ---
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 53-55, warpins: 2 ---
					if slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 56-58, warpins: 1 ---
						slot5 = slot0.preBg

						if slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 59-85, warpins: 1 ---
							slot0.interactive = false

							LeanTween.value(go(slot0._bg), 1, 0, slot4):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-4, warpins: 1 ---
								slot0._bgCG.alpha = slot0

								return
								--- END OF BLOCK #0 ---



							end)):setDelay(delay or 0):setOnComplete(System.Action(function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-12, warpins: 1 ---
								slot0.interactive = true
								slot0.preBg = nil

								setActive(slot0._bg, false)

								return
								--- END OF BLOCK #0 ---



							end))
							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 87-95, warpins: 2 ---
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 96-101, warpins: 2 ---
						slot5 = nil
						slot0.preBg = slot5
						slot5 = setActive
						slot6 = slot0._bg
						slot7 = false

						slot5(slot6, slot7)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #3 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 102-104, warpins: 2 ---
	slot5 = slot0.preStep

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-107, warpins: 1 ---
		slot5 = slot1.paintingFadeOut

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-116, warpins: 1 ---
			slot5 = false
			slot0.interactive = slot5
			slot6 = slot0
			slot5 = slot0.paintingFadeOut
			slot7 = slot0.preStep
			slot8 = slot1

			function slot9()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0 = slot0
				slot1 = true
				slot0.interactive = slot1
				slot0 = SetActive
				slot1 = slot0
				slot1 = slot1._dialogue
				slot2 = false

				slot0(slot1, slot2)

				return
				--- END OF BLOCK #0 ---



			end

			slot5(slot6, slot7, slot8, slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 117-120, warpins: 2 ---
		slot5 = SetActive
		slot6 = slot0._dialogue
		slot7 = false

		slot5(slot6, slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 121-124, warpins: 2 ---
	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot1 = nil
		slot2, slot3, slot4 = ipairs(slot0.sequence or {})

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-10, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 11-52, warpins: 0 ---
		for slot5, slot6 in slot2, slot3, slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-39, warpins: 1 ---
			slot7 = cloneTplTo(slot1, slot2)

			setActive(slot7, true)
			setText(slot7, slot8)
			setTextAlpha(slot7, 0)

			slot1 = LeanTween.textAlpha(slot7, 1, slot0.sequenceSpd or 1):setDelay(slot0):setUseEstimatedTime(true)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-50, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 51-52, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-56, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.signDate

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-80, warpins: 1 ---
			setText(slot3._asideSignDate, slot0.signDate[1])
			setTextAlpha(slot3._asideSignDate._asideSignDate, 0)

			slot1 = LeanTween.textAlpha(slot3._asideSignDate._asideSignDate._asideSignDate, 1, slot0.sequenceSpd or 1):setDelay(slot0):setUseEstimatedTime(true)
			slot2 = slot0.signDate[3]

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 82-96, warpins: 2 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 97-111, warpins: 1 ---
				slot2 = setAnchoredPosition
				slot3 = slot3
				slot3 = slot3._asideSignDate
				slot4 = Vector2
				slot5 = slot0
				slot5 = slot5.signDate
				slot5 = slot5[3]
				slot5 = slot5[1]
				slot6 = slot0
				slot6 = slot6.signDate
				slot6 = slot6[3]
				slot6 = slot6[2]

				slot2(slot3, slot4(slot5, slot6))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-116, warpins: 1 ---
			slot2 = setText
			slot3 = slot3
			slot3 = slot3._asideSignDate
			slot4 = ""

			slot2(slot3, slot4)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 117-118, warpins: 3 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-125, warpins: 1 ---
			slot3 = slot1
			slot2 = slot1.setOnComplete
			slot4 = System
			slot4 = slot4.Action

			function slot5()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0 = slot0
				slot1 = true
				slot0.interactive = slot1
				slot0 = slot1
				slot0 = slot0.autoComplete

				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-11, warpins: 1 ---
					slot0 = triggerButton
					slot1 = slot0
					slot1 = slot1._go

					slot0(slot1)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 12-12, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot2(slot3, slot4(slot5))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 126-126, warpins: 2 ---
		return
		--- END OF BLOCK #5 ---



	end

	slot6 = slot1.flashin

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 125-130, warpins: 1 ---
		slot7 = slot0
		slot6 = slot0.flashin
		slot8 = slot1

		function slot9()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end

		slot6(slot7, slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-132, warpins: 1 ---
		slot6 = slot5

		slot6()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 133-137, warpins: 2 ---
	slot6 = table.getCount(slot1.sequence or {})

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 139-141, warpins: 2 ---
	if slot6 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 142-143, warpins: 1 ---
		slot6 = true
		slot0.interactive = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 144-146, warpins: 2 ---
	slot6 = slot1.bgName

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 147-160, warpins: 1 ---
		slot6 = slot0._bgCG
		slot7 = 1
		slot6.alpha = slot7
		slot6 = setActive
		slot7 = slot0._bg2
		slot8 = false

		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0._bg1
		slot8 = false

		slot6(slot7, slot8)

		slot6 = slot1.useBg2

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 161-163, warpins: 1 ---
			slot0._bg2 or slot0._bg1.GetComponent(slot6, typeof(Image)).color = Color.New(1, 1, 1)

			setActive(slot0._bg, true)
			setActive(slot6, true)
			setImageSprite(slot0._bg2 or slot0._bg1, LoadSprite("bg/" .. slot1.bgName))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 165-194, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 195-197, warpins: 2 ---
	slot6 = slot1.bgShadow

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 198-200, warpins: 1 ---
		slot6 = slot1.useBg2

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 201-203, warpins: 1 ---
			slot7 = slot0._bg2 or slot0._bg1.GetComponent(slot6, typeof(Image))

			LeanTween.value(go(slot6), slot1.bgShadow[1], slot1.bgShadow[2], slot1.bgShadow[3]):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0.color = Color.New(slot0, slot0, slot0)

				return
				--- END OF BLOCK #0 ---



			end))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 205-234, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 235-236, warpins: 2 ---
	return
	--- END OF BLOCK #7 ---



end

slot0.initAside = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot2 = slot0
	slot3 = "enter dialogue mode............"

	slot2(slot3)

	slot2 = SetActive
	slot3 = slot0._dialogue
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._asideContainer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._asideContainer2
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setText
	slot3 = slot0._asideSignDate
	slot4 = ""

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._subBg
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._curtain
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.actorLeft
	slot3 = slot0.posActorLeft
	slot2.localPosition = slot3
	slot2 = slot0.actorRight
	slot3 = slot0.posActorRight
	slot2.localPosition = slot3
	slot2 = slot0.actorMiddle
	slot3 = slot0.posActorMiddle
	slot2.localPosition = slot3
	slot2 = slot1.bgSpeed

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-40, warpins: 1 ---
		slot2 = 0.5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-43, warpins: 2 ---
	slot3 = slot1.bgFade

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-46, warpins: 1 ---
		slot3 = slot0.preBg

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-73, warpins: 1 ---
			slot3 = false
			slot0.interactive = slot3
			slot3 = LeanTween
			slot3 = slot3.value
			slot4 = go
			slot5 = slot0._bg
			slot4 = slot4(slot5)
			slot5 = 1
			slot6 = 0
			slot7 = slot2
			slot3 = slot3(slot4, slot5, slot6, slot7)
			slot4 = slot3
			slot3 = slot3.setUseEstimatedTime
			slot5 = true
			slot3 = slot3(slot4, slot5)
			slot4 = slot3
			slot3 = slot3.setOnUpdate
			slot5 = System
			slot5 = slot5.Action_float

			function slot6(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot1 = slot0
				slot1 = slot1._bgCG
				slot1.alpha = slot0

				return
				--- END OF BLOCK #0 ---



			end

			slot3 = slot3(slot4, slot5(slot6))
			slot4 = slot3
			slot3 = slot3.setDelay
			slot5 = delay

			if not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 74-74, warpins: 1 ---
				slot5 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 75-83, warpins: 2 ---
			slot3 = slot3(slot4, slot5)
			slot4 = slot3
			slot3 = slot3.setOnComplete
			slot5 = System
			slot5 = slot5.Action

			function slot6()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				slot0 = slot0
				slot1 = true
				slot0.interactive = slot1
				slot0 = slot0
				slot1 = nil
				slot0.preBg = slot1
				slot0 = setActive
				slot1 = slot0
				slot1 = slot1._bg
				slot2 = false

				slot0(slot1, slot2)

				return
				--- END OF BLOCK #0 ---



			end

			slot3(slot4, slot5(slot6))
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-87, warpins: 2 ---
		slot3 = setActive
		slot4 = slot0._bg
		slot5 = false

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 88-90, warpins: 2 ---
	slot3 = slot1.bgName

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-104, warpins: 1 ---
		slot3 = slot0._bgCG
		slot4 = 1
		slot3.alpha = slot4
		slot3 = setActive
		slot4 = slot0._bg2
		slot5 = false

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = slot0._bg1
		slot5 = false

		slot3(slot4, slot5)

		slot3 = slot1.useBg2

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-107, warpins: 1 ---
			slot3 = slot0._bg2

			if not slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 108-108, warpins: 2 ---
				slot3 = slot0._bg1
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 109-138, warpins: 2 ---
		slot5 = slot3
		slot4 = slot3.GetComponent
		slot6 = typeof
		slot7 = Image
		slot4 = slot4(slot5, slot6(slot7))
		slot5 = Color
		slot5 = slot5.New
		slot6 = 1
		slot7 = 1
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)
		slot4.color = slot5
		slot4 = setActive
		slot5 = slot0._bg
		slot6 = true

		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot3
		slot6 = true

		slot4(slot5, slot6)

		slot4 = LoadSprite
		slot5 = "bg/"
		slot6 = slot1.bgName
		slot5 = slot5 .. slot6
		slot4 = slot4(slot5)
		slot5 = setImageSprite
		slot6 = slot3
		slot7 = slot4

		slot5(slot6, slot7)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 139-141, warpins: 2 ---
	slot3 = slot1.side

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 142-142, warpins: 1 ---
		slot3 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 143-156, warpins: 2 ---
	slot5 = slot0
	slot4 = slot0.getTagetActorTF
	slot6 = slot3
	slot4, slot5 = slot4(slot5, slot6)
	slot6 = _
	slot6 = slot6.each
	slot7 = slot0.actors

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = LeanTween
		slot1 = slot1.isTweening
		slot2 = slot0.gameObject
		slot1 = slot1(slot2)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-13, warpins: 1 ---
			slot1 = LeanTween
			slot1 = slot1.cancel
			slot2 = go
			slot3 = slot0
			slot2 = slot2(slot3)
			slot3 = true

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-18, warpins: 2 ---
		slot1 = setActive
		slot2 = slot0
		slot3 = slot0

		if slot0 ~= slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-20, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-21, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 22-23, warpins: 2 ---
		slot1(slot2, slot3)

		return
		--- END OF BLOCK #2 ---



	end

	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.actorLeft
	slot8 = slot0.actorLeft

	if slot4 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 157-158, warpins: 1 ---
		slot8 = slot1.actor
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 159-160, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 161-161, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 162-167, warpins: 3 ---
	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.actorRight
	slot8 = slot0.actorRight

	if slot4 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 168-169, warpins: 1 ---
		slot8 = slot1.actor
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 170-171, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 172-172, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 173-178, warpins: 3 ---
	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.actorMiddle
	slot8 = slot0.actorMiddle

	if slot4 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 179-180, warpins: 1 ---
		slot8 = slot1.actor
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 181-182, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 183-183, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 184-189, warpins: 3 ---
	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.nameLeft
	slot8 = slot0.nameLeft

	if slot5 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 190-192, warpins: 1 ---
		slot8 = slot1.actor

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 193-195, warpins: 1 ---
			slot8 = slot1.actorName

			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 196-198, warpins: 2 ---
				slot8 = slot1.withoutActorName
				slot8 = not slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 199-200, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 201-201, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 202-207, warpins: 4 ---
	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.nameRight
	slot8 = slot0.nameRight

	if slot5 == slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 208-210, warpins: 1 ---
		slot8 = slot1.actor

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 211-213, warpins: 1 ---
			slot8 = slot1.actorName

			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 214-216, warpins: 2 ---
				slot8 = slot1.withoutActorName
				slot8 = not slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 217-218, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 219-219, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 220-223, warpins: 4 ---
	slot6(slot7, slot8)

	slot6 = slot1.actorPosition

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 224-230, warpins: 1 ---
		slot6 = Vector3
		slot7 = slot4.localPosition
		slot7 = slot7.x
		slot8 = slot1.actorPosition
		slot8 = slot8.x

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 231-231, warpins: 1 ---
			slot8 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 232-238, warpins: 2 ---
		slot7 = slot7 + slot8
		slot8 = slot4.localPosition
		slot8 = slot8.y
		slot9 = slot1.actorPosition
		slot9 = slot9.y

		if not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 239-239, warpins: 1 ---
			slot9 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 240-243, warpins: 2 ---
		slot8 = slot8 + slot9
		slot9 = 0
		slot6 = slot6(slot7, slot8, slot9)
		slot4.localPosition = slot6
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 244-249, warpins: 2 ---
	slot7 = slot4
	slot6 = slot4.SetAsLastSibling

	slot6(slot7)

	slot6 = slot1.actor

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 250-252, warpins: 1 ---
		slot6 = slot1.sound

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 253-256, warpins: 1 ---
			slot6 = playStorySound
			slot7 = slot1.sound

			slot6(slot7)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 257-258, warpins: 1 ---
			slot6 = stopStorySound

			slot6()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 259-265, warpins: 2 ---
		slot7 = slot0
		slot6 = slot0.getNameAndPainting
		slot8 = slot1
		slot6, slot7 = slot6(slot7, slot8)
		slot8 = slot1.painting

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 266-266, warpins: 1 ---
			slot8 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 267-269, warpins: 2 ---
		slot9 = slot1.nameColor

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 270-275, warpins: 1 ---
			slot9 = setColorStr
			slot10 = slot6
			slot11 = slot1.nameColor
			slot9 = slot9(slot10, slot11)

			if not slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 276-280, warpins: 2 ---
				slot9 = setColorStr
				slot10 = slot6
				slot11 = COLOR_WHITE
				slot9 = slot9(slot10, slot11)
				slot6 = slot9
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 281-293, warpins: 2 ---
		slot9 = setText
		slot11 = slot5
		slot10 = slot5.Find
		slot12 = "Text"
		slot10 = slot10(slot11, slot12)
		slot11 = HXSet
		slot11 = slot11.hxLan
		slot12 = slot6

		slot9(slot10, slot11(slot12))

		slot9 = slot1.withoutPainting

		if not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 294-296, warpins: 1 ---
			slot9 = slot0.preStep

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 297-299, warpins: 1 ---
				slot9 = slot1.paintingFadeOut

				if slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 300-315, warpins: 1 ---
					slot9 = false
					slot0.interactive = slot9
					slot9 = setActive
					slot10 = slot4
					slot11 = false

					slot9(slot10, slot11)

					slot9 = setActive
					slot10 = slot0._main
					slot11 = false

					slot9(slot10, slot11)

					slot10 = slot0
					slot9 = slot0.paintingFadeOut
					slot11 = slot0.preStep
					slot12 = slot1

					function slot13()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-13, warpins: 1 ---
						slot0 = setActive
						slot1 = slot0
						slot2 = true

						slot0(slot1, slot2)

						slot0 = setActive
						slot1 = slot1
						slot1 = slot1._main
						slot2 = true

						slot0(slot1, slot2)

						slot0 = slot1
						slot1 = true
						slot0.interactive = slot1

						return
						--- END OF BLOCK #0 ---



					end

					slot9(slot10, slot11, slot12, slot13)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 316-322, warpins: 3 ---
			function slot9(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot1 = findTF
				slot2 = slot0
				slot3 = "face"
				slot1 = slot1(slot2, slot3)
				slot2 = Ship
				slot2 = slot2.SetExpression
				slot3 = slot0
				slot4 = slot0
				slot5 = "default"
				slot2 = slot2(slot3, slot4, slot5)
				slot3 = slot1
				slot3 = slot3.expression

				if slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-25, warpins: 1 ---
					slot3 = GetSpriteFromAtlas
					slot4 = "paintingface/"
					slot5 = slot0
					slot4 = slot4 .. slot5
					slot5 = slot1
					slot5 = slot5.expression
					slot3 = slot3(slot4, slot5)
					slot4 = setActive
					slot5 = slot1

					if not slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-27, warpins: 1 ---
						slot6 = slot1
						slot6 = slot6.expression
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 28-32, warpins: 2 ---
					slot4(slot5, slot6)

					slot4 = setImageSprite
					slot5 = slot1
					slot6 = slot3

					slot4(slot5, slot6)
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 33-36, warpins: 2 ---
				slot3 = slot1
				slot3 = slot3.paingtingGray

				if slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-40, warpins: 1 ---
					slot3 = onNextTick

					function slot4()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-5, warpins: 1 ---
						slot0 = setGray
						slot1 = slot0
						slot2 = true

						slot0(slot1, slot2)

						return
						--- END OF BLOCK #0 ---



					end

					slot3(slot4)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 41-44, warpins: 1 ---
					slot3 = setGray
					slot4 = slot0
					slot5 = false

					slot3(slot4, slot5)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 45-50, warpins: 2 ---
				slot3 = findTF
				slot4 = slot0
				slot5 = "shadow"
				slot3 = slot3(slot4, slot5)

				if slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-55, warpins: 1 ---
					slot4 = setActive
					slot5 = slot3
					slot6 = slot1
					slot6 = slot6.actorShadow

					slot4(slot5, slot6)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 56-62, warpins: 2 ---
				slot4 = defaultValue
				slot5 = slot1
				slot5 = slot5.recordPaint
				slot6 = true
				slot4 = slot4(slot5, slot6)

				if slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 63-67, warpins: 1 ---
					slot4 = slot2
					slot5 = slot3
					slot5 = slot5.CENTER

					if slot4 == slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 68-69, warpins: 1 ---
						slot4 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 70-70, warpins: 1 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 71-74, warpins: 3 ---
				slot5 = slot1
				slot5 = slot5.actorScale

				if not slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 75-75, warpins: 1 ---
					slot5 = 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 76-79, warpins: 2 ---
				slot6 = slot1
				slot6 = slot6.dir

				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 80-84, warpins: 1 ---
					slot6 = slot1
					slot6 = slot6.dir
					slot7 = 0

					if slot6 < slot7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 85-86, warpins: 1 ---
						slot6 = -1
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 87-87, warpins: 2 ---
					slot6 = 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 88-99, warpins: 2 ---
				slot7 = slot4
				slot7 = slot7.transform
				slot8 = Vector3
				slot9 = slot6 * slot5
				slot10 = slot5
				slot11 = slot5
				slot8 = slot8(slot9, slot10, slot11)
				slot7.localScale = slot8
				slot7 = slot5
				slot7 = slot7.preStep

				if slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 100-106, warpins: 1 ---
					slot7 = slot5
					slot7 = slot7.preStep
					slot7 = slot7.side
					slot8 = slot1
					slot8 = slot8.side

					if slot7 == slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 107-112, warpins: 1 ---
						slot7 = slot1
						slot7 = slot7.side
						slot8 = slot3
						slot8 = slot8.CENTER

						if slot7 ~= slot8 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 113-124, warpins: 1 ---
							slot7 = slot5
							slot8 = slot7
							slot7 = slot7.getTagetActorTF
							slot9 = slot1
							slot9 = slot9.side
							slot7, slot8, slot9 = slot7(slot8, slot9)
							slot10 = setActive
							slot11 = slot9
							slot12 = true

							slot10(slot11, slot12)

							return
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #6 ---

				FLOW; TARGET BLOCK #7



				-- Decompilation error in this vicinity:
				--- BLOCK #7 125-128, warpins: 4 ---
				slot7 = slot5
				slot7 = slot7.targetActorTF

				if slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 129-134, warpins: 1 ---
					slot7 = slot3
					slot7 = slot7.CENTER
					slot8 = slot1
					slot8 = slot8.side

					if slot7 ~= slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 135-138, warpins: 1 ---
						slot7 = slot1
						slot7 = slot7.hideOther

						if not slot7 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 139-153, warpins: 1 ---
							slot7 = setActive
							slot8 = slot5
							slot8 = slot8.targetActorTF
							slot9 = true

							slot7(slot8, slot9)

							slot7 = slot5
							slot8 = slot7
							slot7 = slot7.setFade
							slot9 = slot5
							slot9 = slot9.targetActorTF
							slot10 = 1
							slot11 = slot6
							slot11 = slot11.alpha

							if not slot11 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 154-154, warpins: 1 ---
								slot11 = slot7
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 155-158, warpins: 2 ---
							slot12 = slot6
							slot12 = slot12.time

							if not slot12 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 159-159, warpins: 1 ---
								slot12 = slot8
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 160-160, warpins: 2 ---
							slot7(slot8, slot9, slot10, slot11, slot12)
							--- END OF BLOCK #2 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #7 ---

				FLOW; TARGET BLOCK #8



				-- Decompilation error in this vicinity:
				--- BLOCK #8 161-165, warpins: 4 ---
				slot7 = slot5
				slot7 = slot7.targetActorTF
				slot8 = slot4

				if slot7 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 166-173, warpins: 1 ---
					slot7 = slot5
					slot8 = slot7
					slot7 = slot7.setFade
					slot9 = slot4
					slot10 = slot6
					slot10 = slot10.alpha

					if not slot10 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 174-174, warpins: 1 ---
						slot10 = slot7
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 175-179, warpins: 2 ---
					slot11 = 1
					slot12 = slot6
					slot12 = slot12.time

					if not slot12 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 180-180, warpins: 1 ---
						slot12 = slot8
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 181-184, warpins: 2 ---
					slot7(slot8, slot9, slot10, slot11, slot12)

					slot7 = slot5
					slot8 = slot4
					slot7.targetActorTF = slot8
					--- END OF BLOCK #2 ---



				end

				--- END OF BLOCK #8 ---

				FLOW; TARGET BLOCK #9



				-- Decompilation error in this vicinity:
				--- BLOCK #9 185-193, warpins: 2 ---
				slot7 = slot5
				slot8 = slot7
				slot7 = slot7.updatePainting
				slot9 = slot4
				slot10 = slot1
				slot10 = slot10.paintingNoise

				slot7(slot8, slot9, slot10)

				return
				--- END OF BLOCK #9 ---



			end

			slot10 = setPaintingPrefab
			slot11 = slot4
			slot12 = slot7
			slot13 = slot1.hidePaintObj

			if slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 323-324, warpins: 1 ---
				slot13 = "_n"
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 325-325, warpins: 1 ---
				slot13 = ""
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 326-346, warpins: 2 ---
			slot12 = slot12 .. slot13
			slot13 = "duihua"

			slot10(slot11, slot12, slot13)

			slot11 = slot0
			slot10 = slot0.setSubActors
			slot12 = slot4
			slot13 = slot1.subActors

			slot10(slot11, slot12, slot13)

			slot10 = slot9
			slot11 = findTF
			slot12 = slot4
			slot13 = "fitter"
			slot11 = slot11(slot12, slot13)
			slot12 = slot11
			slot11 = slot11.GetChild
			slot13 = 0

			slot10(slot11(slot12, slot13))

			slot10 = slot1.shake

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 347-350, warpins: 1 ---
				slot10 = slot1.shake
				slot10 = slot10.x

				if not slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 351-351, warpins: 1 ---
					slot10 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 352-355, warpins: 2 ---
				slot11 = slot1.shake
				slot11 = slot11.y

				if not slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 356-356, warpins: 1 ---
					slot11 = 10
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 357-376, warpins: 2 ---
				slot12 = tf
				slot13 = slot4
				slot12 = tf(slot4)
				slot12 = tf(slot4).localPosition
				slot13 = LeanTween
				slot13 = LeanTween.move
				slot14 = rtf
				slot15 = slot4
				slot14 = rtf(slot4)
				slot15 = Vector3
				slot16 = tf(slot4).localPosition.x
				slot16 = tf(slot4).localPosition.x + slot10
				slot17 = tf(slot4).localPosition.y
				slot17 = tf(slot4).localPosition.y + slot11
				slot18 = 0
				slot15 = Vector3(tf(slot4).localPosition.x + slot10, slot17, slot18)
				slot16 = slot1.shake
				slot16 = slot1.shake.speed
				slot16 = slot1.shake.speed or 1

				LeanTween.move(slot14, slot15, 1 / slot16):setLoopPingPong(slot1.shake.number or 1):setUseEstimatedTime(true)

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #3 377-377, warpins: 1 ---
				slot16 = 1
				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 378-385, warpins: 2 ---
				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #5 386-386, warpins: 1 ---
				slot15 = 1
				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 387-391, warpins: 2 ---
				--- END OF BLOCK #6 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 392-394, warpins: 2 ---
			slot10 = slot1.action

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 395-407, warpins: 1 ---
				slot10 = findTF
				slot11 = slot4
				slot12 = "fitter"
				slot10 = slot10(slot11, slot12)
				slot11 = slot10
				slot10 = slot10.GetChild
				slot12 = 0
				slot10 = slot10(slot11, slot12)
				slot11 = 0
				slot12 = ipairs
				slot13 = slot1.action
				slot12, slot13, slot14 = slot12(slot13)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 408-612, warpins: 0 ---
				for slot15, slot16 in slot12, slot13, slot14 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 408-410, warpins: 1 ---
					slot17 = slot16.type

					if slot17 == "shake" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 411-413, warpins: 1 ---
						slot17 = slot16.x

						if not slot17 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 414-414, warpins: 1 ---
							slot17 = 0
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 415-417, warpins: 2 ---
						slot18 = slot16.y

						if not slot18 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 418-418, warpins: 1 ---
							slot18 = 10
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 419-441, warpins: 2 ---
						slot19 = LeanTween
						slot19 = slot19.move
						slot20 = rtf
						slot21 = slot4
						slot20 = slot20(slot21)
						slot21 = Vector3
						slot22 = tf
						slot23 = slot4
						slot22 = slot22(slot23)
						slot22 = slot22.localPosition
						slot22 = slot22.x
						slot22 = slot22 + slot17
						slot23 = tf
						slot24 = slot4
						slot23 = slot23(slot24)
						slot23 = slot23.localPosition
						slot23 = slot23.y
						slot23 = slot23 + slot18
						slot24 = 0
						slot21 = slot21(slot22, slot23, slot24)
						slot22 = slot16.dur

						if not slot22 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 442-442, warpins: 1 ---
							slot22 = 1
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #2 ---

						FLOW; TARGET BLOCK #3



						-- Decompilation error in this vicinity:
						--- BLOCK #3 443-448, warpins: 2 ---
						slot19 = slot19(slot20, slot21, slot22)
						slot20 = slot19
						slot19 = slot19.setLoopPingPong
						slot21 = slot16.number

						if not slot21 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 449-449, warpins: 1 ---
							slot21 = 1
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #3 ---

						FLOW; TARGET BLOCK #4



						-- Decompilation error in this vicinity:
						--- BLOCK #4 450-459, warpins: 2 ---
						slot19 = slot19(slot20, slot21)
						slot20 = slot19
						slot19 = slot19.setUseEstimatedTime
						slot21 = true
						slot19 = slot19(slot20, slot21)
						slot20 = slot19
						slot19 = slot19.setDelay
						slot21 = slot16.delay

						if not slot21 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 460-460, warpins: 1 ---
							slot21 = 0
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #4 ---

						FLOW; TARGET BLOCK #5



						-- Decompilation error in this vicinity:
						--- BLOCK #5 461-464, warpins: 2 ---
						slot19(slot20, slot21)

						slot19 = slot16.delay

						if not slot19 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 465-465, warpins: 1 ---
							slot19 = 0
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #5 ---

						FLOW; TARGET BLOCK #6



						-- Decompilation error in this vicinity:
						--- BLOCK #6 466-468, warpins: 2 ---
						slot20 = slot16.dur

						if not slot20 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 469-469, warpins: 1 ---
							slot20 = 1
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #6 ---

						FLOW; TARGET BLOCK #7



						-- Decompilation error in this vicinity:
						--- BLOCK #7 470-473, warpins: 2 ---
						slot21 = slot16.number
						slot20 = slot20 * slot21
						slot11 = slot19 + slot20
						--- END OF BLOCK #7 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 474-476, warpins: 1 ---
						slot17 = slot16.type

						if slot17 == "zoom" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 477-479, warpins: 1 ---
							slot17 = slot16.from

							if not slot17 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 480-480, warpins: 1 ---
								slot17 = {
									0,
									0,
									0
								}
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 481-483, warpins: 2 ---
							slot18 = slot16.to

							if not slot18 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 484-484, warpins: 1 ---
								slot18 = {
									1,
									1,
									1
								}
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 485-502, warpins: 2 ---
							slot19 = slot16.dur
							slot20 = LeanTween
							slot20 = slot20.scale
							slot21 = rtf
							slot22 = slot4
							slot21 = slot21(slot22)
							slot22 = Vector3
							slot23 = slot18[1]
							slot24 = slot18[2]
							slot25 = slot18[3]
							slot22 = slot22(slot23, slot24, slot25)
							slot23 = slot19
							slot20 = slot20(slot21, slot22, slot23)
							slot21 = slot20
							slot20 = slot20.setDelay
							slot22 = slot16.delay

							if not slot22 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 503-503, warpins: 1 ---
								slot22 = 0
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #2 ---

							FLOW; TARGET BLOCK #3



							-- Decompilation error in this vicinity:
							--- BLOCK #3 504-507, warpins: 2 ---
							slot20(slot21, slot22)

							slot20 = slot16.delay

							if not slot20 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 508-508, warpins: 1 ---
								slot20 = 0
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #3 ---

							FLOW; TARGET BLOCK #4



							-- Decompilation error in this vicinity:
							--- BLOCK #4 509-511, warpins: 2 ---
							slot21 = slot16.dur

							if not slot21 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 512-512, warpins: 1 ---
								slot21 = 0
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #4 ---

							FLOW; TARGET BLOCK #5



							-- Decompilation error in this vicinity:
							--- BLOCK #5 513-514, warpins: 2 ---
							slot11 = slot20 + slot21
							--- END OF BLOCK #5 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 515-517, warpins: 1 ---
							slot17 = slot16.type

							if slot17 == "rotate" then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 518-526, warpins: 1 ---
								slot17 = LeanTween
								slot17 = slot17.rotate
								slot18 = rtf
								slot19 = slot4
								slot18 = slot18(slot19)
								slot19 = slot16.value
								slot20 = slot16.dur

								if not slot20 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 527-527, warpins: 1 ---
									slot20 = 1
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 528-533, warpins: 2 ---
								slot17 = slot17(slot18, slot19, slot20)
								slot18 = slot17
								slot17 = slot17.setLoopPingPong
								slot19 = slot16.number

								if not slot19 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 534-534, warpins: 1 ---
									slot19 = 1
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 535-544, warpins: 2 ---
								slot17 = slot17(slot18, slot19)
								slot18 = slot17
								slot17 = slot17.setUseEstimatedTime
								slot19 = true
								slot17 = slot17(slot18, slot19)
								slot18 = slot17
								slot17 = slot17.setDelay
								slot19 = slot16.delay

								if not slot19 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 545-545, warpins: 1 ---
									slot19 = 0
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #2 ---

								FLOW; TARGET BLOCK #3



								-- Decompilation error in this vicinity:
								--- BLOCK #3 546-549, warpins: 2 ---
								slot17(slot18, slot19)

								slot17 = slot16.delay

								if not slot17 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 550-550, warpins: 1 ---
									slot17 = 0
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #3 ---

								FLOW; TARGET BLOCK #4



								-- Decompilation error in this vicinity:
								--- BLOCK #4 551-553, warpins: 2 ---
								slot18 = slot16.dur

								if not slot18 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 554-554, warpins: 1 ---
									slot18 = 1
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #4 ---

								FLOW; TARGET BLOCK #5



								-- Decompilation error in this vicinity:
								--- BLOCK #5 555-558, warpins: 2 ---
								slot19 = slot16.number
								slot18 = slot18 * slot19
								slot11 = slot17 + slot18
								--- END OF BLOCK #5 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 559-561, warpins: 1 ---
								slot17 = slot16.type

								if slot17 == "move" then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 562-564, warpins: 1 ---
									slot17 = slot16.x

									if not slot17 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 565-565, warpins: 1 ---
										slot17 = 0
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 566-568, warpins: 2 ---
									slot18 = slot16.y

									if not slot18 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 569-569, warpins: 1 ---
										slot18 = 0
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #1 ---

									FLOW; TARGET BLOCK #2



									-- Decompilation error in this vicinity:
									--- BLOCK #2 570-592, warpins: 2 ---
									slot19 = LeanTween
									slot19 = slot19.move
									slot20 = rtf
									slot21 = slot4
									slot20 = slot20(slot21)
									slot21 = Vector3
									slot22 = tf
									slot23 = slot4
									slot22 = slot22(slot23)
									slot22 = slot22.localPosition
									slot22 = slot22.x
									slot22 = slot22 + slot17
									slot23 = tf
									slot24 = slot4
									slot23 = slot23(slot24)
									slot23 = slot23.localPosition
									slot23 = slot23.y
									slot23 = slot23 + slot18
									slot24 = 0
									slot21 = slot21(slot22, slot23, slot24)
									slot22 = slot16.dur

									if not slot22 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 593-593, warpins: 1 ---
										slot22 = 1
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #2 ---

									FLOW; TARGET BLOCK #3



									-- Decompilation error in this vicinity:
									--- BLOCK #3 594-599, warpins: 2 ---
									slot19 = slot19(slot20, slot21, slot22)
									slot20 = slot19
									slot19 = slot19.setDelay
									slot21 = slot16.delay

									if not slot21 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 600-600, warpins: 1 ---
										slot21 = 0
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #3 ---

									FLOW; TARGET BLOCK #4



									-- Decompilation error in this vicinity:
									--- BLOCK #4 601-604, warpins: 2 ---
									slot19(slot20, slot21)

									slot19 = slot16.delay

									if not slot19 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 605-605, warpins: 1 ---
										slot19 = 0
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #4 ---

									FLOW; TARGET BLOCK #5



									-- Decompilation error in this vicinity:
									--- BLOCK #5 606-608, warpins: 2 ---
									slot20 = slot16.dur

									if not slot20 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 609-609, warpins: 1 ---
										slot20 = 1
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #5 ---

									FLOW; TARGET BLOCK #6



									-- Decompilation error in this vicinity:
									--- BLOCK #6 610-610, warpins: 2 ---
									slot11 = slot19 + slot20
									--- END OF BLOCK #6 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 611-612, warpins: 6 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 613-623, warpins: 1 ---
				slot12 = true
				slot0.inAction = slot12
				slot12 = LeanTween
				slot12 = slot12.delayedCall
				slot13 = slot11
				slot14 = System
				slot14 = slot14.Action

				function slot15()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot0 = slot0
					slot1 = nil
					slot0.inAction = slot1

					return
					--- END OF BLOCK #0 ---



				end

				slot12(slot13, slot14(slot15))
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #3 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 624-635, warpins: 1 ---
			slot9 = removeAllChildren
			slot11 = slot4
			slot10 = slot4.Find
			slot12 = "fitter"

			slot9(slot10(slot11, slot12))

			slot9 = removeAllChildren
			slot11 = slot4
			slot10 = slot4.Find
			slot12 = "actor_sub"

			slot9(slot10(slot11, slot12))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 636-636, warpins: 3 ---
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 637-651, warpins: 1 ---
		slot6 = removeAllChildren
		slot8 = slot4
		slot7 = slot4.Find
		slot9 = "fitter"

		slot6(slot7(slot8, slot9))

		slot6 = removeAllChildren
		slot8 = slot4
		slot7 = slot4.Find
		slot9 = "actor_sub"

		slot6(slot7(slot8, slot9))

		slot6 = slot1.actorName

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 652-654, warpins: 1 ---
			slot6 = slot1.nameColor

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 655-660, warpins: 1 ---
				slot6 = setColorStr
				slot7 = slot1.actorName
				slot8 = slot1.nameColor
				slot6 = slot6(slot7, slot8)

				if not slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 661-664, warpins: 2 ---
					slot6 = setColorStr
					slot7 = slot1.actorName
					slot8 = COLOR_WHITE
					slot6 = slot6(slot7, slot8)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 665-679, warpins: 2 ---
			slot7 = HXSet
			slot7 = slot7.hxLan
			slot8 = slot6
			slot7 = slot7(slot8)
			slot6 = slot7
			slot7 = setText
			slot9 = slot5
			slot8 = slot5.Find
			slot10 = "Text"
			slot8 = slot8(slot9, slot10)
			slot9 = HXSet
			slot9 = slot9.hxLan
			slot10 = slot6

			slot7(slot8, slot9(slot10))
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 680-683, warpins: 3 ---
	function slot6()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0 = setText
		slot1 = slot0
		slot1 = slot1.content
		slot2 = slot1
		slot2 = slot2.say

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-8, warpins: 1 ---
			slot2 = "..."
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-13, warpins: 2 ---
		slot0(slot1, slot2)

		slot0 = slot1
		slot0 = slot0.typewriter

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.TypeWriter
			slot2 = slot1

			slot0(slot1, slot2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot7 = slot1.flashin

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 684-689, warpins: 1 ---
		slot8 = slot0
		slot7 = slot0.flashin
		slot9 = slot1

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end

		slot7(slot8, slot9, slot10)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 690-691, warpins: 1 ---
		slot7 = slot6

		slot7()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 692-695, warpins: 2 ---
	slot0.preStep = slot1
	slot7 = slot1.blackBg

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 696-702, warpins: 1 ---
		slot7 = setActive
		slot8 = slot0._curtain
		slot9 = true

		slot7(slot8, slot9)

		slot7 = slot0._curtainCG
		slot8 = 1
		slot7.alpha = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 703-704, warpins: 2 ---
	return
	--- END OF BLOCK #13 ---



end

slot0.initDialog = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot3 = true
	slot0.inflashin = slot3
	slot3 = setText
	slot4 = slot0.content
	slot5 = ""

	slot3(slot4, slot5)

	slot3 = slot0._flash
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Image
	slot3 = slot3(slot4, slot5(slot6))
	slot4 = slot1.flashin
	slot4 = slot4.black

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-24, warpins: 1 ---
		slot4 = Color
		slot5 = 0
		slot6 = 0
		slot7 = 0
		slot4 = slot4(slot5, slot6, slot7)

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 2 ---
			slot4 = Color
			slot5 = 1
			slot6 = 1
			slot7 = 1
			slot4 = slot4(slot5, slot6, slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-78, warpins: 2 ---
	slot3.color = slot4
	slot4 = slot0._flashCG
	slot5 = slot1.flashin
	slot5 = slot5.alpha
	slot5 = slot5[1]
	slot4.alpha = slot5
	slot4 = setActive
	slot5 = slot0._flash
	slot6 = true

	slot4(slot5, slot6)

	slot4 = LeanTween
	slot4 = slot4.value
	slot5 = go
	slot6 = slot0._flash
	slot5 = slot5(slot6)
	slot6 = slot1.flashin
	slot6 = slot6.alpha
	slot6 = slot6[1]
	slot7 = slot1.flashin
	slot7 = slot7.alpha
	slot7 = slot7[2]
	slot8 = slot1.flashin
	slot8 = slot8.dur
	slot4 = slot4(slot5, slot6, slot7, slot8)
	slot5 = slot4
	slot4 = slot4.setDelay
	slot6 = slot1.flashin
	slot6 = slot6.delay
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.setUseEstimatedTime
	slot6 = true
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.setOnUpdate
	slot6 = System
	slot6 = slot6.Action_float

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1._flashCG
		slot1.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end

	slot4 = slot4(slot5, slot6(slot7))
	slot5 = slot4
	slot4 = slot4.setOnComplete
	slot6 = System
	slot6 = slot6.Action

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0 = slot0

			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-9, warpins: 2 ---
		slot0 = slot1
		slot1 = nil
		slot0.inflashin = slot1

		return
		--- END OF BLOCK #1 ---



	end

	slot4(slot5, slot6(slot7))

	return
	--- END OF BLOCK #1 ---



end

slot0.flashin = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = true
	slot0.inflashout = slot3
	slot3 = slot0._flash
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Image
	slot3 = slot3(slot4, slot5(slot6))
	slot4 = slot1.flashout
	slot4 = slot4.black

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 1 ---
		slot4 = Color
		slot5 = 0
		slot6 = 0
		slot7 = 0
		slot4 = slot4(slot5, slot6, slot7)

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-25, warpins: 2 ---
			slot4 = Color
			slot5 = 1
			slot6 = 1
			slot7 = 1
			slot4 = slot4(slot5, slot6, slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-69, warpins: 2 ---
	slot3.color = slot4
	slot4 = slot0._flashCG
	slot5 = slot1.flashout
	slot5 = slot5.alpha
	slot5 = slot5[1]
	slot4.alpha = slot5
	slot4 = setActive
	slot5 = slot0._flash
	slot6 = true

	slot4(slot5, slot6)

	slot4 = LeanTween
	slot4 = slot4.value
	slot5 = go
	slot6 = slot0._flash
	slot5 = slot5(slot6)
	slot6 = slot1.flashout
	slot6 = slot6.alpha
	slot6 = slot6[1]
	slot7 = slot1.flashout
	slot7 = slot7.alpha
	slot7 = slot7[2]
	slot8 = slot1.flashout
	slot8 = slot8.dur
	slot4 = slot4(slot5, slot6, slot7, slot8)
	slot5 = slot4
	slot4 = slot4.setUseEstimatedTime
	slot6 = true
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.setOnUpdate
	slot6 = System
	slot6 = slot6.Action_float

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1._flashCG
		slot1.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end

	slot4 = slot4(slot5, slot6(slot7))
	slot5 = slot4
	slot4 = slot4.setOnComplete
	slot6 = System
	slot6 = slot6.Action

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0 = slot0

			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-9, warpins: 2 ---
		slot0 = slot1
		slot1 = nil
		slot0.inflashout = slot1

		return
		--- END OF BLOCK #1 ---



	end

	slot4(slot5, slot6(slot7))

	return
	--- END OF BLOCK #1 ---



end

slot0.flashout = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot3 = slot1.typewriter
	slot4 = slot3.speed

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot4 = 0.1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-13, warpins: 2 ---
	slot5 = Time
	slot5 = slot5.timeScale
	slot4 = slot4 * slot5
	slot5 = true
	slot0.inTypeWritter = slot5
	slot5 = slot3.speedUp

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot5 = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-29, warpins: 2 ---
	slot0.typeWritterSpeedUp = slot5
	slot5 = slot0.typeWriter
	slot6 = slot5
	slot5 = slot5.setSpeed
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = slot0.typeWriter
	slot6 = slot5
	slot5 = slot5.Play

	slot5(slot6)

	slot5 = slot0.typeWriter

	function slot6()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot0 = slot0
		slot1 = false
		slot0.inTypeWritter = slot1
		slot0 = slot0
		slot1 = nil
		slot0.typeWritterSpeedUp = slot1
		slot0 = slot0
		slot0 = slot0.typeWriteCallback

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			slot1 = slot0

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot5.endFunc = slot6

	return
	--- END OF BLOCK #2 ---



end

slot0.TypeWriter = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2, slot3, slot4 = nil
	slot5 = slot0
	slot5 = slot5.LEFT

	if slot1 == slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot2 = slot0.actorLeft
		slot3 = slot0.nameLeft
		slot4 = slot0.actorRight
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		slot5 = slot0
		slot5 = slot5.RIGHT

		if slot1 == slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot2 = slot0.actorRight
			slot3 = slot0.nameRight
			slot4 = slot0.actorLeft
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-21, warpins: 1 ---
			slot5 = slot0
			slot5 = slot5.CENTER

			if slot1 == slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-23, warpins: 1 ---
				slot2 = slot0.actorMiddle
				slot3 = slot0.nameLeft
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-27, warpins: 4 ---
	slot5 = slot2
	slot6 = slot3
	slot7 = slot4

	return slot5, slot6, slot7
	--- END OF BLOCK #1 ---



end

slot0.getTagetActorTF = slot17

function slot17(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot4 = slot2.painting

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot5 = slot1.side
	slot6 = slot2.side

	if slot5 == slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			slot5 = slot3

			slot5()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-42, warpins: 1 ---
	slot6 = slot0
	slot5 = slot0.getTagetActorTF
	slot7 = slot1.side
	slot5 = slot5(slot6, slot7)
	slot6 = slot2.paintingFadeOut
	slot6 = slot6.side
	slot7 = slot2.paintingFadeOut
	slot7 = slot7.time
	slot9 = slot0
	slot8 = slot0.getNameAndPainting
	slot10 = slot1
	slot8, slot9 = slot8(slot9, slot10)
	slot10 = setActive
	slot11 = slot5
	slot12 = true

	slot10(slot11, slot12)

	slot10 = slot5.anchoredPosition
	slot12 = slot0
	slot11 = slot0.getTagetActorTF
	slot13 = slot6
	slot11 = slot11(slot12, slot13)
	slot12 = setPaintingPrefab
	slot13 = slot11
	slot14 = slot9
	slot15 = "duihua"

	slot12(slot13, slot14, slot15)

	slot12 = slot1.actorScale

	if not slot12 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-43, warpins: 1 ---
		slot12 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 44-46, warpins: 2 ---
	slot13 = slot1.dir

	if slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-50, warpins: 1 ---
		slot13 = slot1.dir
		slot14 = 0

		if slot13 < slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-52, warpins: 1 ---
			slot13 = -1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-53, warpins: 2 ---
		slot13 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 54-72, warpins: 2 ---
	slot14 = slot11.transform
	slot15 = Vector3
	slot16 = slot13 * slot12
	slot17 = slot12
	slot18 = slot12
	slot15 = slot15(slot16, slot17, slot18)
	slot14.localScale = slot15
	slot15 = slot0
	slot14 = slot0.setSubActors
	slot16 = slot11
	slot17 = slot1.subActors

	slot14(slot15, slot16, slot17)

	slot15 = slot0
	slot14 = slot0.setFade
	slot16 = slot11
	slot17 = 1
	slot18 = slot4.alpha

	if not slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-73, warpins: 1 ---
		slot18 = slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 74-102, warpins: 2 ---
	slot19 = 0

	slot14(slot15, slot16, slot17, slot18, slot19)

	slot14 = LeanTween
	slot14 = slot14.moveX
	slot15 = rtf
	slot16 = slot5
	slot15 = slot15(slot16)
	slot16 = slot11.localPosition
	slot16 = slot16.x
	slot17 = slot7
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = slot14
	slot14 = slot14.setUseEstimatedTime
	slot16 = true
	slot14 = slot14(slot15, slot16)
	slot15 = slot14
	slot14 = slot14.setOnComplete
	slot16 = System
	slot16 = slot16.Action

	function slot17()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot0 = slot0

			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-17, warpins: 2 ---
		slot0 = setActive
		slot1 = slot1
		slot2 = false

		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot2
		slot2 = true

		slot0(slot1, slot2)

		slot0 = slot1
		slot1 = slot3
		slot0.anchoredPosition = slot1

		return
		--- END OF BLOCK #1 ---



	end

	slot14(slot15, slot16(slot17))

	slot15 = slot0
	slot14 = slot0.setFade
	slot16 = slot5
	slot17 = 1
	slot18 = slot4.alpha

	if not slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 103-103, warpins: 1 ---
		slot18 = slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 104-107, warpins: 2 ---
	slot19 = slot7

	slot14(slot15, slot16, slot17, slot18, slot19)

	return
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 108-108, warpins: 2 ---
	--- END OF BLOCK #7 ---



end

slot0.paintingFadeOut = slot17

function slot17(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot5 = LeanTween
	slot5 = slot5.scale
	slot6 = rtf
	slot7 = slot1
	slot6 = slot6(slot7)
	slot7 = slot3
	slot8 = slot4
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot5
	slot5 = slot5.setUseEstimatedTime
	slot7 = true
	slot5 = slot5(slot6, slot7)
	slot6 = slot5
	slot5 = slot5.setFrom
	slot7 = slot2

	slot5(slot6, slot7)

	return
	--- END OF BLOCK #0 ---



end

slot0.setScale = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0.inFadeOut

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-26, warpins: 1 ---
	slot2 = LeanTween
	slot2 = slot2.value
	slot3 = go
	slot4 = target
	slot3 = slot3(slot4)
	slot4 = 1
	slot5 = 0
	slot6 = slot1
	slot2 = slot2(slot3, slot4, slot5, slot6)
	slot3 = slot2
	slot2 = slot2.setUseEstimatedTime
	slot4 = true
	slot2 = slot2(slot3, slot4)
	slot3 = slot2
	slot2 = slot2.setOnUpdate
	slot4 = System
	slot4 = slot4.Action_float

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1._curtainCG
		slot1.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end

	slot2(slot3, slot4(slot5))

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.setCurtainFade = slot17

function slot17(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot5 = {}
	slot6 = {}

	function slot7(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.GetComponent
		slot4 = typeof
		slot5 = Image
		slot2 = slot2(slot3, slot4(slot5))
		slot3 = findTF
		slot4 = slot0
		slot5 = "face"
		slot3 = slot3(slot4, slot5)
		slot5 = slot3
		slot4 = slot3.GetComponent
		slot6 = typeof
		slot7 = Image
		slot4 = slot4(slot5, slot6(slot7))

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-32, warpins: 1 ---
			slot5 = Color
			slot5 = slot5.New
			slot6 = 0
			slot7 = 0
			slot8 = 0
			slot5 = slot5(slot6, slot7, slot8)
			slot2.color = slot5
			slot5 = Color
			slot5 = slot5.New
			slot6 = 0
			slot7 = 0
			slot8 = 0
			slot5 = slot5(slot6, slot7, slot8)
			slot4.color = slot5
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-58, warpins: 2 ---
		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0
		slot7 = slot2

		slot5(slot6, slot7)

		slot5 = table
		slot5 = slot5.insert
		slot6 = slot0
		slot7 = slot4

		slot5(slot6, slot7)

		slot5 = table
		slot5 = slot5.insert
		slot6 = slot1
		slot7 = slot0

		slot5(slot6, slot7)

		slot5 = table
		slot5 = slot5.insert
		slot6 = slot1
		slot7 = slot3

		slot5(slot6, slot7)

		slot5 = findTF
		slot6 = slot0
		slot7 = "shadow"
		slot5 = slot5(slot6, slot7)

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-76, warpins: 1 ---
			slot7 = slot5
			slot6 = slot5.GetComponent
			slot8 = typeof
			slot9 = Image
			slot6 = slot6(slot7, slot8(slot9))
			slot7 = Color
			slot7 = slot7.New
			slot8 = 0
			slot9 = 0
			slot10 = 0
			slot7 = slot7(slot8, slot9, slot10)
			slot6.color = slot7
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot0
			slot9 = slot6

			slot7(slot8, slot9)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 77-84, warpins: 2 ---
		slot6 = LeanTween
		slot6 = slot6.isTweening
		slot7 = go
		slot8 = slot0
		slot6 = slot6(slot7(slot8))

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-90, warpins: 1 ---
			slot6 = LeanTween
			slot6 = slot6.cancel
			slot7 = go
			slot8 = slot0

			slot6(slot7(slot8))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 91-96, warpins: 2 ---
		slot6 = findTF
		slot7 = slot0
		slot8 = "hx"
		slot6 = slot6(slot7, slot8)

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 97-101, warpins: 1 ---
			slot7 = 0
			slot8 = slot6.childCount
			slot8 = slot8 - 1
			slot9 = 1

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 102-126, warpins: 0 ---
			for slot10 = slot7, slot8, slot9 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 102-107, warpins: 2 ---
				slot12 = slot6
				slot11 = slot6.GetChild
				slot13 = slot10
				slot11 = slot11(slot12, slot13)

				if slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-115, warpins: 1 ---
					slot13 = slot11
					slot12 = slot11.GetComponent
					slot14 = typeof
					slot15 = Image
					slot12 = slot12(slot13, slot14(slot15))

					if slot12 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 116-125, warpins: 1 ---
						slot13 = table
						slot13 = slot13.insert
						slot14 = slot0
						slot15 = slot12

						slot13(slot14, slot15)

						slot13 = table
						slot13 = slot13.insert
						slot14 = slot1
						slot15 = slot11

						slot13(slot14, slot15)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 126-126, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 127-127, warpins: 2 ---
		return
		--- END OF BLOCK #4 ---



	end

	slot8 = findTF
	slot9 = slot1
	slot10 = "fitter"
	slot8 = slot8(slot9, slot10)
	slot9 = slot8
	slot8 = slot8.GetChild
	slot10 = 0
	slot8 = slot8(slot9, slot10)
	slot9 = slot7
	slot10 = slot8

	slot9(slot10)

	slot9 = findTF
	slot10 = slot1
	slot11 = "actor_sub"
	slot9 = slot9(slot10, slot11)

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		slot10 = slot9.childCount
		slot11 = 0

		if slot10 > slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-28, warpins: 1 ---
			slot10 = 1
			slot11 = slot9.childCount
			slot12 = 1

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-42, warpins: 0 ---
			for slot13 = slot10, slot11, slot12 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-42, warpins: 2 ---
				slot14 = slot7
				slot15 = findTF
				slot17 = slot9
				slot16 = slot9.GetChild
				slot18 = slot13 - 1
				slot16 = slot16(slot17, slot18)
				slot17 = "fitter"
				slot15 = slot15(slot16, slot17)
				slot16 = slot15
				slot15 = slot15.GetChild
				slot17 = 0

				slot14(slot15(slot16, slot17))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 43-73, warpins: 3 ---
	slot10 = false
	slot0.interactive = slot10
	slot10 = LeanTween
	slot10 = slot10.value
	slot11 = go
	slot12 = slot1
	slot11 = slot11(slot12)
	slot12 = slot2
	slot13 = slot3
	slot14 = slot4
	slot10 = slot10(slot11, slot12, slot13, slot14)
	slot11 = slot10
	slot10 = slot10.setUseEstimatedTime
	slot12 = true
	slot10 = slot10(slot11, slot12)
	slot11 = slot10
	slot10 = slot10.setOnUpdate
	slot12 = System
	slot12 = slot12.Action_float

	function slot13(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = ipairs
		slot2 = slot0
		slot1, slot2, slot3 = slot1(slot2)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-18, warpins: 0 ---
		for slot4, slot5 in slot1, slot2, slot3 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-9, warpins: 1 ---
			slot6 = IsNil
			slot7 = slot5
			slot6 = slot6(slot7)

			if not slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-16, warpins: 1 ---
				slot6 = Color
				slot6 = slot6.New
				slot7 = slot0
				slot8 = slot0
				slot9 = slot0
				slot6 = slot6(slot7, slot8, slot9)
				slot5.color = slot6
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-18, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-19, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot10 = slot10(slot11, slot12(slot13))
	slot11 = slot10
	slot10 = slot10.setOnComplete
	slot12 = System
	slot12 = slot12.Action

	function slot13()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0 = slot0
		slot1 = true
		slot0.interactive = slot1

		return
		--- END OF BLOCK #0 ---



	end

	slot10(slot11, slot12(slot13))

	return
	--- END OF BLOCK #1 ---



end

slot0.setFade = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot2 = slot0
	slot3 = "enter bg mode............"

	slot2(slot3)

	slot2 = setActive
	slot3 = slot0._bg
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._asideContainer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._asideContainer2
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.actorLeft
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.actorRight
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.actorMiddle
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._curtain
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._dialogue
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot1.blackBg

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-45, warpins: 1 ---
		slot2 = setActive
		slot3 = slot0._curtain
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0._curtainCG
		slot3 = 1
		slot2.alpha = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 46-48, warpins: 2 ---
	slot2 = slot1.flashin

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-52, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.flashin
		slot4 = slot1

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 53-55, warpins: 2 ---
	slot2 = slot1.side

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-56, warpins: 1 ---
		slot2 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-61, warpins: 2 ---
	slot3 = setActive
	slot4 = slot0.nameRight
	slot5 = slot1.side

	if slot5 ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-63, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-64, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 65-70, warpins: 2 ---
	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.nameLeft
	slot5 = slot1.side

	if slot5 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-72, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-73, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 74-78, warpins: 2 ---
	slot3(slot4, slot5)

	function slot3(slot0, slot1, slot2, slot3, slot4)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		slot5 = LeanTween
		slot5 = slot5.value
		slot6 = go
		slot7 = slot0
		slot7 = slot7._bg
		slot6 = slot6(slot7)
		slot7 = slot0
		slot8 = slot1
		slot9 = slot2
		slot5 = slot5(slot6, slot7, slot8, slot9)
		slot6 = slot5
		slot5 = slot5.setUseEstimatedTime
		slot7 = true
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.setOnUpdate
		slot7 = System
		slot7 = slot7.Action_float

		function slot8(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot1 = slot0
			slot1 = slot1._bgCG
			slot1.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end

		slot5 = slot5(slot6, slot7(slot8))
		slot6 = slot5
		slot5 = slot5.setDelay

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot7 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-36, warpins: 2 ---
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.setOnComplete
		slot7 = System
		slot7 = slot7.Action

		function slot8()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = slot0

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-5, warpins: 1 ---
				slot0 = slot0

				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-6, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot5(slot6, slot7(slot8))

		return
		--- END OF BLOCK #1 ---



	end

	slot4 = slot1.bgSpeed

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-79, warpins: 1 ---
		slot4 = 0.5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 80-82, warpins: 2 ---
	slot5 = slot1.bgName

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-100, warpins: 1 ---
		slot5 = slot0._bgCG
		slot6 = 1
		slot5.alpha = slot6
		slot5 = setActive
		slot6 = slot0._subBg
		slot7 = false

		slot5(slot6, slot7)

		slot5 = setActive
		slot6 = slot0._bg2
		slot7 = false

		slot5(slot6, slot7)

		slot5 = setActive
		slot6 = slot0._bg1
		slot7 = false

		slot5(slot6, slot7)

		slot5 = slot1.useBg2

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 101-103, warpins: 1 ---
			slot5 = slot0._bg2

			if not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 104-104, warpins: 2 ---
				slot5 = slot0._bg1
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 105-133, warpins: 2 ---
		slot7 = slot5
		slot6 = slot5.GetComponent
		slot8 = typeof
		slot9 = Image
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = Color
		slot7 = slot7.New
		slot8 = 1
		slot9 = 1
		slot10 = 1
		slot7 = slot7(slot8, slot9, slot10)
		slot6.color = slot7
		slot6 = setActive
		slot7 = slot0._bg
		slot8 = true

		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot5
		slot8 = true

		slot6(slot7, slot8)

		slot6 = LoadSprite
		slot7 = "bg/"
		slot8 = slot1.bgName
		slot7 = slot7 .. slot8
		slot6 = slot6(slot7)
		slot7 = slot0.preBg

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-137, warpins: 1 ---
			slot7 = slot0.preBg
			slot8 = slot1.bgName

			if slot7 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 138-147, warpins: 1 ---
				slot7 = false
				slot0.interactive = slot7
				slot7 = slot3
				slot8 = 1
				slot9 = 0
				slot10 = slot4
				slot11 = 0

				function slot12()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-12, warpins: 1 ---
					slot0 = setImageSprite
					slot1 = slot0
					slot2 = slot1

					slot0(slot1, slot2)

					slot0 = slot2
					slot1 = 0
					slot2 = 1
					slot3 = slot3
					slot4 = 0

					function slot5()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-4, warpins: 1 ---
						slot0 = slot0
						slot1 = true
						slot0.interactive = slot1

						return
						--- END OF BLOCK #0 ---



					end

					slot0(slot1, slot2, slot3, slot4, slot5)

					return
					--- END OF BLOCK #0 ---



				end

				slot7(slot8, slot9, slot10, slot11, slot12)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 148-150, warpins: 2 ---
			slot7 = slot0.preBg

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 151-154, warpins: 1 ---
				slot7 = slot0.preBg
				slot8 = slot1.bgName

				if slot7 == slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 155-155, warpins: 1 ---
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 156-168, warpins: 2 ---
				slot7 = slot0._bgCG
				slot8 = 0
				slot7.alpha = slot8
				slot7 = setImageSprite
				slot8 = slot5
				slot9 = slot6

				slot7(slot8, slot9)

				slot7 = slot3
				slot8 = 0
				slot9 = 1
				slot10 = slot4
				slot11 = 0

				slot7(slot8, slot9, slot10, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 169-171, warpins: 3 ---
		slot7 = slot1.bgName
		slot0.preBg = slot7
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 172-174, warpins: 2 ---
	slot5 = slot1.bgFade

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 175-187, warpins: 1 ---
		slot5 = false
		slot0.interactive = slot5
		slot5 = slot3
		slot6 = 1
		slot7 = 0
		slot8 = slot4
		slot9 = 0

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0 = slot0
			slot1 = true
			slot0.interactive = slot1
			slot0 = slot1
			slot0 = slot0.blankScreen

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-29, warpins: 1 ---
				slot0 = slot0
				slot1 = true
				slot0.blankScreen = slot1
				slot0 = SetActive
				slot1 = slot0
				slot1 = slot1._curtain
				slot2 = true

				slot0(slot1, slot2)

				slot0 = slot0
				slot1 = Timer
				slot1 = slot1.New

				function slot2()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-13, warpins: 1 ---
					slot0 = SetActive
					slot1 = slot0
					slot1 = slot1._curtain
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot0
					slot1 = nil
					slot0.blankScreen = slot1
					slot0 = triggerButton
					slot1 = slot0
					slot1 = slot1._go

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot3 = slot1
				slot3 = slot3.blankScreen
				slot4 = 1
				slot1 = slot1(slot2, slot3, slot4)
				slot0.blankScreenTimer = slot1
				slot0 = slot0
				slot0 = slot0.blankScreenTimer
				slot1 = slot0
				slot0 = slot0.Start

				slot0(slot1)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-30, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot5(slot6, slot7, slot8, slot9, slot10)

		slot5 = SetActive
		slot6 = slot0._dialogue
		slot7 = false

		slot5(slot6, slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 188-190, warpins: 2 ---
	slot5 = slot1.subBgName

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 191-209, warpins: 1 ---
		slot5 = setActive
		slot6 = slot0._subBg
		slot7 = true

		slot5(slot6, slot7)

		slot5 = LoadSprite
		slot6 = "bg/"
		slot7 = slot1.subBgName
		slot7 = slot7.name
		slot6 = slot6 .. slot7
		slot5 = slot5(slot6)
		slot6 = setImageSprite
		slot7 = slot0._subBg
		slot8 = slot5
		slot9 = true

		slot6(slot7, slot8, slot9)

		slot6 = slot1.subBgName
		slot6 = slot6.anchors

		if not slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 210-210, warpins: 1 ---
			slot6 = {
				0.5,
				0.5,
				0.5,
				0.5
			}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 211-226, warpins: 2 ---
		slot7 = slot0._subBg
		slot8 = Vector2
		slot9 = slot6[1]
		slot10 = slot6[2]
		slot8 = slot8(slot9, slot10)
		slot7.anchorMin = slot8
		slot7 = slot0._subBg
		slot8 = Vector2
		slot9 = slot6[3]
		slot10 = slot6[4]
		slot8 = slot8(slot9, slot10)
		slot7.anchorMax = slot8
		slot7 = slot1.subBgName
		slot7 = slot7.pivot

		if not slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 227-227, warpins: 1 ---
			slot7 = {
				0.5,
				0.5
			}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 228-237, warpins: 2 ---
		slot8 = slot0._subBg
		slot9 = Vector2
		slot10 = slot7[1]
		slot11 = slot7[2]
		slot9 = slot9(slot10, slot11)
		slot8.pivot = slot9
		slot8 = slot1.subBgName
		slot8 = slot8.pos

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 238-238, warpins: 1 ---
			slot8 = {
				0,
				0
			}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 239-244, warpins: 2 ---
		slot9 = slot0._subBg
		slot10 = Vector2
		slot11 = slot8[1]
		slot12 = slot8[2]
		slot10 = slot10(slot11, slot12)
		slot9.anchoredPosition = slot10
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 245-249, warpins: 2 ---
	slot5 = setText
	slot6 = slot0.content
	slot7 = slot1.say

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 250-250, warpins: 1 ---
		slot7 = "..."
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 251-258, warpins: 2 ---
	slot5(slot6, slot7)

	slot5 = setActive
	slot6 = slot0._dialogue
	slot7 = slot1.say

	slot5(slot6, slot7)

	slot5 = slot1.typewriter

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 259-262, warpins: 1 ---
		slot6 = slot0
		slot5 = slot0.TypeWriter
		slot7 = slot1

		slot5(slot6, slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 263-268, warpins: 2 ---
	slot6 = slot0
	slot5 = slot0.getNameAndPainting
	slot7 = slot1
	slot5 = slot5(slot6, slot7)

	if slot2 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 269-277, warpins: 1 ---
		slot6 = setText
		slot7 = slot0.nameLeft
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "Text"
		slot7 = slot7(slot8, slot9)
		slot8 = slot5

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 278-285, warpins: 1 ---
		slot6 = setText
		slot7 = slot0.nameRight
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "Text"
		slot7 = slot7(slot8, slot9)
		slot8 = slot5

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 286-287, warpins: 2 ---
	return
	--- END OF BLOCK #12 ---



end

slot0.initBg = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = ""
	slot3 = ""
	slot4 = slot1.actor

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		slot5 = 0

		if slot4 > slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-18, warpins: 1 ---
			slot5 = slot0
			slot5 = slot5[slot4]
			slot5 = slot5.ship_group
			slot6 = ShipGroup
			slot6 = slot6.getDefaultShipConfig
			slot7 = slot5
			slot6 = slot6(slot7)

			if not slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-22, warpins: 1 ---
				slot7 = slot0
				slot7 = slot7[slot4]
				slot2 = slot7.name
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-27, warpins: 1 ---
				slot7 = Ship
				slot7 = slot7.getShipName
				slot8 = slot6.id
				slot7 = slot7(slot8)
				slot2 = slot7
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-31, warpins: 2 ---
			slot7 = slot0
			slot7 = slot7[slot4]
			slot3 = slot7.painting
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-33, warpins: 1 ---
			if slot4 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-42, warpins: 1 ---
				slot5 = getProxy
				slot6 = PlayerProxy
				slot5 = slot5(slot6)
				slot7 = slot5
				slot6 = slot5.getData
				slot6 = slot6(slot7)
				slot2 = slot6.name
				slot3 = "unknown"
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-44, warpins: 1 ---
				if slot4 == -1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-49, warpins: 1 ---
					slot5 = getProxy
					slot6 = PlayerProxy
					slot5 = slot5(slot6)

					if slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 50-64, warpins: 1 ---
						slot7 = slot5
						slot6 = slot5.getData
						slot6 = slot6(slot7)
						slot7 = getProxy
						slot8 = BayProxy
						slot7 = slot7(slot8)
						slot8 = slot7
						slot7 = slot7.getShipById
						slot9 = slot6.character
						slot7 = slot7(slot8, slot9)
						slot2 = slot7.name
						slot9 = slot7
						slot8 = slot7.getPainting
						slot8 = slot8(slot9)
						slot3 = slot8
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 65-67, warpins: 6 ---
	slot5 = slot1.actorName

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-72, warpins: 1 ---
		slot5 = HXSet
		slot5 = slot5.hxLan
		slot6 = slot1.actorName
		slot5 = slot5(slot6)
		slot2 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 73-75, warpins: 2 ---
	slot5 = slot1.painting

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-76, warpins: 1 ---
		slot5 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 77-79, warpins: 2 ---
	slot6 = slot1.nameColor

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-85, warpins: 1 ---
		slot6 = setColorStr
		slot7 = slot2
		slot8 = slot1.nameColor
		slot6 = slot6(slot7, slot8)

		if not slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-90, warpins: 2 ---
			slot6 = setColorStr
			slot7 = slot2
			slot8 = COLOR_WHITE
			slot6 = slot6(slot7, slot8)
			slot2 = slot6
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 91-93, warpins: 2 ---
	slot6 = slot2
	slot7 = slot3

	return slot6, slot7
	--- END OF BLOCK #4 ---



end

slot0.getNameAndPainting = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = slot0
	slot4 = "enter bg Options............"

	slot3(slot4)

	slot3 = slot0.optionItems

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		slot3 = {}
		slot0.optionItems = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-15, warpins: 2 ---
	slot4 = slot0
	slot3 = slot0.removeOptBtns

	slot3(slot4)

	slot3 = ipairs
	slot4 = slot1.options
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-56, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-19, warpins: 1 ---
		slot8 = slot0.optionItems
		slot8 = slot8[slot6]

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-26, warpins: 1 ---
			slot9 = cloneTplTo
			slot10 = slot0._option_tpl
			slot11 = slot0.optionsContainer
			slot9 = slot9(slot10, slot11)
			slot8 = slot9
			slot9 = slot0.optionItems
			slot9[slot6] = slot8
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-54, warpins: 2 ---
		slot9 = findTF
		slot10 = slot8
		slot11 = "option"
		slot9 = slot9(slot10, slot11)
		slot10 = slot9.transform
		slot11 = Vector2
		slot12 = 421
		slot13 = 0
		slot11 = slot11(slot12, slot13)
		slot10.localPosition = slot11
		slot10 = setActive
		slot11 = slot8
		slot12 = true

		slot10(slot11, slot12)

		slot10 = HXSet
		slot10 = slot10.hxLan
		slot11 = slot7.content
		slot10 = slot10(slot11)
		slot11 = setButtonText
		slot12 = slot9
		slot13 = slot10

		slot11(slot12, slot13)

		slot11 = onButton
		slot12 = slot0
		slot13 = slot9

		function slot14()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hideOptions
			slot2 = slot1

			function slot3()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				slot0 = slot0
				slot1 = slot1
				slot1 = slot1.flag
				slot0.optionFlag = slot1
				slot0 = table
				slot0 = slot0.insert
				slot1 = slot0
				slot1 = slot1.selectedOptions
				slot2 = slot0
				slot2 = slot2.optionFlag

				slot0(slot1, slot2)

				slot0 = slot2
				slot0 = slot0()

				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-17, warpins: 1 ---
					slot0 = slot2

					slot0()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-18, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot0(slot1, slot2, slot3)

			return
			--- END OF BLOCK #0 ---



		end

		slot11(slot12, slot13, slot14)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 55-56, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-61, warpins: 1 ---
	slot4 = slot0
	slot3 = slot0.showOptions

	slot3(slot4)

	return
	--- END OF BLOCK #3 ---



end

slot0.initOptions = slot17

function slot17(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot1 = setActive
	slot2 = slot0.options
	slot3 = true

	slot1(slot2, slot3)

	slot1 = 0
	slot2 = LeanTween
	slot2 = slot2.cancel
	slot3 = go
	slot4 = slot0.optionsBg

	slot2(slot3(slot4))

	slot2 = LeanTween
	slot2 = slot2.moveX
	slot3 = slot0.optionsBg
	slot4 = 0
	slot5 = 0.5

	slot2(slot3, slot4, slot5)

	slot2 = LeanTween
	slot2 = slot2.rotate
	slot3 = rtf
	slot4 = slot0.optionsBg
	slot3 = slot3(slot4)
	slot4 = 360
	slot5 = 5
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setLoopClamp

	slot2(slot3)

	slot2 = ipairs
	slot3 = slot0.optionItems
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-54, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-37, warpins: 1 ---
		slot7 = isActive
		slot8 = slot6
		slot7 = slot7(slot8)

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-52, warpins: 1 ---
			slot7 = findTF
			slot8 = slot6
			slot9 = "option"
			slot7 = slot7(slot8, slot9)
			slot8 = LeanTween
			slot8 = slot8.moveX
			slot9 = slot7
			slot10 = 0
			slot11 = 0.4
			slot8 = slot8(slot9, slot10, slot11)
			slot9 = slot8
			slot8 = slot8.setDelay
			slot10 = slot1 * 0.1

			slot8(slot9, slot10)

			slot1 = slot1 + 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 53-54, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 55-83, warpins: 1 ---
	slot2 = slot0.optionsCg
	slot3 = false
	slot2.interactable = slot3
	slot2 = LeanTween
	slot2 = slot2.value
	slot3 = go
	slot4 = slot0.options
	slot3 = slot3(slot4)
	slot4 = 0
	slot5 = 1
	slot6 = 0.2
	slot2 = slot2(slot3, slot4, slot5, slot6)
	slot3 = slot2
	slot2 = slot2.setOnUpdate
	slot4 = System
	slot4 = slot4.Action_float

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1.optionsCg
		slot1.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end

	slot2(slot3, slot4(slot5))

	slot2 = LeanTween
	slot2 = slot2.delayedCall
	slot3 = slot1 * 0.1
	slot4 = System
	slot4 = slot4.Action

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.optionsCg
		slot1 = true
		slot0.interactable = slot1

		return
		--- END OF BLOCK #0 ---



	end

	slot2(slot3, slot4(slot5))

	return
	--- END OF BLOCK #2 ---



end

slot0.showOptions = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	slot3 = 0
	slot4 = LeanTween
	slot4 = slot4.cancel
	slot5 = go
	slot6 = slot0.optionsBg

	slot4(slot5(slot6))

	slot4 = LeanTween
	slot4 = slot4.moveX
	slot5 = slot0.optionsBg
	slot6 = 525
	slot7 = 0.5

	slot4(slot5, slot6, slot7)

	slot4 = LeanTween
	slot4 = slot4.rotate
	slot5 = rtf
	slot6 = slot0.optionsBg
	slot5 = slot5(slot6)
	slot6 = -360
	slot7 = 5

	slot4(slot5, slot6, slot7)

	slot4 = ipairs
	slot5 = slot0.optionItems
	slot4, slot5, slot6 = slot4(slot5)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-49, warpins: 0 ---
	for slot7, slot8 in slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		slot9 = isActive
		slot10 = slot8
		slot9 = slot9(slot10)

		if slot9 and slot7 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-47, warpins: 1 ---
			slot9 = findTF
			slot10 = slot8
			slot11 = "option"
			slot9 = slot9(slot10, slot11)
			slot10 = LeanTween
			slot10 = slot10.moveX
			slot11 = slot9
			slot12 = 632
			slot13 = 0.4
			slot10 = slot10(slot11, slot12, slot13)
			slot11 = slot10
			slot10 = slot10.setDelay
			slot12 = slot3 * 0.1

			slot10(slot11, slot12)

			slot3 = slot3 + 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-84, warpins: 1 ---
	slot4 = slot0.optionsCg
	slot5 = false
	slot4.interactable = slot5
	slot4 = LeanTween
	slot4 = slot4.value
	slot5 = go
	slot6 = slot0.options
	slot5 = slot5(slot6)
	slot6 = 1
	slot7 = 0
	slot8 = 0.2
	slot4 = slot4(slot5, slot6, slot7, slot8)
	slot5 = slot4
	slot4 = slot4.setOnUpdate
	slot6 = System
	slot6 = slot6.Action_float

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1.optionsCg
		slot1.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end

	slot4 = slot4(slot5, slot6(slot7))
	slot5 = slot4
	slot4 = slot4.setDelay
	slot6 = slot3 * 0.1
	slot6 = slot6 + 0.8

	slot4(slot5, slot6)

	slot4 = LeanTween
	slot4 = slot4.delayedCall
	slot5 = slot3 * 0.1
	slot5 = slot5 + 1
	slot6 = System
	slot6 = slot6.Action

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.skipBtn
		slot1 = slot0
		slot0 = slot0.GetComponent
		slot2 = typeof
		slot3 = Button
		slot0 = slot0(slot1, slot2(slot3))
		slot1 = true
		slot0.interactable = slot1
		slot0 = slot0
		slot0 = slot0.optionsCg
		slot1 = true
		slot0.interactable = slot1
		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.options
		slot2 = false

		slot0(slot1, slot2)

		slot0 = LeanTween
		slot0 = slot0.cancel
		slot1 = go
		slot2 = slot0
		slot2 = slot2.optionsBg

		slot0(slot1(slot2))

		slot0 = slot1

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-31, warpins: 1 ---
			slot0 = slot1

			slot0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-32, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot4(slot5, slot6(slot7))

	return
	--- END OF BLOCK #2 ---



end

slot0.hideOptions = slot17

function slot17(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.optionItems

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot1 = ipairs
	slot2 = slot0.optionItems
	slot1, slot2, slot3 = slot1(slot2)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-14, warpins: 0 ---
	for slot4, slot5 in slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		slot6 = setActive
		slot7 = slot5
		slot8 = false

		slot6(slot7, slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-14, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-15, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.removeOptBtns = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = pairs
	slot3 = slot1
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-21, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot7 = slot6.name

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-12, warpins: 1 ---
			slot7 = LeanTween
			slot7 = slot7.delayedCall
			slot8 = slot6.delay

			if not slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-13, warpins: 1 ---
				slot8 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-18, warpins: 2 ---
			slot9 = System
			slot9 = slot9.Action

			function slot10()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0 = findTF
				slot1 = slot0
				slot1 = slot1._effectPanel
				slot2 = slot1
				slot2 = slot2.name
				slot0 = slot0(slot1, slot2)

				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 9-17, warpins: 1 ---
					slot1 = slot0
					slot1 = slot1.effectObjs
					slot2 = slot1
					slot2 = slot2.name
					slot1 = slot1[slot2]
					slot2 = slot0
					slot2 = slot2.isLoadingEffect

					if slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-18, warpins: 1 ---
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-20, warpins: 1 ---
						if not slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 21-30, warpins: 1 ---
							slot2 = slot0
							slot3 = true
							slot2.isLoadingEffect = slot3
							slot2 = LoadAndInstantiateAsync
							slot3 = "ui"
							slot4 = slot1
							slot4 = slot4.name

							function slot5(slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-38, warpins: 1 ---
								slot1 = slot0
								slot2 = nil
								slot1.isLoadingEffect = slot2
								slot1 = slot1
								slot1 = slot1.name
								slot0.name = slot1
								slot1 = setParent
								slot2 = slot0
								slot3 = slot0
								slot3 = slot3._effectPanel
								slot3 = slot3.transform

								slot1(slot2, slot3)

								slot1 = setActive
								slot2 = slot0
								slot3 = slot1
								slot3 = slot3.active

								slot1(slot2, slot3)

								slot1 = slot0
								slot1 = slot1.effectObjs
								slot2 = slot1
								slot2 = slot2.name
								slot3 = {}
								slot1[slot2] = slot3
								slot1 = slot0
								slot1 = slot1.effectObjs
								slot2 = slot1
								slot2 = slot2.name
								slot1 = slot1[slot2]
								slot2 = slot1
								slot2 = slot2.name
								slot1[1] = slot2
								slot1 = slot0
								slot1 = slot1.effectObjs
								slot2 = slot1
								slot2 = slot2.name
								slot1 = slot1[slot2]
								slot1[2] = slot0

								return
								--- END OF BLOCK #0 ---



							end

							slot2(slot3, slot4, slot5)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 31-36, warpins: 1 ---
							slot2 = setActive
							slot3 = slot1[2]
							slot4 = slot1
							slot4 = slot4.active

							slot2(slot3, slot4)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-45, warpins: 1 ---
					slot1 = SetActive
					slot2 = slot0
					slot3 = slot1
					slot3 = slot3.active

					slot1(slot2, slot3)

					slot1 = slot1
					slot1 = slot1.active

					if not slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 46-49, warpins: 1 ---
						slot1 = slot1
						slot1 = slot1.destory

						if slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 50-56, warpins: 1 ---
							slot1 = slot0
							slot1 = slot1.effectObjs
							slot2 = slot1
							slot2 = slot2.name
							slot1 = slot1[slot2]

							if slot1 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 57-71, warpins: 1 ---
								slot1 = Object
								slot1 = slot1.Destroy
								slot2 = slot0
								slot2 = slot2.effectObjs
								slot3 = slot1
								slot3 = slot3.name
								slot2 = slot2[slot3]
								slot2 = slot2[2]

								slot1(slot2)

								slot1 = slot0
								slot1 = slot1.effectObjs
								slot2 = slot1
								slot2 = slot2.name
								slot3 = nil
								slot1[slot2] = slot3
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 72-72, warpins: 7 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot7(slot8, slot9(slot10))
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-19, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-21, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.setEffects = slot17

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-90, warpins: 1 ---
	slot2 = pg
	slot2 = slot2.CriMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.ResumeCV

	slot2(slot3)

	slot2 = pg
	slot2 = slot2.DelegateInfo
	slot2 = slot2.Dispose
	slot3 = slot0

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.removeOptBtns

	slot2(slot3)

	slot2 = nil
	slot0.preStep = slot2
	slot2 = nil
	slot0.targetActorTF = slot2
	slot2 = nil
	slot0.inTypeWritter = slot2
	slot2 = nil
	slot0.interactive = slot2
	slot2 = nil
	slot0.blankScreen = slot2
	slot2 = nil
	slot0.inFadeOut = slot2
	slot3 = slot0
	slot2 = slot0.hideEffects

	slot2(slot3)

	slot2 = nil
	slot0.preBg = slot2
	slot2 = nil
	slot0.stopBGM = slot2
	slot2 = nil
	slot0.blackSkip = slot2
	slot2 = nil
	slot0.bgm = slot2
	slot2 = setActive
	slot3 = slot0.actorRight
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.actorLeft
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.actorMiddle
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.storyId
	slot3 = pg
	slot3 = slot3.m02
	slot4 = slot3
	slot3 = slot3.sendNotification
	slot5 = GAME
	slot5 = slot5.STORY_UPDATE
	slot6 = {}
	slot6.storyId = slot2

	slot3(slot4, slot5, slot6)

	slot3 = nil
	slot0.storyId = slot3
	slot3 = SetActive
	slot4 = slot0._go
	slot5 = false

	slot3(slot4, slot5)

	slot3 = LeanTween
	slot3 = slot3.alpha
	slot4 = rtf
	slot5 = slot0._go
	slot4 = slot4(slot5)
	slot5 = 0.6823529411764706
	slot6 = 0
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setUseEstimatedTime
	slot5 = true

	slot3(slot4, slot5)

	slot3 = pg
	slot3 = slot3.m02
	slot4 = slot3
	slot3 = slot3.sendNotification
	slot5 = GAME
	slot5 = slot5.STORY_END
	slot6 = slot2

	slot3(slot4, slot5, slot6)

	slot3 = pairs
	slot4 = slot0.effectObjs
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 91-100, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-98, warpins: 1 ---
		slot8 = PoolMgr
		slot8 = slot8.GetInstance
		slot8 = slot8()
		slot9 = slot8
		slot8 = slot8.ReturnUI
		slot10 = slot7[1]
		slot11 = slot7[2]

		slot8(slot9, slot10, slot11)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 99-100, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 101-104, warpins: 1 ---
	slot3 = {}
	slot0.effectObjs = slot3

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-106, warpins: 1 ---
		slot3 = slot1

		slot3()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 107-110, warpins: 2 ---
	slot4 = slot0
	slot3 = slot0.popQuery

	slot3(slot4)

	return
	--- END OF BLOCK #3 ---



end

slot0.EndStory = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = findTF
	slot4 = slot1
	slot5 = "actor_sub"
	slot3 = slot3(slot4, slot5)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-12, warpins: 2 ---
	slot4 = removeAllChildren
	slot5 = slot3

	slot4(slot5)

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-21, warpins: 2 ---
	slot4 = findTF
	slot5 = slot1
	slot6 = "tpl"
	slot4 = slot4(slot5, slot6)
	slot5 = pairs
	slot6 = slot2
	slot5, slot6, slot7 = slot5(slot6)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-102, warpins: 0 ---
	for slot8, slot9 in slot5, slot6, slot7 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-57, warpins: 1 ---
		slot11 = slot0
		slot10 = slot0.getNameAndPainting
		slot12 = {}
		slot13 = slot9.actor
		slot12.actor = slot13
		slot10, slot11 = slot10(slot11, slot12)
		slot12 = cloneTplTo
		slot13 = slot4
		slot14 = slot3
		slot12 = slot12(slot13, slot14)
		slot13 = setPaintingPrefab
		slot14 = slot12
		slot15 = slot11
		slot16 = "duihua"

		slot13(slot14, slot15, slot16)

		slot13 = findTF
		slot14 = slot12
		slot15 = "fitter"
		slot13 = slot13(slot14, slot15)
		slot14 = slot13
		slot13 = slot13.GetChild
		slot15 = 0
		slot13 = slot13(slot14, slot15)
		slot14 = findTF
		slot15 = slot13
		slot16 = "face"
		slot14 = slot14(slot15, slot16)
		slot15 = Ship
		slot15 = slot15.SetExpression
		slot16 = slot13
		slot17 = slot11
		slot18 = "default"
		slot15 = slot15(slot16, slot17, slot18)
		slot16 = slot9.expression

		if slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-67, warpins: 1 ---
			slot16 = GetSpriteFromAtlas
			slot17 = "paintingface/"
			slot18 = slot11
			slot17 = slot17 .. slot18
			slot18 = slot9.expression
			slot16 = slot16(slot17, slot18)
			slot17 = setActive
			slot18 = slot14

			if not slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-68, warpins: 1 ---
				slot19 = slot9.expression
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 69-73, warpins: 2 ---
			slot17(slot18, slot19)

			slot17 = setImageSprite
			slot18 = slot14
			slot19 = slot16

			slot17(slot18, slot19)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 74-76, warpins: 2 ---
		slot16 = slot9.pos

		if slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 77-80, warpins: 1 ---
			slot16 = setAnchoredPosition
			slot17 = slot12
			slot18 = slot9.pos

			slot16(slot17, slot18)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 81-83, warpins: 2 ---
		slot16 = slot9.dir

		if slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-86, warpins: 1 ---
			slot16 = slot2.scale

			if not slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 87-87, warpins: 1 ---
				slot16 = 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 88-95, warpins: 2 ---
			slot17 = slot12.transform
			slot18 = Vector3
			slot19 = slot9.dir
			slot19 = slot19 * slot16
			slot20 = slot16
			slot21 = slot16
			slot18 = slot18(slot19, slot20, slot21)
			slot17.localScale = slot18
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 96-100, warpins: 2 ---
		slot17 = slot0
		slot16 = slot0.updatePainting
		slot18 = slot12
		slot19 = slot9.paintingNoise

		slot16(slot17, slot18, slot19)
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 101-102, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 103-103, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.setSubActors = slot17

function slot17(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = table
	slot1 = slot1.getCount
	slot2 = slot0
	slot1 = slot1(slot2)
	slot2 = 0

	if slot1 > slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-16, warpins: 1 ---
		slot1 = slot0
		slot1 = slot1[1]
		slot2 = table
		slot2 = slot2.remove
		slot3 = slot0
		slot4 = 1

		slot2(slot3, slot4)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-21, warpins: 1 ---
			slot3 = slot0
			slot2 = slot0.Play
			slot4 = slot1[1]
			slot5 = slot1[2]

			slot2(slot3, slot4, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.popQuery = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3 = table
	slot3 = slot3.insert
	slot4 = slot0
	slot5 = {}
	slot5[1] = slot1
	slot5[2] = slot2

	slot3(slot4, slot5)

	return
	--- END OF BLOCK #0 ---



end

slot0.addQuery = slot17

function slot17(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = isActive
	slot2 = slot0._go

	return slot1(slot2)
	--- END OF BLOCK #0 ---



end

slot0.isActive = slot17

function slot17(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot3 = slot0.tweenObjs

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot3 = {}
		slot0.tweenObjs = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-16, warpins: 2 ---
	function slot3(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-40, warpins: 1 ---
		slot1 = slot0.material
		slot2 = slot1
		slot1 = slot1.SetFloat
		slot3 = "_LineGray"
		slot4 = 0.3

		slot1(slot2, slot3, slot4)

		slot1 = slot0.material
		slot2 = slot1
		slot1 = slot1.SetFloat
		slot3 = "_TearDistance"
		slot4 = 0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.cancel
		slot2 = slot0.gameObject

		slot1(slot2)

		slot1 = slot0
		slot1 = slot1.tweenObjs
		slot2 = slot0.gameObject
		slot3 = slot0.gameObject
		slot1[slot2] = slot3
		slot1 = LeanTween
		slot1 = slot1.value
		slot2 = slot0.gameObject
		slot3 = 0
		slot4 = 2
		slot5 = 2
		slot1 = slot1(slot2, slot3, slot4, slot5)
		slot2 = slot1
		slot1 = slot1.setLoopClamp
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1 = slot1.setOnUpdate
		slot3 = System
		slot3 = slot3.Action_float

		function slot4(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot1 = 1.2

			if slot0 >= slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-11, warpins: 1 ---
				slot1 = slot0
				slot1 = slot1.material
				slot2 = slot1
				slot1 = slot1.SetFloat
				slot3 = "_LineGray"
				slot4 = 0.3

				slot1(slot2, slot3, slot4)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-14, warpins: 1 ---
				slot1 = 1.1

				if slot0 >= slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-22, warpins: 1 ---
					slot1 = slot0
					slot1 = slot1.material
					slot2 = slot1
					slot1 = slot1.SetFloat
					slot3 = "_LineGray"
					slot4 = 0.45

					slot1(slot2, slot3, slot4)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-25, warpins: 1 ---
					slot1 = 1.03

					if slot0 >= slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-33, warpins: 1 ---
						slot1 = slot0
						slot1 = slot1.material
						slot2 = slot1
						slot1 = slot1.SetFloat
						slot3 = "_TearDistance"
						slot4 = 0

						slot1(slot2, slot3, slot4)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 34-36, warpins: 1 ---
						slot1 = 1

						if slot0 >= slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 37-44, warpins: 1 ---
							slot1 = slot0
							slot1 = slot1.material
							slot2 = slot1
							slot1 = slot1.SetFloat
							slot3 = "_TearDistance"
							slot4 = 0.3

							slot1(slot2, slot3, slot4)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 45-47, warpins: 1 ---
							slot1 = 0.35

							if slot0 >= slot1 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 48-55, warpins: 1 ---
								slot1 = slot0
								slot1 = slot1.material
								slot2 = slot1
								slot1 = slot1.SetFloat
								slot3 = "_LineGray"
								slot4 = 0.3

								slot1(slot2, slot3, slot4)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 56-58, warpins: 1 ---
								slot1 = 0.3

								if slot0 >= slot1 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 59-66, warpins: 1 ---
									slot1 = slot0
									slot1 = slot1.material
									slot2 = slot1
									slot1 = slot1.SetFloat
									slot3 = "_LineGray"
									slot4 = 0.4

									slot1(slot2, slot3, slot4)
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 67-69, warpins: 1 ---
									slot1 = 0.25

									if slot0 >= slot1 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 70-77, warpins: 1 ---
										slot1 = slot0
										slot1 = slot1.material
										slot2 = slot1
										slot1 = slot1.SetFloat
										slot3 = "_LineGray"
										slot4 = 0.3

										slot1(slot2, slot3, slot4)
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 78-80, warpins: 1 ---
										slot1 = 0.2

										if slot0 >= slot1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 81-87, warpins: 1 ---
											slot1 = slot0
											slot1 = slot1.material
											slot2 = slot1
											slot1 = slot1.SetFloat
											slot3 = "_LineGray"
											slot4 = 0.4

											slot1(slot2, slot3, slot4)
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 88-88, warpins: 9 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot1(slot2, slot3(slot4))

		return
		--- END OF BLOCK #0 ---



	end

	slot4 = findTF
	slot5 = slot1
	slot6 = "fitter"
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.GetChild
	slot6 = 0
	slot4 = slot4(slot5, slot6)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-22, warpins: 1 ---
		slot5 = GetComponent
		slot6 = slot4
		slot7 = "MeshImage"
		slot5 = slot5(slot6, slot7)

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-38, warpins: 1 ---
			slot6 = slot0.material1
			slot5.material = slot6
			slot6 = slot5.material
			slot7 = slot6
			slot6 = slot6.SetFloat
			slot8 = "_LineDensity"
			slot9 = 7

			slot6(slot7, slot8, slot9)

			slot6 = slot3
			slot7 = slot5

			slot6(slot7)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-44, warpins: 1 ---
			slot6 = LeanTween
			slot6 = slot6.cancel
			slot7 = slot5.gameObject

			slot6(slot7)

			slot6 = nil
			slot5.material = slot6
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 45-50, warpins: 2 ---
		slot6 = findTF
		slot7 = slot4
		slot8 = "face"
		slot6 = slot6(slot7, slot8)

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-55, warpins: 1 ---
			slot7 = isActive
			slot8 = slot6
			slot7 = slot7(slot8)

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-61, warpins: 1 ---
				slot7 = GetComponent
				slot8 = slot6
				slot9 = "Image"
				slot7 = slot7(slot8, slot9)

				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-73, warpins: 1 ---
					slot8 = slot0.material2
					slot7.material = slot8
					slot8 = slot7.material
					slot9 = slot8
					slot8 = slot8.SetFloat
					slot10 = "_LineDensity"
					slot11 = 7

					slot8(slot9, slot10, slot11)

					slot8 = slot3
					slot9 = slot7

					slot8(slot9)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 74-79, warpins: 1 ---
					slot8 = LeanTween
					slot8 = slot8.cancel
					slot9 = slot7.gameObject

					slot8(slot9)

					slot8 = nil
					slot7.material = slot8
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 80-81, warpins: 5 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.updatePainting = slot17

return
