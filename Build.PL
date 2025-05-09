use strict;
use warnings;

use Module::Build qw();
my $builder = Module::Build->new(
    module_name       => 'Sipwise-Base',
    license           => 'GPL_3',
    dist_author       => 'Lars Dieckow <ldieckow@sipwise.com>',
    dist_version_from => 'lib/Sipwise/Base.pm',
    configure_requires => {
        'Module::Build' => '0.4004',
    },
    test_requires    => {
        'Test::More' => '0.88',
    },
    requires => {
        'autodie'                    => 0,
        'parent'                     => 0,
        'perl'                       => '5.014',
        'strictures'                 => 1,
        'TryCatch'                   => 0,
        'utf8'                       => 0,
    },
    # these are actually <http://p3rl.org/CPAN::Meta::Spec#develop>,
    # but nothing consumes this yet
    recommends => {
        'bareword::filehandles' => 0,
        'indirect' => 0,
        'multidimensional' => 0,
        'Test::Spelling' => 0,
    },
    add_to_cleanup => ['Sipwise-Base-*'],
);
$builder->create_build_script;
