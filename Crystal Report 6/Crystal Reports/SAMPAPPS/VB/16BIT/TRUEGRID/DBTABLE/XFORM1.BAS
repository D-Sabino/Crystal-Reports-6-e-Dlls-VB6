' ---------------------------------------------------------
'       Copyright (C) 1993 Apex Software Corporation
'
' You have a royalty-free right to use, modify, reproduce,
' and distribute the TrueGrid sample application files
' (and/or any modified version) in any way you find useful,
' provided that you agree that Apex Software Corporation
' has no warranty, obligations, or liability for any sample
' application files.
' ---------------------------------------------------------


' dBTable is a sample program to demonstrate how to use TrueGrid in
' "Callback mode."  I.e., the DataMode property of the grid is
' set to 1 (Callback).  In this mode, the grid is not connected
' to a database file.  Instead, data in the grid will be supplied and
' maintained by the programmer while the grid takes care of user
' interactions and data display.
'
' dBTable allows user to enter a dBASE file structure in a table format.
' It is by no means a complete program.  It's sole purpose is to
' illustrate how to use TrueGrid in "Callback mode."
'
' You do not need to understand dBASE nor its file structure to follow
' this sample program.  Just assume you are creating a program to allow
' users to enter information in a table format with the following
' specifications:
'
' (1) Each row represents a field structure.
' (2) Maximum number of fields (or rows) allowed is 255.
' (3) The table has six columns (used to describe a field structure):
'       col 1: Field number (range 1 to 255)
'       col 2: Field name. 1 to 10 characters.  Allows only upper case
'              letters, digits, and "_".  First character must be an
'              upper case letter.
'       col 3: Field type. 1 character.  Allows only "C", "N", "F", "D",
'              "L", or "M" only.  (Stands for Character, Numeric, Float,
'              Date, Logical and Memo field types, respectively.)
'       col 4: Field width.  1 to 3 characters.  Contains digits only. The
'              field width for Date, Logical and Memo fields are fixed at
'              8, 1, and 10 characters, respectively.
'       col 5: Field decimal width.  1 to 2 characters. Contains digits only.
'              The field decimal width applies to Numeric and Float fields
'              only.
'       col 6: Field index flag.  "Y" if field is indexed, "N" otherwise.
'
'
' The routines in this sample program are commented in detail, so you should
' not have any problem following the code.  In this sample, you will learn:
'
' (1) Use the Form _Load event (xForm1_load) to initialize the grid and
'     internal arrays.
' (2) Use the Grid _Fetch event (xFieldTable_Fetch) to feed data to the grid.
' (3) Use the Grid _Update event (xFieldTable_Update) to get user updated
'     data from the grid.
' (4) Use the Grid _KeyPress event (xFieldTable_KeyPress) to check and
'     restrict user input.
' (5) Use the Grid _Validate event (xFieldTable_Validate) to check and
'     validate user input
' (6) Use the Grid _ColumnChange event (xFieldTable_ColumnChange) to display
'     context sensitive help for the user.
' (7) Use the Grid _Append (xFieldTable_Append) event to append additional
'     rows to the table.
'
'
' Also, the 3-D look of the grid was achieved by setting the following grid
' properties at design time:
'
' (1) HorzLines = 2-3D
' (2) HorzColor was chosen to be gray
' (3) VertLines = 2-3D
' (4) VertColor was chosen to be gray


' Array to store dBASE field structures
Dim FieldNo(1 To 255)  As String                ' Field number
Dim FieldName(1 To 255)  As String              ' Field name
Dim FieldType(1 To 255)  As String              ' Field type
Dim FieldWidth(1 To 255)  As String             ' Field width
Dim FieldDec(1 To 255)  As String               ' Field decimal
Dim FieldIndex(1 To 255)  As String             ' Field index flag

Dim NumFields As Integer                ' Number of fields defined by user
                                        ' in the field table

' Column number of field properties
Const NO_COL = 1                  ' Column number for field number
Const NAME_COL = 2                ' Column number for field name
Const TYPE_COL = 3                ' Column number for field type
Const WIDTH_COL = 4               ' Column number for field width
Const DEC_COL = 5                 ' Column number for field decimal width
Const INDEX_COL = 6               ' Column number for field index flag

