////////////////////////////////////////////////////////////////////////////////
// File:        peplus.h
//
// Authors:     Craig Chaplin
//
// Synopsis:    This file contains the class definitions for CCRPEngine and
//              CCRPEJob as well as any supporting classes and structures.
//
//              Note that the constants defined within this file correspond
//              directly with the #defines found in crpe.h.  Instead of the PE_
//              prefix, the class library uses the PEP_ prefix.
//
//              Note that the structures defined within this file correspond to
//              those present in crpe.h.  Instead of the PE prefix, the class
//              library uses the CRPE prefix.  The class library structures are
//              self initialising and also provide convenient constructors.
//              At this time, the export destination structures
//              (e.g. UXDDiskOptions) and the export format option structures
//              (e.g. UXFCharSepOptions) have NOT been included in the class
//              library.  You will need to include the appropriate header files
//              for these structures.  Search the online help under PEExportTo
//              for more information.
//
// History:     22/06/95 - CC - Created.
//              27/07/95 - CC - Added 4.0 Print Engine calls
//              26/10/95 - CC - Internationalized (only MBCS so far)
//              09/05/96 - CC - Added 5.0 Print Engine calls
//              10/01/97 - CC - Corrected CRPESectionOptions structure to match
//                              definition in crpe.h
//              15/08/97 - CC - Modified CRPEParameterFieldInfo to reflect new
//                              6.0 structure
////////////////////////////////////////////////////////////////////////////////

#ifndef PEPLUS_H
#define PEPLUS_H

// structures MUST be byte aligned to match crpe.dll byte alignment

#if _MSC_VER >= 900
    #pragma pack (push)
#endif

#pragma pack(1)

// error codes returned by CRPEngine::GetErrorCode() and CRPEJob::GetErrorCode()

const int PEP_ERR_NOERROR              = 0;
const int PEP_ERR_NOTENOUGHMEMORY      = 500;
const int PEP_ERR_INVALIDJOBNO         = 501;
const int PEP_ERR_INVALIDHANDLE        = 502;
const int PEP_ERR_STRINGTOOLONG        = 503;
const int PEP_ERR_NOSUCHREPORT         = 504;
const int PEP_ERR_NODESTINATION        = 505;
const int PEP_ERR_BADFILENUMBER        = 506;
const int PEP_ERR_BADFILENAME          = 507;
const int PEP_ERR_BADFIELDNUMBER       = 508;
const int PEP_ERR_BADFIELDNAME         = 509;
const int PEP_ERR_BADFORMULANAME       = 510;
const int PEP_ERR_BADSORTDIRECTION     = 511;
const int PEP_ERR_ENGINENOTOPEN        = 512;
const int PEP_ERR_INVALIDPRINTER       = 513;
const int PEP_ERR_PRINTFILEEXISTS      = 514;
const int PEP_ERR_BADFORMULATEXT       = 515;
const int PEP_ERR_BADGROUPSECTION      = 516;
const int PEP_ERR_ENGINEBUSY           = 517;
const int PEP_ERR_BADSECTION           = 518;
const int PEP_ERR_NOPRINTWINDOW        = 519;
const int PEP_ERR_JOBALREADYSTARTED    = 520;
const int PEP_ERR_BADSUMMARYFIELD      = 521;
const int PEP_ERR_NOTENOUGHSYSRES      = 522;
const int PEP_ERR_BADGROUPCONDITION    = 523;
const int PEP_ERR_JOBBUSY              = 524;
const int PEP_ERR_BADREPORTFILE        = 525;
const int PEP_ERR_NODEFAULTPRINTER     = 526;
const int PEP_ERR_SQLSERVERERROR       = 527;
const int PEP_ERR_BADLINENUMBER        = 528;
const int PEP_ERR_DISKFULL             = 529;
const int PEP_ERR_FILEERROR            = 530;
const int PEP_ERR_INCORRECTPASSWORD    = 531;
const int PEP_ERR_BADDATABASEDLL       = 532;
const int PEP_ERR_BADDATABASEFILE      = 533;
const int PEP_ERR_ERRORINDATABASEDLL   = 534;
const int PEP_ERR_DATABASESESSION      = 535;
const int PEP_ERR_DATABASELOGON        = 536;
const int PEP_ERR_DATABASELOCATION     = 537;
const int PEP_ERR_BADSTRUCTSIZE        = 538;
const int PEP_ERR_BADDATE              = 539;
const int PEP_ERR_BADEXPORTDLL         = 540;
const int PEP_ERR_ERRORINEXPORTDLL     = 541;
const int PEP_ERR_PREVATFIRSTPAGE      = 542;
const int PEP_ERR_NEXTATLASTPAGE       = 543;
const int PEP_ERR_CANNOTACCESSREPORT   = 544;
const int PEP_ERR_USERCANCELLED        = 545;
const int PEP_ERR_OLE2NOTLOADED        = 546;
const int PEP_ERR_BADCROSSTABGROUP     = 547;
const int PEP_ERR_NOCTSUMMARIZEDFIELD  = 548;
const int PEP_ERR_DESTINATIONNOTEXPORT = 549;
const int PEP_ERR_INVALIDPAGENUMBER    = 550;
const int PEP_ERR_BADLABELNUMBER       = 551; // not implemented
const int PEP_ERR_NOTSTOREDPROCEDURE   = 552;
const int PEP_ERR_INVALIDPARAMETER     = 553;
const int PEP_ERR_GRAPHNOTFOUND        = 554;
const int PEP_ERR_INVALIDGRAPHTYPE     = 555;
const int PEP_ERR_INVALIDGRAPHDATA     = 556;
const int PEP_ERR_CANNOTMOVEGRAPH      = 557;
const int PEP_ERR_INVALIDGRAPHTEXT     = 558;
const int PEP_ERR_INVALIDGRAPHOPT      = 559;
const int PEP_ERR_BADSECTIONHEIGHT     = 560;
const int PEP_ERR_BADVALUETYPE         = 561;
const int PEP_ERR_INVALIDSUBREPORTNAME = 562;
const int PEP_ERR_FIELDEXIST           = 563; // not implemented
const int PEP_ERR_NOPARENTWINDOW       = 564; // dialog parent window
const int PEP_ERR_INVALIDZOOMFACTOR    = 565; // zoom factor
const int PEP_ERR_NOTIMPLEMENTED       = 999;

