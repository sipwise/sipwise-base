package Sipwise::Base 1.005;

use strictures ();
use feature ();
use parent 'autodie';

sub import {
    my ($class, %param) = @_;
    my %features = (
        TryCatch => q(use TryCatch;),
    );

    if ($param{-skip}) {
        for my $feature (@{ $param{-skip} }) {
            delete $features{$feature};
        }
    }
    my $caller = caller;

    strictures->import(version => 2);
    feature->import(':5.14');

    my $export = "package $caller;\n";
    for my $f (sort keys %features) {
        $export .= "$features{$f}\n";
    }
    eval $export;

    @_ = ($class, ':all');
    goto &autodie::import;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Sipwise::Base - import boilerplate code

=head1 VERSION

This document describes Sipwise::Base version 1.005

=head1 SYNOPSIS

    use Sipwise::Base;

=head1 DESCRIPTION

The purpose of this module is to reduce the amount of boilerplate code and
to enable some Perl features that are not available by default. This is in
the spirit of
L<eliminating pessimisations|http://modernperlbooks.com/mt/2009/10/remove-the-little-pessimizations.html>.

Switches on the functionality of the pragmatic modules L<strictures>,
L<TryCatch>.

=head1 INTERFACE

=head2 C<import>

See L<perlfunc/import>.

By passing an arrayref to C<-skip>, you can disable features:

    use Sipwise::Base -skip => ['TryCatch'];   # skip importing TryCatch

The features strings are C<TryCatch>.

=head2 Exports

=head1 DIAGNOSTICS

None.

=head1 CONFIGURATION AND ENVIRONMENT

Sipwise::Base requires no configuration files or environment variables.

=head1 DEPENDENCIES

See meta file in the source distribution.

=head1 INCOMPATIBILITIES

None reported.

=head1 BUGS AND LIMITATIONS

L<https://bugtracker.sipwise.com>

=head1 TO DO

different profiles for command-line applications

=head1 SEE ALSO

L<ToolSet>, L<Toolkit>, Ingy's L<perl5>, L<Syntax::Collector>

=head1 AUTHOR

Lars Dieckow C<< <ldieckow@sipwise.com> >>

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
