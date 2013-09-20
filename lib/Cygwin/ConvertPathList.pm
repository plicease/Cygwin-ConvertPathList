package Cygwin::ConvertPathList;

use strict;
use warnings;
use base qw( Exporter );

our @EXPORT = qw( win_to_posix_path_list posix_to_win_path_list );

# ABSTRACT: Convert path lists from POSIX ($PATH) to Windows (%PATH%) and back
# VERSION

=head1 SYNOPSIS

 use Cygwin::ConvertPathList;
 
 # prints /cygdrive/c/windows:/cygdrive/c/windows/system32
 print win_to_posix_path_list("c:\\windows;c:\\windows\\system32");
 
 # prints c:\cygwin\bin;c:\cygwin\usr\bin (actual paths may vary)
 print posix_to_win_path_list("/bin:/usr/bin");

=head1 DESCRIPTION

This module provides an interface to the Cygwin API cygwin_conv_path function,
which allows you to convert between path list style environment variable values as
they are understood by Cygwin and Windows.  Perl already comes with build in 
functions C<Cygwin::win_to_posix_path> and C<Cygwin::posix_to_win_path> which
convert individual path values, this is intended for path lists like the
POSIX $PATH or Windows %PATH%.

=head1 FUNCTIONS

=head2 win_to_posix_path_list

 my $posix_path_list = win_to_posix_path_list $windows_path_list;

Convert a path list from windows to POSIX format.

=head2 posix_to_win_path_list

 my $windows_path_list = posix_to_win_path_list $posix_path_list;

Convert a path list from POSIX to windows format.

=cut

require XSLoader;
XSLoader::load('Cygwin::ConvertPathList');

1;