// values to be used for CRPEngine::GetVersion() versionRequested parameter

const int PEP_GV_DLL    = 100;
const int PEP_GV_ENGINE = 200;

// values returned by CRPEJob::GetJobStatus()

const int PEP_JOBNOTSTARTED = 1;
const int PEP_JOBINPROGRESS = 2;
const int PEP_JOBCOMPLETED  = 3;
const int PEP_JOBFAILED     = 4; // an error occurred
const int PEP_JOBCANCELLED  = 5; // cancelled by user
const int PEP_JOBHALTED     = 6; // too many records or too much time

// values used to specify the sort direction for CRPEJob group condition
// attributes, record sort order field attributes, and group sort order
// field attributes

const int PEP_SF_DESCENDING = 0;
const int PEP_SF_ASCENDING  = 1;

// group section codes used by CRPEJob group condition attributes, report
// section attributes, and graphing attributes

// macro to create section codes
// - allows up to 25 groups and 40 sections of a given type, although
//   Crystal Reports itself has no such limitations
#define PEP_SECTION_CODE(sectionType,groupN,sectionN) \
    (((sectionType) * 1000) + ((groupN) % 25) + (((sectionN) % 40) * 25))

const int PEP_ALLSECTIONS        = 0;
const int PEP_SECT_REPORT_HEADER = 1;
const int PEP_SECT_PAGE_HEADER   = 2;
const int PEP_SECT_GROUP_HEADER  = 3;
const int PEP_SECT_DETAIL        = 4;
const int PEP_SECT_GROUP_FOOTER  = 5;
const int PEP_SECT_PAGE_FOOTER   = 7;
const int PEP_SECT_REPORT_FOOTER = 8;

// macros to decode section codes
#define PEP_SECTION_TYPE(sectionCode) ((sectionCode) / 1000)
#define PEP_GROUP_N(sectionCode)      ((sectionCode) % 25)
#define PEP_SECTION_N(sectionCode)    (((sectionCode) / 25) % 40)

// old section constants redefined in terms of the new 5.x codes above
const int PEP_TITLESECTION      = PEP_SECTION_CODE (PEP_SECT_REPORT_HEADER, 0, 0);
const int PEP_HEADERSECTION     = PEP_SECTION_CODE (PEP_SECT_PAGE_HEADER,   0, 0);
const int PEP_GROUPHEADER       = PEP_SECTION_CODE (PEP_SECT_GROUP_HEADER,  0, 0);
const int PEP_DETAILSECTION     = PEP_SECTION_CODE (PEP_SECT_DETAIL,        0, 0);
const int PEP_GROUPFOOTER       = PEP_SECTION_CODE (PEP_SECT_GROUP_FOOTER,  0, 0);
const int PEP_SUMMARYSECTION    = PEP_SECTION_CODE (PEP_SECT_REPORT_FOOTER, 0, 0);
const int PEP_GRANDTOTALSECTION = PEP_SUMMARYSECTION;
const int PEP_FOOTERSECTION     = PEP_SECTION_CODE (PEP_SECT_PAGE_FOOTER,   0, 0);

// group condition codes used by CRPEJob group condition attributes

const int PEP_GC_ANYCHANGE     = 0; // use for all field types except Date and Boolean

const int PEP_GC_DAILY         = 0; // use these constants for Date fields
const int PEP_GC_WEEKLY        = 1;
const int PEP_GC_BIWEEKLY      = 2;
const int PEP_GC_SEMIMONTHLY   = 3;
const int PEP_GC_MONTHLY       = 4;
const int PEP_GC_QUARTERLY     = 5;
const int PEP_GC_SEMIANNUALLY  = 6;
const int PEP_GC_ANNUALLY      = 7;

const int PEP_GC_TOYES         = 1; // use these constants for Boolean fields
const int PEP_GC_TONO          = 2;
const int PEP_GC_EVERYYES      = 3;
const int PEP_GC_EVERYNO       = 4;
const int PEP_GC_NEXTISYES     = 5;
const int PEP_GC_NEXTISNO      = 6;

