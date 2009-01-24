use strict;
use warnings;
use Test::More tests => 3;

use MythTV;

my $uri = MythTV::URI->new_with_value('http://localhost/');
isa_ok($uri, 'MythTV::URI');

is($uri->get_host, 'localhost');
is($uri->get_protocol, 'http');
