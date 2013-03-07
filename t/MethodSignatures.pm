package MethodSignatures;
use Sipwise::Base;
use t::Types 'Place';

method greet(Place $who) {
    return "Hello, $who!";
}
