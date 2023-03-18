Attribute VB_Name = "SAMPLE1"
Option Explicit

Global Const CRYSTAL_PRO = True

Declare Function GetActiveWindow& Lib "user32" ()
Declare Function IsWindow& Lib "user32" (ByVal hwnd As Long)
