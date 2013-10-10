use strict;
use warnings;
use utf8::all;
use Test::More;
use Cygwin::ConvertPathList;
use File::Temp qw( tempdir );

plan skip_all => 'unicode not supported in this version of Cygwin (' . Cygwin::ConvertPathList::_has_unicode() . ')' unless Cygwin::ConvertPathList::_has_unicode();
plan tests => 3;

my $tmp = tempdir( CLEANUP => 1 );

binmode STDOUT, ":utf8";

ok(mkdir("$tmp/火龍"), "create $tmp/火龍") || diag "unable to create $tmp/火龍 $!";
ok(mkdir("$tmp/火龍/foo"), "create $tmp/火龍/foo") || diag "unable to create $tmp/火龍/foo $!";
ok(mkdir("$tmp/火龍/bar"), "create $tmp/火龍/bar") || diag "unable to create $tmp/火龍/bar $!";

