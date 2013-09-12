package Sipwise::Release 1.005;
use Sipwise::Base;

__END__

=encoding UTF-8

=head1 NAME

Sipwise::Release - Sipwise Release Documentation

=head1 VERSION

This document describes Sipwise::Release version 1.005

=head1 TAGGING A NEW RELEASE

=over

=item Create a new entry in the Changes file

=item Update debian/changelog using the command git-dch like this:
C<git-dch --id-length=7 --meta --multimaint-merge --ignore-branch --release --auto>

=item *

Update the perl files using
C<perl-reversion -dryrun -set $VERSION>. Remove C<-dryrun> to actually
run this command.

=item git commit your work with $VERSION as commit message

=item run C<git tag -u $KEY -s $VERSION>

=item run C<git push> and C<git push --tags>

=back

=head1 AUTHOR

C<< <gjungwirth@sipwise.com> >>
