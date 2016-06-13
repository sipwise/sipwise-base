use Sipwise::Base -skip => ['TryCatch'];
use Test::More import => [qw(done_testing ok)];

ok(!__PACKAGE__->can($_), "TryCatch $_ function name is not available")
    for qw(try catch);

done_testing;
