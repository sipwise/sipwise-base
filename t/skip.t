use Sipwise::Base -skip => ['Moose'];
use Test::More import => [qw(done_testing ok)];

ok(!__PACKAGE__->can($_), "Moose $_ function name is not available")
    for qw(after augment before extends has inner override super with);

done_testing;
