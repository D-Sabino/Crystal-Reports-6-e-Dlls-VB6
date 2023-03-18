/*
** File:    UXFRec.h
**
** Author:  Jinshi Xia
** Date:    93-10-12
**
** Purpose: An export format DLL for record style.
**
** Copyright (c) 1993  Crystal Services
*/

#if !defined (UXFREC_H)
#define UXFREC_H

//#include "UXDLL.h"
//#include "UXFormat.h"

#if defined (__cplusplus)
extern "C"
{
#endif

#define UXFRecordType   0

typedef struct UXFRecordStyleOptions
{
    WORD structSize;

    BOOL useReportNumberFormat;
    BOOL useReportDateFormat;
}
    UXFRecordStyleOptions;

#define UXFRecordStyleOptionsSize (sizeof (UXFRecordStyleOptions))

#if defined (__cplusplus)
}
#endif

#endif // UXFSEPV_H
