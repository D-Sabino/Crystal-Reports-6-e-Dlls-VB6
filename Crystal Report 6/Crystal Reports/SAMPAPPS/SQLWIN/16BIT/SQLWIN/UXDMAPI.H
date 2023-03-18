/*
** File:    UXDMAPI.h
**
** Author:  Ron Hayter
** Date:    93-05-28
**
** Mods:	Douglas Lankshear
** Date:	93-09-21
**
** Purpose: An export destination DLL for MAPI.
**
** Copyright (c) 1993  Crystal Services
*/

#if !defined (UXDMAPI_H)
#define UXDMAPI_H

//#include "UXDLL.h"
//#include "UXDest.h"

#if defined (__cplusplus)
extern "C"
{
#endif

#define UXDMAPIType             0

typedef struct UXDMAPIOptions
{
    WORD structSize;

    char FAR *toList;
    char FAR *ccList;
    char FAR *subject;
    char FAR *message;
}
    UXDMAPIOptions;
#define UXDMAPIOptionsSize      (sizeof (UXDMAPIOptions))


#if defined (__cplusplus)
}
#endif

#endif // UXDMAPI_H
