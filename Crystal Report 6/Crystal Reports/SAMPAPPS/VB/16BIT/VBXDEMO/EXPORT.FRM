VERSION 2.00
Begin Form Export 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Export"
   ClientHeight    =   2400
   ClientLeft      =   1260
   ClientTop       =   1455
   ClientWidth     =   7140
   Height          =   2805
   Left            =   1200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   7140
   Top             =   1110
   Width           =   7260
   Begin CommandButton ExportHelp 
      Caption         =   "Help"
      Height          =   375
      Left            =   4440
      TabIndex        =   5
      Top             =   1800
      Width           =   1605
   End
   Begin CommandButton ExportCancel 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2730
      TabIndex        =   4
      Top             =   1800
      Width           =   1605
   End
   Begin CommandButton ExportOk 
      Caption         =   "Ok"
      Height          =   375
      Left            =   1020
      TabIndex        =   3
      Top             =   1800
      Width           =   1605
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      Height          =   1320
      Left            =   180
      TabIndex        =   0
      Top             =   225
      Width           =   6705
      Begin TextBox DestText 
         Height          =   295
         Left            =   3510
         TabIndex        =   2
         Text            =   "Disk File"
         Top             =   675
         Width           =   2625
      End
      Begin TextBox FormatText 
         Height          =   295
         Left            =   300
         TabIndex        =   1
         Text            =   "Character-separated values"
         Top             =   675
         Width           =   2715
      End
      Begin ComboBox DestCombo 
         Height          =   300
         Left            =   3630
         Style           =   2  'Dropdown List
         TabIndex        =   7
         Top             =   675
         Width           =   2745
      End
      Begin ComboBox FormatCombo 
         Height          =   300
         Left            =   360
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   675
         Width           =   2895
      End
      Begin Label Label2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Destination:"
         Height          =   240
         Left            =   3540
         TabIndex        =   9
         Top             =   315
         Width           =   1185
      End
      Begin Label Label1 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Format:"
         Height          =   240
         Left            =   300
         TabIndex        =   8
         Top             =   360
         Width           =   1095
      End
   End
End
Sub Combo1_Click ()
 
End Sub

Sub DestCombo_Click ()
   DestText.Text = DestCombo.Text
End Sub

Sub ExportCancel_Click ()
 Unload Me
End Sub

Sub ExportOk_Click ()

CancelCheck = 0

If DestText.Text = "Disk File" Then
   
   If FormatText.Text = "Character-separated values" Then
     
     CharSep.Show 1
     NDFormatform.Show 1
     If CancelCheck <> 1 Then
       On Error GoTo ErrorHandlerc
       Main.CMDialog1.CancelError = True
       Main.CMDialog1.Flags = OFN_HIDEREADONLY
       Main.CMDialog1.DialogTitle = "Choose Export File"
       Main.CMDialog1.Filter = "Character-seperated(*.chr)"
       Main.CMDialog1.Filename = "*.chr"
       Main.CMDialog1.Action = 1
       Main.Report1.PrintFileName = Main.CMDialog1.Filename
       Main.Report1.PrintFileType = 5
     Else
       Exit Sub
     End If
   Else
     If FormatText.Text = "Comma-separated values(CSV)" Then
        
        NDFormatform.Show 1
        
         If CancelCheck <> 1 Then
           On Error GoTo ErrorHandlerc
           Main.CMDialog1.CancelError = True
           Main.CMDialog1.Flags = OFN_HIDEREADONLY
           Main.CMDialog1.DialogTitle = "Choose Export File"
           Main.CMDialog1.Filter = "Comma-seperated(*.csv)"
           Main.CMDialog1.Filename = "*.csv"
           Main.CMDialog1.Action = 1
           Main.Report1.PrintFileName = Main.CMDialog1.Filename
           Main.Report1.PrintFileType = 4
         Else
          Exit Sub
         End If
     Else
       If FormatText.Text = "Crystal Reports(RPT)" Then
         
          If CancelCheck <> 1 Then
            On Error GoTo ErrorHandlerc
            Main.CMDialog1.CancelError = True
            Main.CMDialog1.Flags = OFN_HIDEREADONLY
            Main.CMDialog1.DialogTitle = "Choose Export File"
            Main.CMDialog1.Filter = "Crystal Report(*.rpt)"
            Main.CMDialog1.Filename = "*.rpt"
            Main.CMDialog1.Action = 1
            Main.Report1.PrintFileName = Main.CMDialog1.Filename
            Main.Report1.PrintFileType = 7
          Else
           Exit Sub
          End If
       Else
        If FormatText.Text = "Excel 4.0(XLS)" Then
         
          If CancelCheck <> 1 Then
            On Error GoTo ErrorHandlerc
            Main.CMDialog1.CancelError = True
            Main.CMDialog1.Flags = OFN_HIDEREADONLY
            Main.CMDialog1.DialogTitle = "Choose Export File"
            Main.CMDialog1.Filter = "Excel 4.0 (*.xls)"
            Main.CMDialog1.Filename = "*.xls"
            Main.CMDialog1.Action = 1
            Main.Report1.PrintFileName = Main.CMDialog1.Filename
            Main.Report1.PrintFileType = 10
          Else
           Exit Sub
          End If
        Else
          If FormatText.Text = "Word for Windows" Then
            
             If CancelCheck <> 1 Then
               On Error GoTo ErrorHandlerc
               Main.CMDialog1.CancelError = True
               Main.CMDialog1.Flags = OFN_HIDEREADONLY
               Main.CMDialog1.DialogTitle = "Choose Export File"
               Main.CMDialog1.Filter = "Word for Windows(*.doc)"
               Main.CMDialog1.Filename = "*.doc"
               Main.CMDialog1.Action = 1
               Main.Report1.PrintFileName = Main.CMDialog1.Filename
               Main.Report1.PrintFileType = 17
             Else
               Exit Sub
             End If
          Else
            If FormatText.Text = "Lotus(WKS)" Then
               Unload Me
               If CancelCheck <> 1 Then
                  On Error GoTo ErrorHandlerc
                  Main.CMDialog1.CancelError = True
                  Main.CMDialog1.Flags = OFN_HIDEREADONLY
                  Main.CMDialog1.DialogTitle = "Choose Export File"
                  Main.CMDialog1.Filter = "Lotus(*.wks)"
                  Main.CMDialog1.Filename = "*.wks"
                  Main.CMDialog1.Action = 1
                  Main.Report1.PrintFileName = Main.CMDialog1.Filename
                  Main.Report1.PrintFileType = 13
               Else
                 Exit Sub
               End If
            Else
              Exit Sub
            End If
          End If
        End If
       End If
     End If
   End If




     Main.Report1.Destination = 2

     If Main.Report1.PrintReport <> 0 Then
       Screen.MousePointer = 0
       MsgBox "Exporting has caused Error#: " & Main.Report1.LastErrorNumber & " - " & Main.Report1.LastErrorString
       Exit Sub
     Else
      Main!StatusBar.Caption = "Export Successful."
      'Enable the Close menu item under file inorder to
      'allow the user to close the window from a menu
      'as well as the windows control box
      Screen.MousePointer = 0
      Unload Me

     End If