' Maximum number of characters allowed for columns or field properties.
' For a given column, user can enter no more than the number of characters
' specified below.
Const NO_SZ = 3                   ' Field number
Const NAME_SZ = 10                ' Field name
Const TYPE_SZ = 1                 ' Field type
Const WIDTH_SZ = 3                ' Field width
Const DEC_SZ = 2                  ' Field decimal width
Const INDEX_SZ = 1                ' Field index flag

' Columns display widths (in characters).  Note that the display widths
' are bigger than the maximum number of characters allowed for the columns
' so that the table will look nice and will not be crowded.
Const NO_WIDTH = 4
Const NAME_WIDTH = 13
Const TYPE_WIDTH = 5
Const WIDTH_WIDTH = 6
Const DEC_WIDTH = 4
Const INDEX_WIDTH = 8

' constant ASCII values used in the program
Const A = 65
Const Z = 90
Const sA = 97
Const sZ = 122
Const A_a = 65 - 97
Const Asc0 = 48
Const Asc9 = 57
Const Asc_ = 95
Const C = 67
Const N = 78
Const F = 70
Const D = 68
Const L = 76
Const M = 77
Const Y = 89
Const BackSpace = 8

Sub ClearFieldArray ()
    Dim i As Integer

    ' Clear field table arrays.
    For i = 1 To 255
        ClearFieldRow i
    Next i

    NumFields = 0
    Form1.FieldTable.Rows = 0
End Sub

Sub ClearFieldRow (Row As Integer)
    FieldName(Row) = ""
    FieldType(Row) = ""
    FieldWidth(Row) = ""
    FieldDec(Row) = ""
    FieldIndex(Row) = ""
End Sub

Sub InitFieldTable ()
    Dim i As Integer

    ' Define Field number array
    For i = 1 To 255
        FieldNo(i) = Mid$(Str$(i), 2)
    Next i

    ' Clear field table arrays
    ClearFieldArray

    ' Define column heading text.  This can be done in code at runtime
    ' or in the Layout Editor during design time.
    Form1.FieldTable.ColumnName(NO_COL) = "No."
    Form1.FieldTable.ColumnName(NAME_COL) = "Field Name"
    Form1.FieldTable.ColumnName(TYPE_COL) = "Type"
    Form1.FieldTable.ColumnName(WIDTH_COL) = "Width"
    Form1.FieldTable.ColumnName(DEC_COL) = "Dec"
    Form1.FieldTable.ColumnName(INDEX_COL) = "Indexed"

    ' Maximum number of characters allowed for columns.  For a given
    ' column, user can enter no more than the number of characters
    ' specified below.
    Form1.FieldTable.ColumnSize(NO_COL) = NO_SZ
    Form1.FieldTable.ColumnSize(NAME_COL) = NAME_SZ
    Form1.FieldTable.ColumnSize(TYPE_COL) = TYPE_SZ
    Form1.FieldTable.ColumnSize(WIDTH_COL) = WIDTH_SZ
    Form1.FieldTable.ColumnSize(DEC_COL) = DEC_SZ
    Form1.FieldTable.ColumnSize(INDEX_COL) = INDEX_SZ

    ' Columns display widths (in characters).  Note that the display
    ' widths are bigger than ColumnSize(s) so that the table will look
    ' nice and will not be crowded.
    Form1.FieldTable.ColumnWidth(NO_COL) = NO_WIDTH
    Form1.FieldTable.ColumnWidth(NAME_COL) = NAME_WIDTH
    Form1.FieldTable.ColumnWidth(TYPE_COL) = TYPE_WIDTH
    Form1.FieldTable.ColumnWidth(WIDTH_COL) = WIDTH_WIDTH
    Form1.FieldTable.ColumnWidth(DEC_COL) = DEC_WIDTH
    Form1.FieldTable.ColumnWidth(INDEX_COL) = INDEX_WIDTH

    ' Column styles.  Specify left, center, or right justified.  Also
    ' specifies if a column is readonly (i.e., user cannot edit that
    ' column).
    Form1.FieldTable.ColumnStyle(NO_COL) = GRS_LEFT + GRS_READONLY
    Form1.FieldTable.ColumnStyle(NAME_COL) = GRS_LEFT
    Form1.FieldTable.ColumnStyle(TYPE_COL) = GRS_LEFT
    Form1.FieldTable.ColumnStyle(WIDTH_COL) = GRS_RIGHT
    Form1.FieldTable.ColumnStyle(DEC_COL) = GRS_RIGHT
    Form1.FieldTable.ColumnStyle(INDEX_COL) = GRS_LEFT

    ' Can user move and resize columns?  We set it to False, you can
    ' set it to True to experiment.
    Form1.FieldTable.Configurable = False

    ' Display column heading text?
    Form1.FieldTable.Headings = True

    ' Start with 1 rows in the table.
    Form1.FieldTable.Rows = 1

    ' Initialize current cell position.  Note that column 1 is the field
    ' number, so we start at column 2 for user to enter the field name.
    Form1.FieldTable.RowIndex = 1
    Form1.FieldTable.ColumnIndex = 2
