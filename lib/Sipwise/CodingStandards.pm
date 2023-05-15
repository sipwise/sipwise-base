package Sipwise::CodingStandards 1.005;
use Sipwise::Base;

__END__

=encoding UTF-8

=head1 NAME

Sipwise::CodingStandards - Sipwise Perl coding standards

=head1 VERSION

This document describes Sipwise::CodingStandards version 1.005

=head1 DESCRIPTION

This document outlines the coding standards for new Perl projects. Their purpose is to guide programmers to a common
code style and practices, making decisions so you don't have to. Follow them unless you have a good reason not to. See
L<< chapter 1 in I<PBP>|http://oreilly.com/catalog/perlbp/ >> for the rationale. Taking Perl's philosophy to heart, the
standards are not enforced – it's up to the programmer to use common sense and sound judgement in applying them.

The standards are not set in stone, either. If you notice that consistently I<not> following them produces better
results, please communicate the matter and get this document ameliorated.

=head2 common modules

L<Sipwise::Base> is a module that simply bundles common other modules that you are very likely to include in a class
file - one line is enough to load all of them. The goal is to enable modern Perl programming and restrict some legacy
features of the language that should not be used anymore in new code.

=head2 versions

=head3 examples

For modules:

    package Foo::Bar 2.001; # 2nd version of revision 2
    package Fnord 2.420;    # 421st version of revision 2

Otherwise:

    our $VERSION = '2.001'; # 2nd version of revision 2
    our $VERSION = '2.420'; # 421st version of revision 2

=head3 rationale

Every module must have a version or else it is problematic to accurately specify a dependency when a distribution is
split. It works best when the distribution version and each module's version are equal and increased in lock-step. To
to make this easy, use C<perl-reversion>, which is part of L<Perl::Version>. Increase a version each time when you need
to depend on a new features or a changed API from code external to the distribution, it should be followed by a release
of the distribution.

When using the L<perlfunc/package> declaration, a version is a rational number. If a C<package> declaration is not
suitable, declare the magic C<$VERSION> variable (see L<perlobj/VERSION($need)>) and then a version is a string.

In any case, the version consists of a revision number, a literal dot as separator and a version number, altogether in
the form C<y.xxx>. C<y> is a natural number, C<xxx> are exactly three zero-padded digits. String quoting prevents
trailing zeroes from disappearing. Padding to the same amount of digits prevents confusion about C<< 1.10 < 1.9 >>.
Having exactly one separator prevents confusion about C<5.10.1 == 5.010001>.

Do not use the L<version> module for declaring versions. Using plain strings prevents that ugly C<v> prefix in a
distribution tarball name. However, using the module to handle versions, e.g. for comparing them, is a good idea.

Do not use L<v-strings|http://p3rl.org/data#Version-Strings>. They are poorly understood.

Do not use underscores. Using underscores require to L<perlfunc/eval> the version to turn it into a number. If you want
to mark a distribution as release candidate to the PAUSE indexer, add the word C<TRIAL> to the distribution name, see
L<http://pause.perl.org/pause/query?ACTION=pause_04about#developerreleases>.

=head3 compliance

This scheme is fully compatible with the advice laid out in L<perlmodstyle>, L<version>,
L<"strict" version rules|http://p3rl.org/perl5120delta#Version-number-formats>,
L<"Version numbers should be boring"|http://www.dagolden.com/index.php/369/>,
L<Perl::Critic::Policy::ValuesAndExpressions::ProhibitVersionStrings>,
L<Perl::Critic::Policy::ValuesAndExpressions::RequireNumericVersion>.

It is incompatible with L<< I<semver>|http://semver.org >>.

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

It is OK to manually fix this for symmetry.

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

=head1 LICENSE

Copyright © 2013-2023 Sipwise GmbH, Austria.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
