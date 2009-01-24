#include "perlmyth.h"

MODULE = Net::MythTV::URI  PACKAGE = Net::MythTV::URI  PREFIX = gmyth_uri_

GMythURI *
gmyth_uri_new (class)
	C_ARGS:

GMythURI *
gmyth_uri_new_with_value (class, value)
		const gchar *value
	C_ARGS:
		value

gboolean
gmyth_uri_is_equals (uri1, uri2)
		GMythURI *uri1
		GMythURI *uri2

gboolean
gmyth_uri_is_livetv (uri)
		GMythURI *uri

gint
gmyth_uri_get_channel_num (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_channel_name (uri)
		GMythURI *uri

char *
gmyth_uri_to_string (uri)
		const GMythURI *uri

gboolean
gmyth_uri_is_local_file (uri)
		const GMythURI *uri

gchar *
gmyth_uri_get_host (uri)
		GMythURI *uri

gint
gmyth_uri_get_port (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_protocol (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_path (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_user (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_password (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_fragment (uri)
		GMythURI *uri

gchar *
gmyth_uri_get_query (uri)
		GMythURI *uri
