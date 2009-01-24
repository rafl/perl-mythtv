#include "perlmyth.h"

MODULE = MythTV::BackendInfo  PACKAGE = MythTV::BackendInfo  PREFIX = gmyth_backend_info_

GMythBackendInfo *
gmyth_backend_info_new (class)
	C_ARGS:

GMythBackendInfo *
gmyth_backend_info_new_full (class, hostname, username, password, db_name, port)
		const gchar *hostname
		const gchar *username
		const gchar *password
		const gchar *db_name
		gint port
	C_ARGS:
		hostname, username, password, db_name, port

GMythBackendInfo *
gmyth_backend_info_new_with_uri (class, uri_str)
		const gchar *uri_str
	C_ARGS:
		uri_str

void
gmyth_backend_info_set_hostname (backend_info, hostname)
		GMythBackendInfo *backend_info
		const gchar *hostname

void
gmyth_backend_info_set_username (backend_info, username)
		GMythBackendInfo *backend_info
		const gchar *username

void
gmyth_backend_info_set_password (backend_info, password)
		GMythBackendInfo *backend_info
		const gchar *password

void
gmyth_backend_info_set_db_name (backend_info, db_name)
		GMythBackendInfo *backend_info
		const gchar *db_name

void
gmyth_backend_info_set_db_port (backend_info, db_port)
		GMythBackendInfo *backend_info
		gint db_port

void
gmyth_backend_info_set_port (backend_info, port)
		GMythBackendInfo *backend_info
		gint port

void
gmyth_backend_info_set_status_port (backend_info, port)
		GMythBackendInfo *backend_info
		gint port

const gchar *
gmyth_backend_info_get_hostname (backend_info)
		GMythBackendInfo *backend_info

const gchar *
gmyth_backend_info_get_username (backend_info)
		GMythBackendInfo *backend_info

const gchar *
gmyth_backend_info_get_password (backend_info)
		GMythBackendInfo *backend_info

const gchar *
gmyth_backend_info_get_db_name (backend_info)
		GMythBackendInfo *backend_info

#gint
#gmyth_backend_info_get_db_port (backend_info)
#		GMythBackendInfo *backend_info

gint
gmyth_backend_info_get_port (backend_info)
		GMythBackendInfo *backend_info

GMythURI *
gmyth_backend_info_get_uri (backend_info)
		GMythBackendInfo *backend_info

gboolean
gmyth_backend_info_is_local_file (backend_info)
		GMythBackendInfo *backend_info

GMythSocket *
gmyth_backend_info_get_connected_socket (backend_info)
		GMythBackendInfo *backend_info
