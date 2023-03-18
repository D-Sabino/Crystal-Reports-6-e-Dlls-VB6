INCLUDE "main.4gh"

FORWARD MainWin

INCLUDE SYSTEM "ixconn.4gh"

GLOBAL VARIABLE Window1 MainWin
INCLUDE "popup1.4gh"
VARIABLE myJob CRPEJob

MAIN
	CALL ixSQLConnect::getImplicitConnection().connect("SPORTS")
	LET Window1 = NEW MainWin()
	CALL Window1.open()
	RETURN
END MAIN

HANDLER MainWin::Window1_start() RETURNING VOID

LET myEngine = new CRPEngine( TRUE )
END HANDLER -- MainWin::Window1_start

HANDLER ixMenu::Window1_exit_menu_activate() RETURNING VOID
EXIT PROGRAM
END HANDLER -- ixMenu::Window1_exit_menu_activate

HANDLER ixButton::Window1_open_btn_activate() RETURNING VOID
VARIABLE newWin PopupWin,
     thisWin MainWin

LET thisWin = getWindow() CAST MainWin
-- LET thisWin = self.getWindow()

LET newWin = NEW PopupWin( containingWindow :  thisWin  )
LET newWin.thisText1 = thisWin.myText1
CALL newWin.open()
LET thisWin.myText1 = newWin.thisText1
DISPLAY "We're back !! myText1 = ", thisWin.myText1.getValueStr()
END HANDLER -- ixButton::Window1_open_btn_activate

HANDLER ixTextBox::Window1_datafield_tb_valueChanged() RETURNING VOID
VARIABLE thisWin MainWin

LET thisWin = getWindow() CAST MainWin
LET thisWin.myText1 = new ixString( self.getText() ) 
DISPLAY thisWin.myText1.getValueStr()
END HANDLER -- ixTextBox::Window1_datafield_tb_valueChanged

HANDLER ixButton::Window1_Button95_activate() RETURNING VOID

BEGIN_C

MessageBox( NULL, "hello world", "debug", MB_OK );


END_C
END HANDLER -- ixButton::Window1_Button95_activate

HANDLER ixButton::Window1_Button295_activate() RETURNING VOID
VARIABLE 
      thisWin MainWin,
      ret BOOLEAN

LET thisWin = getWindow() CAST MainWin

LET myJob =  thisWin.myEngine.openJob("report1.rpt")
IF ( myJob IS NULL ) THEN
      DISPLAY "myJob is null"
ELSE
LET ret = myJob.OutputToWindow( "Test Title", 10, 20, 300, 300, 0, NULL )
DISPLAY "ret = ", ret

CALL myJob.StartJob() RETURNING ret
DISPLAY "ret = ", ret
END IF

END HANDLER -- ixButton::Window1_Button295_activate

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
		MainWin::Window1_start
	LET Menu10 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu10",
		helpNum : 0,
		title : "File",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : SELF.getMenuBar()
	)
	LET Menu12 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu12",
		helpNum : 0,
		title : "Open",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu10
	)
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
		title : "Save",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu10
	)
	LET Menu14 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu14",
		helpNum : 0,
		title : "Save As",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu10
	)
	LET Menu15 = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "Menu15",
		helpNum : 0,
		title : "-",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : NULL,
		parentMenu : Menu10
	)
	LET exit_menu = NEW ixMenu( 
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		name : "exit_menu",
		helpNum : 0,
		title : "Exit\tAlt+F4",
		enabled : TRUE,
		checkState : ixMenu::notACheck,
		accelerator : fgl_keyval("Alt+F4"),
		parentMenu : Menu10
	)
	HANDLE exit_menu.activate WITH
		ixMenu::Window1_exit_menu_activate
	LET open_btn = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 3435,
			left : 510,
			height : 750,
			width : 2010
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
		title : "Open",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "open_btn",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	HANDLE open_btn.activate WITH
		ixButton::Window1_open_btn_activate
	LET Label2 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 120,
			left : 3255,
			height : 270,
			width : 1290
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
		text : "Data Field1",
		container : SELF
	)
	LET datafield_tb = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 120,
			left : 4530,
			height : 315,
			width : 2940
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
		maxChars : 32,
		name : "datafield_tb",
		helpNum : 0,
		shown : TRUE,
		text : NULL,
		multiLine : FALSE,
		container : SELF
	)
	HANDLE datafield_tb.valueChanged WITH
		ixTextBox::Window1_datafield_tb_valueChanged
	LET itemList = NEW ixVector()
	LET result = itemList.insert(NEW ixString("Value1"))
	LET result = itemList.insert(NEW ixString("Value2"))
	LET result = itemList.insert(NEW ixString("Value3"))
	LET ListBox5 = NEW ixListBox( 
		geometry : NEW ixGeometry( 
			top : 690,
			left : 3165,
			height : 1665,
			width : 3660
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : 0,
			backColor : NULL
		),
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		style : ixListBox::singleSelect,
		name : "ListBox5",
		helpNum : 0,
		itemList : itemList,
		shown : TRUE,
		sorted : TRUE,
		container : SELF
	)
	LET Frame6 = NEW ixFrame( 
		geometry : NEW ixGeometry( 
			top : 45,
			left : 165,
			height : 1785,
			width : 2430
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
		helpFile : NULL,
		borderWidth : 20,
		name : "Frame6",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	LET CheckBox4 = NEW ixCheckBox( 
		geometry : NEW ixGeometry( 
			top : 90,
			left : 210,
			height : 495,
			width : 1335
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
		title : "Option 1",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "CheckBox4",
		helpNum : 0,
		shown : TRUE,
		checked : FALSE,
		container : Frame6
	)
	LET RadioButton8 = NEW ixRadioButton( 
		geometry : NEW ixGeometry( 
			top : 600,
			left : 210,
			height : 555,
			width : 1230
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
		title : "Radio 1",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "RadioButton8",
		helpNum : 0,
		shown : TRUE,
		container : Frame6
	)
	LET RadioButton9 = NEW ixRadioButton( 
		geometry : NEW ixGeometry( 
			top : 1170,
			left : 210,
			height : 435,
			width : 1890
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
		title : "Radio 2",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "RadioButton9",
		helpNum : 0,
		shown : TRUE,
		container : Frame6
	)
	LET Button95 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 3495,
			left : 2700,
			height : 705,
			width : 2160
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
		title : "SDK Message",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button95",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	HANDLE Button95.activate WITH
		ixButton::Window1_Button95_activate
	LET Button96 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2475,
			left : 870,
			height : 465,
			width : 1785
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
		title : "Button",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button96",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	LET Button295 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 3405,
			left : 5385,
			height : 795,
			width : 2235
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
		title : "Button",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button295",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	HANDLE Button295.activate WITH
		ixButton::Window1_Button295_activate
END FUNCTION -- MainWin::MainWin

