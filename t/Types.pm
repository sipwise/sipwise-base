package Types;
use Sipwise::Base;
use Moose::Util::TypeConstraints qw(subtype as where);

subtype 'Place', as 'Str', where { /world/ };