End Sub

Function IsDigit (KeyAscii As Integer)
    If KeyAscii < Asc0 Or KeyAscii > Asc9 Then
        IsDigit = False
    Else
        IsDigit = True
    End If
End Function

Function IsDLM (FieldType As Integer) As Integer
'
' Check if FieldType character is "D (Date)", "L (Logical)" or "M (Memo)"
'
    If FieldType = D Or FieldType = L Or FieldType = M Then
        IsDLM = True
    Else
        IsDLM = False
    End If
End Function

Function IsLM (FieldType As Integer) As Integer
'
' Check if FieldType character is "L (Logical)" or "M (Memo)"
'
    If FieldType = L Or FieldType = M Then
        IsLM = True
    Else
        IsLM = False
    End If
End Function

Function IsNF (FieldType As Integer) As Integer
'
' Check if FieldType character is "N (Numeric)" or "F (Float)".
'
    If FieldType = N Or FieldType = F Then
        IsNF = True
    Else
        IsNF = False
    End If
End Function

Function IsUpperLetter (KeyAscii As Integer)
    If KeyAscii < A Or KeyAscii > Z Then
        IsUpperLetter = False
    Else
        IsUpperLetter = True
    End If
End Function

Function IsValidFieldDec (Row As Integer, Value As String) As Integer
'
' This function checks if the FieldDec value in the current cell is
' valid.
'
    Dim w As Integer
    Dim D As Integer
    Dim t As Integer

    t = Asc(FieldType(Row))

    '
    ' Need to check FieldDec only if it is a numeric field
    '
    If IsNF(t) = False Then
        IsValidFieldDec = True
        Exit Function
    End If

    '
    ' If empty, print it as 0
    '
    If Value = "" Then
        Value = "0"
        IsValidFieldDec = True
        Exit Function
    End If

    '
    ' Make sure there is enough room for decimal digits
    '
    w = Val(FieldWidth(Row))
    D = Val(Value)
    If D <> 0 And (w - D) < 2 Then
        MsgBox "(Width - Dec) must be greater than 1.", 48, "Error"
        IsValidFieldDec = False
        Exit Function
    End If

    ' Eliminate leading 0
    Value = Mid$(Str$(D), 2)

    IsValidFieldDec = True
End Function

