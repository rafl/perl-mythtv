#include "perlmyth.h"

STATIC SV *
channel_info_to_hashref (GMythChannelInfo *channel)
{
	HV *hash = newHV ();

	if (!hv_stores (hash, "id", newSViv (channel->channel_ID))) croak ("hash store failed");
	if (!hv_stores (hash, "num", newSVpvn (channel->channel_num->str, channel->channel_num->len))) croak ("hash store failed");
	if (!hv_stores (hash, "name", newSVpvn (channel->channel_name->str, channel->channel_name->len))) croak ("hash store failed");
	if (!hv_stores (hash, "icon", newSVpvn (channel->channel_icon->str, channel->channel_icon->len))) croak ("hash store failed");

	return newRV_noinc ((SV *)hash);
}

MODULE = MythTV::EPG  PACKAGE = MythTV::EPG  PREFIX = gmyth_epg_

GMythEPG *
gmyth_epg_new (class)
	C_ARGS:

gboolean
gmyth_epg_connect (epg, backend_info)
		GMythEPG *epg
		GMythBackendInfo *backend_info

gboolean
gmyth_epg_disconnect (epg)
		GMythEPG *epg

void
gmyth_epg_get_channel_list (epg)
		GMythEPG *epg
	PREINIT:
		gint num_channels;
		GList *i, *channels = NULL;
	PPCODE:
		num_channels = gmyth_epg_get_channel_list (epg, &channels);

		if (num_channels < 0) {
			croak ("getting channel list failed");
		}

		EXTEND (SP, num_channels);
		for (i = channels; i; i = i->next) {
			PUSHs (sv_2mortal (channel_info_to_hashref ((GMythChannelInfo *)i->data)));
		}

		gmyth_free_channel_list (channels);

void
gmyth_epg_get_program_list (epg, chan_num, start_time, end_time)
		GMythEPG *epg
		gint chan_num
		IV start_time
		IV end_time
	PREINIT:
		gint num_programs;
		GList *i, *programs = NULL;
		GTimeVal start, end;
	INIT:
		start.tv_sec = start_time;
		start.tv_usec = 0;
		end.tv_sec = end_time;
		end.tv_usec = 0;
	PPCODE:
		num_programs = gmyth_epg_get_program_list (epg, &programs, chan_num, &start, &end);
		if (num_programs < 0) {
			croak ("getting program list failed");
		}

		EXTEND (SP, num_programs);
		for (i = programs; i; i = i->next) {
			PUSHs (sv_2mortal (newSVGMythProgramInfo ((GMythProgramInfo *)i->data)));
		}

		g_list_free (programs);

SV *
gmyth_epg_get_channel_info (epg, channel_id)
		GMythEPG *epg
		gint channel_id
	CODE:
		RETVAL = channel_info_to_hashref (gmyth_epg_get_channel_info (epg, channel_id));
	OUTPUT:
		RETVAL
