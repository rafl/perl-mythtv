#include "perlmyth.h"

MODULE = MythTV::Socket  PACKAGE = MythTV::Socket  PREFIX = gmyth_socket_

GMythSocket *
gmyth_socket_new (class)
	C_ARGS:

IV
gmyth_socket_get_io_channel (socket)
		GMythSocket *socket
	CODE:
		RETVAL = g_io_channel_unix_get_fd (gmyth_socket_get_io_channel (socket));
	OUTPUT:
		RETVAL

gboolean
gmyth_socket_is_able_to_read (socket)
		GMythSocket *socket

gboolean
gmyth_socket_is_able_to_write (socket)
		GMythSocket *socket

gboolean
gmyth_socket_send_command (socket, command)
		GMythSocket *socket
		GString *command
	CLEANUP:
		g_string_free (command, TRUE);

GString *
gmyth_socket_receive_response (socket)
		GMythSocket *socket

gint
gmyth_socket_sendreceive_stringlist (socket, str_list)
		GMythSocket *socket
		GMythStringList *str_list

gboolean
gmyth_socket_connect (socket, hostname, port)
		GMythSocket *socket
		const gchar *hostname
		gint port

gboolean
gmyth_socket_connect_with_timeout (socket, hostname, port, timeout)
		GMythSocket *socket
		const gchar *hostname
		gint port
		guint timeout

gboolean
gmyth_socket_connect_to_backend (socket, hostname_backend, port, blocking_client)
		GMythSocket *socket
		const gchar *hostname_backend
		gint port
		gboolean blocking_client

gboolean
gmyth_socket_connect_to_backend_events (socket, hostname_backend, port, blocking_client)
		GMythSocket *socket
		const gchar *hostname_backend
		gint port
		gboolean blocking_client

gchar *
gmyth_socket_get_primary_addr (class)
	C_ARGS:
	CLEANUP:
		free (RETVAL);

GString *
gmyth_socket_get_local_hostname (class)
	C_ARGS:
	CLEANUP:
		g_string_free (RETVAL, TRUE);

void
gmyth_socket_close_connection (socket)
		GMythSocket *socket

gboolean
gmyth_socket_check_protocol_version (socket)
		GMythSocket *socket

gint
gmyth_socket_check_protocol_version_number (socket, mythtv_version)
		GMythSocket *socket
		gint mythtv_version

gint
gmyth_socket_get_protocol_version (socket)
		GMythSocket *socket

gboolean
gmyth_socket_write_stringlist (socket, str_list)
		GMythSocket *socket
		GMythStringList *str_list

gint
gmyth_socket_read_stringlist (socket, str_list)
		GMythSocket *socket
		GMythStringList *str_list
