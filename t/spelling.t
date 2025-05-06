use strict;
use warnings;

use Test::More import => [qw(plan)];

plan skip_all => 'Author test' unless $ENV{AUTHOR_TESTING};

if (eval { require Test::Spelling }) {
    Test::Spelling->import(qw(add_stopwords all_pod_files_spelling_ok set_spell_cmd));
} else {
    plan skip_all => 'Test::Spelling required to spell check';
}

add_stopwords(<DATA>);
set_spell_cmd('aspell list -l en_GB -p /dev/null');
all_pod_files_spelling_ok();

__DATA__
API
Dieckow
GmbH
Ingy
git-dch
merchantability
Sipwise
