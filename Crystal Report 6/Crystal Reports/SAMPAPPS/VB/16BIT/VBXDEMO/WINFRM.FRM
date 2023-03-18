VERSION 2.00
Begin Form WinFrm 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Print To Window"
   ClientHeight    =   2190
   ClientLeft      =   1980
   ClientTop       =   2580
   ClientWidth     =   5520
   Height          =   2595
   Left            =   1920
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2190
   ScaleWidth      =   5520
   Top             =   2235
   Width           =   5640
   Begin CommandButton Command1 
      Caption         =   "Help"
      Height          =   375
      Left            =   3600
      TabIndex        =   6
      Top             =   1530
      Width           =   1185
   End
   Begin SSCheck SavedData 
      Caption         =   "Use Saved Data"
      Font3D          =   0  'None
      Height          =   255
      Left            =   450
      TabIndex        =   2
      Top             =   810
      Width           =   1815
   End
   Begin CommandButton Command3 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      Height          =   375
      Left            =   2220
      TabIndex        =   5
      Top             =   1530
      Width           =   1215
   End
   Begin CommandButton Command2 
      Caption         =   "Print"
      Default         =   -1  'True
      Height          =   375
      Left            =   840
      TabIndex        =   4
      Top             =   1530
      Width           =   1215
   End
   Begin SSFrame Frame3D1 
      Font3D          =   0  'None
      ForeColor       =   &H00000000&
      Height          =   1005
      Left            =   120
      TabIndex        =   7
      Top             =   225
      Width           =   5295
      Begin SSCheck ShowControls 
         Caption         =   "Show Print Controls"
         Font3D          =   0  'None
         Height          =   195
         Left            =   2220
         TabIndex        =   3
         Top             =   630
         Value           =   -1  'True
         Width           =   2025
      End
      Begin TextBox NDetailCopies 
         Height          =   285
         Left            =   2580
         TabIndex        =   1
         Text            =   "1"
         Top             =   225
         Width           =   615
      End
      Begin Label Label3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Number of Detail Copies:"
         Height          =   255
         Left            =   360
         TabIndex        =   0
         Top             =   225
         Width           =   2175
      End
   End
End
Sub Command1_Click ()
   RCode = Shell("Winhelp c:\crw\crw.hlp", 3)
End Sub

Sub Command2_Click ()
    
'Declare Variables
'Dimension a new child form for use with the Crystal Reports
'Print Window. See the VBXDEMO.TXT for more information

    Dim C As New Child

    
'Turn Print Window controls either on or off based on
'value in 3D Check box.

    If ShowControls.Value = False Then
        Main.Report1.WindowControls = 0
        'If the user does not want print controls then the
        'following command buttons are displayed. They are
        'page scrolling keys which allow you scroll from page to page

        
        
        Main.Command3D17.Visible = True
        Main.Panel3D1.Visible = True
    Else
        Main.Report1.WindowControls = 1
        Main.Command3D17.Visible = False
        Main.Panel3D1.Visible = False
    End If

'Use the data saved in the report or discard it.

    If SavedData.Enabled = True Then
      Main.Report1.DiscardSavedData = 0
    Else
      Main.Report1.DiscardSavedData = 1
    End If

'Set number of details copies to be printed. The default is
'set to 1

    Main.Report1.DetailCopies = NDetailCopies.Text
 
'Check to see if the resources are above 20%. If they are then
'proceed with report printing. If not then ask user to close
'down a few applications and try again.


     FreeRes = FreeResourcesAreAbove(20)
     If FreeRes = False Then
       MsgBox "Your System Resources are below 20% Free, the job cannot be started! Please exit CRPEDemo, close some of your other Windows applications and try again."
       Exit Sub
     End If
    
'Set mouse to an Hour glass

    Screen.MousePointer = 11

'Set the Title of the MDI Child frame window.

    C.Caption = "MDIChild-VBXDemo"

'Set the Crystal print window to be a child of the MDI child
'frame window.

    Main.Report1.WindowParentHandle = C.hWnd

'Set the destination to Window(0)

    Main.Report1.Destination = 0
'unload WinFRM before print window appears

    Unload Me

'Print report to window. If this fails then retrieve the error
'number and error string and display in a message box. If the call
'is successful then display the appropriate message in the status
'bar caption. Notice that the PrintReport property was used
'so that a Result% was return inorder to do proper error checking

    Main.Arrange Cascade
    If Main.Report1.PrintReport <> 0 Then
      Unload C
      Screen.MousePointer = 0
      MsgBox "Printing the Report to Window has caused Error#: " & Main.Report1.LastErrorNumber & " - " & Main.Report1.LastErrorString
      Exit Sub
    Else
      Main!StatusBar.Caption = "Preview to window Successful."
      'Enable the Close menu item under file inorder to
      'allow the user to close the window from a menu
      'as well as the windows control box

      Main.MenuFileClose.Enabled = True
      'Set the Mouse back to the default(a pointer)

      Screen.MousePointer = 0

    End If

     

End Sub

Sub Command3_Click ()
Unload Me
End Sub

