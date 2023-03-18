/*
** File:    UXDDisk.h
**
** Author:  Ron Hayter
** Date:    93-04-08
**
** Purpose: An export destination DLL for disk files.
**
** Copyright (c) 1993  Crystal Services
*/

#if !defined (UXDDISK_H)
#define UXDDISK_H

//#include "UXDLL.h"
//#include "UXDest.h"

#if defined (__cplusplus)
extern "C"
{
#endif

#define UXDDiskType             0

typedef struct UXDDiskOptions
{
    WORD structSize;

    char FAR *fileName;
}
    UXDDiskOptions;
#define UXDDiskOptionsSize      (sizeof (UXDDiskOptions))

#if defined (__cplusplus)
}
#endif

#endif // UXDDISK_H
