VERSION 2.00
Begin Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "dBASE Table Entry"
   ClientHeight    =   3540
   ClientLeft      =   1875
   ClientTop       =   1770
   ClientWidth     =   4680
   ForeColor       =   &H00FFFFFF&
   Height          =   4230
   Icon            =   FORM1.FRX:0000
   Left            =   1815
   LinkTopic       =   "Form1"
   ScaleHeight     =   3540
   ScaleWidth      =   4680
   Top             =   1140
   Width           =   4800
   Begin TrueGrid FieldTable 
      AllowArrows     =   -1  'True
      AllowTabs       =   -1  'True
      BackColor       =   &H00C0C0C0&
      Editable        =   -1  'True
      EditDropDown    =   -1  'True
      ExposeCellMode  =   0  'Expose upon selection
      FetchMode       =   0  'By cell
      HeadingHeight   =   1
      Height          =   2445
      HorzLines       =   2  '3D
      Layout          =   FORM1.FRX:0302
      Left            =   90
      LinesPerRow     =   1
      MarqueeUnique   =   -1  'True
      SplitPropsGlobal=   -1  'True
      SplitTabMode    =   0  'Don't tab across splits
      TabCapture      =   0   'False
      TabIndex        =   2
      Top             =   450
      UseBookmarks    =   -1  'True
      Width           =   4470
      WrapCellPointer =   -1  'True
   End
   Begin Label ColumnPrompt 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Prompt String"
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   3000
      Width           =   3855
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Enter dBASE field structure below:"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   3015
   End
   Begin Menu TG_Exit 
      Caption         =   "&Exit!"
   End
   Begin Menu TG_Help 
      Caption         =   "&Help"
      Begin Menu TG_Index 
         Caption         =   "&Index"
      End
      Begin Menu TG_UsingHelp 
         Caption         =   "&Using Help"
      End
      Begin Menu TG_SepBar 
         Caption         =   "-"
      End
      Begin Menu TG_About 
         Caption         =   "&About dBTable..."
      End
   End
End
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

Sub FieldTable_Append ()
    xFieldTable_Append
End Sub

Sub FieldTable_ColumnChange ()
    xFieldTable_ColumnChange
End Sub

Sub FieldTable_Fetch (Row As Long, Col As Integer, Value As String)
    xFieldTable_Fetch Row, Col, Value
End Sub

Sub FieldTable_KeyPress (KeyAscii As Integer)
    xFieldTable_KeyPress KeyAscii
End Sub

Sub FieldTable_Update (Row As Long, Col As Integer, Value As String)
    xFieldTable_Update Row, Col, Value
End Sub

Sub FieldTable_Validate (Row As Long, Col As Integer, Value As String, Cancel As Integer)
    xFieldTable_Validate Row, Col, Value, Cancel
End Sub

Sub Form_Load ()
    xForm1_Load
End Sub

Sub Form_Unload (Cancel As Integer)
    ' Unload Help in case it is left open
    HelpQuit Form1
End Sub

Sub TG_About_Click ()
    About.Show 1
End Sub

Sub TG_Exit_Click ()
    Unload Form1
    End
End Sub

Sub TG_Index_Click ()
    HelpContext Form1, HELP_DBTABLE
End Sub

Sub TG_UsingHelp_Click ()
    HelpOnHelp Form1
End Sub

