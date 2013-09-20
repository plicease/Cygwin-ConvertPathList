use strict;
use warnings;
use Test::More;
use Cygwin::ConvertPathList;

plan skip_all => 'unicode not supported in this version of Cygwin (' . Cygwin::ConvertPathList::_has_unicode() . ')' unless Cygwin::ConvertPathList::_has_unicode();
plan tests => 1;

pass 'okay';
