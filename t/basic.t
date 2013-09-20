use strict;
use warnings;
use Test::More tests => 2;
use Cygwin::ConvertPathList;

is win_to_posix_path_list("c:\\windows;x:\\foo\\bar"), '/cygdrive/c/windows:/cygdrive/x/foo/bar';
note 'win_to_posix_path_list("c:\\windows;x:\\foo\\bar") = ' . win_to_posix_path_list("c:\\windows;x:\\foo\\bar");

my $win_home = Cygwin::posix_to_win_path("/home");
note 'Cygwin::posix_to_win_path("/home") = ' . $win_home;
my $win_etc  = Cygwin::posix_to_win_path("/etc");
note 'Cygwin::posix_to_with_path("/etc") = ' . $win_etc;

is posix_to_win_path_list("/home:/etc"), join(';', $win_home, $win_etc);
note 'posix_to_win_path_list("/home:/etc") = '. posix_to_win_path_list("/home:/etc");
