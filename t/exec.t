use Sipwise::Base;
use Test::More import => [qw(done_testing ok)];

eval {
    child {
        exec $^X, '-e1';
    };
};
ok !$@;

done_testing;
