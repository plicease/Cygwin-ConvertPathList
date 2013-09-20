#include <sys/cygwin.h>
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

static char buffer[32767];

MODULE = Cygwin::ConvertPathList    PACKAGE = Cygwin::ConvertPathList

char *
win_to_posix_path_list(win_path)
        char *win_path;
    CODE:
        cygwin_conv_path_list(CCP_WIN_A_TO_POSIX, win_path, buffer, sizeof(buffer));
        RETVAL = buffer;
    OUTPUT:
        RETVAL

char *
posix_to_win_path_list(posix_path)
        char *posix_path;
    CODE:
        cygwin_conv_path_list(CCP_POSIX_TO_WIN_A, posix_path, buffer, sizeof(buffer));
        RETVAL = buffer;
    OUTPUT:
        RETVAL
