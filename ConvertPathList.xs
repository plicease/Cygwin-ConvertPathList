#include <sys/cygwin.h>
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

MODULE = Cygwin::ConvertPathList    PACKAGE = Cygwin::ConvertPathList

SV *
win_to_posix_path_list(win_path)
        char *win_path;
    INIT:
        int size;
        char *posix_path;
    CODE:
        size = cygwin_conv_path_list(CCP_WIN_A_TO_POSIX, win_path, NULL, 0);
        posix_path = (char*) safemalloc(size);
        cygwin_conv_path_list(CCP_WIN_A_TO_POSIX, win_path, posix_path, size);
        RETVAL = newSVpv(posix_path,0);
        safefree(posix_path);
    OUTPUT:
        RETVAL

SV *
posix_to_win_path_list(posix_path)
        char *posix_path;
    INIT:
        int size;
        char *win_path;
    CODE:
        size = cygwin_conv_path_list(CCP_POSIX_TO_WIN_A, posix_path, NULL, 0);
        win_path = (char*) safemalloc(size);
        cygwin_conv_path_list(CCP_POSIX_TO_WIN_A, posix_path, win_path, size);
        RETVAL = newSVpv(win_path,0);
        safefree(win_path);
    OUTPUT:
        RETVAL
