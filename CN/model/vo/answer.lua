slot0 = class("Answer", import(".BaseVO"))
slot0.Ship1 = 101061
slot0.Ship2 = 102081

slot0.Ctor = function (slot0, slot1, slot2)
	slot0.id = slot1
	slot0.configId = slot1
	slot0.type = slot2
	slot0.select = nil
	slot0.restTime = nil
end

slot0.bindConfigTable = function (slot0)
	return pg.question_lib_template
end

slot0.checkAnswer = function (slot0, slot1)
	return slot1 == slot0.type
end

return slot0
