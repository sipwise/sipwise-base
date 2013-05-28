use Test::DescribeMe qw(author);
use Test::More import => [qw(done_testing)];
use Test::Spelling qw(add_stopwords all_pod_files_spelling_ok set_spell_cmd);

add_stopwords(<DATA>);
set_spell_cmd('aspell list -l en_GB -p /dev/null');
all_pod_files_spelling_ok;
done_testing;

__DATA__
API
Dieckow
GmbH
Ingy's
merchantability
Sipwise
