/*
** File:    TblParms.hpp
** Author:  Rick Cameron
** Date:    8 Apr 93
**
** Purpose: Classes to hold parameters for CRPE tables
*/

#if !defined (TBLPARMS_HPP)

#define TBLPARMS_HPP

// #define USE_INHERITANCE

#if defined (USE_INHERITANCE)
  #if defined (ORIGINAL)
class SessionParams : public PESessionInfo
{
    public:
        SessionParams ()
        {
            reset ();
        }

        void reset ()
        {
            StructSize    = PE_SIZEOF_SESSION_INFO;
            UserID   [0]  = '\0';
            Password [0]  = '\0';
            SessionHandle = 0;

            isSet = FALSE;
        }

        BOOL isSet;  
};

class LogonParams : public PELogOnInfo
{
    public:
        LogonParams ()
        {
            reset ();
        }

        void reset ()
        {
            StructSize       = PE_SIZEOF_LOGON_INFO;
            ServerName   [0] = '\0';
            DatabaseName [0] = '\0';
            UserID       [0] = '\0';
            Password     [0] = '\0';

            isSet = FALSE;
        }

        BOOL isSet;
};
  #else // !defined (ORIGINAL)
class SessionParams : private PESessionInfo
{
    public:
        SessionParams ()
        {
            reset ();
        }

        void reset ()
        {
            StructSize    = PE_SIZEOF_SESSION_INFO;
            UserID   [0]  = '\0';
            Password [0]  = '\0';
            SessionHandle = 0;

            isSet = FALSE;
        }

        void set () { isSet = TRUE; }

        BOOL hasBeenSet () { return isSet; }

        operator PESessionInfo * () { return this; }

    protected:

        BOOL isSet;  
};

class LogonParams : private PELogOnInfo
{
    public:
        LogonParams ()
        {
            reset ();
        }

        void reset ()
        {
            StructSize       = PE_SIZEOF_LOGON_INFO;
            ServerName   [0] = '\0';
            DatabaseName [0] = '\0';
            UserID       [0] = '\0';
            Password     [0] = '\0';

            isSet = FALSE;
        }

        void set () { isSet = TRUE; }

        BOOL hasBeenSet () { return isSet; }

        operator PELogOnInfo * () { return this; }

    protected:

        BOOL isSet;
};
  #endif // defined (ORIGINAL)
#else // !defined (USE_INHERITANCE)
class SessionParams
{
    public:
        SessionParams ()
          : info (0)
        {
        }

        ~SessionParams ()
        {
            reset ();
        }

        void reset ()
        {
            delete info;
            info = 0;
        }

        void set () { }

        BOOL hasBeenSet () { return info != 0; }

        operator PESessionInfo * () { create (); return info; }

    protected:

        void create ()
        {
            if (info != 0)
                return;

            info = new PESessionInfo;

            if (info != 0)
            {
                info->StructSize    = PE_SIZEOF_SESSION_INFO;
                info->UserID   [0]  = '\0';
                info->Password [0]  = '\0';
                info->SessionHandle = 0;
            }
        }


        PESessionInfo *info;  
};

class LogonParams
{
    public:
        LogonParams ()
          : info (0)
        {
        }

        ~LogonParams ()
        {
            reset ();
        }

        void reset ()
        {
            delete info;
            info = 0;
        }

        void set () { }

        BOOL hasBeenSet () { return info != 0; }

        operator PELogOnInfo * () { create (); return info; }

    protected:

        void create ()
        {
            if (info != 0)
                return;

            info = new PELogOnInfo;

            if (info != 0)
            {
                info->StructSize       = PE_SIZEOF_LOGON_INFO;
                info->ServerName   [0] = '\0';
                info->DatabaseName [0] = '\0';
                info->UserID       [0] = '\0';
                info->Password     [0] = '\0';
            }
        }

        PELogOnInfo *info;
};
#endif // defined (USE_INHERITANCE)

#endif // !defined (TBLPARMS_HPP)
