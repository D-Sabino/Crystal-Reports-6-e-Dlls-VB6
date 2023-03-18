INCLUDE "popup1.4gh"

FORWARD PopupWin

HANDLER PopupWin::PopupWin_start() RETURNING VOID

CALL newText_tb.setText( thisText1.getValueStr() )
END HANDLER -- PopupWin::PopupWin_start

HANDLER ixButton::PopupWin_Button24_activate() RETURNING VOID
VARIABLE thisWin PopupWin,
       err BOOLEAN

LET thisWin = getWindow() CAST PopupWin
DISPLAY thisWin.thisText1.getValueStr()

LET thisWin.thisText1 = NEW ixString( thisWin.newtext_tb.getText() clipped )
CALL thisWin.close() RETURNING err

END HANDLER -- ixButton::PopupWin_Button24_activate

HANDLER ixButton::PopupWin_Button66_activate() RETURNING VOID
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    CALL superTable.setDisplayMode (ixSuperTable::displayQuery)
END HANDLER -- ixButton::PopupWin_Button66_activate

HANDLER ixButton::PopupWin_Button67_activate() RETURNING VOID
    VARIABLE ok BOOLEAN
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    LET ok = superTable.retrieve( QBE: TRUE )
END HANDLER -- ixButton::PopupWin_Button67_activate

HANDLER ixButton::PopupWin_Button68_activate() RETURNING VOID
    VARIABLE ok BOOLEAN
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    LET ok = superTable.pageDown()
END HANDLER -- ixButton::PopupWin_Button68_activate

HANDLER ixButton::PopupWin_Button69_activate() RETURNING VOID
    VARIABLE ok BOOLEAN
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    LET ok = superTable.pageUp()
END HANDLER -- ixButton::PopupWin_Button69_activate

HANDLER ixButton::PopupWin_Button70_activate() RETURNING VOID
    VARIABLE rowNum INTEGER
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    LET rownum = superTable.insert()
END HANDLER -- ixButton::PopupWin_Button70_activate

HANDLER ixButton::PopupWin_Button71_activate() RETURNING VOID
    VARIABLE ok BOOLEAN
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    IF superTable.acceptRow() THEN
        LET ok = superTable.applyRowSQL(superTable.getRowByNumber(displayMode : 
ixSuperTable::displayData))
    END IF
END HANDLER -- ixButton::PopupWin_Button71_activate

HANDLER ixButton::PopupWin_Button72_activate() RETURNING VOID
    VARIABLE deletedRow ixRow
    VARIABLE superTable ixSuperTable
    LET superTable = (getVisualContainer() CAST ixSuperTable)
    #just use default rowNum = currentRow
    #need not do anything w/ deletedRow
    LET deletedRow = superTable.delete()
END HANDLER -- ixButton::PopupWin_Button72_activate

