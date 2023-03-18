VERSION 4.00
Begin VB.Form Child 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "MDIChild"
   ClientHeight    =   4020
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   3480
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   4425
   Left            =   1035
   LinkTopic       =   "Child"
   MDIChild        =   -1  'True
   ScaleHeight     =   268
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   232
   Top             =   1140
   Width           =   3600
End
Attribute VB_Name = "Child"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
' It is important to ensure that the ScaleMode of this
' Form be set to the same ScaleMode of CRYSTAL.VBX, Twips.

Private Sub Form_Activate()

    'Main!StatusBar.Caption = " Active Window :- " & Me.Caption

End Sub

Private Sub Form_Load()
Main!MenuFileClose.Enabled = True

End Sub

Private Sub Form_Paint()
    
    hWndChild = GetWindow(hWnd, GW_CHILD)
    If (hWndChild <> 0) Then
       MoveWindow hWndChild, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 1
    End If

End Sub

Private Sub Form_Resize()
    
    hWndChild = GetWindow(hWnd, GW_CHILD)
    If (hWndChild <> 0) Then
       MoveWindow hWndChild, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 1
    End If

End Sub

Private Sub Form_Unload(Cancel As Integer)
    'Hide print Controls when closing Child Window

     Main.Command3D13.Visible = False
     Main.Command3D14.Visible = False
     Main.Command3D15.Visible = False
     Main.Command3D16.Visible = False
     Main.Command3D17.Visible = False
     Main.Panel3D1.Visible = False
     
     

    ' Window may be unloaded from SystemMenu or F4
    ' so Main MenuFileClose needs to be updated
    If Forms.Count = 2 Then
        Main!MenuFileClose.Enabled = False
        Main!StatusBar.Caption = " Ready"
    End If
    Unload Me

End Sub