const int PEP_GC_CONDITIONMASK = 0x00ff; // masks to get the condition and type
const int PEP_GC_TYPEMASK      = 0x0f00; // after calling CRPEJob::GetGroupCondition()
                                         
const int PEP_GC_TYPEOTHER     = 0x0000; // condition parameter
const int PEP_GC_TYPEDATE      = 0x0200;
const int PEP_GC_TYPEBOOLEAN   = 0x0400;

// values used by CRPEJob::ZoomPreviewWindow()
const int PEP_ZOOM_FULL_SIZE           = 0;
const int PEP_ZOOM_SIZE_FIT_ONE_SIDE   = 1;
const int PEP_ZOOM_SIZE_FIT_BOTH_SIDES = 2;

// values used in CRPEJob::SetFont()
const int PEP_FIELDS    = 0x0001;
const int PEP_TEXT      = 0x0002;
const int PEP_UNCHANGED = -1;
#define   PEP_UNCHANGED_COLOR (COLORREF) -2

// values used by CRPELogOnInfo structure
const int PEP_SERVERNAME_LEN   = 128;
const int PEP_DATABASENAME_LEN = 128;
const int PEP_USERID_LEN       = 128;
const int PEP_PASSWORD_LEN     = 128;

// value used in CRPEJob::SetMargins and CRPEJob::GetMargins
const int PEP_SM_DEFAULT = 0x800;

struct CRPELogOnInfo
{
    CRPELogOnInfo () : m_StructSize(sizeof(CRPELogOnInfo))
    {
        m_serverName[0] = m_databaseName[0] = m_userID[0] = m_password[0] = '\0';
    }

    CRPELogOnInfo (const _TCHAR *serverName,
                   const _TCHAR *databaseName,
                   const _TCHAR *userID,
                   const _TCHAR *password);

    // Initialize to sizeof(CRPELogOnInfo).
    WORD m_StructSize;

    // For any of the following values an empty string ("") means to use
    // the value already set in the report.  To override a value in the
    // report use a non-empty string (e.g. "Server A").  All strings are
    // null-terminated.
    //
    // For Netware SQL, pass the dictionary path name in ServerName and
    // data path name in DatabaseName.
    _TCHAR m_serverName [PEP_SERVERNAME_LEN];
    _TCHAR m_databaseName [PEP_DATABASENAME_LEN];
    _TCHAR m_userID [PEP_USERID_LEN];

    // Password is undefined when getting information from report.
    _TCHAR m_password [PEP_PASSWORD_LEN];
};


struct CRPEJobInfo
{
    CRPEJobInfo () : m_StructSize(sizeof(CRPEJobInfo)),
                     m_numRecordsRead(0),
                     m_numRecordsSelected(0),
                     m_numRecordsPrinted(0),
                     m_displayPageN(0),
                     m_latestPageN(0),
                     m_startPageN(0),
                     m_printEnded(FALSE)   // full report print completed?
    {}
    
    WORD m_StructSize;    // initialize to sizeof (CRPEJobInfo)

    DWORD m_numRecordsRead;
    DWORD m_numRecordsSelected;
    DWORD m_numRecordsPrinted;
    WORD  m_displayPageN;       // the page being displayed in window
    WORD  m_latestPageN;        // the page being generated
    WORD  m_startPageN;         // user opted, default to 1
    BOOL  m_printEnded;         // full report print completed?
};


// values used in CRPETableType structure
const int  PEP_DLL_NAME_LEN     = 64;
const int  PEP_FULL_NAME_LEN    = 256;
const WORD PEP_DT_STANDARD      = 1;
const WORD PEP_DT_SQL           = 2;

struct CRPETableType
{
    CRPETableType () : m_StructSize(sizeof(CRPETableType)),
                       m_dbType(PEP_DT_SQL)
    {
        m_dllName[0] = m_descriptiveName[0] = '\0';
    }
    
    // Initialize to sizeof(CRPETableType)
    WORD m_StructSize;

    // All strings are null-terminated.
    _TCHAR m_dllName [PEP_DLL_NAME_LEN];
    _TCHAR m_descriptiveName [PEP_FULL_NAME_LEN];

    WORD m_dbType;
};


// values used in CRPESessionInfo structure
const int PEP_SESS_USERID_LEN   = 128;
const int PEP_SESS_PASSWORD_LEN = 128;

struct CRPESessionInfo
{
    CRPESessionInfo () : m_StructSize(sizeof(CRPESessionInfo)),
                         m_sessionHandle(0)
    {
        m_userID[0] = m_password[0] = '\0';
    }

    CRPESessionInfo (const _TCHAR *userID,
                     const _TCHAR *password,
                     DWORD sessionHandle);

    // Initialize to sizeof(CRPESessionInfo)
    WORD m_StructSize;

    // All strings are null-terminated.
    _TCHAR m_userID [PEP_SESS_USERID_LEN];

    // Password is undefined when getting information from report.
    _TCHAR m_password [PEP_SESS_PASSWORD_LEN];

    // SessionHandle is undefined when getting information from report.
    // When setting information, if it is = 0 the UserID and Password
    // settings are used, otherwise the SessionHandle is used.
    DWORD m_sessionHandle;
};


// values used in CRPETableLocation structure
const int PEP_TABLE_LOCATION_LEN      = 256;

