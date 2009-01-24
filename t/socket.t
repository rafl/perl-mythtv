use strict;
use warnings;
use Test::More tests => 2;

use MythTV;

ok(defined MythTV::Socket->get_primary_addr);
ok(defined MythTV::Socket->get_local_hostname);
