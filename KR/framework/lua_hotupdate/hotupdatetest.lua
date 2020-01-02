slot0 = 0

function HUT_Var1()
	slot0 = slot0 + 2

	print("x = ", print)
end

function HUT_Var3()
	slot0 = slot0 + 10

	print("x = ", print)
end

slot1 = HUT_Var1

function HUT_Func()
	slot0()
end

function HUT_FUNC2()
	print("y = 4")
end

return
