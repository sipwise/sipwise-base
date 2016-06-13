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

eval 'say("")';
ok !$@, 'say syntax is available';

eval 'state $foobar = 1';
ok !$@, 'state syntax is available';

eval { unlink '/nonexistent' };
ok $@, 'autodie is in effect';

try {
    die bless { fnord => 42 } => 'Foobar';
} catch (Foobar $e) {
    ok $e->isa('Foobar'), 'TryCatch works';
}

ok uc("\xe4") eq "\xc4", 'unicode_strings in effect';

done_testing;
