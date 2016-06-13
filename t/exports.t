use Sipwise::Base;
use Test::More import => [qw(done_testing ok)];

eval 'use t::StrictVars';
ok $@, 'strict vars';

eval 'use t::StrictSubs';
ok $@, 'strict subs';

eval '$$foobar';
ok $@, 'strict refs';

eval { my $foo = 1 + undef };
ok $@, 'fatal warnings';

ok say(''), 'say syntax is available';

ok state $foobar = 1, 'state syntax is available';

eval {
    given (1) {
        when (1) {}
        default {1}
    }
};
ok !$@, 'switch syntax is available';

eval { unlink '/tmp/doesnotexist' };
ok $@, 'autodie is in effect';

try {
    die bless { fnord => 42 } => 'Foobar';
} catch (Foobar $e) {
    ok $e->isa('Foobar'), 'TryCatch works';
}

ok uc("\xe4") eq "\xc4", 'unicode_strings in effect';

done_testing;
