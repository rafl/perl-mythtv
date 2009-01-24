use strict;
use warnings;
use Test::More tests => 8;

use MythTV;

my $prog = MythTV::ProgramInfo->new;
isa_ok($prog, 'MythTV::ProgramInfo');

$prog->set_len_mins(42);
is($prog->get_len_mins, 42, 'int accessors');

is($prog->get_startts, undef, 'timeval accessors');
my $now = time();
$prog->set_startts($now);
is($prog->get_startts, $now, 'timeval accessors');

$prog->set_description('affe');
is($prog->get_description, 'affe', 'string accessors');

$prog->set_is_video(1);
ok($prog->get_is_video, 'bool accessors');

$prog->set_stars(4.2);
is($prog->get_stars, 4.2, 'double accessors');

$prog->set_filesize(123);
is($prog->get_filesize, 123, 'int64 accessors');
