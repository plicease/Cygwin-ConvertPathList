#include <sys/cygwin.h>
#include <cygwin/version.h>
#include <string.h>
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/*
 * http://cygwin.com/cygwin-api/func-cygwin-conv-path-list.html
 */

static char *error_str = "internal Cygwin::ConvertPathList error";

MODULE = Cygwin::ConvertPathList    PACKAGE = Cygwin::ConvertPathList

SV *
win_to_posix_path_list(win_path_sv)
        SV *win_path_sv;
    INIT:
        int size;
        char *posix_path;
        int is_utf8;
        char *win_path;
        STRLEN len;
    CODE:
        win_path = SvPV(win_path_sv, len);
        is_utf8 = SvUTF8(win_path_sv);
        size = cygwin_conv_path_list(CCP_WIN_A_TO_POSIX, win_path, NULL, 0);
        if(size < 0)
        {
          croak(error_str);
        }
        else
        {
          posix_path = (char*) safemalloc(size);
          if(cygwin_conv_path_list(CCP_WIN_A_TO_POSIX, win_path, posix_path, size))
          {
            croak(error_str);
          }
          else
          {
            RETVAL = newSVpv(posix_path,0);
          }
          safefree(posix_path);
        }
    OUTPUT:
        RETVAL

SV *
posix_to_win_path_list(posix_path_sv)
        SV *posix_path_sv;
    INIT:
        int size;
        char *win_path;
        char *posix_path;
        STRLEN len;
        int is_utf8;
    CODE:
        posix_path = SvPV(posix_path_sv, len);
        is_utf8 = SvUTF8(posix_path_sv);
        size = cygwin_conv_path_list(CCP_POSIX_TO_WIN_A, posix_path, NULL, 0);
        if(size < 0)
        {
          croak(error_str);
        }
        else
        {
          win_path = (char*) safemalloc(size);
          if(cygwin_conv_path_list(CCP_POSIX_TO_WIN_A, posix_path, win_path, size))
          {
            croak(error_str);
          }
          else
          {
            RETVAL = newSVpv(win_path,0);
          }
          safefree(win_path);
        }
    OUTPUT:
        RETVAL



int
_has_unicode()
    CODE:
#if (CYGWIN_VERSION_API_MINOR >= 181)
          RETVAL = 1;
#else
          RETVAL = 0;
#endif
    OUTPUT:
        RETVAL
