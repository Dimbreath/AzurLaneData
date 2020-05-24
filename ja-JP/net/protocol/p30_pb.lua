slot0 = require("protobuf")

module("p30_pb")

slot2 = {
	SC_30001_UNREAD_NUMBER_FIELD = slot0.FieldDescriptor(),
	SC_30001_TOTAL_NUMBER_FIELD = slot0.FieldDescriptor(),
	CS_30002_TYPE_FIELD = slot0.FieldDescriptor(),
	CS_30002_SPLIT_ID_FIELD = slot0.FieldDescriptor(),
	SC_30003_MAIL_LIST_FIELD = slot0.FieldDescriptor(),
	CS_30004_ID_FIELD = slot0.FieldDescriptor(),
	SC_30005_ATTACHMENT_LIST_FIELD = slot0.FieldDescriptor(),
	CS_30006_ID_FIELD = slot0.FieldDescriptor(),
	SC_30007_ID_LIST_FIELD = slot0.FieldDescriptor(),
	CS_30008_ID_FIELD = slot0.FieldDescriptor(),
	SC_30009_DETAIL_INFO_FIELD = slot0.FieldDescriptor(),
	CS_30010_ID_FIELD = slot0.FieldDescriptor(),
	CS_30010_FLAG_FIELD = slot0.FieldDescriptor(),
	SC_30011_RESULT_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_ID_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_DATE_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_TITLE_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_ATTACH_FLAG_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_READ_FLAG_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_ATTACHMENT_LIST_FIELD = slot0.FieldDescriptor(),
	MAIL_SIGLE_IMP_FLAG_FIELD = slot0.FieldDescriptor(),
	MAIL_DETAIL_ID_FIELD = slot0.FieldDescriptor(),
	MAIL_DETAIL_CONTENT_FIELD = slot0.FieldDescriptor(),
	MAIL_DETAIL_ATTACHMENT_LIST_FIELD = slot0.FieldDescriptor(),
	ATTACHMENT_TYPE_FIELD = slot0.FieldDescriptor(),
	ATTACHMENT_ID_FIELD = slot0.FieldDescriptor(),
	ATTACHMENT_NUMBER_FIELD = slot0.FieldDescriptor(),
	CS_30101_ACT_ID_FIELD = slot0.FieldDescriptor(),
	CS_30101_ANSWERS_FIELD = slot0.FieldDescriptor(),
	SC_30102_RESULT_FIELD = slot0.FieldDescriptor(),
	SC_30102_DROP_LIST_FIELD = slot0.FieldDescriptor(),
	ANSWER_ID_FIELD = slot0.FieldDescriptor(),
	ANSWER_OPTIONS_FIELD = slot0.FieldDescriptor(),
	ANSWER_CONTAIN_FIELD = slot0.FieldDescriptor()
}
SC_30001 = slot0.Descriptor()
CS_30002 = slot0.Descriptor()
SC_30003 = slot0.Descriptor()
CS_30004 = slot0.Descriptor()
SC_30005 = slot0.Descriptor()
CS_30006 = slot0.Descriptor()
SC_30007 = slot0.Descriptor()
CS_30008 = slot0.Descriptor()
SC_30009 = slot0.Descriptor()
CS_30010 = slot0.Descriptor()
SC_30011 = slot0.Descriptor()
MAIL_SIGLE = slot0.Descriptor()
MAIL_DETAIL = slot0.Descriptor()
ATTACHMENT = slot0.Descriptor()
CS_30101 = slot0.Descriptor()
SC_30102 = slot0.Descriptor()
ANSWER = slot0.Descriptor()
slot2.SC_30001_UNREAD_NUMBER_FIELD.name = "unread_number"
slot2.SC_30001_UNREAD_NUMBER_FIELD.full_name = "p30.sc_30001.unread_number"
slot2.SC_30001_UNREAD_NUMBER_FIELD.number = 1
slot2.SC_30001_UNREAD_NUMBER_FIELD.index = 0
slot2.SC_30001_UNREAD_NUMBER_FIELD.label = 2
slot2.SC_30001_UNREAD_NUMBER_FIELD.has_default_value = false
slot2.SC_30001_UNREAD_NUMBER_FIELD.default_value = 0
slot2.SC_30001_UNREAD_NUMBER_FIELD.type = 13
slot2.SC_30001_UNREAD_NUMBER_FIELD.cpp_type = 3
slot2.SC_30001_TOTAL_NUMBER_FIELD.name = "total_number"
slot2.SC_30001_TOTAL_NUMBER_FIELD.full_name = "p30.sc_30001.total_number"
slot2.SC_30001_TOTAL_NUMBER_FIELD.number = 3
slot2.SC_30001_TOTAL_NUMBER_FIELD.index = 1
slot2.SC_30001_TOTAL_NUMBER_FIELD.label = 2
slot2.SC_30001_TOTAL_NUMBER_FIELD.has_default_value = false
slot2.SC_30001_TOTAL_NUMBER_FIELD.default_value = 0
slot2.SC_30001_TOTAL_NUMBER_FIELD.type = 13
slot2.SC_30001_TOTAL_NUMBER_FIELD.cpp_type = 3
SC_30001.name = "sc_30001"
SC_30001.full_name = "p30.sc_30001"
SC_30001.nested_types = {}
SC_30001.enum_types = {}
SC_30001.fields = {
	slot2.SC_30001_UNREAD_NUMBER_FIELD,
	slot2.SC_30001_TOTAL_NUMBER_FIELD
}
SC_30001.is_extendable = false
SC_30001.extensions = {}
slot2.CS_30002_TYPE_FIELD.name = "type"
slot2.CS_30002_TYPE_FIELD.full_name = "p30.cs_30002.type"
slot2.CS_30002_TYPE_FIELD.number = 1
slot2.CS_30002_TYPE_FIELD.index = 0
slot2.CS_30002_TYPE_FIELD.label = 2
slot2.CS_30002_TYPE_FIELD.has_default_value = false
slot2.CS_30002_TYPE_FIELD.default_value = 0
slot2.CS_30002_TYPE_FIELD.type = 13
slot2.CS_30002_TYPE_FIELD.cpp_type = 3
slot2.CS_30002_SPLIT_ID_FIELD.name = "split_id"
slot2.CS_30002_SPLIT_ID_FIELD.full_name = "p30.cs_30002.split_id"
slot2.CS_30002_SPLIT_ID_FIELD.number = 2
slot2.CS_30002_SPLIT_ID_FIELD.index = 1
slot2.CS_30002_SPLIT_ID_FIELD.label = 1
slot2.CS_30002_SPLIT_ID_FIELD.has_default_value = false
slot2.CS_30002_SPLIT_ID_FIELD.default_value = 0
slot2.CS_30002_SPLIT_ID_FIELD.type = 13
slot2.CS_30002_SPLIT_ID_FIELD.cpp_type = 3
CS_30002.name = "cs_30002"
CS_30002.full_name = "p30.cs_30002"
CS_30002.nested_types = {}
CS_30002.enum_types = {}
CS_30002.fields = {
	slot2.CS_30002_TYPE_FIELD,
	slot2.CS_30002_SPLIT_ID_FIELD
}
CS_30002.is_extendable = false
CS_30002.extensions = {}
slot2.SC_30003_MAIL_LIST_FIELD.name = "mail_list"
slot2.SC_30003_MAIL_LIST_FIELD.full_name = "p30.sc_30003.mail_list"
slot2.SC_30003_MAIL_LIST_FIELD.number = 1
slot2.SC_30003_MAIL_LIST_FIELD.index = 0
slot2.SC_30003_MAIL_LIST_FIELD.label = 3
slot2.SC_30003_MAIL_LIST_FIELD.has_default_value = false
slot2.SC_30003_MAIL_LIST_FIELD.default_value = {}
slot2.SC_30003_MAIL_LIST_FIELD.message_type = MAIL_SIGLE
slot2.SC_30003_MAIL_LIST_FIELD.type = 11
slot2.SC_30003_MAIL_LIST_FIELD.cpp_type = 10
SC_30003.name = "sc_30003"
SC_30003.full_name = "p30.sc_30003"
SC_30003.nested_types = {}
SC_30003.enum_types = {}
SC_30003.fields = {
	slot2.SC_30003_MAIL_LIST_FIELD
}
SC_30003.is_extendable = false
SC_30003.extensions = {}
slot2.CS_30004_ID_FIELD.name = "id"
slot2.CS_30004_ID_FIELD.full_name = "p30.cs_30004.id"
slot2.CS_30004_ID_FIELD.number = 1
slot2.CS_30004_ID_FIELD.index = 0
slot2.CS_30004_ID_FIELD.label = 3
slot2.CS_30004_ID_FIELD.has_default_value = false
slot2.CS_30004_ID_FIELD.default_value = {}
slot2.CS_30004_ID_FIELD.type = 13
slot2.CS_30004_ID_FIELD.cpp_type = 3
CS_30004.name = "cs_30004"
CS_30004.full_name = "p30.cs_30004"
CS_30004.nested_types = {}
CS_30004.enum_types = {}
CS_30004.fields = {
	slot2.CS_30004_ID_FIELD
}
CS_30004.is_extendable = false
CS_30004.extensions = {}
slot2.SC_30005_ATTACHMENT_LIST_FIELD.name = "attachment_list"
slot2.SC_30005_ATTACHMENT_LIST_FIELD.full_name = "p30.sc_30005.attachment_list"
slot2.SC_30005_ATTACHMENT_LIST_FIELD.number = 1
slot2.SC_30005_ATTACHMENT_LIST_FIELD.index = 0
slot2.SC_30005_ATTACHMENT_LIST_FIELD.label = 3
slot2.SC_30005_ATTACHMENT_LIST_FIELD.has_default_value = false
slot2.SC_30005_ATTACHMENT_LIST_FIELD.default_value = {}
slot2.SC_30005_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
slot2.SC_30005_ATTACHMENT_LIST_FIELD.type = 11
slot2.SC_30005_ATTACHMENT_LIST_FIELD.cpp_type = 10
SC_30005.name = "sc_30005"
SC_30005.full_name = "p30.sc_30005"
SC_30005.nested_types = {}
SC_30005.enum_types = {}
SC_30005.fields = {
	slot2.SC_30005_ATTACHMENT_LIST_FIELD
}
SC_30005.is_extendable = false
SC_30005.extensions = {}
slot2.CS_30006_ID_FIELD.name = "id"
slot2.CS_30006_ID_FIELD.full_name = "p30.cs_30006.id"
slot2.CS_30006_ID_FIELD.number = 1
slot2.CS_30006_ID_FIELD.index = 0
slot2.CS_30006_ID_FIELD.label = 2
slot2.CS_30006_ID_FIELD.has_default_value = false
slot2.CS_30006_ID_FIELD.default_value = 0
slot2.CS_30006_ID_FIELD.type = 13
slot2.CS_30006_ID_FIELD.cpp_type = 3
CS_30006.name = "cs_30006"
CS_30006.full_name = "p30.cs_30006"
CS_30006.nested_types = {}
CS_30006.enum_types = {}
CS_30006.fields = {
	slot2.CS_30006_ID_FIELD
}
CS_30006.is_extendable = false
CS_30006.extensions = {}
slot2.SC_30007_ID_LIST_FIELD.name = "id_list"
slot2.SC_30007_ID_LIST_FIELD.full_name = "p30.sc_30007.id_list"
slot2.SC_30007_ID_LIST_FIELD.number = 1
slot2.SC_30007_ID_LIST_FIELD.index = 0
slot2.SC_30007_ID_LIST_FIELD.label = 3
slot2.SC_30007_ID_LIST_FIELD.has_default_value = false
slot2.SC_30007_ID_LIST_FIELD.default_value = {}
slot2.SC_30007_ID_LIST_FIELD.type = 13
slot2.SC_30007_ID_LIST_FIELD.cpp_type = 3
SC_30007.name = "sc_30007"
SC_30007.full_name = "p30.sc_30007"
SC_30007.nested_types = {}
SC_30007.enum_types = {}
SC_30007.fields = {
	slot2.SC_30007_ID_LIST_FIELD
}
SC_30007.is_extendable = false
SC_30007.extensions = {}
slot2.CS_30008_ID_FIELD.name = "id"
slot2.CS_30008_ID_FIELD.full_name = "p30.cs_30008.id"
slot2.CS_30008_ID_FIELD.number = 1
slot2.CS_30008_ID_FIELD.index = 0
slot2.CS_30008_ID_FIELD.label = 2
slot2.CS_30008_ID_FIELD.has_default_value = false
slot2.CS_30008_ID_FIELD.default_value = 0
slot2.CS_30008_ID_FIELD.type = 13
slot2.CS_30008_ID_FIELD.cpp_type = 3
CS_30008.name = "cs_30008"
CS_30008.full_name = "p30.cs_30008"
CS_30008.nested_types = {}
CS_30008.enum_types = {}
CS_30008.fields = {
	slot2.CS_30008_ID_FIELD
}
CS_30008.is_extendable = false
CS_30008.extensions = {}
slot2.SC_30009_DETAIL_INFO_FIELD.name = "detail_info"
slot2.SC_30009_DETAIL_INFO_FIELD.full_name = "p30.sc_30009.detail_info"
slot2.SC_30009_DETAIL_INFO_FIELD.number = 1
slot2.SC_30009_DETAIL_INFO_FIELD.index = 0
slot2.SC_30009_DETAIL_INFO_FIELD.label = 2
slot2.SC_30009_DETAIL_INFO_FIELD.has_default_value = false
slot2.SC_30009_DETAIL_INFO_FIELD.default_value = nil
slot2.SC_30009_DETAIL_INFO_FIELD.message_type = MAIL_DETAIL
slot2.SC_30009_DETAIL_INFO_FIELD.type = 11
slot2.SC_30009_DETAIL_INFO_FIELD.cpp_type = 10
SC_30009.name = "sc_30009"
SC_30009.full_name = "p30.sc_30009"
SC_30009.nested_types = {}
SC_30009.enum_types = {}
SC_30009.fields = {
	slot2.SC_30009_DETAIL_INFO_FIELD
}
SC_30009.is_extendable = false
SC_30009.extensions = {}
slot2.CS_30010_ID_FIELD.name = "id"
slot2.CS_30010_ID_FIELD.full_name = "p30.cs_30010.id"
slot2.CS_30010_ID_FIELD.number = 1
slot2.CS_30010_ID_FIELD.index = 0
slot2.CS_30010_ID_FIELD.label = 2
slot2.CS_30010_ID_FIELD.has_default_value = false
slot2.CS_30010_ID_FIELD.default_value = 0
slot2.CS_30010_ID_FIELD.type = 13
slot2.CS_30010_ID_FIELD.cpp_type = 3
slot2.CS_30010_FLAG_FIELD.name = "flag"
slot2.CS_30010_FLAG_FIELD.full_name = "p30.cs_30010.flag"
slot2.CS_30010_FLAG_FIELD.number = 2
slot2.CS_30010_FLAG_FIELD.index = 1
slot2.CS_30010_FLAG_FIELD.label = 2
slot2.CS_30010_FLAG_FIELD.has_default_value = false
slot2.CS_30010_FLAG_FIELD.default_value = 0
slot2.CS_30010_FLAG_FIELD.type = 13
slot2.CS_30010_FLAG_FIELD.cpp_type = 3
CS_30010.name = "cs_30010"
CS_30010.full_name = "p30.cs_30010"
CS_30010.nested_types = {}
CS_30010.enum_types = {}
CS_30010.fields = {
	slot2.CS_30010_ID_FIELD,
	slot2.CS_30010_FLAG_FIELD
}
CS_30010.is_extendable = false
CS_30010.extensions = {}
slot2.SC_30011_RESULT_FIELD.name = "result"
slot2.SC_30011_RESULT_FIELD.full_name = "p30.sc_30011.result"
slot2.SC_30011_RESULT_FIELD.number = 1
slot2.SC_30011_RESULT_FIELD.index = 0
slot2.SC_30011_RESULT_FIELD.label = 2
slot2.SC_30011_RESULT_FIELD.has_default_value = false
slot2.SC_30011_RESULT_FIELD.default_value = 0
slot2.SC_30011_RESULT_FIELD.type = 13
slot2.SC_30011_RESULT_FIELD.cpp_type = 3
SC_30011.name = "sc_30011"
SC_30011.full_name = "p30.sc_30011"
SC_30011.nested_types = {}
SC_30011.enum_types = {}
SC_30011.fields = {
	slot2.SC_30011_RESULT_FIELD
}
SC_30011.is_extendable = false
SC_30011.extensions = {}
slot2.MAIL_SIGLE_ID_FIELD.name = "id"
slot2.MAIL_SIGLE_ID_FIELD.full_name = "p30.mail_sigle.id"
slot2.MAIL_SIGLE_ID_FIELD.number = 1
slot2.MAIL_SIGLE_ID_FIELD.index = 0
slot2.MAIL_SIGLE_ID_FIELD.label = 2
slot2.MAIL_SIGLE_ID_FIELD.has_default_value = false
slot2.MAIL_SIGLE_ID_FIELD.default_value = 0
slot2.MAIL_SIGLE_ID_FIELD.type = 13
slot2.MAIL_SIGLE_ID_FIELD.cpp_type = 3
slot2.MAIL_SIGLE_DATE_FIELD.name = "date"
slot2.MAIL_SIGLE_DATE_FIELD.full_name = "p30.mail_sigle.date"
slot2.MAIL_SIGLE_DATE_FIELD.number = 2
slot2.MAIL_SIGLE_DATE_FIELD.index = 1
slot2.MAIL_SIGLE_DATE_FIELD.label = 2
slot2.MAIL_SIGLE_DATE_FIELD.has_default_value = false
slot2.MAIL_SIGLE_DATE_FIELD.default_value = 0
slot2.MAIL_SIGLE_DATE_FIELD.type = 13
slot2.MAIL_SIGLE_DATE_FIELD.cpp_type = 3
slot2.MAIL_SIGLE_TITLE_FIELD.name = "title"
slot2.MAIL_SIGLE_TITLE_FIELD.full_name = "p30.mail_sigle.title"
slot2.MAIL_SIGLE_TITLE_FIELD.number = 3
slot2.MAIL_SIGLE_TITLE_FIELD.index = 2
slot2.MAIL_SIGLE_TITLE_FIELD.label = 2
slot2.MAIL_SIGLE_TITLE_FIELD.has_default_value = false
slot2.MAIL_SIGLE_TITLE_FIELD.default_value = ""
slot2.MAIL_SIGLE_TITLE_FIELD.type = 9
slot2.MAIL_SIGLE_TITLE_FIELD.cpp_type = 9
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.name = "attach_flag"
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.full_name = "p30.mail_sigle.attach_flag"
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.number = 4
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.index = 3
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.label = 2
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.has_default_value = false
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.default_value = 0
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.type = 13
slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD.cpp_type = 3
slot2.MAIL_SIGLE_READ_FLAG_FIELD.name = "read_flag"
slot2.MAIL_SIGLE_READ_FLAG_FIELD.full_name = "p30.mail_sigle.read_flag"
slot2.MAIL_SIGLE_READ_FLAG_FIELD.number = 5
slot2.MAIL_SIGLE_READ_FLAG_FIELD.index = 4
slot2.MAIL_SIGLE_READ_FLAG_FIELD.label = 2
slot2.MAIL_SIGLE_READ_FLAG_FIELD.has_default_value = false
slot2.MAIL_SIGLE_READ_FLAG_FIELD.default_value = 0
slot2.MAIL_SIGLE_READ_FLAG_FIELD.type = 13
slot2.MAIL_SIGLE_READ_FLAG_FIELD.cpp_type = 3
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.name = "attachment_list"
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.full_name = "p30.mail_sigle.attachment_list"
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.number = 6
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.index = 5
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.label = 3
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.has_default_value = false
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.default_value = {}
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.type = 11
slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD.cpp_type = 10
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.name = "imp_flag"
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.full_name = "p30.mail_sigle.imp_flag"
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.number = 7
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.index = 6
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.label = 2
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.has_default_value = false
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.default_value = 0
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.type = 13
slot2.MAIL_SIGLE_IMP_FLAG_FIELD.cpp_type = 3
MAIL_SIGLE.name = "mail_sigle"
MAIL_SIGLE.full_name = "p30.mail_sigle"
MAIL_SIGLE.nested_types = {}
MAIL_SIGLE.enum_types = {}
MAIL_SIGLE.fields = {
	slot2.MAIL_SIGLE_ID_FIELD,
	slot2.MAIL_SIGLE_DATE_FIELD,
	slot2.MAIL_SIGLE_TITLE_FIELD,
	slot2.MAIL_SIGLE_ATTACH_FLAG_FIELD,
	slot2.MAIL_SIGLE_READ_FLAG_FIELD,
	slot2.MAIL_SIGLE_ATTACHMENT_LIST_FIELD,
	slot2.MAIL_SIGLE_IMP_FLAG_FIELD
}
MAIL_SIGLE.is_extendable = false
MAIL_SIGLE.extensions = {}
slot2.MAIL_DETAIL_ID_FIELD.name = "id"
slot2.MAIL_DETAIL_ID_FIELD.full_name = "p30.mail_detail.id"
slot2.MAIL_DETAIL_ID_FIELD.number = 1
slot2.MAIL_DETAIL_ID_FIELD.index = 0
slot2.MAIL_DETAIL_ID_FIELD.label = 2
slot2.MAIL_DETAIL_ID_FIELD.has_default_value = false
slot2.MAIL_DETAIL_ID_FIELD.default_value = 0
slot2.MAIL_DETAIL_ID_FIELD.type = 13
slot2.MAIL_DETAIL_ID_FIELD.cpp_type = 3
slot2.MAIL_DETAIL_CONTENT_FIELD.name = "content"
slot2.MAIL_DETAIL_CONTENT_FIELD.full_name = "p30.mail_detail.content"
slot2.MAIL_DETAIL_CONTENT_FIELD.number = 2
slot2.MAIL_DETAIL_CONTENT_FIELD.index = 1
slot2.MAIL_DETAIL_CONTENT_FIELD.label = 2
slot2.MAIL_DETAIL_CONTENT_FIELD.has_default_value = false
slot2.MAIL_DETAIL_CONTENT_FIELD.default_value = ""
slot2.MAIL_DETAIL_CONTENT_FIELD.type = 9
slot2.MAIL_DETAIL_CONTENT_FIELD.cpp_type = 9
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.name = "attachment_list"
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.full_name = "p30.mail_detail.attachment_list"
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.number = 3
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.index = 2
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.label = 3
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.has_default_value = false
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.default_value = {}
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.message_type = ATTACHMENT
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.type = 11
slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD.cpp_type = 10
MAIL_DETAIL.name = "mail_detail"
MAIL_DETAIL.full_name = "p30.mail_detail"
MAIL_DETAIL.nested_types = {}
MAIL_DETAIL.enum_types = {}
MAIL_DETAIL.fields = {
	slot2.MAIL_DETAIL_ID_FIELD,
	slot2.MAIL_DETAIL_CONTENT_FIELD,
	slot2.MAIL_DETAIL_ATTACHMENT_LIST_FIELD
}
MAIL_DETAIL.is_extendable = false
MAIL_DETAIL.extensions = {}
slot2.ATTACHMENT_TYPE_FIELD.name = "type"
slot2.ATTACHMENT_TYPE_FIELD.full_name = "p30.attachment.type"
slot2.ATTACHMENT_TYPE_FIELD.number = 1
slot2.ATTACHMENT_TYPE_FIELD.index = 0
slot2.ATTACHMENT_TYPE_FIELD.label = 2
slot2.ATTACHMENT_TYPE_FIELD.has_default_value = false
slot2.ATTACHMENT_TYPE_FIELD.default_value = 0
slot2.ATTACHMENT_TYPE_FIELD.type = 13
slot2.ATTACHMENT_TYPE_FIELD.cpp_type = 3
slot2.ATTACHMENT_ID_FIELD.name = "id"
slot2.ATTACHMENT_ID_FIELD.full_name = "p30.attachment.id"
slot2.ATTACHMENT_ID_FIELD.number = 2
slot2.ATTACHMENT_ID_FIELD.index = 1
slot2.ATTACHMENT_ID_FIELD.label = 2
slot2.ATTACHMENT_ID_FIELD.has_default_value = false
slot2.ATTACHMENT_ID_FIELD.default_value = 0
slot2.ATTACHMENT_ID_FIELD.type = 13
slot2.ATTACHMENT_ID_FIELD.cpp_type = 3
slot2.ATTACHMENT_NUMBER_FIELD.name = "number"
slot2.ATTACHMENT_NUMBER_FIELD.full_name = "p30.attachment.number"
slot2.ATTACHMENT_NUMBER_FIELD.number = 3
slot2.ATTACHMENT_NUMBER_FIELD.index = 2
slot2.ATTACHMENT_NUMBER_FIELD.label = 2
slot2.ATTACHMENT_NUMBER_FIELD.has_default_value = false
slot2.ATTACHMENT_NUMBER_FIELD.default_value = 0
slot2.ATTACHMENT_NUMBER_FIELD.type = 13
slot2.ATTACHMENT_NUMBER_FIELD.cpp_type = 3
ATTACHMENT.name = "attachment"
ATTACHMENT.full_name = "p30.attachment"
ATTACHMENT.nested_types = {}
ATTACHMENT.enum_types = {}
ATTACHMENT.fields = {
	slot2.ATTACHMENT_TYPE_FIELD,
	slot2.ATTACHMENT_ID_FIELD,
	slot2.ATTACHMENT_NUMBER_FIELD
}
ATTACHMENT.is_extendable = false
ATTACHMENT.extensions = {}
slot2.CS_30101_ACT_ID_FIELD.name = "act_id"
slot2.CS_30101_ACT_ID_FIELD.full_name = "p30.cs_30101.act_id"
slot2.CS_30101_ACT_ID_FIELD.number = 1
slot2.CS_30101_ACT_ID_FIELD.index = 0
slot2.CS_30101_ACT_ID_FIELD.label = 2
slot2.CS_30101_ACT_ID_FIELD.has_default_value = false
slot2.CS_30101_ACT_ID_FIELD.default_value = 0
slot2.CS_30101_ACT_ID_FIELD.type = 13
slot2.CS_30101_ACT_ID_FIELD.cpp_type = 3
slot2.CS_30101_ANSWERS_FIELD.name = "answers"
slot2.CS_30101_ANSWERS_FIELD.full_name = "p30.cs_30101.answers"
slot2.CS_30101_ANSWERS_FIELD.number = 2
slot2.CS_30101_ANSWERS_FIELD.index = 1
slot2.CS_30101_ANSWERS_FIELD.label = 3
slot2.CS_30101_ANSWERS_FIELD.has_default_value = false
slot2.CS_30101_ANSWERS_FIELD.default_value = {}
slot2.CS_30101_ANSWERS_FIELD.message_type = ANSWER
slot2.CS_30101_ANSWERS_FIELD.type = 11
slot2.CS_30101_ANSWERS_FIELD.cpp_type = 10
CS_30101.name = "cs_30101"
CS_30101.full_name = "p30.cs_30101"
CS_30101.nested_types = {}
CS_30101.enum_types = {}
CS_30101.fields = {
	slot2.CS_30101_ACT_ID_FIELD,
	slot2.CS_30101_ANSWERS_FIELD
}
CS_30101.is_extendable = false
CS_30101.extensions = {}
slot2.SC_30102_RESULT_FIELD.name = "result"
slot2.SC_30102_RESULT_FIELD.full_name = "p30.sc_30102.result"
slot2.SC_30102_RESULT_FIELD.number = 1
slot2.SC_30102_RESULT_FIELD.index = 0
slot2.SC_30102_RESULT_FIELD.label = 2
slot2.SC_30102_RESULT_FIELD.has_default_value = false
slot2.SC_30102_RESULT_FIELD.default_value = 0
slot2.SC_30102_RESULT_FIELD.type = 13
slot2.SC_30102_RESULT_FIELD.cpp_type = 3
slot2.SC_30102_DROP_LIST_FIELD.name = "drop_list"
slot2.SC_30102_DROP_LIST_FIELD.full_name = "p30.sc_30102.drop_list"
slot2.SC_30102_DROP_LIST_FIELD.number = 2
slot2.SC_30102_DROP_LIST_FIELD.index = 1
slot2.SC_30102_DROP_LIST_FIELD.label = 3
slot2.SC_30102_DROP_LIST_FIELD.has_default_value = false
slot2.SC_30102_DROP_LIST_FIELD.default_value = {}
slot2.SC_30102_DROP_LIST_FIELD.message_type = require("common_pb").DROPINFO
slot2.SC_30102_DROP_LIST_FIELD.type = 11
slot2.SC_30102_DROP_LIST_FIELD.cpp_type = 10
SC_30102.name = "sc_30102"
SC_30102.full_name = "p30.sc_30102"
SC_30102.nested_types = {}
SC_30102.enum_types = {}
SC_30102.fields = {
	slot2.SC_30102_RESULT_FIELD,
	slot2.SC_30102_DROP_LIST_FIELD
}
SC_30102.is_extendable = false
SC_30102.extensions = {}
slot2.ANSWER_ID_FIELD.name = "id"
slot2.ANSWER_ID_FIELD.full_name = "p30.answer.id"
slot2.ANSWER_ID_FIELD.number = 1
slot2.ANSWER_ID_FIELD.index = 0
slot2.ANSWER_ID_FIELD.label = 2
slot2.ANSWER_ID_FIELD.has_default_value = false
slot2.ANSWER_ID_FIELD.default_value = 0
slot2.ANSWER_ID_FIELD.type = 13
slot2.ANSWER_ID_FIELD.cpp_type = 3
slot2.ANSWER_OPTIONS_FIELD.name = "options"
slot2.ANSWER_OPTIONS_FIELD.full_name = "p30.answer.options"
slot2.ANSWER_OPTIONS_FIELD.number = 2
slot2.ANSWER_OPTIONS_FIELD.index = 1
slot2.ANSWER_OPTIONS_FIELD.label = 3
slot2.ANSWER_OPTIONS_FIELD.has_default_value = false
slot2.ANSWER_OPTIONS_FIELD.default_value = {}
slot2.ANSWER_OPTIONS_FIELD.type = 13
slot2.ANSWER_OPTIONS_FIELD.cpp_type = 3
slot2.ANSWER_CONTAIN_FIELD.name = "contain"
slot2.ANSWER_CONTAIN_FIELD.full_name = "p30.answer.contain"
slot2.ANSWER_CONTAIN_FIELD.number = 3
slot2.ANSWER_CONTAIN_FIELD.index = 2
slot2.ANSWER_CONTAIN_FIELD.label = 1
slot2.ANSWER_CONTAIN_FIELD.has_default_value = false
slot2.ANSWER_CONTAIN_FIELD.default_value = ""
slot2.ANSWER_CONTAIN_FIELD.type = 9
slot2.ANSWER_CONTAIN_FIELD.cpp_type = 9
ANSWER.name = "answer"
ANSWER.full_name = "p30.answer"
ANSWER.nested_types = {}
ANSWER.enum_types = {}
ANSWER.fields = {
	slot2.ANSWER_ID_FIELD,
	slot2.ANSWER_OPTIONS_FIELD,
	slot2.ANSWER_CONTAIN_FIELD
}
ANSWER.is_extendable = false
ANSWER.extensions = {}
answer = slot0.Message(ANSWER)
attachment = slot0.Message(ATTACHMENT)
cs_30002 = slot0.Message(CS_30002)
cs_30004 = slot0.Message(CS_30004)
cs_30006 = slot0.Message(CS_30006)
cs_30008 = slot0.Message(CS_30008)
cs_30010 = slot0.Message(CS_30010)
cs_30101 = slot0.Message(CS_30101)
mail_detail = slot0.Message(MAIL_DETAIL)
mail_sigle = slot0.Message(MAIL_SIGLE)
sc_30001 = slot0.Message(SC_30001)
sc_30003 = slot0.Message(SC_30003)
sc_30005 = slot0.Message(SC_30005)
sc_30007 = slot0.Message(SC_30007)
sc_30009 = slot0.Message(SC_30009)
sc_30011 = slot0.Message(SC_30011)
sc_30102 = slot0.Message(SC_30102)
