INCLUDE "crpedemo.4gh"

FORWARD MainWin

GLOBAL VARIABLE MainWin MainWin
VARIABLE Main_Engine CRPEngine,
		 CurJob CRPEJob

MAIN
	LET MainWin = NEW MainWin()
	CALL MainWin.open()
	RETURN
END MAIN

HANDLER MainWin::MainWin_start() RETURNING VOID
VARIABLE main_Win MainWin

LET Main_Engine = NEW CRPEngine(TRUE)

LET main_Win = self.getWindow() CAST MainWin

	CALL main_Win.label2.setText("")
	CALL main_Win.TextBox2.setText("")
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
	CALL main_Win.TextBox6.setText("")
END HANDLER -- MainWin::MainWin_start

HANDLER ixMenu::MainWin_OpenPrintJobMenu_activate() RETURNING VOID
VARIABLE main_Win MainWin,
		 ErrText ixString

LET main_Win = self.getWindow() CAST MainWin

LET CurJob = Main_Engine.OpenJob(main_Win.TextBox1.getText())
IF (CurJob.GetErrorCode() = 0 ) THEN
    CALL main_Win.StatusBar.setcolor(black,65408) 
    CALL main_Win.StatusBar.setText("Congratulation! Job is Opened")
ELSE
    LET ErrText = NEW ixstring( "Job is Not Open : ")
    CALL ErrText.concat(Main_Engine.GetErrorText())
    CALL main_Win.StatusBar.setcolor(red,65408) 
    CALL main_Win.StatusBar.setText(ErrText.getValueStr())
END IF

END HANDLER -- ixMenu::MainWin_OpenPrintJobMenu_activate

HANDLER ixMenu::MainWin_PrintToWindowMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
		 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.OutPutToWindow("Test",50,50,550,450,0,NULL)) THEN
    IF (CurJob.StartJob()) THEN
	LET ErrText = NEW ixString("Job has started")
    ELSE
	LET ErrText = NEW ixString("Error In Start Job :")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     LET ErrText = NEW ixString("Error  :")
     CALL ErrText.concat(CurJob.GetErrorText())
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_PrintToWindowMenu_activate

HANDLER ixMenu::MainWin_PrintToPrinterMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
		 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.OutPutToPrinter(1) ) THEN
    IF (CurJob.StartJob()) THEN
	LET ErrText = NEW ixString("Job has started")
    ELSE
	LET ErrText = NEW ixString("Error In Start Job :")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     LET ErrText = NEW ixString("Error  :")
     CALL ErrText.concat(CurJob.GetErrorText())
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_PrintToPrinterMenu_activate

HANDLER ixMenu::MainWin_Menu11_activate() RETURNING VOID
EXIT PROGRAM
END HANDLER -- ixMenu::MainWin_Menu11_activate

HANDLER ixMenu::MainWin_GetLocMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLocation CRPETableLocation 

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.GetNTables() >  (main_Win.IndexBox.getText() - "0") )THEN
    CALL CurJob.GetNthTableLocation( main_Win.IndexBox.getText() - "0" ) RETURNING err, tableLocation
    IF (Err) THEN
	CALL main_Win.label2.setText("Table")
	CALL main_Win.TextBox2.setText(tableLocation.m_location)
--     setting the text black colour
                call main_Win.StatusBar.setcolor(black, 65408) 
	LET ErrText = NEW ixString("Get Table Location Succeeded")
-- not used
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
	CALL main_Win.TextBox6.setText("")
    ELSE
                call main_Win.StatusBar.setcolor(red, 65408) 
	LET ErrText = NEW ixString("Error Getting Name : ")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     call main_Win.StatusBar.setcolor(red,65408) 
     LET ErrText = NEW ixString("Table Index Invalid.")
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_GetLocMenu_activate

HANDLER ixMenu::MainWin_SetLocMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLocation CRPETableLocation() 

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.GetNTables() >  (main_Win.IndexBox.getText() - "0") )THEN
    LET tableLocation.m_location = main_Win.TextBox2.getText()
    CALL CurJob.SetNthTableLocation( main_Win.IndexBox.getText() - "0", tableLocation ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set Table Location Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting Location :")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     call main_Win.StatusBar.setcolor(red,65408) 
     LET ErrText = NEW ixString("Table Index Invalid.")
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_SetLocMenu_activate

HANDLER ixMenu::MainWin_GetTableLogMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLogon CRPELogonInfo

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.GetNTables() >  (main_Win.IndexBox.getText() - "0") )THEN
    CALL CurJob.GetNthTableLogonInfo( main_Win.IndexBox.getText() - "0" ) RETURNING err, tableLogon
    IF (Err) THEN
	CALL main_Win.label2.setText("Server")
	CALL main_Win.TextBox2.setText(tableLogon.m_serverName)
	CALL main_Win.label3.setText("Database")
	CALL main_Win.TextBox3.setText(tableLogon.m_databaseName)
	CALL main_Win.label4.setText("UserID")
	CALL main_Win.TextBox4.setText(tableLogon.m_userID)
	CALL main_Win.label5.setText("Password")
	CALL main_Win.TextBox5.setText(tableLogon.m_Password)
