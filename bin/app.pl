#!/usr/bin/env perl
use Dancer2;

get '/' => sub {
  return '<html><body><h3>Hello Perl Docker Web!</h3></body></html>';
};

start;
