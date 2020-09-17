slot0 = class("MonthlyShop", import(".BaseShop"))

function slot0.Ctor(slot0)
	slot0.goods = {}
end

slot0.GoodsType = nil

function slot0.IsSameKind(slot0, slot1)
	return isa(slot1, MonthlyShop)
end

function slot0.GetCommodityById(slot0, slot1)
	return slot0:getGoodsById(slot1)
end

function slot0.GetCommodities(slot0)
	return slot0:getSortGoods()
end

function slot0.isOpen(slot0)
	if not slot0.id then
		return false
	end

	slot1 = false

	if slot0:bindConfigTable()[slot0.id] then
		slot3 = pg.TimeMgr.GetInstance()
		slot1 = slot3:STimeDescS(slot3:GetServerTime(), "*t").month == slot0.id
	end

	return slot1
end

function slot0.getRestDays(slot0)
	if not slot0.id then
		return 0
	end

	slot1 = pg.TimeMgr.GetInstance()
	slot3 = Clone(slot1:STimeDescS(slot1:GetServerTime(), "*t"))
	slot3.month = slot0.id

	if slot3.month >= 12 then
		slot3.month = 0
		slot3.year = slot3.year + 1
	end

	slot3.month = slot3.month + 1
	slot3.day = 0

	return math.max(os.date("%d", os.time(slot3)) - slot2.day + 1, 1)
end

function slot0.GetRestTime(slot0)
	if not slot0.id then
		return 0
	end

	slot1 = pg.TimeMgr.GetInstance()
	slot3 = Clone(slot1:STimeDescS(slot1:GetServerTime(), "*t"))
	slot3.month = slot0.id

	if slot3.month >= 12 then
		slot3.month = 0
		slot3.year = slot3.year + 1
	end

	slot3.month = slot3.month + 1
	slot3.day = 0
	slot3.hour = 23
	slot3.min = 59
	slot3.sec = 59
	slot3.isdst = false

	return math.max(os.time(slot3) - slot1:GetServerTime(), 0)
end

function slot0.getSortGoods(slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.goods) do
		table.insert(slot1, slot6)
	end

	function slot2(slot0)
		return math.floor(slot0 * 0.1)
	end

	table.sort(slot1, function ()
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
	end)

	return slot1
end

function slot0.getGoodsCfg(slot0, slot1)
	return pg.activity_shop_template[slot1]
end

function slot0.getGoodsById(slot0, slot1)
	return slot0.goods[slot1]
end

function slot0.bindConfigTable(slot0)
	return pg.month_shop_template
end

return slot0
