use strict;
use warnings;
use Test::More tests => 2;

use Net::MythTV;

ok(defined Net::MythTV::Socket->get_primary_addr);
ok(defined Net::MythTV::Socket->get_local_hostname);