Function IsValidFieldName (Row As Integer, Value As String) As Integer
'
' This function makes sure FieldName starts with an upper case letter
' and there is no duplicate FieldName in the table
'
    Dim i As Integer
    Dim rsh As Integer

    '
    ' Make sure FieldName is not empty
    '
    If Value = "" Then
        MsgBox "Field name not defined.", 48, "Error"
        IsValidFieldName = False
        Exit Function
    End If

    '
    ' Make sure 1 st FieldName character is an upper case letter
    '
    If IsUpperLetter(Asc(Value)) = False Then
        MsgBox "First field name character must be a letter.", 48, "Error"
        IsValidFieldName = False
        Exit Function
    End If

    '
    ' Make sure there is no duplicate FieldName in the table
    '
    For i = 1 To Form1.FieldTable.Rows
        If Row <> i And Value = FieldName(i) Then
            MsgBox "Duplicate field name: " + Value, 48, "Error"
            IsValidFieldName = False
            Exit Function
        End If
    Next i

    '
    ' Assume no other cell values (other than the current cell) has
    ' been changed changed by the programmer.
    '
    rsh = False

    '
    ' Fill in some default values
    '
    If FieldDec(Row) = "" Then
        FieldDec(Row) = "0"     ' Set FieldDec to 0
        rsh = True              ' To flag other cell value has changed
    End If

    If FieldIndex(Row) = "" Then
        FieldIndex(Row) = "N"   ' Set FieldIndex to "N"
        rsh = True              ' To flag other cell value has changed
    End If

    '
    ' To refresh row if programmer has changed values in other cells.
    ' The grid knows user has made changes in the current cell, but it
    ' cannot know that the programmer has changed values in other cells,
    ' so the programmer has to call RefreshRow to force the grid to
    ' refresh the row so that all new cell values will be displayed.
    '
    ' Note that the programmer changes cell values by updating its
    ' internal storage and then tell the grid to update the display.
    '
    If rsh Then Form1.FieldTable.RefreshRow = Row

    IsValidFieldName = True
End Function

Function IsValidFieldNameChar (KeyAscii As Integer) As Integer
'
' This function checks if KeyAscii is a valid field name character.
' A valid field name character must be either an upper case letter,
' a digit, or "_".
'
    IsValidFieldNameChar = True

    If IsUpperLetter(KeyAscii) = False Then
        If IsDigit(KeyAscii) = False Then
            If KeyAscii <> Asc_ Then
                IsValidFieldNameChar = False
            End If
        End If
    End If

End Function

Function IsValidFieldType (Row As Integer, Value As String) As Integer
'
' This function checks if the FieldType value in the current cell is
' valid.  Depending on the FieldType, it also fills in some default
' values in other cells.
'

    IsValidFieldType = False

    '
    ' Check if field is empty
    '
    If Value = "" Then
        MsgBox "Field type not defined.", 48, "Error"
        Exit Function
    End If

    '
    ' Fill in some default values
    '
    Select Case Asc(Value)
        Case C
            '
            ' A character field does not have decimal field width
            '
            FieldDec(Row) = "0"
        Case N, F
            '
            ' Default decimal field width is 0
            '
            If FieldDec(Row) = "" Then
                FieldDec(Row) = "0"
            End If
        Case D
            '
            ' A date field has a fixed length of 8
            '
            FieldWidth(Row) = "8"
            FieldDec(Row) = "0"
        Case L
            '
            ' A logical field has a fixed length of 1 and it cannot
            ' be indexed
            '
            FieldWidth(Row) = "1"
            FieldDec(Row) = "0"
            FieldIndex(Row) = "N"
        Case M
            '
            ' A memo field has a fixed length of 10 and it cannot
            ' be indexed
            '
            FieldWidth(Row) = "10"
            FieldDec(Row) = "0"
            FieldIndex(Row) = "N"
    End Select

    ' Refresh current row
    '
    ' The grid knows user has made changes in the current cell, but it
    ' cannot know that the programmer has changed values in other cells,
    ' so the programmer has to call RefreshRow to force the grid to
    ' refresh the row so that all new cell values will be displayed.
    '
    ' Note that the programmer changes cell values by updating its
    ' internal storage and then tell the grid to update the display.
    '
    Form1.FieldTable.RefreshRow = Row

    IsValidFieldType = True
End Function

