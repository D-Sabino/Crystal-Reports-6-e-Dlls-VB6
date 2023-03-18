/*
** File:    InfoDlg.hpp
** Author:  Rick Cameron
** Date:    8 Apr 93
**
** Purpose: Dialogs to get session and logon info for CrRun.exe
*/

#if !defined (INFODLG_HPP)

#define INFODLG_HPP

#include <Edit.h>

#include "TblParms.hpp"

class SessionInfoDlg : public TDialog
{
    public:
        SessionInfoDlg (PTWindowsObject parent,
                        SessionParams  &params);

    protected:
        virtual void TransferData (WORD Direction);

        SessionParams &params;

        PTEdit userName,
               password;
};

class LogonInfoDlg : public TDialog
{
    public:
        LogonInfoDlg (PTWindowsObject parent,
                        LogonParams  &params);

    protected:
        virtual void TransferData (WORD Direction);

        LogonParams &params;

        PTEdit serverName,
               databaseName,
               userName,
               password;
};

#endif // !defined (INFODLG_HPP)
