use Test::More import => [qw(done_testing plan)];
use Test::Spelling qw(add_stopwords all_pod_files_spelling_ok set_spell_cmd);

plan skip_all => 'Author test' unless $ENV{AUTHOR_TESTING};

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
