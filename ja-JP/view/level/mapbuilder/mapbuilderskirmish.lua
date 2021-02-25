slot1 = class("MapBuilderSkirmish", import(".MapBuilder"))

function slot1.GetType(slot0)
	return uv0.TYPESKIRMISH
end

function slot1.getUIName(slot0)
	return "skirmish_levels"
end

function slot1.Update(slot0, ...)
	slot1 = slot0._tf
	slot2 = 0.21875
	slot1.pivot = Vector2(slot2, 1)
	slot1.anchorMin = Vector2(0.5, 1)
	slot1.anchorMax = Vector2(0.5, 1)
	slot1.anchoredPosition = Vector2((slot2 - 0.5) * slot0._parentTf.rect.width, 0)
	slot0.map.pivot = Vector2(slot2, 1)
	slot6 = 1
	slot6 = slot0.map.rect.width / slot0.map.rect.height < slot0._parentTf.rect.width / slot0._parentTf.rect.height and slot0._parentTf.rect.width / slot0._tf.rect.width or slot0._parentTf.rect.height / slot0._tf.rect.height
	slot0._tf.localScale = Vector3(slot6, slot6, slot6)

	uv0.super.Update(slot0, ...)
end

slot2 = Vector2(-193.5, 120.6)
slot3 = Vector2(211.3, 116.5263)
slot4 = Vector2(0, -622)
slot5 = Vector2(-114, -372)

function slot1.UpdateMapItems()
	error("Decompilation failed")
	-- Exception in function building!
	-- Traceback (most recent call last):
	-- File "utils/luajit/ljd/ast/builder.py", line 856, in _build_function
	--     return _build_function_definition(prototype, state.header)
	-- File "utils/luajit/ljd/ast/builder.py", line 54, in _build_function_definition
	--     node.statements.contents = _build_function_blocks(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 75, in _build_function_blocks
	--     _blockenize(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 143, in _blockenize
	--     _fix_broken_unary_expressions(state, instructions)
	-- File "utils/luajit/ljd/ast/builder.py", line 1242, in _fix_broken_unary_expressions
	--     _remove_instruction(state, instructions, i + 1)
	-- File "utils/luajit/ljd/ast/builder.py", line 1265, in _remove_instruction
	--     state.debuginfo.addr_to_line_map.pop(index)
	-- IndexError: pop from empty list
end

function slot1.OnHide(slot0)
	for slot5 = 1, slot0._tf:Find("skirmish_items").childCount do
		LeanTween.cancel(go(slot1:GetChild(slot5 - 1)))
	end

	LeanTween.cancel(go(slot0._tf:Find("cloud")))
	setActive(slot0.sceneParent.skirmishBar, false)
end

return slot1
