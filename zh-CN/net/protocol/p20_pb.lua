slot0 = require("protobuf")

module("p20_pb")

SC_20001 = slot0.Descriptor()
slot2 = slot0.FieldDescriptor()
TASK_INFO = slot0.Descriptor()
slot3 = slot0.FieldDescriptor()
slot4 = slot0.FieldDescriptor()
slot5 = slot0.FieldDescriptor()
slot6 = slot0.FieldDescriptor()
SC_20002 = slot0.Descriptor()
slot7 = slot0.FieldDescriptor()
TASK_PROGRESS = slot0.Descriptor()
slot8 = slot0.FieldDescriptor()
slot9 = slot0.FieldDescriptor()
SC_20003 = slot0.Descriptor()
slot10 = slot0.FieldDescriptor()
SC_20004 = slot0.Descriptor()
slot11 = slot0.FieldDescriptor()
CS_20005 = slot0.Descriptor()
slot12 = slot0.FieldDescriptor()
slot13 = slot0.FieldDescriptor()
SC_20006 = slot0.Descriptor()
slot14 = slot0.FieldDescriptor()
slot15 = slot0.FieldDescriptor()
CS_20007 = slot0.Descriptor()
slot16 = slot0.FieldDescriptor()
SC_20008 = slot0.Descriptor()
slot17 = slot0.FieldDescriptor()
slot18 = slot0.FieldDescriptor()
TASK_ADD = slot0.Descriptor()
slot19 = slot0.FieldDescriptor()
slot20 = slot0.FieldDescriptor()
slot21 = slot0.FieldDescriptor()
slot22 = slot0.FieldDescriptor()
CS_20009 = slot0.Descriptor()
slot23 = slot0.FieldDescriptor()
SC_20010 = slot0.Descriptor()
slot24 = slot0.FieldDescriptor()
TASK_UPDATE = slot0.Descriptor()
slot25 = slot0.FieldDescriptor()
slot26 = slot0.FieldDescriptor()
slot27 = slot0.FieldDescriptor()
slot2.name = "info"
slot2.full_name = ".p20.sc_20001.info"
slot2.number = 1
slot2.index = 0
slot2.label = 3
slot2.has_default_value = false
slot2.default_value = {}
slot2.message_type = TASK_INFO
slot2.type = 11
slot2.cpp_type = 10
SC_20001.name = "sc_20001"
SC_20001.full_name = ".p20.sc_20001"
SC_20001.nested_types = {}
SC_20001.enum_types = {}
SC_20001.fields = {
	slot2
}
SC_20001.is_extendable = false
SC_20001.extensions = {}
slot3.name = "id"
slot3.full_name = ".p20.task_info.id"
slot3.number = 1
slot3.index = 0
slot3.label = 2
slot3.has_default_value = false
slot3.default_value = 0
slot3.type = 13
slot3.cpp_type = 3
slot4.name = "progress"
slot4.full_name = ".p20.task_info.progress"
slot4.number = 2
slot4.index = 1
slot4.label = 2
slot4.has_default_value = false
slot4.default_value = 0
slot4.type = 13
slot4.cpp_type = 3
slot5.name = "accept_time"
slot5.full_name = ".p20.task_info.accept_time"
slot5.number = 3
slot5.index = 2
slot5.label = 2
slot5.has_default_value = false
slot5.default_value = 0
slot5.type = 13
slot5.cpp_type = 3
slot6.name = "submit_time"
slot6.full_name = ".p20.task_info.submit_time"
slot6.number = 4
slot6.index = 3
slot6.label = 2
slot6.has_default_value = false
slot6.default_value = 0
slot6.type = 13
slot6.cpp_type = 3
TASK_INFO.name = "task_info"
TASK_INFO.full_name = ".p20.task_info"
TASK_INFO.nested_types = {}
TASK_INFO.enum_types = {}
TASK_INFO.fields = {
	slot3,
	slot4,
	slot5,
	slot6
}
TASK_INFO.is_extendable = false
TASK_INFO.extensions = {}
slot7.name = "info"
slot7.full_name = ".p20.sc_20002.info"
slot7.number = 1
slot7.index = 0
slot7.label = 3
slot7.has_default_value = false
slot7.default_value = {}
slot7.message_type = TASK_PROGRESS
slot7.type = 11
slot7.cpp_type = 10
SC_20002.name = "sc_20002"
SC_20002.full_name = ".p20.sc_20002"
SC_20002.nested_types = {}
SC_20002.enum_types = {}
SC_20002.fields = {
	slot7
}
SC_20002.is_extendable = false
SC_20002.extensions = {}
slot8.name = "id"
slot8.full_name = ".p20.task_progress.id"
slot8.number = 1
slot8.index = 0
slot8.label = 2
slot8.has_default_value = false
slot8.default_value = 0
slot8.type = 13
slot8.cpp_type = 3
slot9.name = "progress"
slot9.full_name = ".p20.task_progress.progress"
slot9.number = 2
slot9.index = 1
slot9.label = 2
slot9.has_default_value = false
slot9.default_value = 0
slot9.type = 13
slot9.cpp_type = 3
TASK_PROGRESS.name = "task_progress"
TASK_PROGRESS.full_name = ".p20.task_progress"
TASK_PROGRESS.nested_types = {}
TASK_PROGRESS.enum_types = {}
TASK_PROGRESS.fields = {
	slot8,
	slot9
}
TASK_PROGRESS.is_extendable = false
TASK_PROGRESS.extensions = {}
slot10.name = "info"
slot10.full_name = ".p20.sc_20003.info"
slot10.number = 1
slot10.index = 0
slot10.label = 3
slot10.has_default_value = false
slot10.default_value = {}
slot10.message_type = TASK_ADD
slot10.type = 11
slot10.cpp_type = 10
SC_20003.name = "sc_20003"
SC_20003.full_name = ".p20.sc_20003"
SC_20003.nested_types = {}
SC_20003.enum_types = {}
SC_20003.fields = {
	slot10
}
SC_20003.is_extendable = false
SC_20003.extensions = {}
slot11.name = "id_list"
slot11.full_name = ".p20.sc_20004.id_list"
slot11.number = 1
slot11.index = 0
slot11.label = 3
slot11.has_default_value = false
slot11.default_value = {}
slot11.type = 13
slot11.cpp_type = 3
SC_20004.name = "sc_20004"
SC_20004.full_name = ".p20.sc_20004"
SC_20004.nested_types = {}
SC_20004.enum_types = {}
SC_20004.fields = {
	slot11
}
SC_20004.is_extendable = false
SC_20004.extensions = {}
slot12.name = "id"
slot12.full_name = ".p20.cs_20005.id"
slot12.number = 1
slot12.index = 0
slot12.label = 2
slot12.has_default_value = false
slot12.default_value = 0
slot12.type = 13
slot12.cpp_type = 3
slot13.name = "choice_award"
slot13.full_name = ".p20.cs_20005.choice_award"
slot13.number = 2
slot13.index = 1
slot13.label = 3
slot13.has_default_value = false
slot13.default_value = {}
slot13.message_type = require("common_pb").DROPINFO
slot13.type = 11
slot13.cpp_type = 10
CS_20005.name = "cs_20005"
CS_20005.full_name = ".p20.cs_20005"
CS_20005.nested_types = {}
CS_20005.enum_types = {}
CS_20005.fields = {
	slot12,
	slot13
}
CS_20005.is_extendable = false
CS_20005.extensions = {}
slot14.name = "result"
slot14.full_name = ".p20.sc_20006.result"
slot14.number = 1
slot14.index = 0
slot14.label = 2
slot14.has_default_value = false
slot14.default_value = 0
slot14.type = 13
slot14.cpp_type = 3
slot15.name = "award_list"
slot15.full_name = ".p20.sc_20006.award_list"
slot15.number = 2
slot15.index = 1
slot15.label = 3
slot15.has_default_value = false
slot15.default_value = {}
slot15.message_type = require("common_pb").DROPINFO
slot15.type = 11
slot15.cpp_type = 10
SC_20006.name = "sc_20006"
SC_20006.full_name = ".p20.sc_20006"
SC_20006.nested_types = {}
SC_20006.enum_types = {}
SC_20006.fields = {
	slot14,
	slot15
}
SC_20006.is_extendable = false
SC_20006.extensions = {}
slot16.name = "id"
slot16.full_name = ".p20.cs_20007.id"
slot16.number = 1
slot16.index = 0
slot16.label = 2
slot16.has_default_value = false
slot16.default_value = 0
slot16.type = 13
slot16.cpp_type = 3
CS_20007.name = "cs_20007"
CS_20007.full_name = ".p20.cs_20007"
CS_20007.nested_types = {}
CS_20007.enum_types = {}
CS_20007.fields = {
	slot16
}
CS_20007.is_extendable = false
CS_20007.extensions = {}
slot17.name = "result"
slot17.full_name = ".p20.sc_20008.result"
slot17.number = 1
slot17.index = 0
slot17.label = 2
slot17.has_default_value = false
slot17.default_value = 0
slot17.type = 13
slot17.cpp_type = 3
slot18.name = "task"
slot18.full_name = ".p20.sc_20008.task"
slot18.number = 2
slot18.index = 1
slot18.label = 1
slot18.has_default_value = false
slot18.default_value = nil
slot18.message_type = TASK_ADD
slot18.type = 11
slot18.cpp_type = 10
SC_20008.name = "sc_20008"
SC_20008.full_name = ".p20.sc_20008"
SC_20008.nested_types = {}
SC_20008.enum_types = {}
SC_20008.fields = {
	slot17,
	slot18
}
SC_20008.is_extendable = false
SC_20008.extensions = {}
slot19.name = "id"
slot19.full_name = ".p20.task_add.id"
slot19.number = 1
slot19.index = 0
slot19.label = 2
slot19.has_default_value = false
slot19.default_value = 0
slot19.type = 13
slot19.cpp_type = 3
slot20.name = "progress"
slot20.full_name = ".p20.task_add.progress"
slot20.number = 2
slot20.index = 1
slot20.label = 2
slot20.has_default_value = false
slot20.default_value = 0
slot20.type = 13
slot20.cpp_type = 3
slot21.name = "accept_time"
slot21.full_name = ".p20.task_add.accept_time"
slot21.number = 3
slot21.index = 2
slot21.label = 2
slot21.has_default_value = false
slot21.default_value = 0
slot21.type = 13
slot21.cpp_type = 3
slot22.name = "submit_time"
slot22.full_name = ".p20.task_add.submit_time"
slot22.number = 4
slot22.index = 3
slot22.label = 1
slot22.has_default_value = false
slot22.default_value = 0
slot22.type = 13
slot22.cpp_type = 3
TASK_ADD.name = "task_add"
TASK_ADD.full_name = ".p20.task_add"
TASK_ADD.nested_types = {}
TASK_ADD.enum_types = {}
TASK_ADD.fields = {
	slot19,
	slot20,
	slot21,
	slot22
}
TASK_ADD.is_extendable = false
TASK_ADD.extensions = {}
slot23.name = "progressinfo"
slot23.full_name = ".p20.cs_20009.progressinfo"
slot23.number = 1
slot23.index = 0
slot23.label = 3
slot23.has_default_value = false
slot23.default_value = {}
slot23.message_type = TASK_UPDATE
slot23.type = 11
slot23.cpp_type = 10
CS_20009.name = "cs_20009"
CS_20009.full_name = ".p20.cs_20009"
CS_20009.nested_types = {}
CS_20009.enum_types = {}
CS_20009.fields = {
	slot23
}
CS_20009.is_extendable = false
CS_20009.extensions = {}
slot24.name = "result"
slot24.full_name = ".p20.sc_20010.result"
slot24.number = 1
slot24.index = 0
slot24.label = 2
slot24.has_default_value = false
slot24.default_value = 0
slot24.type = 13
slot24.cpp_type = 3
SC_20010.name = "sc_20010"
SC_20010.full_name = ".p20.sc_20010"
SC_20010.nested_types = {}
SC_20010.enum_types = {}
SC_20010.fields = {
	slot24
}
SC_20010.is_extendable = false
SC_20010.extensions = {}
slot25.name = "id"
slot25.full_name = ".p20.task_update.id"
slot25.number = 1
slot25.index = 0
slot25.label = 2
slot25.has_default_value = false
slot25.default_value = 0
slot25.type = 13
slot25.cpp_type = 3
slot26.name = "mode"
slot26.full_name = ".p20.task_update.mode"
slot26.number = 2
slot26.index = 1
slot26.label = 2
slot26.has_default_value = false
slot26.default_value = 0
slot26.type = 13
slot26.cpp_type = 3
slot27.name = "progress"
slot27.full_name = ".p20.task_update.progress"
slot27.number = 3
slot27.index = 2
slot27.label = 2
slot27.has_default_value = false
slot27.default_value = 0
slot27.type = 13
slot27.cpp_type = 3
TASK_UPDATE.name = "task_update"
TASK_UPDATE.full_name = ".p20.task_update"
TASK_UPDATE.nested_types = {}
TASK_UPDATE.enum_types = {}
TASK_UPDATE.fields = {
	slot25,
	slot26,
	slot27
}
TASK_UPDATE.is_extendable = false
TASK_UPDATE.extensions = {}
cs_20005 = slot0.Message(CS_20005)
cs_20007 = slot0.Message(CS_20007)
cs_20009 = slot0.Message(CS_20009)
sc_20001 = slot0.Message(SC_20001)
sc_20002 = slot0.Message(SC_20002)
sc_20003 = slot0.Message(SC_20003)
sc_20004 = slot0.Message(SC_20004)
sc_20006 = slot0.Message(SC_20006)
sc_20008 = slot0.Message(SC_20008)
sc_20010 = slot0.Message(SC_20010)
task_add = slot0.Message(TASK_ADD)
task_info = slot0.Message(TASK_INFO)
task_progress = slot0.Message(TASK_PROGRESS)
task_update = slot0.Message(TASK_UPDATE)

return