FUNCTION PopupWin::PopupWin( 
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
		PopupWin::PopupWin_start
	LET Button24 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 4365,
			left : 135,
			height : 420,
			width : 1350
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
		title : "Close",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button24",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	HANDLE Button24.activate WITH
		ixButton::PopupWin_Button24_activate
	LET newtext_tb = NEW ixTextBox( 
		geometry : NEW ixGeometry( 
			top : 270,
			left : 495,
			height : 345,
			width : 2940
		),
		appearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : 16777215
		),
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		maxChars : 255,
		name : "newtext_tb",
		helpNum : 0,
		shown : TRUE,
		text : NULL,
		multiLine : FALSE,
		container : SELF
	)
	LET SuperTable44 = NEW ixSuperTable( 
		geometry : NEW ixGeometry( 
			top : 945,
			left : 180,
			height : 3240,
			width : 7650
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
		updateTable : "items",
		numDisplayedRows : 1,
		maxRows : NULL,
		selectUnique : FALSE,
		numDisplayedCols : 7,
		enabled : TRUE,
		selectFromPart : "items",
		selectJoinPart : NULL,
		selectOrderbyPart : NULL,
		borderWidth : 20,
		name : "SuperTable44",
		helpNum : 0,
		shown : TRUE,
		layout : ixSuperTable::freeForm,
		displayMode : ixSuperTable::displayData,
		selectFilterPart : NULL,
		dbConnection : NULL,
		lockMode : ixSuperTable::noLock,
		container : SELF
	)
	LET includeTable = NEW ixRow()
	LET SuperField4546 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 160,
			left : 2048,
			height : 440,
			width : 1240
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
		titleGeometry : NEW ixGeometry( 
			top : 160,
			left : 520,
			height : 440,
			width : 1208
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 1,
			encLength : 2,
			nullable : FALSE,
			tableName : "items",
			columnName : "item_num"
		),
		maxDataChars : 6,
		title : "item_num",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField4546",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : TRUE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 1,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField4546.setFormat(NULL)
	CALL SuperField4546.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField4546.setShiftPolicy(ixSuperField::noShift)
	LET SuperField4546.required = FALSE
	LET SuperField4546.verify = FALSE
	LET SuperField4546.includeTable = includeTable
	LET SuperField4546.useIncludes = FALSE
	LET SuperField4546.autoNextOn = FALSE
	LET SuperField4546.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField4849 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 760,
			left : 2048,
			height : 440,
			width : 2140
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
		titleGeometry : NEW ixGeometry( 
			top : 760,
			left : 160,
			height : 440,
			width : 1568
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 8,
			encLength : 2050,
			nullable : TRUE,
			tableName : "items",
			columnName : "item_subtotal"
		),
		maxDataChars : 11,
		title : "item_subtotal",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField4849",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : FALSE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 2,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField4849.setFormat(NULL)
	CALL SuperField4849.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField4849.setShiftPolicy(ixSuperField::noShift)
	LET SuperField4849.required = FALSE
	LET SuperField4849.verify = FALSE
	LET SuperField4849.includeTable = includeTable
	LET SuperField4849.useIncludes = FALSE
	LET SuperField4849.autoNextOn = FALSE
	LET SuperField4849.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField5152 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 1360,
			left : 2048,
			height : 440,
			width : 700
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
		titleGeometry : NEW ixGeometry( 
			top : 1360,
			left : 355,
			height : 440,
			width : 1373
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 0,
			encLength : 3,
			nullable : TRUE,
			tableName : "items",
			columnName : "manu_code"
		),
		maxDataChars : 3,
		title : "manu_code",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField5152",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : FALSE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 3,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField5152.setFormat(NULL)
	CALL SuperField5152.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField5152.setShiftPolicy(ixSuperField::noShift)
	LET SuperField5152.required = FALSE
	LET SuperField5152.verify = FALSE
	LET SuperField5152.includeTable = includeTable
	LET SuperField5152.useIncludes = FALSE
	LET SuperField5152.autoNextOn = FALSE
	LET SuperField5152.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField5455 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 100,
			left : 5153,
			height : 440,
			width : 2140
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
		titleGeometry : NEW ixGeometry( 
			top : 85,
			left : 3715,
			height : 440,
			width : 1298
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 2,
			encLength : 4,
			nullable : FALSE,
			tableName : "items",
			columnName : "order_num"
		),
		maxDataChars : 11,
		title : "order_num",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField5455",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : TRUE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 4,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField5455.setFormat(NULL)
	CALL SuperField5455.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField5455.setShiftPolicy(ixSuperField::noShift)
	LET SuperField5455.required = FALSE
	LET SuperField5455.verify = FALSE
	LET SuperField5455.includeTable = includeTable
	LET SuperField5455.useIncludes = FALSE
	LET SuperField5455.autoNextOn = FALSE
	LET SuperField5455.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField5758 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 2005,
			left : 2048,
			height : 440,
			width : 1240
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
		titleGeometry : NEW ixGeometry( 
			top : 1915,
			left : 625,
			height : 440,
			width : 1028
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 1,
			encLength : 2,
			nullable : TRUE,
			tableName : "items",
			columnName : "quantity"
		),
		maxDataChars : 6,
		title : "quantity",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField5758",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : FALSE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 5,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField5758.setFormat(NULL)
	CALL SuperField5758.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField5758.setShiftPolicy(ixSuperField::noShift)
	LET SuperField5758.required = FALSE
	LET SuperField5758.verify = FALSE
	LET SuperField5758.includeTable = includeTable
	LET SuperField5758.useIncludes = FALSE
	LET SuperField5758.autoNextOn = FALSE
	LET SuperField5758.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField6061 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 610,
			left : 5888,
			height : 440,
			width : 1240
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
		titleGeometry : NEW ixGeometry( 
			top : 595,
			left : 4540,
			height : 440,
			width : 1298
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 1,
			encLength : 2,
			nullable : FALSE,
			tableName : "items",
			columnName : "stock_num"
		),
		maxDataChars : 6,
		title : "stock_num",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField6061",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : FALSE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 6,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField6061.setFormat(NULL)
	CALL SuperField6061.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField6061.setShiftPolicy(ixSuperField::noShift)
	LET SuperField6061.required = FALSE
	LET SuperField6061.verify = FALSE
	LET SuperField6061.includeTable = includeTable
	LET SuperField6061.useIncludes = FALSE
	LET SuperField6061.autoNextOn = FALSE
	LET SuperField6061.blobEditor = NULL
	LET includeTable = NEW ixRow()
	LET SuperField6364 = NEW ixSuperField( 
		geometry : NEW ixGeometry( 
			top : 1945,
			left : 4493,
			height : 440,
			width : 880
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
		titleGeometry : NEW ixGeometry( 
			top : 1870,
			left : 3580,
			height : 440,
			width : 608
		),
		titleAppearance : NEW ixAppearance( 
			fontName : NULL,
			fontSize : NULL,
			fontBold : NULL,
			fontItalic : NULL,
			fontUnderline : NULL,
			foreColor : NULL,
			backColor : NULL
		),
		colInfo : NEW ixColumn( 
			type : 0,
			encLength : 4,
			nullable : TRUE,
			tableName : "items",
			columnName : "unit"
		),
		maxDataChars : 4,
		title : "unit",
		tabIndex : NULL,
		tabEnabled : TRUE,
		name : "SuperField6364",
		helpNum : 0,
		shown : TRUE,
		initialQueryValue : NULL,
		initialDataValue : NULL,
		dataState : ixSuperField::enabledState,
		titleJustify : ixSuperField::rightJustify,
		primaryKey : FALSE,
		SQLRole : ixSuperField::updateRole,
		queryState : ixSuperField::enabledState,
		multiLine : FALSE,
		colNum : 7,
		pictureString : NULL,
		superTable : SuperTable44
	)
	CALL SuperField6364.setFormat(NULL)
	CALL SuperField6364.setDataJustify(ixSuperField::leftJustify)
	CALL SuperField6364.setShiftPolicy(ixSuperField::noShift)
	LET SuperField6364.required = FALSE
	LET SuperField6364.verify = FALSE
	LET SuperField6364.includeTable = includeTable
	LET SuperField6364.useIncludes = FALSE
	LET SuperField6364.autoNextOn = FALSE
	LET SuperField6364.blobEditor = NULL
	LET Button66 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2690,
			left : 280,
			height : 480,
			width : 905
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
		title : "Query",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button66",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button66.activate WITH
		ixButton::PopupWin_Button66_activate
	LET Button67 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2675,
			left : 1255,
			height : 480,
			width : 1145
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
		title : "Retrieve",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button67",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button67.activate WITH
		ixButton::PopupWin_Button67_activate
	LET Button68 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2645,
			left : 2530,
			height : 480,
			width : 1325
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
		title : "Next Page",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button68",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button68.activate WITH
		ixButton::PopupWin_Button68_activate
	LET Button69 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2660,
			left : 4015,
			height : 480,
			width : 1745
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
		title : "Previous Page",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button69",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button69.activate WITH
		ixButton::PopupWin_Button69_activate
	LET Button70 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2135,
			left : 5920,
			height : 480,
			width : 1355
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
		title : "Insert Row",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button70",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button70.activate WITH
		ixButton::PopupWin_Button70_activate
	LET Button71 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 1520,
			left : 6060,
			height : 480,
			width : 1340
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
		title : "Apply Row",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button71",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button71.activate WITH
		ixButton::PopupWin_Button71_activate
	LET Button72 = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 2660,
			left : 6090,
			height : 480,
			width : 1430
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
		title : "Delete Row",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "Button72",
		helpNum : 0,
		shown : TRUE,
		container : SuperTable44
	)
	HANDLE Button72.activate WITH
		ixButton::PopupWin_Button72_activate
END FUNCTION -- PopupWin::PopupWin

