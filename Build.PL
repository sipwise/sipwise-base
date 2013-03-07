use Module::Build qw();
my $builder = Module::Build->new(
    module_name       => 'Sipwise-Base',
    license           => 'restrictive',
    dist_author       => 'Lars Dieckow <ldieckow@sipwise.com>',
    dist_version_from => 'lib/Sipwise/Base.pm',
    build_requires    => {
        'Test::More' => '0.88',
    },
    requires => {
        'autodie'                    => 0,
        'lambda'                     => 0,
        'Module::Runtime'            => 0,
        'Moose'                      => 2,
        'MooseX::Method::Signatures' => 0,
        'parent'                     => 0,
        'perl5i::2'                  => 0,
        'strictures'                 => 1,
        'TryCatch'                   => 0,
        'utf8'                       => 0,
    },
    add_to_cleanup => ['Sipwise-Base-*'],
);
$builder->create_build_script;
