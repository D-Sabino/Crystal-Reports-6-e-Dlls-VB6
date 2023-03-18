INCLUDE "about.4gh"

FORWARD AboutWin

HANDLER ixButton::AboutWin_CloseButton_activate() RETURNING VOID
VARIABLE thisBox AboutWin

LET thisBox = getWindow() CAST AboutWin
IF (thisBox.close() ) THEN
END IF
END HANDLER -- ixButton::AboutWin_CloseButton_activate

FUNCTION AboutWin::AboutWin( 
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

	LET Label1 = NEW ixLabel( 
		geometry : NEW ixGeometry( 
			top : 300,
			left : 300,
			height : 1350,
			width : 4080
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
		text : "Crystal Reports NewEra Class Library\n Written By K.C. \n July 1996",
		container : SELF
	)
	LET CloseButton = NEW ixButton( 
		geometry : NEW ixGeometry( 
			top : 1890,
			left : 1560,
			height : 495,
			width : 1260
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
		title : "&Close",
		enabled : TRUE,
		tabIndex : NULL,
		tabEnabled : TRUE,
		theDefault : FALSE,
		name : "CloseButton",
		helpNum : 0,
		shown : TRUE,
		container : SELF
	)
	HANDLE CloseButton.activate WITH
		ixButton::AboutWin_CloseButton_activate
END FUNCTION -- AboutWin::AboutWin

