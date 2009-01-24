use strict;
use warnings;
use Glib::CodeGen;
use Glib::MakeHelper;
use ExtUtils::Depends;
use ExtUtils::PkgConfig;
use ExtUtils::MakeMaker;
use File::Spec::Functions qw/catfile rel2abs/;

mkdir 'build';

my %pkg_config = ExtUtils::PkgConfig->find('gmyth');

Glib::CodeGen->parse_maps('mythtv');
Glib::CodeGen->write_boot(ignore => qr/^MythTV$/);

our $mythtv = ExtUtils::Depends->new('MythTV', 'Glib');
our @xs_files = <xs/*.xs>;

$mythtv->add_xs(@xs_files);
$mythtv->add_typemaps(rel2abs(catfile(qw/build mythtv.typemap/)));
$mythtv->set_inc($pkg_config{cflags} . ' -I./build -Wall -Wextra');
$mythtv->set_libs($pkg_config{libs});
$mythtv->install(catfile(qw/build mythtv-autogen.h/));
$mythtv->add_pm('lib/MythTV.pm' => '$(INST_LIBDIR)/MythTV.pm');

WriteMakefile(
    NAME         => 'MythTV',
    VERSION_FROM => 'lib/MythTV.pm',
    XSPROTOARG   => '-noprototypes',
    $mythtv->get_makefile_vars(),
);
