VERSION 2.00
Begin Form Child 
   Caption         =   "MDIChild"
   ClientHeight    =   4020
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   3480
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
' It is important to ensure that the ScaleMode of this
' Form be set to the same ScaleMode of CRYSTAL.VBX, Twips.

Sub Form_Activate ()

    'Main!StatusBar.Caption = " Active Window :- " & Me.Caption

End Sub

Sub Form_Load ()
Main!MenuFileClose.Enabled = True
End Sub

Sub Form_Paint ()
    
    hWndChild = GetWindow(hWnd, GW_CHILD)
    If (hWndChild <> 0) Then
       MoveWindow hWndChild, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 1
    End If

End Sub

Sub Form_Resize ()
    
    hWndChild = GetWindow(hWnd, GW_CHILD)
    If (hWndChild <> 0) Then
       MoveWindow hWndChild, ScaleLeft, ScaleTop, ScaleWidth, ScaleHeight, 1
    End If

End Sub

Sub Form_Unload (Cancel As Integer)
    'Hide print Controls when closing Child Window

     
     
     
     
     Main.Command3D17.Visible = False
     Main.Panel3D1.Visible = False
     
     

    ' Window may be unloaded from SystemMenu or F4
    ' so Main MenuFileClose needs to be updated
    If Forms.Count = 1 Then
        Main.MenuFileClose.Enabled = False
        Main!StatusBar.Caption = " Ready"
    End If
    Unload Me

End Sub

