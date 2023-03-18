VERSION 2.00
Begin Form About 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "About CRPEDemo"
   ClientHeight    =   6330
   ClientLeft      =   3165
   ClientTop       =   1770
   ClientWidth     =   5175
   Height          =   6735
   Left            =   3105
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6330
   ScaleWidth      =   5175
   Top             =   1425
   Width           =   5295
   Begin SSPanel Panel3D1 
      Alignment       =   1  'Left Justify - MIDDLE
      BackColor       =   &H00C0C0C0&
      BevelInner      =   1  'Inset
      BevelWidth      =   3
      BorderWidth     =   15
      Font3D          =   0  'None
      Height          =   6345
      Left            =   -60
      TabIndex        =   0
      Top             =   0
      Width           =   5265
      Begin SSFrame Frame3D3 
         Font3D          =   0  'None
         ForeColor       =   &H00000000&
         Height          =   1200
         Left            =   360
         TabIndex        =   12
         Top             =   3870
         Width           =   4545
         Begin TextBox Text3 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   255
            Left            =   1470
            TabIndex        =   18
            Top             =   810
            Width           =   1305
         End
         Begin TextBox Text2 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   285
            Left            =   1470
            TabIndex        =   17
            Top             =   540
            Width           =   1305
         End
         Begin TextBox Text1 
            BackColor       =   &H00C0C0C0&
            BorderStyle     =   0  'None
            Height          =   285
            Left            =   1470
            TabIndex        =   16
            Top             =   270
            Width           =   1305
         End
         Begin Label Label11 
            BackColor       =   &H00C0C0C0&
            Caption         =   "System Data:"
            Height          =   195
            Left            =   300
            TabIndex        =   15
            Top             =   810
            Width           =   1155
         End
         Begin Label Label10 
            BackColor       =   &H00C0C0C0&
            Caption         =   "User Data:"
            Height          =   255
            Left            =   300
            TabIndex        =   14
            Top             =   540
            Width           =   975
         End
         Begin Label Label9 
            BackColor       =   &H00C0C0C0&
            Caption         =   "GDI Data:"
            Height          =   255
            Left            =   300
            TabIndex        =   13
            Top             =   270
            Width           =   1035
         End
      End
      Begin CommandButton Command1 
         Caption         =   "OK"
         Height          =   345
         Left            =   1740
         TabIndex        =   11
         Top             =   5400
         Width           =   1695
      End
      Begin SSFrame Frame3D2 
         Font3D          =   0  'None
         ForeColor       =   &H00000000&
         Height          =   1485
         Left            =   330
         TabIndex        =   6
         Top             =   2280
         Width           =   4575
         Begin Label Label8 
            BackColor       =   &H00C0C0C0&
            Caption         =   "CIS:     Go Reports"
            Height          =   225
            Left            =   390
            TabIndex        =   10
            Top             =   1110
            Width           =   1875
         End
         Begin Label Label7 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Phone: (604)669-8379"
            Height          =   225
            Left            =   390
            TabIndex        =   9
            Top             =   840
            Width           =   2685
         End
         Begin Label Label6 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Fax:     (604)681-7163"
            Height          =   255
            Left            =   390
            TabIndex        =   8
            Top             =   570
            Width           =   2775
         End
         Begin Label Label5 
            BackColor       =   &H00C0C0C0&
            Caption         =   "For Technical Support with the Print Engine:"
            Height          =   225
            Left            =   210
            TabIndex        =   7
            Top             =   210
            Width           =   3915
         End
      End
      Begin SSFrame Frame3D1 
         Font3D          =   0  'None
         ForeColor       =   &H00000000&
         Height          =   1785
         Left            =   330
         TabIndex        =   1
         Top             =   405
         Width           =   4605
         Begin PictureBox Picture1 
            Height          =   690
            Left            =   360
            Picture         =   ABOUT.FRX:0000
            ScaleHeight     =   660
            ScaleWidth      =   855
            TabIndex        =   19
            Top             =   315
            Width           =   885
         End
         Begin Label Label12 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Written By: Mark Cunningham, Crystal Inc."
            Height          =   240
            Left            =   330
            TabIndex        =   20
            Top             =   1440
            Visible         =   0   'False
            Width           =   4125
         End
         Begin Label Label4 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Size: 163,855 Bytes"
            Height          =   225
            Left            =   2940
            TabIndex        =   5
            Top             =   1125
            Width           =   1365
         End
         Begin Label Label3 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Created: December 13, 1994"
            Height          =   255
            Left            =   330
            TabIndex        =   4
            Top             =   1125
            Width           =   2595
         End
         Begin Label Label2 
            BackColor       =   &H00C0C0C0&
            Caption         =   "Version 4.0.1.0"
            Height          =   225
            Left            =   1620
            TabIndex        =   3
            Top             =   585
            Width           =   1335
         End
         Begin Label Label1 
            BackColor       =   &H00C0C0C0&
            Caption         =   "CRPEDemo for Windows"
            Height          =   255
            Left            =   1590
            TabIndex        =   2
            Top             =   315
            Width           =   2145
         End
      End
   End
End

Sub Command1_Click ()
 Unload Me
End Sub

Sub Form_Load ()
 Res = Get_Resource(myGDI, myUSER, mySYSTEM)
 Text1.Text = myGDI & "% Free"
 Text2.Text = myUSER & "% Free"
 Text3.Text = mySYSTEM & "% Free"
 
End Sub

Sub Form_Unload (Cancel As Integer)
  Label12.Visible = False
End Sub

Sub Picture1_DblClick ()
 Label12.Visible = True
End Sub

