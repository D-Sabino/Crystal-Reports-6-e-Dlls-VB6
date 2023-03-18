/*
** File:    UXFSepV.h
**
** Author:  Ron Hayter
** Date:    93-04-08
**
** Purpose: An export format DLL for separated values.
**
** Copyright (c) 1993  Crystal Services
*/

#if !defined (UXFSEPV_H)
#define UXFSEPV_H

//#include "UXDLL.h"
//#include "UXFormat.h"

#if defined (__cplusplus)
extern "C"
{
#endif

#define UXFCommaSeparatedType   0
#define UXFTabSeparatedType     1
#define UXFCharSeparatedType    2

typedef struct UXFCommaTabSeparatedOptions
{
    WORD structSize;

    BOOL useReportNumberFormat;
    BOOL useReportDateFormat;
}
    UXFCommaTabSeparatedOptions;
#define UXFCommaTabSeparatedOptionsSize (sizeof (UXFCommaTabSeparatedOptions))

typedef struct UXFCharSeparatedOptions
{
    WORD structSize;

    BOOL useReportNumberFormat;
    BOOL useReportDateFormat;
    char stringDelimiter;
    char FAR *fieldDelimiter;
}
    UXFCharSeparatedOptions;
#define UXFCharSeparatedOptionsSize (sizeof (UXFCharSeparatedOptions))

#if defined (__cplusplus)
}
#endif

#endif // UXFSEPV_H
