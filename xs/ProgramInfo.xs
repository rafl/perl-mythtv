#include "perlmyth.h"

MODULE = MythTV::ProgramInfo  PACKAGE = MythTV::ProgramInfo  PREFIX = gmyth_program_info_

GMythProgramInfo *
gmyth_program_info_new (class)
	C_ARGS:

SV *
gmyth_program_info_to_string_list (program, strlist)
		GMythProgramInfo *program
		GMythStringList *strlist
	CODE:
		(void)gmyth_program_info_to_string_list (program, strlist);
		RETVAL = ST (0);
	OUTPUT:
		RETVAL

GMythProgramInfo *
gmyth_program_info_from_string_list_from_pos (class, strlist, pos)
		GMythStringList *strlist
		guint pos
	C_ARGS:
		strlist, pos

GMythProgramInfo *
gmyth_program_info_from_string_list (class, strlist)
		GMythStringList *strlist
	C_ARGS:
		strlist

GMythProgramInfo *
gmyth_program_info_from_string_list_next_prog (class, strlist)
		GMythStringList *strlist
	C_ARGS:
		strlist

const gchar *
gmyth_program_info_to_string (program)
		GMythProgramInfo *program

gboolean
gmyth_program_info_is_equals (program1, program2)
		GMythProgramInfo *program1
		GMythProgramInfo *program2

gint
get_channel_id (program)
		GMythProgramInfo *program
	ALIAS:
		get_chancommfree = 1
		get_len_mins = 2
		get_repeat = 3
		get_spread = 4
		get_start_col = 5
		get_recpriority2 = 6
		get_reactivate = 7
		get_record_id = 8
		get_parent_id = 9
		get_source_id = 10
		get_input_id = 11
		get_card_id = 12
		get_find_id = 13
		get_programflags = 14
		get_transcoder = 15
		get_rectype = 16
		get_recstatus = 17
		get_recpriority = 18
		get_dupin = 19
		get_dupmethod = 20
	CODE:
		switch (ix) {
			case 0:  RETVAL = program->channel_id;   break;
			case 1:  RETVAL = program->chancommfree; break;
			case 2:  RETVAL = program->lenMins;      break;
			case 3:  RETVAL = program->repeat;       break;
			case 4:  RETVAL = program->spread;       break;
			case 5:  RETVAL = program->startCol;     break;
			case 6:  RETVAL = program->recpriority2; break;
			case 7:  RETVAL = program->reactivate;   break;
			case 8:  RETVAL = program->recordid;     break;
			case 9:  RETVAL = program->parentid;     break;
			case 10: RETVAL = program->sourceid;     break;
			case 11: RETVAL = program->inputid;      break;
			case 12: RETVAL = program->cardid;       break;
			case 13: RETVAL = program->findid;       break;
			case 14: RETVAL = program->programflags; break;
			case 15: RETVAL = program->transcoder;   break;
			case 16: RETVAL = program->rectype;      break;
			case 17: RETVAL = program->recstatus;    break;
			case 18: RETVAL = program->recpriority;  break;
			case 19: RETVAL = program->dupin;        break;
			case 20: RETVAL = program->dupmethod;    break;
			default:
				croak ("should not be reached");
		}
	OUTPUT:
		RETVAL

void
set_channel_id (program, value)
		GMythProgramInfo *program
		gint value
	ALIAS:
		set_chancommfree = 1
		set_len_mins = 2
		set_repeat = 3
		set_spread = 4
		set_start_col = 5
		set_recpriority2 = 6
		set_reactivate = 7
		set_record_id = 8
		set_parent_id = 9
		set_source_id = 10
		set_input_id = 11
		set_card_id = 12
		set_find_id = 13
		set_programflags = 14
		set_transcoder = 15
		set_rectype = 16
		set_recstatus = 17
		set_recpriority = 18
		set_dupin = 19
		set_dupmethod = 20
	CODE:
		switch (ix) {
			case 0:  program->channel_id = value;   break;
			case 1:  program->chancommfree = value; break;
			case 2:  program->lenMins = value;      break;
			case 3:  program->repeat = value;       break;
			case 4:  program->spread = value;       break;
			case 5:  program->startCol = value;     break;
			case 6:  program->recpriority2 = value; break;
			case 7:  program->reactivate = value;   break;
			case 8:  program->recordid = value;     break;
			case 9:  program->parentid = value;     break;
			case 10: program->sourceid = value;     break;
			case 11: program->inputid = value;      break;
			case 12: program->cardid = value;       break;
			case 13: program->findid = value;       break;
			case 14: program->programflags = value; break;
			case 15: program->transcoder = value;   break;
			case 16: program->rectype = value;      break;
			case 17: program->recstatus = value;    break;
			case 18: program->recpriority = value;  break;
			case 19: program->dupin = value;        break;
			case 20: program->dupmethod = value;    break;
			default:
				croak ("should not be reached");
		}

glong
get_startts (program)
		GMythProgramInfo *program
	ALIAS:
		get_endts = 1
		get_recstartts = 2
		get_recendts = 3
		get_original_air_date = 4
		get_last_modified = 5
		get_last_in_use_time = 6
	PREINIT:
		GTimeVal *time;
	CODE:
		switch (ix) {
			case 0: time = program->startts;         break;
			case 1: time = program->endts;           break;
			case 2: time = program->recstartts;      break;
			case 3: time = program->recendts;        break;
			case 4: time = program->originalAirDate; break;
			case 5: time = program->lastmodified;    break;
			case 6: time = program->lastInUseTime;   break;
			default:
				croak ("should not be reached");
		}

		if (!time) {
			XSRETURN_UNDEF;
		}

		RETVAL = time->tv_sec;
	OUTPUT:
		RETVAL