struct CRPETableLocation
{
    CRPETableLocation () : m_StructSize(sizeof(CRPETableLocation))
    {
        m_location[0] = '\0';
    }

    CRPETableLocation (const _TCHAR *location);

    // Initialize to sizeof(CRPETableLocation)
    WORD m_StructSize;

    // String is null-terminated.
    _TCHAR m_location [PEP_TABLE_LOCATION_LEN];
};


// values used in CRPEPrintOptions structures
const short PEP_UNCOLLATED       = 0;
const short PEP_COLLATED         = 1;
const short PEP_DEFAULTCOLLATION = 2;

struct CRPEPrintOptions
{
    CRPEPrintOptions () : m_StructSize(sizeof(CRPEPrintOptions)),
                          m_startPageN(0),
                          m_stopPageN(0),
                          m_nReportCopies(0),
                          m_collation(PEP_DEFAULTCOLLATION)
    {}

    CRPEPrintOptions (unsigned short startPageN,
                      unsigned short stopPageN,
                      unsigned short nReportCopies,
                      unsigned short collation
                     ) :
                      m_StructSize(sizeof(CRPEPrintOptions)),
                      m_startPageN(startPageN),
                      m_stopPageN(stopPageN),
                      m_nReportCopies(nReportCopies),
                      m_collation(collation)
    {}

    WORD m_StructSize;            // initialize to sizeof (PEPrintOptions)

    // page and copy numbers are 1-origin
    // use 0 to preserve the existing settings
    unsigned short m_startPageN,
                   m_stopPageN;

    unsigned short m_nReportCopies;
    unsigned short m_collation;
};

    
struct CRPEExportOptions
{
    CRPEExportOptions () : m_StructSize(sizeof(CRPEExportOptions)),
                           m_formatType(0),
                           m_formatOptions(NULL),
                           m_destinationType(0),
                           m_destinationOptions(NULL),
                           m_nFormatOptionsBytes(0),
                           m_nDestinationOptionsBytes(0)
    {
        m_formatDLLName[0] = m_destinationDLLName[0] = '\0';
    }

    CRPEExportOptions (const _TCHAR *formatDLLName,
                       DWORD formatType,
                       void *formatOptions,
                       const _TCHAR *destinationDLLName,
                       DWORD destinationType,
                       void *destinationOptions);

    WORD m_StructSize;               // initialize to sizeof(CRPEExportOptions)

    _TCHAR m_formatDLLName [PEP_DLL_NAME_LEN];
    DWORD m_formatType;
    void *m_formatOptions;
    _TCHAR m_destinationDLLName [PEP_DLL_NAME_LEN];
    DWORD m_destinationType;
    void *m_destinationOptions;
    WORD m_nFormatOptionsBytes;      // Set by 'GetExportOptions',
                                     // ignored by 'ExportTo'.
    WORD m_nDestinationOptionsBytes; // Set by 'GetExportOptions',
                                     // ignored by 'ExportTo'.
};


struct CRPESectionOptions
{
    CRPESectionOptions () : m_StructSize(sizeof(CRPESectionOptions)),
                            m_visible(0),
                            m_newPageBefore(0),
                            m_newPageAfter(0),
                            m_keepTogether(0),
                            m_suppressBlankLines(0),
                            m_resetPageNAfter(0),
                            m_printAtBottomOfPage(0),
                            m_backgroundColour(PEP_UNCHANGED_COLOR),
                            m_underlaySection(0),
                            m_showArea(0),
                            m_freeFormPlacement(0)
    {}

    CRPESectionOptions (short visible,
                        short newPageBefore,
                        short newPageAfter,
                        short keepTogether,
                        short suppressBlankLines,
                        short resetPageNAfter,
                        short printAtBottomOfPage,
                        COLORREF backgroundColour,
                        short underlaySection,
                        short showArea,
                        short freeFormPlacement
                       ) :
                        m_StructSize(sizeof(CRPESectionOptions)),
                        m_visible(visible),
                        m_newPageBefore(newPageBefore),
                        m_newPageAfter(newPageAfter),
                        m_keepTogether(keepTogether),
                        m_suppressBlankLines(suppressBlankLines),
                        m_resetPageNAfter(resetPageNAfter),
                        m_printAtBottomOfPage(printAtBottomOfPage),
                        m_backgroundColour(backgroundColour),
                        m_underlaySection(underlaySection),
                        m_showArea(showArea),
                        m_freeFormPlacement(freeFormPlacement)
    {}

    WORD m_StructSize; // initialize to sizeof (CRPESectionOptions)

    short m_visible;              // BOOLEAN values, except use PEP_UNCHANGED
    short m_newPageBefore;        // to preserve the existing settings
    short m_newPageAfter;
    short m_keepTogether;
    short m_suppressBlankLines;
    short m_resetPageNAfter;
    short m_printAtBottomOfPage;
    COLORREF m_backgroundColour;
    short m_underlaySection;
    short m_showArea;
    short m_freeFormPlacement;
};


// Setting Graph/Chart info
// ------------------------
//
// Two parameters are passed to uniquely identify the graph:
//      - section code
//      - graph number in that section
//
// The section code includes whether it is a header or footer, and the
// graph number starts at 0, 1...  The graph number identifies the graph
// by its position in the section
//      - looking top down first,
//      - then left to right if they have the same top.

