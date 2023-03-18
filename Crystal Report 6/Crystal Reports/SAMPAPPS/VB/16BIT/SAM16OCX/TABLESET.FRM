VERSION 4.00
Begin VB.Form TableSettings 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Table Settings"
   ClientHeight    =   3390
   ClientLeft      =   2955
   ClientTop       =   6750
   ClientWidth     =   5415
   ControlBox      =   0   'False
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   1
      weight          =   700
      size            =   8.25
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3795
   Left            =   2895
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3390
   ScaleWidth      =   5415
   Top             =   6405
   Width           =   5535
   Begin VB.Frame Frame3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Session Info"
      ForeColor       =   &H80000008&
      Height          =   1335
      Left            =   120
      TabIndex        =   9
      Top             =   1920
      Width           =   4095
      Begin VB.TextBox txtSessionHandle 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   4
         Top             =   960
         Width           =   1695
      End
      Begin VB.TextBox txtSessionPassword 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   3
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox txtSessionUserID 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1320
         TabIndex        =   2
         Top             =   240
         Width           =   2535
      End
      Begin VB.Label Label13 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "User ID:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   270
         Width           =   975
      End
      Begin VB.Label Label12 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Password:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   630
         Width           =   1095
      End
      Begin VB.Label Label10 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Handle:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   480
         TabIndex        =   17
         Top             =   990
         Width           =   735
      End
   End
   Begin VB.Frame Frame2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "LogOn Info"
      ForeColor       =   &H80000008&
      Height          =   1695
      Left            =   120
      TabIndex        =   10
      Top             =   120
      Width           =   4095
      Begin VB.TextBox txtLogOnPassword 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   8
         Top             =   1320
         Width           =   2175
      End
      Begin VB.TextBox txtLogOnUserID 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   7
         Top             =   960
         Width           =   2175
      End
      Begin VB.TextBox txtDatabaseName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   6
         Top             =   600
         Width           =   2175
      End
      Begin VB.TextBox txtServerName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1680
         TabIndex        =   5
         Top             =   240
         Width           =   2175
      End
      Begin VB.Label Label11 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Password:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   480
         TabIndex        =   15
         Top             =   1350
         Width           =   1095
      End
      Begin VB.Label Label9 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Server Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   270
         Width           =   1335
      End
      Begin VB.Label Label8 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "Database Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   12
         Top             =   630
         Width           =   1455
      End
      Begin VB.Label Label7 
         Alignment       =   1  'Right Justify
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "User ID:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   480
         TabIndex        =   11
         Top             =   990
         Width           =   1095
      End
   End
   Begin VB.CommandButton cmdCancel 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   4440
      TabIndex        =   1
      Top             =   1200
      Width           =   855
   End
   Begin VB.CommandButton cmdOk 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "&Ok"
      Height          =   375
      Left            =   4440
      TabIndex        =   0
      Top             =   600
      Width           =   855
   End
End
Attribute VB_Name = "TableSettings"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    TableSettings.Tag = "Cancel"
    TableSettings.Hide
End Sub

Private Sub cmdOk_Click()
    TableSettings.Tag = "Ok"
    TableSettings.Hide
End Sub

Private Sub cmdTest_Click()
    TableSettings.Tag = "Test"
    TableSettings.Hide
End Sub