void
set_startts (program, value)
		GMythProgramInfo *program
		glong value
	ALIAS:
		set_endts = 1
		set_recstartts = 2
		set_recendts = 3
		set_original_air_date = 4
		set_last_modified = 5
		set_last_in_use_time = 6
	PREINIT:
		GTimeVal **time;
	CODE:
		switch (ix) {
			case 0: time = &program->startts;         break;
			case 1: time = &program->endts;           break;
			case 2: time = &program->recstartts;      break;
			case 3: time = &program->recendts;        break;
			case 4: time = &program->originalAirDate; break;
			case 5: time = &program->lastmodified;    break;
			case 6: time = &program->lastInUseTime;   break;
			default:
				croak ("should not be reached");
		}

		if (!*time) {
			*time = g_new (GTimeVal, 1);
		}

		(*time)->tv_sec = value;
		(*time)->tv_usec = 0;

GString *
get_title (program)
		GMythProgramInfo *program
	ALIAS:
		get_subtitle = 1
		get_description = 2
		get_category = 3
		get_chanstr = 4
		get_chansign = 5
		get_channame = 6
		get_chan_output_filters = 7
		get_series_id = 8
		get_program_id = 9
		get_cat_type = 10
		get_sort_title = 11
		get_year = 12
		get_scheduler_id = 13
		get_recgroup = 14
		get_playgroup = 15
		get_pathname = 16
		get_hostname = 17
	CODE:
		switch (ix) {
			case 0:  RETVAL = program->title;             break;
			case 1:  RETVAL = program->subtitle;          break;
			case 2:  RETVAL = program->description;       break;
			case 3:  RETVAL = program->category;          break;
			case 4:  RETVAL = program->chanstr;           break;
			case 5:  RETVAL = program->chansign;          break;
			case 6:  RETVAL = program->channame;          break;
			case 7:  RETVAL = program->chanOutputFilters; break;
			case 8:  RETVAL = program->seriesid;          break;
			case 9:  RETVAL = program->program_id;        break;
			case 10: RETVAL = program->catType;           break;
			case 11: RETVAL = program->sortTitle;         break;
			case 12: RETVAL = program->year;              break;
			case 13: RETVAL = program->schedulerid;       break;
			case 14: RETVAL = program->recgroup;          break;
			case 15: RETVAL = program->playgroup;         break;
			case 16: RETVAL = program->pathname;          break;
			case 17: RETVAL = program->hostname;          break;
			default:
				croak ("should not be reached");
		}
	OUTPUT:
		RETVAL

void
set_title (program, value)
		GMythProgramInfo *program
		SV *value
	ALIAS:
		set_subtitle = 1
		set_description = 2
		set_category = 3
		set_chanstr = 4
		set_chansign = 5
		set_channame = 6
		set_chan_output_filters = 7
		set_series_id = 8
		set_program_id = 9
		set_cat_type = 10
		set_sort_title = 11
		set_year = 12
		set_scheduler_id = 13
		set_recgroup = 14
		set_playgroup = 15
		set_pathname = 16
		set_hostname = 17
	PREINIT:
		GString **str;
		STRLEN len;
		char *new_val;
	CODE:
		switch (ix) {
			case 0:  str = &program->title;             break;
			case 1:  str = &program->subtitle;          break;
			case 2:  str = &program->description;       break;
			case 3:  str = &program->category;          break;
			case 4:  str = &program->chanstr;           break;
			case 5:  str = &program->chansign;          break;
			case 6:  str = &program->channame;          break;
			case 7:  str = &program->chanOutputFilters; break;
			case 8:  str = &program->seriesid;          break;
			case 9:  str = &program->program_id;        break;
			case 10: str = &program->catType;           break;
			case 11: str = &program->sortTitle;         break;
			case 12: str = &program->year;              break;
			case 13: str = &program->schedulerid;       break;
			case 14: str = &program->recgroup;          break;
			case 15: str = &program->playgroup;         break;
			case 16: str = &program->pathname;          break;
			case 17: str = &program->hostname;          break;
			default:
				croak ("should not be reached");
		}

		if (!*str) {
			*str = g_string_new ("");
		}

		new_val = SvPVbyte (value, len);

		g_string_truncate (*str, 0);
		g_string_append_len (*str, new_val, len);

gboolean
get_is_video (program)
		GMythProgramInfo *program
	ALIAS:
		get_has_air_date = 1
		get_shareable = 2
		get_duplicate = 3
	CODE:
		switch (ix) {
			case 0: RETVAL = program->isVideo;    break;
			case 1: RETVAL = program->hasAirDate; break;
			case 2: RETVAL = program->shareable;  break;
			case 3: RETVAL = program->duplicate;  break;
			default:
				croak ("should not be reached");
		}
	OUTPUT:
		RETVAL

void
set_is_video (program, value)
		GMythProgramInfo *program
		gboolean value
	ALIAS:
		set_has_air_date = 1
		set_shareable = 2
		set_duplicate = 3
	CODE:
		switch (ix) {
			case 0: program->isVideo = value;    break;
			case 1: program->hasAirDate = value; break;
			case 2: program->shareable = value;  break;
			case 3: program->duplicate = value;  break;
			default:
				croak ("should not be reached");
		}

gdouble
get_stars (program)
		GMythProgramInfo *program
	CODE:
		RETVAL = program->stars;
	OUTPUT:
		RETVAL

void
set_stars (program, value)
		GMythProgramInfo *program
		gdouble value
	CODE:
		program->stars = value;

gint64
get_filesize (program)
		GMythProgramInfo *program
	CODE:
		RETVAL = program->filesize;
	OUTPUT:
		RETVAL

void
set_filesize (program, value)
		GMythProgramInfo *program
		gint64 value
	CODE:
		program->filesize = value;
