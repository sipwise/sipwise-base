package Sipwise::CodingStandards;
use Sipwise::Base;
our $VERSION = '1.000';

__END__

=encoding UTF-8

=head1 NAME

Sipwise::CodingStandards - Sipwise Perl coding standards

=head1 VERSION

This document describes Sipwise::CodingStandards version 1.000

=head1 DESCRIPTION

This document outlines the coding standards for new Perl projects. Their purpose is to guide programmers to a common
code style and practices, making decisions so you don't have to. Follow them unless you have a good reason not to. See
L<http://oreilly.com/catalog/perlbp/|chapter 1 in PBP> for the rationale. Taking Perl's philosophy to heart, the
standards are not enforced – it's up to the programmer to use common sense and sound judgement in applying them.

The standards are not set in stone, either. If you notice that consistently I<not> following them produces better
results, please communicate the matter and get this document ameliorated.

=head2 common modules

L<Sipwise::Base> is a module that simply bundles common other modules that you are very likely to include in a class
file - one line is enough to load all of them. The goal is to enable modern Perl programming and restrict some legacy
features of the language that should not be used anymore in new code.

=head2 sample code template

See L<Sipwise::Boilerplate> in this distribution.

This template is derived from L<Module::Starter::PBP> for the most part.

=head2 C<perltidy>

See F<share/.perltidyrc> in this distribution.

L<perltidy> sometimes produces not optimal results with immediately nested pairs of types of brackets.

    $resultset->find({
            foo => 123,
        },
        {
            bar_id  => 23,
            quux_id => {-ident => 'baz_id'},
        },
    );

It is okay to manually fix this for symmetry.

    $resultset->find(
        {
            foo => 123,
        },
        {
            bar_id  => 23,
            quux_id => {-ident => 'baz_id'},
        },
    );

=head2 C<perlcritic>

See F<share/.perlcritic> in this distribution.

Install L<Task::Perl::Critic::IncludingOptionalDependencies> and L<Perl::Critic::logicLAB>.

=head1 AUTHOR

C<< <ldieckow@sipwise.com> >>