Function IsValidFieldTypeChar (KeyAscii As Integer)
'
' This function checks if KeyAscii is a valid field type character.
' A valid field type character must be "C", "N", "F", "D", "L", or "M"
' only.  (Stands for Character, Numeric, Float, Date, Logical and Memo
' types, respectively.)
'
    IsValidFieldTypeChar = True

    If KeyAscii <> C And KeyAscii <> N And KeyAscii <> F Then
        If KeyAscii <> D And KeyAscii <> L And KeyAscii <> M Then
            IsValidFieldTypeChar = FLASE
        End If
    End If
End Function

Function IsValidFieldWidth (Row As Integer, Value As String) As Integer
'
' This function checks if the FieldWidth value in the current cell is
' valid.
'

    Dim w As Integer
    Dim D As Integer
    Dim t As Integer

    '
    ' Check if field is empty
    '
    If Value = "" Then
        MsgBox "Field width no defined.", 48, "Error"
        IsValidFieldWidth = False
        Exit Function
    End If

    t = Asc(FieldType(Row))
    w = Val(Value)

    Select Case t
        Case C
            '
            ' Character field must be between 1 to 254 characters
            '
            If w = 0 Or w > 254 Then
                MsgBox "Character field width must be between 1 and 254.", 48, "Error"
                IsValidFieldWidth = False
                Exit Function
            End If

        Case N, F
            '
            ' Numeric fields must be between 1 to 20 digits
            '
            If w = 0 Or w > 20 Then
                MsgBox "Numeric field width must be between 1 and 20.", 48, "Error"
                IsValidFieldWidth = False
                Exit Function
            End If

            '
            ' There must be enough room for decimal digits
            '
            D = Val(FieldDec(Row))

            If D <> 0 And (w - D) < 2 Then
                MsgBox "(Width - Dec) must be greater than 1.", 48, "Error"
                IsValidFieldWidth = False
                Exit Function
            End If

        Case Else               ' DLM
            '
            ' No checking needed fo Date, Logical and Memo fields
            '
            IsValidFieldWidth = True
            Exit Function

    End Select

    ' Eliminate leading 0
    Value = Mid$(Str$(w), 2)

    IsValidFieldWidth = True
End Function

Sub ToUpper (KeyAscii As Integer)
    If KeyAscii >= sA And KeyAscii <= sZ Then
        KeyAscii = KeyAscii + A_a
    End If
End Sub

Sub xFieldTable_Append ()
'
' The _Append event is activated when the user press the down arrow key
' at the last row of the table.  This Sub then adds a new row to the field
' table.
'
    '
    ' Do nothing if not a last row in the table
    '
    If Form1.FieldTable.RowIndex <> Form1.FieldTable.Rows Then
        Exit Sub
    End If

    '
    ' Cannot have more than 255 rows
    '
    If Form1.FieldTable.Rows = 255 Then
        Exit Sub
    End If

    '
    ' Add a new row and poistion to the FieldName column
    '
    Form1.FieldTable.Rows = Form1.FieldTable.Rows + 1
    Form1.FieldTable.RowIndex = Form1.FieldTable.Rows
    Form1.FieldTable.ColumnIndex = 2
End Sub

Sub xFieldTable_ColumnChange ()
'
' This Sub displays a different help string when the user is at different
' table column.  This is to make the program user friendly by assisting
' the user during the data entry process.
'
    Dim t As String

    '
    ' If at table heading, prompt should be empty
    '
    If Form1.FieldTable.RowIndex = 0 Then
        Form1.ColumnPrompt.Caption = ""
        Exit Sub
    End If

    t = FieldType(Form1.FieldTable.RowIndex)

    Select Case Form1.FieldTable.ColumnIndex
        Case NAME_COL           ' FieldName column
            Form1.ColumnPrompt.Caption = "Enter field name"

        Case TYPE_COL           ' FieldType column
            Form1.ColumnPrompt.Caption = "C=Character, N=Numeric, F=Float" + Chr$(13) + "D=Date, L=Logical, M=Memo"

        Case WIDTH_COL          ' FieldWidth column
            If t = "D" Or t = "L" Or t = "M" Then
                Form1.ColumnPrompt.Caption = "Cannot Change Field Width"
            Else
                Form1.ColumnPrompt.Caption = "Enter Field Width"
            End If

        Case DEC_COL            ' FieldDec column
            If t = "C" Or t = "D" Or t = "L" Or t = "M" Then
                Form1.ColumnPrompt.Caption = "Cannot Change Decimal Width"
            Else
                Form1.ColumnPrompt.Caption = "Enter Field Decimal Width"
            End If

        Case INDEX_COL          ' FieldIndex column
            If t = "L" Or t = "M" Then
                Form1.ColumnPrompt.Caption = "Cannot be indexed"
            Else
                Form1.ColumnPrompt.Caption = "Y=Indexed, N=Not Indexed"
            End If
    End Select