// Graph Types

const int PEP_SIDE_BY_SIDE_BAR_GRAPH          = 0;
const int PEP_STACKED_BAR_GRAPH               = 2;
const int PEP_PERCENT_BAR_GRAPH               = 3;
const int PEP_FAKED_3D_SIDE_BY_SIDE_BAR_GRAPH = 4;
const int PEP_FAKED_3D_STACKED_BAR_GRAPH      = 5;
const int PEP_FAKED_3D_PERCENT_BAR_GRAPH      = 6;
const int PEP_PIE_GRAPH                       = 40;
const int PEP_MULTIPLE_PIE_GRAPH              = 42;
const int PEP_PROPORTIONAL_MULTI_PIE_GRAPH    = 43;
const int PEP_LINE_GRAPH                      = 80;
const int PEP_AREA_GRAPH                      = 120;
const int PEP_THREED_BAR_GRAPH                = 160;
const int PEP_USER_DEFINED_GRAPH              = 500;
const int PEP_UNKNOWN_TYPE_GRAPH              = 1000;

// Graph Directions.
const int PEP_GRAPH_ROWS_ONLY         = 0;
const int PEP_GRAPH_COLS_ONLY         = 1;
const int PEP_GRAPH_MIXED_ROW_COL     = 2;
const int PEP_GRAPH_MIXED_COL_ROW     = 3;
const int PEP_GRAPH_UNKNOWN_DIRECTION = 20;

// Graph constant for rowGroupN, colGroupN, summarizedFieldN in PEGraphDataInfo
const int PEP_GRAPH_DATA_NULL_SELECTION = -1;

// Graph text max length
const int PEP_GRAPH_TEXT_LEN = 128;


struct CRPEGraphDataInfo
{
    CRPEGraphDataInfo () : m_StructSize(sizeof(CRPEGraphDataInfo)),
                           m_rowGroupN(0),
                           m_colGroupN(0),
                           m_summarizedFieldN(0),
                           m_graphDirection(PEP_GRAPH_COLS_ONLY)
    {}
    
    CRPEGraphDataInfo (short rowGroupN,
                       short colGroupN,
                       short summarizedFieldN,
                       short graphDirection
                      ) :
                       m_StructSize(sizeof(CRPEGraphDataInfo)),
                       m_rowGroupN(rowGroupN),
                       m_colGroupN(colGroupN),
                       m_summarizedFieldN(summarizedFieldN),
                       m_graphDirection(graphDirection)
    {}
                           
    WORD m_StructSize;        // initialize to sizeof (CRPEGraphDataInfo)

    short m_rowGroupN;        // group number in report
    short m_colGroupN;        // group number in report
    short m_summarizedFieldN; // summarized field number for the group
                              // where the graph stays.
    short m_graphDirection;   // For normal group/total report, the direction,
                              // is always GRAPH_COLS_ONLY.  For CrossTab
                              // report all four options will change the
                              // graph data.
};


struct CRPEGraphTextInfo
{
    CRPEGraphTextInfo () : m_StructSize(sizeof(CRPEGraphTextInfo))
    {
        m_graphTitle[0] = m_graphSubTitle[0]
                        = m_graphFootNote[0]
                        = m_graphGroupsTitle[0]
                        = m_graphSeriesTitle[0]
                        = m_graphXAxisTitle[0]
                        = m_graphYAxisTitle[0]
                        = m_graphZAxisTitle[0]
                        = '\0';
    }
        
    CRPEGraphTextInfo (const _TCHAR *graphTitle,
                       const _TCHAR *graphSubTitle,
                       const _TCHAR *graphFootNote,
                       const _TCHAR *graphGroupsTitle,
                       const _TCHAR *graphSeriesTitle,
                       const _TCHAR *graphXAxisTitle,
                       const _TCHAR *graphYAxisTitle,
                       const _TCHAR *graphZAxisTitle);
        
    WORD m_StructSize; // initialize to sizeof (CRPEGraphTextInfo)

