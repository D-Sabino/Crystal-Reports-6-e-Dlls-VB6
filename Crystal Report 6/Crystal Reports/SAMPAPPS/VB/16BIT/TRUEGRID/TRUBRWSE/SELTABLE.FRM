VERSION 2.00
Begin Form PickTable 
   BackColor       =   &H00808080&
   Caption         =   "Table List"
   ClientHeight    =   3090
   ClientLeft      =   1980
   ClientTop       =   1830
   ClientWidth     =   4080
   Height          =   3495
   Left            =   1920
   LinkTopic       =   "Form2"
   ScaleHeight     =   3090
   ScaleWidth      =   4080
   Top             =   1485
   Width           =   4200
   Begin TrueGrid Table1 
      AllowArrows     =   -1  'True
      AllowTabs       =   -1  'True
      BackColor       =   &H00C0C0C0&
      Editable        =   0   'False
      EditDropDown    =   -1  'True
      FetchMode       =   0  'By cell
      ForeColor       =   &H00000000&
      HeadingHeight   =   1
      Height          =   1755
      HorzLines       =   0  'None
      Layout          =   SELTABLE.FRX:0000
      Left            =   420
      LinesPerRow     =   1
      MarqueeUnique   =   -1  'True
      SplitPropsGlobal=   -1  'True
      SplitTabMode    =   0  'Don't tab across splits
      TabCapture      =   0   'False
      TabIndex        =   2
      Top             =   240
      UseBookmarks    =   -1  'True
      Width           =   2955
      WrapCellPointer =   0   'False
   End
   Begin CommandButton Cancel 
      Caption         =   "&Cancel"
      Height          =   540
      Left            =   2025
      TabIndex        =   1
      Top             =   2175
      Width           =   990
   End
   Begin CommandButton OK 
      Caption         =   "&Ok"
      Default         =   -1  'True
      Height          =   540
      Left            =   750
      TabIndex        =   0
      Top             =   2175
      Width           =   990
   End
End

Sub Cancel_Click ()

    'User has cancelled choice so the selCancel flag is set and the form unloaded
    Screen.MousePointer = HOURGLASS
    selCancel = True
    Unload PickTable

End Sub

Sub Form_Load ()

    'Center the Form on the Screen
    CenterForm PickTable

End Sub

Sub OK_Click ()

    'If user clicks OK then selTable contains the value the user has chosen
    Screen.MousePointer = HOURGLASS
    selTable = Table1.Text
    Unload PickTable

End Sub

Sub Table1_DblClick ()

    'Simulate the click of the OK button
    OK_Click

End Sub

Sub Table1_Fetch (Row As Long, Col As Integer, Value As String)

    'Displays the values listed in the selList array. If the array
    'was 2-demensional then you could also use the Col value to get
    'the current Column you were in.  This is and the Update events
    'are the 2 main sections if you are planning to use the grid in
    'callback mode
    Value = selList(Row)

End Sub

