package Sipwise::Base 1.005;
use 5.014;
use Module::Runtime qw(use_module);
use parent 'autodie';

sub import {
    my ($class, %param) = @_;
    my %features = (
        Moose => q(use Moose qw(after augment before extends has inner override super with);),
        TryCatch => q(use TryCatch;),
        'Hash::Merge' => q(use Hash::Merge qw(merge);),
        'Data::Types' => q(use Data::Types qw(:all);),
    );

    if ($param{-skip}) {
        for my $feature (@{ $param{-skip} }) {
            delete $features{$feature};
        }
    }
    my $caller = caller;

    use_module('strictures')->import(1);
    my @skip = qw(Try::Tiny autodie);
    push @skip, 'CLASS' if __PACKAGE__->can('CLASS');

    my $export = "package $caller;\n";
    for my $f (sort keys %features) {
        $export .= "$features{$f}\n";
    }
    eval $export;

    @_ = ($class, ':all');
    goto &autodie::import;
}

1;
