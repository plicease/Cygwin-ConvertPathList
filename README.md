# Cygwin::ConvertPathList [![Build Status](https://secure.travis-ci.org/plicease/Cygwin-ConvertPathList.png)](http://travis-ci.org/plicease/Cygwin-ConvertPathList)

Convert path lists from POSIX ($PATH) to Windows (%PATH%) and back

# SYNOPSIS

    use Cygwin::ConvertPathList qw( win_to_posix_path_list posix_to_win_path_list );
    
    # prints /cygdrive/c/windows:/cygdrive/c/windows/system32
    print win_to_posix_path_list("c:\\windows;c:\\windows\\system32");
    
    # prints c:\cygwin\bin;c:\cygwin\usr\bin (actual paths may vary)
    print posix_to_win_path_list("/bin:/usr/bin");

# DESCRIPTION

This module provides an interface to the Cygwin API cygwin\_conv\_path function,
which allows you to convert between path list style environment variable values as
they are understood by Cygwin and Windows.  Perl already comes with build in 
functions `Cygwin::win_to_posix_path` and `Cygwin::posix_to_win_path` which
convert individual path values, this is intended for path lists like the
POSIX $PATH or Windows %PATH%.

# FUNCTIONS

## win\_to\_posix\_path\_list

    my $posix_path_list = win_to_posix_path_list $windows_path_list;

Convert a path list from windows to POSIX format.

## posix\_to\_win\_path\_list

    my $windows_path_list = posix_to_win_path_list $posix_path_list;

Convert a path list from POSIX to windows format.

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