End Sub

Sub xFieldTable_Fetch (Row As Long, Col As Integer, Value As String)
'
' Whenever the grid needs to display data, it will ask the programmer
' for the appropriate data to display via the _Fetch event.  The
' programmer cannot make any assumption as to when the grid will ask
' for data.  Also, the programmer cannot make the assumption that if
' data for a certain row/col is asked once, the grid will not ask for
' it again.  In short, it's the programmer's responsibility to store
' and maintain the data, and it's the grid's responsibility to display
' them properly.
' This technique will free the programmer from worrying when and how to
' display data in the grid. For example, if the user drags a window to
' (partially) covers the gird and later remove the window, the grid will
' be responsible to know about it and refresh the data in the grid.  The
' programmer needs only to maintain the data.  (In this case, data is
' stored in 6 arrays, one array per column.)
'
    Select Case Col
        Case NO_COL
            Value = FieldNo(Row)
        Case NAME_COL
            Value = FieldName(Row)
        Case TYPE_COL
            Value = FieldType(Row)
        Case WIDTH_COL
            Value = FieldWidth(Row)
        Case DEC_COL
            Value = FieldDec(Row)
        Case INDEX_COL
            Value = FieldIndex(Row)
    End Select
End Sub

Sub xFieldTable_KeyPress (KeyAscii As Integer)
'
' This routine illustrates a few techniques to check, modify, and retrict
' user input.  The goal is to assist user to enter valid values thus making
' the program more user friendly.
'
    Dim isbs As Integer

    ' Convert all key to upper case.
    ToUpper KeyAscii

    r = Form1.FieldTable.RowIndex

    '
    ' No checking needed if at table heading
    '
    If r = 0 Then
        Exit Sub
    End If

    ' Check if key is BackSpace
    If KeyAscii = BackSpace Then
        isbs = True
    Else
        isbs = False
    End If

    Select Case Form1.FieldTable.ColumnIndex
        Case NAME_COL           ' FieldName column
            '
            ' Do not allow user input if it is not BackSpace or a valid
            ' field name character
            '
            If isbs = False And IsValidFieldNameChar(KeyAscii) = False Then
                KeyAscii = 0    ' Cancel user input
                Exit Sub
            End If

        Case TYPE_COL           ' FieldType column
            If FieldName(r) = "" Then
                '
                ' Do not allow user input if field name is not yet defined
                '
                KeyAscii = 0
                Exit Sub
            ElseIf isbs = False And IsValidFieldTypeChar(KeyAscii) = False Then
                '
                ' Do not allow user input if it is not BackSpace or a valid
                ' field type
                '
                KeyAscii = 0
                Exit Sub
            End If

        Case WIDTH_COL          ' FieldWidth column
            If FieldType(r) = "" Then
                '
                ' Do not allow user input if field type is not yet defined
                '
                KeyAscii = 0
                Exit Sub
            ElseIf IsDLM(Asc(FieldType(r))) = True Then
                '
                ' No input allowed if FieldType is "D (Date)", "L (Logical)"
                ' or "M (Memo)".  FieldWidth for this fields are fixed and
                ' are defined in the _Validate event.
                '
                KeyAscii = 0
                Exit Sub
            ElseIf isbs = False And IsDigit(KeyAscii) = False Then
                '
                ' Only BackSpace and digits are allowed.
                '
                KeyAscii = 0
                Exit Sub
            End If

        Case DEC_COL            ' FieldDec column
            If FieldWidth(r) = "" Then
                '
                ' Do not allow user input if field width is not yet defined
                '
                KeyAscii = 0
                Exit Sub
            ElseIf IsNF(Asc(FieldType(r))) = False Then
                '
                ' No input allowed if field type is not "N (Numeric)" or
                ' "F (Float)"  (Only numeric fields can have a non-zero
                ' field decimal value.)
                '
                KeyAscii = 0
                Exit Sub
            ElseIf isbs = False And IsDigit(KeyAscii) = False Then
                '
                ' Only BackSpace and digits are allowed.
                '
                KeyAscii = 0
                Exit Sub
            End If

        Case INDEX_COL          ' FieldIndex column
            If FieldWidth(r) = "" Then
                '
                ' Do not allow user input if field width is not yet defined
                '
                KeyAscii = 0
                Exit Sub
            ElseIf IsLM(Asc(FieldType(r))) = True Then
                '
                ' No input allowed if field type is not "L (Logical)" or
                ' "M (Memo)"  (Index is not allowed for Logical and Memo
                ' fields.
                '
                KeyAscii = 0
                Exit Sub
            ElseIf isbs = False And KeyAscii <> N And KeyAscii <> Y Then
                '
                ' Only BackSpace, "N (No)" or "Y (Yes)" are allowed.
                KeyAscii = 0
                Exit Sub
            End If

    End Select

