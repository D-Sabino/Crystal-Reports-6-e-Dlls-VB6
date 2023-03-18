/*
** File:    UXFDIF.h
**
** Author:  Ron Hayter
** Date:    93-11-17
**
** Purpose: An export format DLL for Data Interchange Format.
**
** Copyright (c) 1993  Crystal Services
*/

#if !defined (UXFDIF_H)
#define UXFDIF_H

//#include "UXDLL.h"
//#include "UXFormat.h"

#if defined (__cplusplus)
extern "C"
{
#endif

#define UXFDIFType              0

typedef struct UXFDIFOptions
{
    WORD structSize;

    BOOL useReportNumberFormat;
    BOOL useReportDateFormat;
}
    UXFDIFOptions;
#define UXFDIFOptionsSize       (sizeof (UXFDIFOptions))

#if defined (__cplusplus)
}
#endif

#endif // UXFDIF_H
