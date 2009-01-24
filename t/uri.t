use strict;
use warnings;
use Test::More tests => 3;

use Net::MythTV;

my $uri = Net::MythTV::URI->new_with_value('http://localhost/');
isa_ok($uri, 'Net::MythTV::URI');

is($uri->get_host, 'localhost');
is($uri->get_protocol, 'http');
