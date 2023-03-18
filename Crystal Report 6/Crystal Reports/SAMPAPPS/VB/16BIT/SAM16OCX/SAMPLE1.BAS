Attribute VB_Name = "SAMPLE1"
Option Explicit

Global Const CRYSTAL_PRO = True

Declare Function GetActiveWindow Lib "User" () As Integer
Declare Function IsWindow Lib "User" (ByVal hWnd As Integer) As Integer