Else
 If DestText.Text = "Microsoft Mail(MAPI)" Then
   If FormatText.Text = "Character-separated values" Then
     
     CharSep.Show 1
     NDFormatform.Show 1

     If CancelCheck <> 1 Then
       On Error GoTo ErrorHandlerc
       Main.CMDialog1.CancelError = True
       Main.CMDialog1.Flags = OFN_HIDEREADONLY
       Main.CMDialog1.DialogTitle = "Choose Export File"
       Main.CMDialog1.Filter = "Character-seperated(*.chr)"
       Main.CMDialog1.Filename = "*.chr"
       Main.CMDialog1.Action = 1
       Main.Report1.PrintFileName = Main.CMDialog1.Filename
       Main.Report1.PrintFileType = 5
     Else
       Exit Sub
     End If
   Else
     If FormatText.Text = "Comma-separated values(CSV)" Then
        
        NDFormatform.Show 1
         If CancelCheck <> 1 Then
           On Error GoTo ErrorHandlerc
           Main.CMDialog1.CancelError = True
           Main.CMDialog1.Flags = OFN_HIDEREADONLY
           Main.CMDialog1.DialogTitle = "Choose Export File"
           Main.CMDialog1.Filter = "Comma-seperated(*.csv)"
           Main.CMDialog1.Filename = "*.csv"
           Main.CMDialog1.Action = 1
           Main.Report1.PrintFileName = Main.CMDialog1.Filename
           Main.Report1.PrintFileType = 4
         Else
          Exit Sub
         End If
     Else
       If FormatText.Text = "Crystal Reports(RPT)" Then
         
          If CancelCheck <> 1 Then
            On Error GoTo ErrorHandlerc
            Main.CMDialog1.CancelError = True
            Main.CMDialog1.Flags = OFN_HIDEREADONLY
            Main.CMDialog1.DialogTitle = "Choose Export File"
            Main.CMDialog1.Filter = "Crystal Report(*.rpt)"
            Main.CMDialog1.Filename = "*.rpt"
            Main.CMDialog1.Action = 1
            Main.Report1.PrintFileName = Main.CMDialog1.Filename
            Main.Report1.PrintFileType = 7
          Else
           Exit Sub
          End If
       Else
        If FormatText.Text = "Excel 4.0(XLS)" Then
         
          If CancelCheck <> 1 Then
            On Error GoTo ErrorHandlerc
            Main.CMDialog1.CancelError = True
            Main.CMDialog1.Flags = OFN_HIDEREADONLY
            Main.CMDialog1.DialogTitle = "Choose Export File"
            Main.CMDialog1.Filter = "Excel 4.0 (*.xls)"
            Main.CMDialog1.Filename = "*.xls"
            Main.CMDialog1.Action = 1
            Main.Report1.PrintFileName = Main.CMDialog1.Filename
            Main.Report1.PrintFileType = 10
          Else
           Exit Sub
          End If
        Else
          If FormatText.Text = "Word for Windows" Then
            
             If CancelCheck <> 1 Then
               On Error GoTo ErrorHandlerc
               Main.CMDialog1.CancelError = True
               Main.CMDialog1.Flags = OFN_HIDEREADONLY
               Main.CMDialog1.DialogTitle = "Choose Export File"
               Main.CMDialog1.Filter = "Word for Windows(*.doc)"
               Main.CMDialog1.Filename = "*.doc"
               Main.CMDialog1.Action = 1
               Main.Report1.PrintFileName = Main.CMDialog1.Filename
               Main.Report1.PrintFileType = 17
             Else
               Exit Sub
             End If
          Else
            If FormatText.Text = "Lotus(WKS)" Then
               
               If CancelCheck <> 1 Then
                  On Error GoTo ErrorHandlerc
                  Main.CMDialog1.CancelError = True
                  Main.CMDialog1.Flags = OFN_HIDEREADONLY
                  Main.CMDialog1.DialogTitle = "Choose Export File"
                  Main.CMDialog1.Filter = "Lotus(*.wks)"
                  Main.CMDialog1.Filename = "*.wks"
                  Main.CMDialog1.Action = 1
                  Main.Report1.PrintFileName = Main.CMDialog1.Filename
                  Main.Report1.PrintFileType = 13
               Else
                 Exit Sub
               End If
            Else
              Exit Sub
            End If
          End If
        End If
       End If
     End If
   End If
    

     Main.Report1.Destination = 3
     Email.Show 1
     If CancelCheck <> 1 Then

       If Main.Report1.PrintReport <> 0 Then
         Screen.MousePointer = 0
         MsgBox "Export to E-mail has caused Error#: " & Main.Report1.LastErrorNumber & " - " & Main.Report1.LastErrorString
         Exit Sub
       Else
         Main!StatusBar.Caption = "Export Successful."
         'Enable the Close menu item under file inorder to
         'allow the user to close the window from a menu
         'as well as the windows control box
          Screen.MousePointer = 0
          Unload Me

       End If
     Else
       Exit Sub
     End If
   
 End If
