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

ok(__PACKAGE__->can($_), "$_ function name is available")
    for qw(λ after augment before extends has inner override super with method list);

eval 'use t::MethodSignatures';
try {
     MethodSignatures->new->greet(123);
} catch($e) {
    ok $e =~ /^Validation failed/;
}

ok MethodSignatures->new->greet('world') eq 'Hello, world!', 'method signatures';

eval { unlink '/tmp/doesnotexist' };
ok $@, 'autodie is in effect';

ok 2->pow(8), 'autobox is in effect';

try {
    die bless { fnord => 42 } => 'Foobar';
} catch (Foobar $e) {
    ok $e->isa('Foobar'), 'TryCatch works';
}

done_testing;
