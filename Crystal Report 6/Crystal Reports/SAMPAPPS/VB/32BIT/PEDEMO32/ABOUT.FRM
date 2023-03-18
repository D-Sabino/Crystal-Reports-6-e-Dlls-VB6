VERSION 4.00
Begin VB.Form About 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About CRPEDemo"
   ClientHeight    =   6330
   ClientLeft      =   3165
   ClientTop       =   1770
   ClientWidth     =   5175
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
   Height          =   6735
   Left            =   3105
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6330
   ScaleWidth      =   5175
   Top             =   1425
   Width           =   5295
   Begin Threed.SSPanel Panel3D1 
      Height          =   6345
      Left            =   -60
      TabIndex        =   0
      Top             =   0
      Width           =   5265
      _Version        =   65536
      _ExtentX        =   9287
      _ExtentY        =   11192
      _StockProps     =   15
      BevelWidth      =   3
      BorderWidth     =   15
      BevelInner      =   1
      Alignment       =   1
      Begin Threed.SSFrame Frame3D3 
         Height          =   1200
         Left            =   360
         TabIndex        =   12
         Top             =   3870
         Width           =   4545
         _Version        =   65536
         _ExtentX        =   8017
         _ExtentY        =   2117
         _StockProps     =   14
         ForeColor       =   0
         Begin VB.TextBox Text3 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   1470
            TabIndex        =   18
            Top             =   810
            Width           =   1305
         End
         Begin VB.TextBox Text2 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   285
            Left            =   1470
            TabIndex        =   17
            Top             =   540
            Width           =   1305
         End
         Begin VB.TextBox Text1 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   285
            Left            =   1470
            TabIndex        =   16
            Top             =   270
            Width           =   1305
         End
         Begin VB.Label Label11 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "System Data:"
            ForeColor       =   &H80000008&
            Height          =   195
            Left            =   300
            TabIndex        =   15
            Top             =   810
            Width           =   1155
         End
         Begin VB.Label Label10 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "User Data:"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   300
            TabIndex        =   14
            Top             =   540
            Width           =   975
         End
         Begin VB.Label Label9 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "GDI Data:"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   300
            TabIndex        =   13
            Top             =   270
            Width           =   1035
         End
      End
      Begin VB.CommandButton Command1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "OK"
         Height          =   345
         Left            =   1740
         TabIndex        =   11
         Top             =   5400
         Width           =   1695
      End
      Begin Threed.SSFrame Frame3D2 
         Height          =   1485
         Left            =   330
         TabIndex        =   6
         Top             =   2280
         Width           =   4575
         _Version        =   65536
         _ExtentX        =   8070
         _ExtentY        =   2619
         _StockProps     =   14
         ForeColor       =   0
         Begin VB.Label Label8 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "CIS:     Go Reports"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   390
            TabIndex        =   10
            Top             =   1110
            Width           =   1875
         End
         Begin VB.Label Label7 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Phone: (604)669-8379"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   390
            TabIndex        =   9
            Top             =   840
            Width           =   2685
         End
         Begin VB.Label Label6 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Fax:     (604)681-7163"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   390
            TabIndex        =   8
            Top             =   570
            Width           =   2775
         End
         Begin VB.Label Label5 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "For Technical Support with the Print Engine:"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   210
            TabIndex        =   7
            Top             =   210
            Width           =   3915
         End
      End
      Begin Threed.SSFrame Frame3D1 
         Height          =   1785
         Left            =   330
         TabIndex        =   1
         Top             =   405
         Width           =   4605
         _Version        =   65536
         _ExtentX        =   8123
         _ExtentY        =   3149
         _StockProps     =   14
         ForeColor       =   0
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            ForeColor       =   &H80000008&
            Height          =   690
            Left            =   360
            Picture         =   "ABOUT.frx":0000
            ScaleHeight     =   660
            ScaleWidth      =   855
            TabIndex        =   19
            Top             =   315
            Width           =   885
         End
         Begin VB.Label Label12 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Written By: Mark Cunningham, Crystal Inc."
            ForeColor       =   &H80000008&
            Height          =   240
            Left            =   330
            TabIndex        =   20
            Top             =   1440
            Visible         =   0   'False
            Width           =   4125
         End
         Begin VB.Label Label4 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Size: 163,855 Bytes"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   2940
            TabIndex        =   5
            Top             =   1125
            Width           =   1365
         End
         Begin VB.Label Label3 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Created: December 13, 1994"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   330
            TabIndex        =   4
            Top             =   1125
            Width           =   2595
         End
         Begin VB.Label Label2 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "Version 4.0.1.0"
            ForeColor       =   &H80000008&
            Height          =   225
            Left            =   1620
            TabIndex        =   3
            Top             =   585
            Width           =   1335
         End
         Begin VB.Label Label1 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Caption         =   "CRPEDemo for Windows"
            ForeColor       =   &H80000008&
            Height          =   255
            Left            =   1590
            TabIndex        =   2
            Top             =   315
            Width           =   2145
         End
      End
   End
End
Attribute VB_Name = "About"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
 Unload Me
End Sub

Private Sub Form_Unload(Cancel As Integer)
  Label12.Visible = False
End Sub

Private Sub Picture1_DblClick()
 Label12.Visible = True
End Sub