End If
Exit Sub

ErrorHandlerc:
  Exit Sub



   
End Sub

Sub Form_Load ()
  FormatCombo.AddItem "Character-separated values"
  FormatCombo.AddItem "Comma-separated values(CSV)"
  FormatCombo.AddItem "Crystal Reports(RPT)"
  'FormatCombo.AddItem "Data Interchange Format(DIF)"
  'FormatCombo.AddItem "Excel 2.1(XLS)"
  'FormatCombo.AddItem "Excel 3.0(XLS)"
  FormatCombo.AddItem "Excel 4.0(XLS)"
  'FormatCombo.AddItem "Lotus 1-2-3(WK1)"
  'FormatCombo.AddItem "Lotus 1-2-3(WK3)"
  FormatCombo.AddItem "Lotus(WKS)"
  'FormatCombo.AddItem "Quattro Pro 5.0(WB1)"
  'FormatCombo.AddItem "Rich Text Format"
  'FormatCombo.AddItem "Tab-separated text"
  'FormatCombo.AddItem "Tab-separated values"
  'FormatCombo.AddItem "Record Format"
  'FormatCombo.AddItem "Text"
  'FormatCombo.AddItem "Word for Dos"
  FormatCombo.AddItem "Word for Windows"
  'FormatCombo.AddItem "WordPerfect"

  DestCombo.AddItem "Disk File"
  DestCombo.AddItem "Microsoft Mail(MAPI)"


'  0 - Record
 '   1 - Tab Separated
 '   2 - Text
 '   3 - DIF
 '   4 - CSV
 '   5 - Character Separated
 '   6 - Tab Separated Text
 '   7 - Crystal Reports RPT
 '   8 - Excel 2.1 XLS
 '   9 - Excel 3.0 XLS
 '   10 - Excel 4.0 XLS
 '   11 - Lotus 1-2-3 WK1
  '  12 - Lotus 1-2-3 WK3
  '  13 - Lotus 1-2-3 WKS
  '  14 - Quattro Pro 5.0 WB1
  '  15 - RTF
  '  16 - Word for DOS
  '  17 - Word for Windows
  '  18 - WordPerfect
'

End Sub

Sub FormatCombo_Change ()
 FormatText.Text = FormatCombo.Text
End Sub

Sub FormatCombo_Click ()

FormatText.Text = FormatCombo.Text
End Sub

