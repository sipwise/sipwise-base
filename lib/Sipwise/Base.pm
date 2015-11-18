package Sipwise::Base 1.005;
use 5.014;
use Module::Runtime qw(use_module);
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

    use_module('strictures')->import(1);

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

The purpose of this module is to reduce the amount of boilerplate code and to enable some Perl features that are not
available by default. This is in the spirit of
L<http://modernperlbooks.com/mt/2009/10/remove-the-little-pessimizations.html|eliminating pessimisations>.

Switches on the functionality of the pragmatic modules L<strictures>, L<perl5i>, L<Moose>,
L<MooseX::Method::Signatures>, L<TryCatch>.

=head1 INTERFACE

=head2 C<import>

See L<perlfunc/import>.

By passing an arrayref to C<-skip>, you can disable features:

    use Sipwise::Base -skip => ['Moose'];   # skip importing Moose

The features strings are C<perl5i>, C<Moose>, C<MooseX::Method::Signatures>, C<TryCatch>.

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

=head1 LICENCE

This software is Copyright © 2013 by Sipwise GmbH, Austria.

This program is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public
License as published by the Free Software Foundation; either
version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public
License along with this package; if not, write to the Free
Software Foundation, Inc., 51 Franklin St, Fifth Floor,
Boston, MA  02110-1301 USA

On Debian systems, the full text of the GNU General Public
License version 3 can be found in the file
F</usr/share/common-licenses/GPL-3>.
