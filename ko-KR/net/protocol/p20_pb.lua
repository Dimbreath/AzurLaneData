slot0 = require("protobuf")
slot1 = require("common_pb")

module("p20_pb")

slot2 = {
	SC_20001_INFO_FIELD = slot0.FieldDescriptor(),
	TASK_INFO_ID_FIELD = slot0.FieldDescriptor(),
	TASK_INFO_PROGRESS_FIELD = slot0.FieldDescriptor(),
	TASK_INFO_ACCEPT_TIME_FIELD = slot0.FieldDescriptor(),
	TASK_INFO_SUBMIT_TIME_FIELD = slot0.FieldDescriptor(),
	SC_20002_INFO_FIELD = slot0.FieldDescriptor(),
	TASK_PROGRESS_ID_FIELD = slot0.FieldDescriptor(),
	TASK_PROGRESS_PROGRESS_FIELD = slot0.FieldDescriptor(),
	SC_20003_INFO_FIELD = slot0.FieldDescriptor(),
	SC_20004_ID_LIST_FIELD = slot0.FieldDescriptor(),
	CS_20005_ID_FIELD = slot0.FieldDescriptor(),
	CS_20005_CHOICE_AWARD_FIELD = slot0.FieldDescriptor(),
	SC_20006_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_20006_AWARD_LIST_FIELD = slot0.FieldDescriptor(),
	CS_20007_ID_FIELD = slot0.FieldDescriptor(),
	SC_20008_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_20008_TASK_FIELD = slot0.FieldDescriptor(),
	TASK_ADD_ID_FIELD = slot0.FieldDescriptor(),
	TASK_ADD_PROGRESS_FIELD = slot0.FieldDescriptor(),
	TASK_ADD_ACCEPT_TIME_FIELD = slot0.FieldDescriptor(),
	TASK_ADD_SUBMIT_TIME_FIELD = slot0.FieldDescriptor(),
	CS_20009_PROGRESSINFO_FIELD = slot0.FieldDescriptor(),
	SC_20010_RESULT_FIELD = slot0.FieldDescriptor(),
	TASK_UPDATE_ID_FIELD = slot0.FieldDescriptor(),
	TASK_UPDATE_MODE_FIELD = slot0.FieldDescriptor(),
	TASK_UPDATE_PROGRESS_FIELD = slot0.FieldDescriptor()
}
SC_20001 = slot0.Descriptor()
TASK_INFO = slot0.Descriptor()
SC_20002 = slot0.Descriptor()
TASK_PROGRESS = slot0.Descriptor()
SC_20003 = slot0.Descriptor()
SC_20004 = slot0.Descriptor()
CS_20005 = slot0.Descriptor()
SC_20006 = slot0.Descriptor()
CS_20007 = slot0.Descriptor()
SC_20008 = slot0.Descriptor()
TASK_ADD = slot0.Descriptor()
CS_20009 = slot0.Descriptor()
SC_20010 = slot0.Descriptor()
TASK_UPDATE = slot0.Descriptor()
slot2.SC_20001_INFO_FIELD.name = "info"
slot2.SC_20001_INFO_FIELD.full_name = "p20.sc_20001.info"
slot2.SC_20001_INFO_FIELD.number = 1
slot2.SC_20001_INFO_FIELD.index = 0
slot2.SC_20001_INFO_FIELD.label = 3
slot2.SC_20001_INFO_FIELD.has_default_value = false
slot2.SC_20001_INFO_FIELD.default_value = {}
slot2.SC_20001_INFO_FIELD.message_type = TASK_INFO
slot2.SC_20001_INFO_FIELD.type = 11
slot2.SC_20001_INFO_FIELD.cpp_type = 10
SC_20001.name = "sc_20001"
SC_20001.full_name = "p20.sc_20001"
SC_20001.nested_types = {}
SC_20001.enum_types = {}
SC_20001.fields = {
	slot2.SC_20001_INFO_FIELD
}
SC_20001.is_extendable = false
SC_20001.extensions = {}
slot2.TASK_INFO_ID_FIELD.name = "id"
slot2.TASK_INFO_ID_FIELD.full_name = "p20.task_info.id"
slot2.TASK_INFO_ID_FIELD.number = 1
slot2.TASK_INFO_ID_FIELD.index = 0
slot2.TASK_INFO_ID_FIELD.label = 2
slot2.TASK_INFO_ID_FIELD.has_default_value = false
slot2.TASK_INFO_ID_FIELD.default_value = 0
slot2.TASK_INFO_ID_FIELD.type = 13
slot2.TASK_INFO_ID_FIELD.cpp_type = 3
slot2.TASK_INFO_PROGRESS_FIELD.name = "progress"
slot2.TASK_INFO_PROGRESS_FIELD.full_name = "p20.task_info.progress"
slot2.TASK_INFO_PROGRESS_FIELD.number = 2
slot2.TASK_INFO_PROGRESS_FIELD.index = 1
slot2.TASK_INFO_PROGRESS_FIELD.label = 2
slot2.TASK_INFO_PROGRESS_FIELD.has_default_value = false
slot2.TASK_INFO_PROGRESS_FIELD.default_value = 0
slot2.TASK_INFO_PROGRESS_FIELD.type = 13
slot2.TASK_INFO_PROGRESS_FIELD.cpp_type = 3
slot2.TASK_INFO_ACCEPT_TIME_FIELD.name = "accept_time"
slot2.TASK_INFO_ACCEPT_TIME_FIELD.full_name = "p20.task_info.accept_time"
slot2.TASK_INFO_ACCEPT_TIME_FIELD.number = 3
slot2.TASK_INFO_ACCEPT_TIME_FIELD.index = 2
slot2.TASK_INFO_ACCEPT_TIME_FIELD.label = 2
slot2.TASK_INFO_ACCEPT_TIME_FIELD.has_default_value = false
slot2.TASK_INFO_ACCEPT_TIME_FIELD.default_value = 0
slot2.TASK_INFO_ACCEPT_TIME_FIELD.type = 13
slot2.TASK_INFO_ACCEPT_TIME_FIELD.cpp_type = 3
slot2.TASK_INFO_SUBMIT_TIME_FIELD.name = "submit_time"
slot2.TASK_INFO_SUBMIT_TIME_FIELD.full_name = "p20.task_info.submit_time"
slot2.TASK_INFO_SUBMIT_TIME_FIELD.number = 4
slot2.TASK_INFO_SUBMIT_TIME_FIELD.index = 3
slot2.TASK_INFO_SUBMIT_TIME_FIELD.label = 2
slot2.TASK_INFO_SUBMIT_TIME_FIELD.has_default_value = false
slot2.TASK_INFO_SUBMIT_TIME_FIELD.default_value = 0
slot2.TASK_INFO_SUBMIT_TIME_FIELD.type = 13
slot2.TASK_INFO_SUBMIT_TIME_FIELD.cpp_type = 3
TASK_INFO.name = "task_info"
TASK_INFO.full_name = "p20.task_info"
TASK_INFO.nested_types = {}
TASK_INFO.enum_types = {}
TASK_INFO.fields = {
	slot2.TASK_INFO_ID_FIELD,
	slot2.TASK_INFO_PROGRESS_FIELD,
	slot2.TASK_INFO_ACCEPT_TIME_FIELD,
	slot2.TASK_INFO_SUBMIT_TIME_FIELD
}
TASK_INFO.is_extendable = false
TASK_INFO.extensions = {}
slot2.SC_20002_INFO_FIELD.name = "info"
slot2.SC_20002_INFO_FIELD.full_name = "p20.sc_20002.info"
slot2.SC_20002_INFO_FIELD.number = 1
slot2.SC_20002_INFO_FIELD.index = 0
slot2.SC_20002_INFO_FIELD.label = 3
slot2.SC_20002_INFO_FIELD.has_default_value = false
slot2.SC_20002_INFO_FIELD.default_value = {}
slot2.SC_20002_INFO_FIELD.message_type = TASK_PROGRESS
slot2.SC_20002_INFO_FIELD.type = 11
slot2.SC_20002_INFO_FIELD.cpp_type = 10
SC_20002.name = "sc_20002"
SC_20002.full_name = "p20.sc_20002"
SC_20002.nested_types = {}
SC_20002.enum_types = {}
SC_20002.fields = {
	slot2.SC_20002_INFO_FIELD
}
SC_20002.is_extendable = false
SC_20002.extensions = {}
slot2.TASK_PROGRESS_ID_FIELD.name = "id"
slot2.TASK_PROGRESS_ID_FIELD.full_name = "p20.task_progress.id"
slot2.TASK_PROGRESS_ID_FIELD.number = 1
slot2.TASK_PROGRESS_ID_FIELD.index = 0
slot2.TASK_PROGRESS_ID_FIELD.label = 2
slot2.TASK_PROGRESS_ID_FIELD.has_default_value = false
slot2.TASK_PROGRESS_ID_FIELD.default_value = 0
slot2.TASK_PROGRESS_ID_FIELD.type = 13
slot2.TASK_PROGRESS_ID_FIELD.cpp_type = 3
slot2.TASK_PROGRESS_PROGRESS_FIELD.name = "progress"
slot2.TASK_PROGRESS_PROGRESS_FIELD.full_name = "p20.task_progress.progress"
slot2.TASK_PROGRESS_PROGRESS_FIELD.number = 2
slot2.TASK_PROGRESS_PROGRESS_FIELD.index = 1
slot2.TASK_PROGRESS_PROGRESS_FIELD.label = 2
slot2.TASK_PROGRESS_PROGRESS_FIELD.has_default_value = false
slot2.TASK_PROGRESS_PROGRESS_FIELD.default_value = 0
slot2.TASK_PROGRESS_PROGRESS_FIELD.type = 13
slot2.TASK_PROGRESS_PROGRESS_FIELD.cpp_type = 3
TASK_PROGRESS.name = "task_progress"
TASK_PROGRESS.full_name = "p20.task_progress"
TASK_PROGRESS.nested_types = {}
TASK_PROGRESS.enum_types = {}
TASK_PROGRESS.fields = {
	slot2.TASK_PROGRESS_ID_FIELD,
	slot2.TASK_PROGRESS_PROGRESS_FIELD
}
TASK_PROGRESS.is_extendable = false
TASK_PROGRESS.extensions = {}
slot2.SC_20003_INFO_FIELD.name = "info"
slot2.SC_20003_INFO_FIELD.full_name = "p20.sc_20003.info"
slot2.SC_20003_INFO_FIELD.number = 1
slot2.SC_20003_INFO_FIELD.index = 0
slot2.SC_20003_INFO_FIELD.label = 3
slot2.SC_20003_INFO_FIELD.has_default_value = false
slot2.SC_20003_INFO_FIELD.default_value = {}
slot2.SC_20003_INFO_FIELD.message_type = TASK_ADD
slot2.SC_20003_INFO_FIELD.type = 11
slot2.SC_20003_INFO_FIELD.cpp_type = 10
SC_20003.name = "sc_20003"
SC_20003.full_name = "p20.sc_20003"
SC_20003.nested_types = {}
SC_20003.enum_types = {}
SC_20003.fields = {
	slot2.SC_20003_INFO_FIELD
}
SC_20003.is_extendable = false
SC_20003.extensions = {}
slot2.SC_20004_ID_LIST_FIELD.name = "id_list"
slot2.SC_20004_ID_LIST_FIELD.full_name = "p20.sc_20004.id_list"
slot2.SC_20004_ID_LIST_FIELD.number = 1
slot2.SC_20004_ID_LIST_FIELD.index = 0
slot2.SC_20004_ID_LIST_FIELD.label = 3
slot2.SC_20004_ID_LIST_FIELD.has_default_value = false
slot2.SC_20004_ID_LIST_FIELD.default_value = {}
slot2.SC_20004_ID_LIST_FIELD.type = 13
slot2.SC_20004_ID_LIST_FIELD.cpp_type = 3
SC_20004.name = "sc_20004"
SC_20004.full_name = "p20.sc_20004"
SC_20004.nested_types = {}
SC_20004.enum_types = {}
SC_20004.fields = {
	slot2.SC_20004_ID_LIST_FIELD
}
SC_20004.is_extendable = false
SC_20004.extensions = {}
slot2.CS_20005_ID_FIELD.name = "id"
slot2.CS_20005_ID_FIELD.full_name = "p20.cs_20005.id"
slot2.CS_20005_ID_FIELD.number = 1
slot2.CS_20005_ID_FIELD.index = 0
slot2.CS_20005_ID_FIELD.label = 2
slot2.CS_20005_ID_FIELD.has_default_value = false
slot2.CS_20005_ID_FIELD.default_value = 0
slot2.CS_20005_ID_FIELD.type = 13
slot2.CS_20005_ID_FIELD.cpp_type = 3
slot2.CS_20005_CHOICE_AWARD_FIELD.name = "choice_award"
slot2.CS_20005_CHOICE_AWARD_FIELD.full_name = "p20.cs_20005.choice_award"
slot2.CS_20005_CHOICE_AWARD_FIELD.number = 2
slot2.CS_20005_CHOICE_AWARD_FIELD.index = 1
slot2.CS_20005_CHOICE_AWARD_FIELD.label = 3
slot2.CS_20005_CHOICE_AWARD_FIELD.has_default_value = false
slot2.CS_20005_CHOICE_AWARD_FIELD.default_value = {}
slot2.CS_20005_CHOICE_AWARD_FIELD.message_type = slot1.DROPINFO
slot2.CS_20005_CHOICE_AWARD_FIELD.type = 11
slot2.CS_20005_CHOICE_AWARD_FIELD.cpp_type = 10
CS_20005.name = "cs_20005"
CS_20005.full_name = "p20.cs_20005"
CS_20005.nested_types = {}
CS_20005.enum_types = {}
CS_20005.fields = {
	slot2.CS_20005_ID_FIELD,
	slot2.CS_20005_CHOICE_AWARD_FIELD
}
CS_20005.is_extendable = false
CS_20005.extensions = {}
slot2.SC_20006_RESULT_FIELD.name = "result"
slot2.SC_20006_RESULT_FIELD.full_name = "p20.sc_20006.result"
slot2.SC_20006_RESULT_FIELD.number = 1
slot2.SC_20006_RESULT_FIELD.index = 0
slot2.SC_20006_RESULT_FIELD.label = 2
slot2.SC_20006_RESULT_FIELD.has_default_value = false
slot2.SC_20006_RESULT_FIELD.default_value = 0
slot2.SC_20006_RESULT_FIELD.type = 13
slot2.SC_20006_RESULT_FIELD.cpp_type = 3
slot2.SC_20006_AWARD_LIST_FIELD.name = "award_list"
slot2.SC_20006_AWARD_LIST_FIELD.full_name = "p20.sc_20006.award_list"
slot2.SC_20006_AWARD_LIST_FIELD.number = 2
slot2.SC_20006_AWARD_LIST_FIELD.index = 1
slot2.SC_20006_AWARD_LIST_FIELD.label = 3
slot2.SC_20006_AWARD_LIST_FIELD.has_default_value = false
slot2.SC_20006_AWARD_LIST_FIELD.default_value = {}
slot2.SC_20006_AWARD_LIST_FIELD.message_type = slot1.DROPINFO
slot2.SC_20006_AWARD_LIST_FIELD.type = 11
slot2.SC_20006_AWARD_LIST_FIELD.cpp_type = 10
SC_20006.name = "sc_20006"
SC_20006.full_name = "p20.sc_20006"
SC_20006.nested_types = {}
SC_20006.enum_types = {}
SC_20006.fields = {
	slot2.SC_20006_RESULT_FIELD,
	slot2.SC_20006_AWARD_LIST_FIELD
}
SC_20006.is_extendable = false
SC_20006.extensions = {}
slot2.CS_20007_ID_FIELD.name = "id"
slot2.CS_20007_ID_FIELD.full_name = "p20.cs_20007.id"
slot2.CS_20007_ID_FIELD.number = 1
slot2.CS_20007_ID_FIELD.index = 0
slot2.CS_20007_ID_FIELD.label = 2
slot2.CS_20007_ID_FIELD.has_default_value = false
slot2.CS_20007_ID_FIELD.default_value = 0
slot2.CS_20007_ID_FIELD.type = 13
slot2.CS_20007_ID_FIELD.cpp_type = 3
CS_20007.name = "cs_20007"
CS_20007.full_name = "p20.cs_20007"
CS_20007.nested_types = {}
CS_20007.enum_types = {}
CS_20007.fields = {
	slot2.CS_20007_ID_FIELD
}
CS_20007.is_extendable = false
CS_20007.extensions = {}
slot2.SC_20008_RESULT_FIELD.name = "result"
slot2.SC_20008_RESULT_FIELD.full_name = "p20.sc_20008.result"
slot2.SC_20008_RESULT_FIELD.number = 1
slot2.SC_20008_RESULT_FIELD.index = 0
slot2.SC_20008_RESULT_FIELD.label = 2
slot2.SC_20008_RESULT_FIELD.has_default_value = false
slot2.SC_20008_RESULT_FIELD.default_value = 0
slot2.SC_20008_RESULT_FIELD.type = 13
slot2.SC_20008_RESULT_FIELD.cpp_type = 3
slot2.SC_20008_TASK_FIELD.name = "task"
slot2.SC_20008_TASK_FIELD.full_name = "p20.sc_20008.task"
slot2.SC_20008_TASK_FIELD.number = 2
slot2.SC_20008_TASK_FIELD.index = 1
slot2.SC_20008_TASK_FIELD.label = 1
slot2.SC_20008_TASK_FIELD.has_default_value = false
slot2.SC_20008_TASK_FIELD.default_value = nil
slot2.SC_20008_TASK_FIELD.message_type = TASK_ADD
slot2.SC_20008_TASK_FIELD.type = 11
slot2.SC_20008_TASK_FIELD.cpp_type = 10
SC_20008.name = "sc_20008"
SC_20008.full_name = "p20.sc_20008"
SC_20008.nested_types = {}
SC_20008.enum_types = {}
SC_20008.fields = {
	slot2.SC_20008_RESULT_FIELD,
	slot2.SC_20008_TASK_FIELD
}
SC_20008.is_extendable = false
SC_20008.extensions = {}
slot2.TASK_ADD_ID_FIELD.name = "id"
slot2.TASK_ADD_ID_FIELD.full_name = "p20.task_add.id"
slot2.TASK_ADD_ID_FIELD.number = 1
slot2.TASK_ADD_ID_FIELD.index = 0
slot2.TASK_ADD_ID_FIELD.label = 2
slot2.TASK_ADD_ID_FIELD.has_default_value = false
slot2.TASK_ADD_ID_FIELD.default_value = 0
slot2.TASK_ADD_ID_FIELD.type = 13
slot2.TASK_ADD_ID_FIELD.cpp_type = 3
slot2.TASK_ADD_PROGRESS_FIELD.name = "progress"
slot2.TASK_ADD_PROGRESS_FIELD.full_name = "p20.task_add.progress"
slot2.TASK_ADD_PROGRESS_FIELD.number = 2
slot2.TASK_ADD_PROGRESS_FIELD.index = 1
slot2.TASK_ADD_PROGRESS_FIELD.label = 2
slot2.TASK_ADD_PROGRESS_FIELD.has_default_value = false
slot2.TASK_ADD_PROGRESS_FIELD.default_value = 0
slot2.TASK_ADD_PROGRESS_FIELD.type = 13
slot2.TASK_ADD_PROGRESS_FIELD.cpp_type = 3
slot2.TASK_ADD_ACCEPT_TIME_FIELD.name = "accept_time"
slot2.TASK_ADD_ACCEPT_TIME_FIELD.full_name = "p20.task_add.accept_time"
slot2.TASK_ADD_ACCEPT_TIME_FIELD.number = 3
slot2.TASK_ADD_ACCEPT_TIME_FIELD.index = 2
slot2.TASK_ADD_ACCEPT_TIME_FIELD.label = 2
slot2.TASK_ADD_ACCEPT_TIME_FIELD.has_default_value = false
slot2.TASK_ADD_ACCEPT_TIME_FIELD.default_value = 0
slot2.TASK_ADD_ACCEPT_TIME_FIELD.type = 13
slot2.TASK_ADD_ACCEPT_TIME_FIELD.cpp_type = 3
slot2.TASK_ADD_SUBMIT_TIME_FIELD.name = "submit_time"
slot2.TASK_ADD_SUBMIT_TIME_FIELD.full_name = "p20.task_add.submit_time"
slot2.TASK_ADD_SUBMIT_TIME_FIELD.number = 4
slot2.TASK_ADD_SUBMIT_TIME_FIELD.index = 3
slot2.TASK_ADD_SUBMIT_TIME_FIELD.label = 1
slot2.TASK_ADD_SUBMIT_TIME_FIELD.has_default_value = false
slot2.TASK_ADD_SUBMIT_TIME_FIELD.default_value = 0
slot2.TASK_ADD_SUBMIT_TIME_FIELD.type = 13
slot2.TASK_ADD_SUBMIT_TIME_FIELD.cpp_type = 3
TASK_ADD.name = "task_add"
TASK_ADD.full_name = "p20.task_add"
TASK_ADD.nested_types = {}
TASK_ADD.enum_types = {}
TASK_ADD.fields = {
	slot2.TASK_ADD_ID_FIELD,
	slot2.TASK_ADD_PROGRESS_FIELD,
	slot2.TASK_ADD_ACCEPT_TIME_FIELD,
	slot2.TASK_ADD_SUBMIT_TIME_FIELD
}
TASK_ADD.is_extendable = false
TASK_ADD.extensions = {}
slot2.CS_20009_PROGRESSINFO_FIELD.name = "progressinfo"
slot2.CS_20009_PROGRESSINFO_FIELD.full_name = "p20.cs_20009.progressinfo"
slot2.CS_20009_PROGRESSINFO_FIELD.number = 1
slot2.CS_20009_PROGRESSINFO_FIELD.index = 0
slot2.CS_20009_PROGRESSINFO_FIELD.label = 3
slot2.CS_20009_PROGRESSINFO_FIELD.has_default_value = false
slot2.CS_20009_PROGRESSINFO_FIELD.default_value = {}
slot2.CS_20009_PROGRESSINFO_FIELD.message_type = TASK_UPDATE
slot2.CS_20009_PROGRESSINFO_FIELD.type = 11
slot2.CS_20009_PROGRESSINFO_FIELD.cpp_type = 10
CS_20009.name = "cs_20009"
CS_20009.full_name = "p20.cs_20009"
CS_20009.nested_types = {}
CS_20009.enum_types = {}
CS_20009.fields = {
	slot2.CS_20009_PROGRESSINFO_FIELD
}
CS_20009.is_extendable = false
CS_20009.extensions = {}
slot2.SC_20010_RESULT_FIELD.name = "result"
slot2.SC_20010_RESULT_FIELD.full_name = "p20.sc_20010.result"
slot2.SC_20010_RESULT_FIELD.number = 1
slot2.SC_20010_RESULT_FIELD.index = 0
slot2.SC_20010_RESULT_FIELD.label = 2
slot2.SC_20010_RESULT_FIELD.has_default_value = false
slot2.SC_20010_RESULT_FIELD.default_value = 0
slot2.SC_20010_RESULT_FIELD.type = 13
slot2.SC_20010_RESULT_FIELD.cpp_type = 3
SC_20010.name = "sc_20010"
SC_20010.full_name = "p20.sc_20010"
SC_20010.nested_types = {}
SC_20010.enum_types = {}
SC_20010.fields = {
	slot2.SC_20010_RESULT_FIELD
}
SC_20010.is_extendable = false
SC_20010.extensions = {}
slot2.TASK_UPDATE_ID_FIELD.name = "id"
slot2.TASK_UPDATE_ID_FIELD.full_name = "p20.task_update.id"
slot2.TASK_UPDATE_ID_FIELD.number = 1
slot2.TASK_UPDATE_ID_FIELD.index = 0
slot2.TASK_UPDATE_ID_FIELD.label = 2
slot2.TASK_UPDATE_ID_FIELD.has_default_value = false
slot2.TASK_UPDATE_ID_FIELD.default_value = 0
slot2.TASK_UPDATE_ID_FIELD.type = 13
slot2.TASK_UPDATE_ID_FIELD.cpp_type = 3
slot2.TASK_UPDATE_MODE_FIELD.name = "mode"
slot2.TASK_UPDATE_MODE_FIELD.full_name = "p20.task_update.mode"
slot2.TASK_UPDATE_MODE_FIELD.number = 2
slot2.TASK_UPDATE_MODE_FIELD.index = 1
slot2.TASK_UPDATE_MODE_FIELD.label = 2
slot2.TASK_UPDATE_MODE_FIELD.has_default_value = false
slot2.TASK_UPDATE_MODE_FIELD.default_value = 0
slot2.TASK_UPDATE_MODE_FIELD.type = 13
slot2.TASK_UPDATE_MODE_FIELD.cpp_type = 3
slot2.TASK_UPDATE_PROGRESS_FIELD.name = "progress"
slot2.TASK_UPDATE_PROGRESS_FIELD.full_name = "p20.task_update.progress"
slot2.TASK_UPDATE_PROGRESS_FIELD.number = 3
slot2.TASK_UPDATE_PROGRESS_FIELD.index = 2
slot2.TASK_UPDATE_PROGRESS_FIELD.label = 2
slot2.TASK_UPDATE_PROGRESS_FIELD.has_default_value = false
slot2.TASK_UPDATE_PROGRESS_FIELD.default_value = 0
slot2.TASK_UPDATE_PROGRESS_FIELD.type = 13
slot2.TASK_UPDATE_PROGRESS_FIELD.cpp_type = 3
TASK_UPDATE.name = "task_update"
TASK_UPDATE.full_name = "p20.task_update"
TASK_UPDATE.nested_types = {}
TASK_UPDATE.enum_types = {}
TASK_UPDATE.fields = {
	slot2.TASK_UPDATE_ID_FIELD,
	slot2.TASK_UPDATE_MODE_FIELD,
	slot2.TASK_UPDATE_PROGRESS_FIELD
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
