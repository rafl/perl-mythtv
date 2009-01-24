#include "perlmyth.h"

MODULE = Net::MythTV::StringList  PACKAGE = Net::MythTV::StringList  PREFIX = gmyth_string_list_

GMythStringList *
gmyth_string_list_new (class)
	C_ARGS:

void
gmyth_string_list_clear_all (strlist)
		GMythStringList *strlist

int
gmyth_string_list_length (strlist)
		GMythStringList *strlist

GString *
gmyth_string_list_append_float (strlist, value)
		GMythStringList *strlist
		gdouble value

GString *
gmyth_string_list_append_int (strlist, value)
		GMythStringList *strlist
		gint value

GString *
gmyth_string_list_append_uint64 (strlist, value)
		GMythStringList *strlist
		guint64 value

GString *
gmyth_string_list_append_int64 (strlist, value)
		GMythStringList *strlist
		gint64 value

GString *
gmyth_string_list_append_string (strlist, value)
		GMythStringList *strlist
		GString *value

int
gmyth_string_list_get_int (strlist, index)
		GMythStringList *strlist
		gint index

guint64
gmyth_string_list_get_uint64 (strlist, index)
		GMythStringList *strlist
		gint index

gint64
gmyth_string_list_get_int64 (strlist, index)
		GMythStringList *strlist
		gint index

GString *
gmyth_string_list_get_string (strlist, index)
		GMythStringList *strlist
		gint index
