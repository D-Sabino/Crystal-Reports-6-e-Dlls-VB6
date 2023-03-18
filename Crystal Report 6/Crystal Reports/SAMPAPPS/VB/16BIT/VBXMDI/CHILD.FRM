VERSION 2.00
Begin Form Child 
   Caption         =   "MDIChild"
   ClientHeight    =   4020
   ClientLeft      =   1095
   ClientTop       =   1485
   ClientWidth     =   7365
   Height          =   4425
   Left            =   1035
   LinkTopic       =   "Child"
   MDIChild        =   -1  'True
   ScaleHeight     =   268
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   491
   Top             =   1140
   Width           =   7485
End
' It is important to ensure that the ScaleMode of this
' Form be set to the same ScaleMode of CRYSTAL.VBX which
' is Pixels.

Sub Form_Activate ()

    Main!StatusBar.Caption = " Active Window :- " & Me.Caption

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
    
    ' Window may be unloaded from SystemMenu or F4
    ' so Main MenuFileClose needs to be updated
    If Forms.Count = 2 Then
        Main!MenuFileClose.Enabled = False
        Main!StatusBar.Caption = " Ready"
    End If
    
    Main!ReportDemo.Action = 2
    hWndChild = GetWindow(hWnd, GW_CHILD)
    If (hWndChild <> 0) Then
       rcode = SendMessage(hWndChild, WM_CLOSE, 0, 0)
    End If
    
    Unload Me

End Sub