    _TCHAR m_graphTitle       [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphSubTitle    [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphFootNote    [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphGroupsTitle [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphSeriesTitle [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphXAxisTitle  [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphYAxisTitle  [PEP_GRAPH_TEXT_LEN];
    _TCHAR m_graphZAxisTitle  [PEP_GRAPH_TEXT_LEN];
};


struct CRPEGraphOptions
{
    CRPEGraphOptions () : m_StructSize(sizeof(CRPEGraphOptions)),
                          m_graphMaxValue(0),
                          m_graphMinValue(0),
                          m_showDataValue(FALSE),
                          m_showGridLine(FALSE),
                          m_verticalBars(FALSE),
                          m_showLegend(FALSE)
    {
        m_fontFaceName[0] = '\0';
    }
    
    CRPEGraphOptions (double graphMaxValue,
                      double graphMinValue,
                      BOOL showDataValue,
                      BOOL showGridLine,
                      BOOL verticalBars,
                      BOOL showLegend,
                      const _TCHAR *fontFaceName);
                      
    WORD m_StructSize;      // initialize to sizeof (PEGraphOptions)

    double m_graphMaxValue;
    double m_graphMinValue;

    BOOL m_showDataValue;   // Show data values on risers.
    BOOL m_showGridLine;
    BOOL m_verticalBars;
    BOOL m_showLegend;

    _TCHAR m_fontFaceName[PEP_GRAPH_TEXT_LEN];
};


// controlling parameter fields
const int PEP_WORD_LEN           = 2;
const int PEP_PF_NAME_LEN        = 256;
const int PEP_PF_PROMPT_LEN      = 256;
const int PEP_PF_VALUE_LEN       = 256;
const int PEP_PF_NUMBER          = 0;
const int PEP_PF_CURRENCY        = 1;
const int PEP_PF_BOOLEAN         = 2;
const int PEP_PF_DATE            = 3;
const int PEP_PF_STRING          = 4;
const int PEP_PF_DATETIME        = 5;
const int PEP_PF_TIME            = 6;
const int PEP_PF_REPORT_NAME_LEN = 128;
 
struct CRPEParameterFieldInfo
{
    CRPEParameterFieldInfo () : m_StructSize(sizeof(CRPEParameterFieldInfo)),
                                m_ValueType(0),
                                m_DefaultValueSet(0),
                                m_CurrentValueSet(0),
                                m_needsCurrentValue(0)
    {
        m_Name[0] = m_Prompt[0]
                  = m_DefaultValue[0]
                  = m_CurrentValue[0]
                  = m_ReportName[0]
                  = '\0';
    }

    CRPEParameterFieldInfo (WORD ValueType,
                            WORD DefaultValueSet,
                            WORD CurrentValueSet,
                            const _TCHAR *Name,
                            const _TCHAR *Prompt,
                            const _TCHAR *DefaultValue,
                            const _TCHAR *CurrentValue);

    // Initialize to size of CRPEParameterFieldInfo structure
    WORD m_StructSize;

    // PEP_PF_ constant
    WORD m_ValueType;

    // default value for variable
    WORD m_DefaultValueSet;

    // current value for variable
    WORD m_CurrentValueSet;

    // All strings are null-terminated.
    _TCHAR m_Name[PEP_PF_NAME_LEN];
    _TCHAR m_Prompt[PEP_PF_PROMPT_LEN];

    // Could be Number, Date, DateTime, Time, Boolean, or String
    _TCHAR m_DefaultValue[PEP_PF_VALUE_LEN];
    _TCHAR m_CurrentValue[PEP_PF_VALUE_LEN];

    // name of report where the field belongs, only used in
    // GetNthParameterField and NewParameterField
    _TCHAR m_ReportName[PEP_PF_REPORT_NAME_LEN];

    // returns false if parameter is linked, not in use, or has current value set
    WORD m_needsCurrentValue;
};


// stored procedure parameters
const int PEP_PARAMETER_NAME_LEN = 128;

struct CRPEParameterInfo
{
    CRPEParameterInfo () : m_StructSize(sizeof(CRPEParameterInfo)),
                           m_Type(0)
    {
        m_Name[0] = '\0';
    }

    // Initialize to size of CRPEParameterInfo structure
    WORD m_StructSize;

    WORD m_Type;
    
    _TCHAR m_Name[PEP_PARAMETER_NAME_LEN];
};


// subreport info
const int PEP_SUBREPORT_NAME_LEN = 128;

struct CRPESubreportInfo
{
    CRPESubreportInfo () : m_StructSize(sizeof(CRPESubreportInfo))
    {
        m_name[0] = '\0';
    }

    WORD m_StructSize; // Initialize to size of CRPESubreportInfo
    
    _TCHAR m_name[PEP_SUBREPORT_NAME_LEN];
};


class CRPEJob : public CObject
{
    public:
        
    // constructors

        CRPEJob (short jobHandle);

        CRPEJob (short jobHandle, CRPEJob *parentJob);

    // destructor

        ~CRPEJob ();

    // operations

        BOOL Start ();  // start generating print job output

        void Close ();  // closes print job AND deletes CRPEJob object
        
        void Cancel (); // cancel print job output generation

        BOOL ShowNextPage ();           // show next page in preview window
        
        BOOL ShowFirstPage ();          // show first page in preview window

        BOOL ShowPreviousPage ();       // show previous page in preview window

        BOOL ShowLastPage ();           // show last page of preview window

        BOOL ShowNthPage (short pageN); // show page N

        BOOL ShowPrintControls (BOOL showControls); // show controls in
                                                    // preview window

        BOOL ZoomPreviewWindow (short level); // set preview magnification

        BOOL NextWindowMagnification (); // step to the next preview window
                                         // magnification

        BOOL PrintWindow (); // print the preview window to printer

        BOOL ExportPrintWindow (BOOL toMail); // export the preview window

        void CloseWindow (); // close the preview window

        BOOL TestNthTableConnectivity (short tableN); // test to see if a valid
                                                      // connection exists to
                                                      // the specified table

        BOOL DiscardSavedData (); // discards any saved data in the report

    // attributes

        // report formula text attributes
        short GetNFormulas();

        BOOL GetNthFormula(short formulaN,
                           CString &formulaName,
                           CString &formulaText);

        BOOL GetFormula (const _TCHAR *formulaName,
                         CString &formulaText);

        BOOL SetFormula (const _TCHAR *formulaName,
                         const _TCHAR *formulaText);

        BOOL CheckFormula(const _TCHAR *formulaName);

        // record selection formula attributes
        BOOL GetSelectionFormula (CString &formulaText);

        BOOL SetSelectionFormula (const _TCHAR *formulaText);

        BOOL CheckSelectionFormula ();

        // group selection formula attributes
        BOOL GetGroupSelectionFormula (CString &formulaText);

        BOOL SetGroupSelectionFormula (const _TCHAR *formulaText);

        BOOL CheckGroupSelectionFormula();

        // group condition attributes
        short GetNGroups ();

        BOOL GetGroupCondition (short sectionCode,
                                CString &conditionField,
                                short *condition,
                                short *sortDirection);

        BOOL SetGroupCondition (short sectionCode,
                                const _TCHAR *conditionField,
                                short condition,
                                short sortDirection);

        // record sort order field attributes
        short GetNSortFields ();

        BOOL GetNthSortField (short sortFieldN,
                              CString &field,
                              short *direction);

        BOOL SetNthSortField (short sortFieldN,
                              const _TCHAR *field,
                              short direction);

        BOOL DeleteNthSortField (short sortFieldN);

        // group sort order field attributes
        short GetNGroupSortFields ();

        BOOL GetNthGroupSortField (short sortFieldN,
                                   CString &field,
                                   short *direction);
                                    
        BOOL SetNthGroupSortField (short sortFieldN,
                                   const _TCHAR *field,
                                   short direction);

        BOOL DeleteNthGroupSortField (short sortFieldN);

        // database table attributes
        short GetNTables ();

        BOOL GetNthTableType (short tableN,
                              CRPETableType *tableType);

        BOOL GetNthTableSessionInfo (short tableN,
                                     CRPESessionInfo *sessionInfo);

        BOOL SetNthTableSessionInfo (short tableN,
                                     const CRPESessionInfo *sessionInfo,
                                     BOOL propagate);

        BOOL GetNthTableLocation (short tableN,
                                  CRPETableLocation *tableLocation);

        BOOL SetNthTableLocation (short tableN,
                                  const CRPETableLocation *tableLocation);

        BOOL GetNthTableLogonInfo (short tableN,
                                   CRPELogOnInfo *logonInfo);

        BOOL SetNthTableLogonInfo (short tableN,
                                   const CRPELogOnInfo *logonInfo,
                                   BOOL propagate);

        // SQL query attributes
        BOOL GetSQLQuery (CString &query);

        BOOL SetSQLQuery (const _TCHAR *query);

        // SQL stored procedure attributes
        short GetNParams ();

        BOOL GetNthParam (short paramN,
                          CString &paramValue);

        BOOL GetNthParamInfo (short paramN,
                              CRPEParameterInfo *paramInfo);

        BOOL SetNthParam (short paramN,
                          const _TCHAR *paramValue);

        // report section attributes
        BOOL GetNDetailCopies(short *nCopies);
    
        BOOL SetNDetailCopies (short nCopies);

        short GetNSections ();

        short GetSectionCode (short sectionN);

        BOOL GetMinimumSectionHeight (short sectionCode,
                                      short *height);
        
        BOOL SetMinimumSectionHeight (short sectionCode,
                                      short height);

        BOOL SetFont (short sectionCode,
                      short scopeCode,
                      const _TCHAR *faceName,
                      short fontFamily,
                      short fontPitch,
                      short charSet,
                      short pointSize,
                      short isItalic,
                      short isUnderlined,
                      short isStruckOut,
                      short weight);

        BOOL GetSectionFormat (short sectionCode,
                               CRPESectionOptions *options);

        BOOL SetSectionFormat (short sectionCode,
                               const CRPESectionOptions *options);
        
        // graphing attributes
        BOOL GetGraphType (short sectionCode,
                           short graphN,
                           short *graphType);

        BOOL SetGraphType (short sectionCode,
                           short graphN,
                           short graphType);

        BOOL GetGraphData (short sectionCode,
                           short graphN,
                           CRPEGraphDataInfo *graphDataInfo);

        BOOL SetGraphData (short sectionCode,
                           short graphN,
                           CRPEGraphDataInfo *graphDataInfo);

        BOOL GetGraphText (short sectionCode,
                           short graphN,
                           CRPEGraphTextInfo *graphTextInfo);

        BOOL SetGraphText (short sectionCode,
                           short graphN,
                           CRPEGraphTextInfo *graphTextInfo);

        BOOL GetGraphOptions (short sectionCode,
                              short graphN,
                              CRPEGraphOptions *graphOptions);

        BOOL SetGraphOptions (short sectionCode,
                              short graphN,
                              CRPEGraphOptions *graphOptions);

        // report attributes
        BOOL GetReportTitle (CString &title);

        BOOL SetReportTitle (const _TCHAR *title);

        BOOL GetPrintDate (short *year,
                           short *month,
                           short *day);
        
        BOOL SetPrintDate (short year,
                           short month,
                           short day);

        BOOL HasSavedData (BOOL *hasSavedData);

        short GetNPages ();

        // report printer attributes
        BOOL GetSelectedPrinter (CString &driverName,
                                 CString &printerName,
                                 CString &portName,
                                 DEVMODE **mode);

        BOOL SelectPrinter (const _TCHAR *driverName,
                            const _TCHAR *printerName,
                            const _TCHAR *portName,
                            const DEVMODE *mode = 0);

        BOOL GetPrintOptions (CRPEPrintOptions *options);

        BOOL SetPrintOptions (const CRPEPrintOptions *options);

        // output destination options
        BOOL OutputToPrinter (short nCopies = 1);

        BOOL OutputToWindow (const _TCHAR *title,
                             int left,
                             int top,
                             int width,
                             int height,
                             int style,
                             CWnd *parentWindow);

        BOOL OutputToWindow (const char *title,
                             int left,
                             int top,
                             int width,
                             int height,
                             int style,
                             CMDIFrameWnd *parentWindow);

        HWND GetWindowHandle ();

        BOOL PrintControlsShowing (BOOL *controlsShowing);

        BOOL GetExportOptions (CRPEExportOptions *options);

        BOOL ExportTo (const CRPEExportOptions *options);

        BOOL GetMargins (short *left,
                         short *right,
                         short *top,
                         short *bottom);

        BOOL SetMargins (short left,
                         short right,
                         short top,
                         short bottom);

        // job status attributes
        short GetJobStatus (CRPEJobInfo *jobStatus);

        BOOL IsJobFinished ();

        short GetErrorCode ();
        
        CString GetErrorText ();

        // dialog control attributes
        BOOL SetDialogParentWindow (CWnd *parentWindow);

        BOOL EnableProgressDialog (BOOL enable);

        // parameter field attributes
        short GetNParameterFields ();

        BOOL GetNthParameterField (short parameterN,
                                   CRPEParameterFieldInfo *parameterInfo);

        BOOL SetNthParameterField (short parameterN,
                                   const CRPEParameterFieldInfo *parameterInfo);

        // subreport attributes
        short GetNSubreportsInSection (short sectionCode);

        DWORD GetNthSubreportInSection (short sectionCode,
                                        short subreportN);

        BOOL GetSubreportInfo (DWORD subreportHandle,
                               CRPESubreportInfo *subreportInfo);

        CRPEJob *OpenSubreportJob (const _TCHAR *subreportName);

        // misc. attributes
        short GetJobHandle ();

        // implementation
        #ifdef _DEBUG
        virtual void AssertValid() const;
        virtual void Dump(CDumpContext& dc) const;
        #endif

        void AddSubReportJob (CRPEJob *job);

        void RemoveSubReportJob (CRPEJob *job);

    protected:
        short m_jobHandle;

        // MDI cached values
        BOOL m_mdiOutput;

        CString m_mdiTitle;
        
        int m_mdiLeft;
        
        int m_mdiTop;
        
        int m_mdiWidth;
        
        int m_mdiHeight;
        
        int m_mdiStyle;
        
        CMDIFrameWnd *m_mdiFrameWnd;
        
        CObArray m_subReportJobs;

        CRPEJob *m_parentJob;
};


class CRPEngine : public CObject
{
    public:
        enum Status {engineOpen, engineClosed, engineMissing};

        static CRPEngine *GetEngine ();

        static Status GetEngineStatus ();

    // constructors

        CRPEngine (BOOL open = FALSE);

    // destructor

        ~CRPEngine ();

    // operations

        BOOL Open ();

        void Close ();

        CRPEJob *OpenJob (const _TCHAR *reportFileName);

        BOOL LogOnServer (const _TCHAR *dllName,
                          const CRPELogOnInfo *logOnInfo);

        BOOL LogOffServer (const _TCHAR *dllName,
                           const CRPELogOnInfo *logOnInfo);

        BOOL LogOnSQLServerWithPrivateInfo(const _TCHAR *dllName,
                                           void *privateInfo);

        short PrintReport (const _TCHAR *reportFilePath,
                           BOOL toPrinter,
                           BOOL toWindow,
                           const _TCHAR *title,
                           int left,
                           int top,
                           int width,
                           int height,
                           DWORD style,
                           CWnd *parentWindow);

    // attributes

        BOOL CanClose ();
        
        short GetVersion (short versionRequested);

        short GetErrorCode ();

        CString GetErrorText ();

        int GetNPrintJobs ();

    // implementation

        void AddJob (CRPEJob *job);

        void RemoveJob (CRPEJob *job);

        BOOL GetHandleString (HANDLE textHandle,
                              short textLength,
                              CString &string);

        #ifdef _DEBUG
        virtual void AssertValid() const;
        virtual void Dump(CDumpContext& dc) const;
        #endif

    protected:
                                    
        static CRPEngine *thePrintEngine;
        Status m_engineStatus;
        CObArray m_printJobs;
        int m_engineError;
};


class CRPEMDIChildWnd : public CMDIChildWnd
{
	DECLARE_DYNCREATE(CRPEMDIChildWnd)

    public:
	    CRPEMDIChildWnd();

        HWND m_printWnd;
        
// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRPEMDIChildWnd)
	//}}AFX_VIRTUAL

// Implementation
    protected:
	    virtual ~CRPEMDIChildWnd();

	// Generated message map functions
	//{{AFX_MSG(CRPEMDIChildWnd)
	afx_msg void OnSize(UINT nType, int cx, int cy);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

#if _MSC_VER >= 900
    #pragma pack (pop)
#else
    #pragma pack ()
#endif

#endif // PEPLUS_H
