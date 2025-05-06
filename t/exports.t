use Sipwise::Base;
use Test::More import => [qw(done_testing ok)];

## no critic (BuiltinFunctions::ProhibitStringyEval, ValuesAndExpressions::ProhibitImplicitNewlines)

eval 'use t::StrictVars';
ok $@, 'strict vars';

eval 'use t::StrictSubs';
ok $@, 'strict subs';

eval '$$foobar';
ok $@, 'strict refs';

eval { my $foo = 1 + undef };
ok $@, 'fatal warnings';

eval 'say("")';
ok !$@, 'say syntax is available';

eval 'state $foobar = 1';
ok !$@, 'state syntax is available';

eval { unlink '/nonexistent' };
ok $@, 'autodie is in effect';

eval q{
    try {
        die bless { fnord => 42 } => 'Foobar';
    } catch (Foobar $e) {
        $e->isa('Foobar') or die 'TryCatch failed';
    }
};
ok !$@, 'TryCatch is available and works';

ok uc("\xe4") eq "\xc4", 'unicode_strings in effect';

done_testing;
