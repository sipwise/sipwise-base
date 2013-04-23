package Sipwise::Boilerplate;
use Sipwise::Base;
our $VERSION = '1.001';

__END__

=encoding UTF-8

=head1 NAME

Sipwise::Boilerplate - a template for new code

=head1 SYNOPSIS

Copy the following text, outdent it, save to a new file, then fill it in. Delete the C<=for author> POD sections after
you are done with them.

    package Something::Or::Other;
    use Sipwise::Base;
    use namespace::sweep;

    our $VERSION = '1.000';

    … # attributes, methods, package-level code go here

    $CLASS->meta->make_immutable;

    __END__

    =encoding UTF-8

    =head1 NAME

    Something::Or::Other - [One line description of module's purpose here]

    =head1 VERSION

    This document describes Something::Or::Other version 1.000

    =head1 SYNOPSIS

        use Something::Or::Other qw();

        =for author to fill in:
            Brief code example(s) here showing commonest usage(s).
            This section will be as far as many users bother reading
            so make it as educational and exeplary as possible.

    =head1 DESCRIPTION

    =for author to fill in:
        Write a full description of the module and its features here.
        Use subsections (=head2, =head3) as appropriate.

    =head1 INTERFACE

    =for author to fill in:
        Write a separate section listing the public components of the modules
        interface. These normally consist of either subroutines that may be
        exported, or methods that may be called on objects belonging to the
        classes provided by the module.

    =head2 Composition

        Something::Or::Other
            ISA Something
            DOES OtherRole

    All methods and attributes not mentioned here are
    inherited from L<Something> or mixed in from L<OtherRole>.

    =head2 Attributes

    =head3 C<foo>

    Type C<Str>, B<required> attribute, designates the fnarg fnord.

    =head3 C<feh>

    Type C<Bool>, whether foo is encoded into fnord.

    =head2 Methods

    =head3 C<bar>

    Returns the bar fnord as string.

    =head3 C<mogrify>

        $soo->mogrify;  # use defaults
        $soo->mogrify({blah => 42, harbl => 23});

    Uses the supplied arguments to blah blah.

    =head4 C<mogrify> argument keys

    …

    =head2 Exports

    =head3 C<quux>

    Exported on demand, same as calling the default constructor followed by the L</bar> method.

    =head1 DIAGNOSTICS

    None.

    =for author to fill in:
        List every single error and warning message that the module can
        generate (even the ones that will "never happen"), with a full
        explanation of each problem, one or more likely causes, and any
        suggested remedies.

    =over

    =item C<< Error message here, perhaps with %s placeholders >>

    [Description of error here]

    =item C<< Another error message here >>

    [Description of error here]

    [Et cetera, et cetera]

    =back

    =head1 CONFIGURATION AND ENVIRONMENT

    Something::Or::Other requires no configuration files or environment variables.

    =for author to fill in:
        A full explanation of any configuration system(s) used by the
        module, including the names and locations of any configuration
        files, and the meaning of any environment variables or properties
        that can be set. These descriptions must also include details of any
        configuration language used.

    =head1 DEPENDENCIES

    See meta file in the source distribution.

    =for author to fill in:
        A list of all the other modules that this module relies upon,
        including any restrictions on versions, and an indication whether
        the module is part of the standard Perl distribution, part of the
        module's distribution, or must be installed separately.

    =head1 INCOMPATIBILITIES

    None reported.

    =for author to fill in:
        A list of any modules that this module cannot be used in conjunction
        with. This may be due to name conflicts in the interface, or
        competition for system or program resources, or due to internal
        limitations of Perl (for example, many modules that use source code
        filters are mutually incompatible).

    =head1 BUGS AND LIMITATIONS

    L<https://bugtracker.sipwise.com>

    No known limitations.

    =for author to fill in:
        A list of known problems with the module, together with some
        indication whether they are likely to be fixed in an upcoming
        release. Also a list of restrictions on the features the module
        does provide: data types that cannot be handled, performance issues
        and the circumstances in which they may arise, practical
        limitations on the size of data sets, special cases that are not
        (yet) handled, etc.

    =head1 TO DO

    =for author to fill in:
        future plans and ideas

    =head1 SEE ALSO

    =for author to fill in:
        related work and modules, perhaps with some prose describing the
        different advantages of each under which circumstances

    =head1 AUTHOR

    Your Name C<< <yname@sipwise.com> >>

    =head1 LICENCE

    restricted