--     setting the text black colour
                call main_Win.StatusBar.setcolor(black, 65408) 
	LET ErrText = NEW ixString("Get Table Logon Info Succeeded")
-- not used
	CALL main_Win.TextBox6.setText("")

    ELSE
	LET ErrText = NEW ixString("Error Getting Logon Info :")
--     setting the text red colour
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     call main_Win.StatusBar.setcolor(red,65408) 
     LET ErrText = NEW ixString("Table Index Invalid.")
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_GetTableLogMenu_activate

HANDLER ixMenu::MainWin_SetTableLogMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLogon CRPELogonInfo() 

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.GetNTables() >  (main_Win.IndexBox.getText() - "0") )THEN
    LET tableLogon.m_serverName = main_Win.TextBox2.getText()
    LET tableLogon.m_databaseName = main_Win.TextBox3.getText()
    LET tableLogon.m_UserID = main_Win.TextBox4.getText()
    LET tableLogon.m_Password = main_Win.TextBox5.getText()
-- I am hardcoding this to propagate across all tables
    CALL CurJob.SetNthTableLogonInfo( main_Win.IndexBox.getText() - "0", tableLogon, TRUE ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set Table Logon Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting Logon Info :")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     call main_Win.StatusBar.setcolor(red,65408) 
     LET ErrText = NEW ixString("Table Index Invalid.")
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_SetTableLogMenu_activate

HANDLER ixMenu::MainWin_LogonMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLogon CRPELogonInfo() 

LET main_Win = self.getWindow() CAST MainWin

    LET tableLogon.m_serverName = main_Win.TextBox2.getText()
    LET tableLogon.m_databaseName = main_Win.TextBox3.getText()
    LET tableLogon.m_UserID = main_Win.TextBox4.getText()
    LET tableLogon.m_Password = main_Win.TextBox5.getText()
    CALL Main_Engine.LogonServer( "PDSODBC.DLL", tableLogon ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Logon Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Logon To Server : ")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_LogonMenu_activate

HANDLER ixMenu::MainWin_LogOffMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 tableLogon CRPELogonInfo() 

LET main_Win = self.getWindow() CAST MainWin

    LET tableLogon.m_serverName = main_Win.TextBox2.getText()
    LET tableLogon.m_databaseName = main_Win.TextBox3.getText()
    LET tableLogon.m_UserID = main_Win.TextBox4.getText()
    LET tableLogon.m_Password = main_Win.TextBox5.getText()
    CALL Main_Engine.LogoffServer( "PDSODBC.DLL",tableLogon ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Logoff Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Logoff From Server : ")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_LogOffMenu_activate

HANDLER ixMenu::MainWin_Menu135_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	sqlQuery ixString

LET main_Win = self.getWindow() CAST MainWin

CALL CurJob.GetSQLQuery() RETURNING err, sqlQuery
IF (Err) THEN
	CALL main_Win.TextBox6.setText(sqlQuery.getValueStr())
--     setting the text black colour
                CALL main_Win.StatusBar.setcolor(black,65408)
	LET ErrText = NEW ixString("Get SQL Query Succeeded")
--  not used
	CALL main_Win.label2.setText("")
	CALL main_Win.TextBox2.setText("")
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
ELSE
                call main_Win.StatusBar.setcolor(red, 65408) 
	LET ErrText = NEW ixString("Error Getting SQL Query : ")
	CALL ErrText.concat(CurJob.GetErrorText())
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_Menu135_activate

HANDLER ixMenu::MainWin_Menu136_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

CALL CurJob.SetSQLQuery( main_Win.TextBox6.getText() ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set SQL Query Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting SQL Query : ")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_Menu136_activate

HANDLER ixMenu::MainWin_GetRecSelMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 selectStr ixString

LET main_Win = self.getWindow() CAST MainWin

    CALL CurJob.GetSelectionFormula() RETURNING err, selectStr
    IF (Err) THEN
	CALL main_Win.label2.setText("Sel Formula")
	CALL main_Win.TextBox2.setText(selectStr.getValueStr())
--     setting the text black colour
                call main_Win.StatusBar.setcolor(black, 65408) 
	LET ErrText = NEW ixString("Get Selection Formula Succeeded")
--not used
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
	CALL main_Win.TextBox6.setText("")
    ELSE
                call main_Win.StatusBar.setcolor(red, 65408) 
	LET ErrText = NEW ixString("Error Getting Selection Formula : ")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_GetRecSelMenu_activate

HANDLER ixMenu::MainWin_SetRecSelMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

    CALL CurJob.SetSelectionFormula( main_Win.TextBox2.getText() ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set Record Selection Formula Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting Record Selection Formula :")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_SetRecSelMenu_activate

HANDLER ixMenu::MainWin_GetGrpSelMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 selectStr ixString

LET main_Win = self.getWindow() CAST MainWin

    CALL CurJob.GetGroupSelectionFormula() RETURNING err, selectStr
    IF (Err) THEN
	CALL main_Win.label2.setText("Grp Sel Fmla")
	CALL main_Win.TextBox2.setText(selectStr.getValueStr())
--     setting the text black colour
                call main_Win.StatusBar.setcolor(black, 65408) 
	LET ErrText = NEW ixString("Get Selection Formula Succeeded")
--not used
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
	CALL main_Win.TextBox6.setText("")
    ELSE
                call main_Win.StatusBar.setcolor(red, 65408) 
	LET ErrText = NEW ixString("Error Getting Group Selection Formula : ")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_GetGrpSelMenu_activate

HANDLER ixMenu::MainWin_SetGrpSelMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

    CALL CurJob.SetGroupSelectionFormula( main_Win.TextBox2.getText() ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set Group Selection Formula Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting Group Selection Formula :")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_SetGrpSelMenu_activate

HANDLER ixMenu::MainWin_GetFormulaMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin,
	 formName ixString,
                 formString ixString

LET main_Win = self.getWindow() CAST MainWin

IF ( CurJob.GetNFormulas() >  (main_Win.IndexBox.getText() - "0") ) THEN
    CALL CurJob.GetNthFormula( main_Win.IndexBox.getText() - "0" ) RETURNING err, formName, formString
    IF (Err) THEN
	CALL main_Win.label2.setText(formName.getValueStr())
	CALL main_Win.TextBox2.setText(formString.getValueStr())
--     setting the text black colour
                CALL main_Win.StatusBar.setcolor(black,65408)
	LET ErrText = NEW ixString("Get Formula Succeeded")
--  not used
	CALL main_Win.label3.setText("")
	CALL main_Win.TextBox3.setText("")
	CALL main_Win.label4.setText("")
	CALL main_Win.TextBox4.setText("")
	CALL main_Win.label5.setText("")
	CALL main_Win.TextBox5.setText("")
	CALL main_Win.TextBox6.setText("")
    ELSE
                call main_Win.StatusBar.setcolor(red, 65408) 
	LET ErrText = NEW ixString("Error Getting Formula : ")
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF
ELSE
     call main_Win.StatusBar.setcolor(red,65408) 
     LET ErrText = NEW ixString("Formula Index Invalid.")
END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_GetFormulaMenu_activate

HANDLER ixMenu::MainWin_SetFormulaMenu_activate() RETURNING VOID
VARIABLE ErrText ixString,
                 Err BOOLEAN,
	 main_Win MainWin

LET main_Win = self.getWindow() CAST MainWin

    CALL CurJob.SetFormula( main_Win.label2.getText(), main_Win.TextBox2.getText()  ) RETURNING err
    IF (Err) THEN
                call main_Win.StatusBar.setcolor(black,65408) 
	LET ErrText = NEW ixString("Set Formula Succeeded")
    ELSE
	LET ErrText = NEW ixString("Error Setting Formula :")
                call main_Win.StatusBar.setcolor(red,65408) 
	CALL ErrText.concat(CurJob.GetErrorText())
    END IF

--Display result
call main_Win.StatusBar.setText(ErrText.getValueStr()) 
END HANDLER -- ixMenu::MainWin_SetFormulaMenu_activate

HANDLER ixMenu::MainWin_Menu85_activate() RETURNING VOID
VARIABLE about_win aboutWin,
     thisWin MainWin

LET thisWin = getWindow() CAST MainWin

LET about_win = NEW aboutWIN(containingWindow :  thisWin)
CALL about_win.OPEN()
END HANDLER -- ixMenu::MainWin_Menu85_activate

FUNCTION MainWin::MainWin( 
	geometry ixGeometry,
	appearance ixAppearance,
	windowStyle SMALLINT,
	containingWindow ixWindow,
	title CHAR(*),
	enabled BOOLEAN,
	helpFile CHAR(*),
	name CHAR(*),
	helpNum INTEGER,
	source BOOLEAN,
	shown BOOLEAN,
	topicName CHAR(*),
	icon CHAR(*)
)
	: ixWindow(
		containingWindow : containingWindow,
		name : name,
		enabled : enabled,
		shown : shown,
		helpNum : helpNum,
		geometry : geometry,
		appearance : appearance,
		helpFile : helpFile,
		title : title,
		icon : icon,
		windowStyle : windowStyle,
		topicName : topicName,
		source : source
	)

	VARIABLE itemList ixVector
	VARIABLE includeTable ixRow
	VARIABLE result INTEGER
	LET result = 0

	HANDLE start WITH
		MainWin::MainWin_start
	LET Menu1 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu1",
		helpNum : 0,
		title : "&File",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : SELF.getMenuBar()
	)
	LET OpenPrintJobMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "OpenPrintJobMenu",
		helpNum : 0,
		title : "&Open Print Job",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	HANDLE OpenPrintJobMenu.activate WITH
		ixMenu::MainWin_OpenPrintJobMenu_activate
	LET Menu13 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu13",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	LET PrintToWindowMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "PrintToWindowMenu",
		helpNum : 0,
		title : "Print To &Window",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	HANDLE PrintToWindowMenu.activate WITH
		ixMenu::MainWin_PrintToWindowMenu_activate
	LET PrintToPrinterMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "PrintToPrinterMenu",
		helpNum : 0,
		title : "Print To &Printer",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	HANDLE PrintToPrinterMenu.activate WITH
		ixMenu::MainWin_PrintToPrinterMenu_activate
	LET Menu50 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu50",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	LET Menu11 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu11",
		helpNum : 0,
		title : "&Exit",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu1
	)
	HANDLE Menu11.activate WITH
		ixMenu::MainWin_Menu11_activate
	LET DbMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "DbMenu",
		helpNum : 0,
		title : "&Database",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : SELF.getMenuBar()
	)
	LET GetLocMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "GetLocMenu",
		helpNum : 0,
		title : "&Get Table Location",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE GetLocMenu.activate WITH
		ixMenu::MainWin_GetLocMenu_activate
	LET SetLocMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "SetLocMenu",
		helpNum : 0,
		title : "&Set Table Location",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE SetLocMenu.activate WITH
		ixMenu::MainWin_SetLocMenu_activate
	LET Menu103 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu103",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	LET GetTableLogMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "GetTableLogMenu",
		helpNum : 0,
		title : "Ge&t Table Logon Info",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE GetTableLogMenu.activate WITH
		ixMenu::MainWin_GetTableLogMenu_activate
	LET SetTableLogMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "SetTableLogMenu",
		helpNum : 0,
		title : "Set Ta&ble Logon Info",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE SetTableLogMenu.activate WITH
		ixMenu::MainWin_SetTableLogMenu_activate
	LET Menu102 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu102",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	LET LogonMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "LogonMenu",
		helpNum : 0,
		title : "&Logon Server",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE LogonMenu.activate WITH
		ixMenu::MainWin_LogonMenu_activate
	LET LogOffMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "LogOffMenu",
		helpNum : 0,
		title : "Log&Off Server",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE LogOffMenu.activate WITH
		ixMenu::MainWin_LogOffMenu_activate
	LET Menu137 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu137",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	LET Menu135 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu135",
		helpNum : 0,
		title : "Show S&QL Query",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE Menu135.activate WITH
		ixMenu::MainWin_Menu135_activate
	LET Menu136 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu136",
		helpNum : 0,
		title : "Set SQL Q&uery",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : DbMenu
	)
	HANDLE Menu136.activate WITH
		ixMenu::MainWin_Menu136_activate
	LET ReportMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "ReportMenu",
		helpNum : 0,
		title : "&Report",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : SELF.getMenuBar()
	)
	LET GetRecSelMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "GetRecSelMenu",
		helpNum : 0,
		title : "&Get Record Selection Formula",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE GetRecSelMenu.activate WITH
		ixMenu::MainWin_GetRecSelMenu_activate
	LET SetRecSelMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "SetRecSelMenu",
		helpNum : 0,
		title : "&Set Record Selection Formula",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE SetRecSelMenu.activate WITH
		ixMenu::MainWin_SetRecSelMenu_activate
	LET Menu104 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu104",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	LET GetGrpSelMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "GetGrpSelMenu",
		helpNum : 0,
		title : "Get Grou&p  Selection Formula",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE GetGrpSelMenu.activate WITH
		ixMenu::MainWin_GetGrpSelMenu_activate
	LET SetGrpSelMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "SetGrpSelMenu",
		helpNum : 0,
		title : "Se&t Group  Selection Formula",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE SetGrpSelMenu.activate WITH
		ixMenu::MainWin_SetGrpSelMenu_activate
	LET Menu105 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu105",
		helpNum : 0,
		title : "-",
		enabled : FALSE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	LET GetFormulaMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "GetFormulaMenu",
		helpNum : 0,
		title : "Get &Formula",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE GetFormulaMenu.activate WITH
		ixMenu::MainWin_GetFormulaMenu_activate
	LET SetFormulaMenu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "SetFormulaMenu",
		helpNum : 0,
		title : "&Set Formu&la",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : ReportMenu
	)
	HANDLE SetFormulaMenu.activate WITH
		ixMenu::MainWin_SetFormulaMenu_activate
	LET Menu84 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu84",
		helpNum : 0,
		title : "&Help",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : SELF.getMenuBar()
	)
	LET Menu85 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu85",
		helpNum : 0,
		title : "&About",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu84
	)
	HANDLE Menu85.activate WITH
		ixMenu::MainWin_Menu85_activate
	LET TextBox1 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 180,
			left : 2730,
			height : 360,
			width : 4470
		),
		appearance : NEW ixAppearance( 
			fontName : "Times New Roman",
			fontSize : 10,
			fontBold : TRUE,
			fontItalic : FALSE,
			fontUnderline : FALSE,
			foreColor : 0,
			backColor : 4226943
		),
		enabled : TRUE,
		tabIndex : 1,
		tabEnabled : TRUE,
		maxChars : 254,
		name : "TextBox1",
		helpNum : 0,
		shown : TRUE,
		text : "c:\\crw\\boxoffic.rpt",
		multiLine : FALSE,
		container : SELF
	)
	LET Label1 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 180,
			left : 1260,
			height : 330,
			width : 1440
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label1",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Report Name",
		container : SELF
	)
	LET StatusBar = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 6120,
			left : 720,
			height : 375,
			width : 6930
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : 0,
			backColor : 65408
		),
		name : "StatusBar",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Crystal Report Demo",
		container : SELF
	)
	LET Label2 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 720,
			left : 1260,
			height : 360,
			width : 1410
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label2",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Label",
		container : SELF
	)
	LET Label3 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 1260,
			left : 1260,
			height : 360,
			width : 1395
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label3",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Label",
		container : SELF
	)
	LET Label4 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 1800,
			left : 1260,
			height : 360,
			width : 1440
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label4",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Label",
		container : SELF
	)
	LET Label5 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 2340,
			left : 1260,
			height : 360,
			width : 1440
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label5",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Label",
		container : SELF
	)
	LET TextBox2 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 720,
			left : 2700,
			height : 360,
			width : 4500
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : 2,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "TextBox2",
		helpNum : 0,
		shown : TRUE,
		text : "Text to edit",
		multiLine : FALSE,
		container : SELF
	)
	LET TextBox3 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 1260,
			left : 2700,
			height : 360,
			width : 4500
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : 3,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "TextBox3",
		helpNum : 0,
		shown : TRUE,
		text : "Text to edit",
		multiLine : FALSE,
		container : SELF
	)
	LET TextBox4 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 1800,
			left : 2700,
			height : 360,
			width : 4500
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : 4,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "TextBox4",
		helpNum : 0,
		shown : TRUE,
		text : "Text to edit",
		multiLine : FALSE,
		container : SELF
	)
	LET TextBox5 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 2340,
			left : 2700,
			height : 360,
			width : 4500
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : 5,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "TextBox5",
		helpNum : 0,
		shown : TRUE,
		text : "Text to edit",
		multiLine : FALSE,
		container : SELF
	)
	LET TextBox6 = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 3150,
			left : 540,
			height : 2790,
			width : 7830
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : 8,
		tabEnabled : TRUE,
		maxChars : 1024,
		name : "TextBox6",
		helpNum : 0,
		shown : TRUE,
		text : "Text to edit",
		multiLine : TRUE,
		container : SELF
	)
	LET Label138 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 720,
			left : 7560,
			height : 360,
			width : 540
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Label138",
		shown : TRUE,
		labelJustify : ixLabel::leftJustify,
		text : "Index",
		container : SELF
	)
	LET IndexBox = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 720,
			left : 8280,
			height : 360,
			width : 540
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "IndexBox",
		helpNum : 0,
		shown : TRUE,
		text : "0",
		multiLine : FALSE,
		container : SELF
	)
END FUNCTION -- MainWin::MainWin

