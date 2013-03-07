package Sipwise::Base;
use utf8;
use Module::Runtime qw(require_module);
use parent 'autodie';
our $VERSION = '1.000';

sub import {
    my ($class) = @_;
    my $caller = caller;

    require_module('strictures');
    strictures->import(1);

    require_module('perl5i::2');
    perl5i::2->import(-skip => [qw(Signatures Try::Tiny)]);

    eval <<"";
package $caller;
use lambda 'λ';
use perl5i::2 -skip => [qw(Signatures Try::Tiny)];
use Moose qw(extends has with);
use MooseX::Method::Signatures;
use TryCatch;

    @_ = ($class, ':all');
    goto &autodie::import;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Sipwise::Base - import boilerplate code

=head1 VERSION

This document describes Sipwise::Base version 1.000

=head1 SYNOPSIS

    use Sipwise::Base;

=head1 DESCRIPTION

The purpose of this module is to reduce the amount of boilerplate code and to enable some Perl features that are not
available by default. This is in the spirit of
L<http://modernperlbooks.com/mt/2009/10/remove-the-little-pessimizations.html|eliminating pessimisations>.

Switches on the functionality of the pragmatic modules L<strictures>, L<lambda>, L<perl5i>, L<Moose>,
L<MooseX::Method::Signatures>, L<TryCatch>.

=head1 INTERFACE

=head2 C<import>

See L<perlfunc/import>.

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

restricted