End Sub

Sub xFieldTable_Update (Row As Long, Col As Integer, Value As String)
'
' After the user has finished editing data in a cell and the data has
' been validated by the programmer via the _Validate event, the grid
' will then notify the programmer the cell now has a new value via
' this _Update event.  In this event, the programmer uses the value
' supplied by the grid to update the data he/she is reponsible for
' storing and maintaining.  In this case, the field table arrays are
' updated by the new value supplied by the gird.  Note that we don't
' need to update the FieldNo array because the FieldNo column is
' readonly.
'
    Select Case Col
        Case NAME_COL
            FieldName(Row) = Value
        Case TYPE_COL
            FieldType(Row) = Value
        Case WIDTH_COL
            FieldWidth(Row) = Value
        Case DEC_COL
            FieldDec(Row) = Value
        Case INDEX_COL
            FieldIndex(Row) = Value
    End Select
End Sub

Sub xFieldTable_Validate (Row As Long, Col As Integer, Value As String, Cancel As Integer)
'
' Before moving to another grid cell, this routine let the programmer
' examine the value in the current cell.  If the value entered is invalid,
' programmer can display a message, then set Cancel to True to prohibit
' the user moving on to another cell.  The _Validate and _KeyPress events
' together provide a very easy way for programmers to check, restrict and
' validate user inputs in TrueGrid.
'
    Dim r As Integer

    '
    ' If empty row, no validation needed
    '
    If Value = "" And FieldName(Row) = "" Then
        Exit Sub
    End If

    r = CInt(Row)
    
    Select Case Col
        Case NAME_COL          ' FieldName
            '
            ' Check if FieldName is valid
            '
            If IsValidFieldName(r, Value) = False Then
                Cancel = True
            End If

        Case TYPE_COL          ' FieldType
            '
            ' Check if FieldType is valid
            '
            If IsValidFieldType(r, Value) = False Then
                Cancel = True
            End If

        Case WIDTH_COL          ' FieldWidth
            '
            ' Check if FieldWidth is valid
            '
            If IsValidFieldWidth(r, Value) = False Then
                Cancel = True
            End If

        Case DEC_COL          ' FieldDec
            '
            ' Check if FieldDec is valid
            '
            If IsValidFieldDec(r, Value) = False Then
                Cancel = True
            End If

        Case INDEX_COL          ' FieldIndex
            '
            ' If field is empty, default it to "N"
            '
            If Value = "" Then
                Value = "N"
            End If
    End Select
End Sub

Sub xForm1_Load ()
'
' During Form_Load, the ColumnPrompt (Label) Caption, the field
' structure array and the table properties are initialized.
'
    Form1.ColumnPrompt.Caption = ""
    InitFieldTable
End Sub

