VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmLogin 
   Caption         =   "DokoTsubu - ログイン"
   ClientHeight    =   4200
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5400
   StartUpPosition =   1
   Begin VB.Label lblTitle
      Caption         =   "ログイン"
      Height          =   372
      Left            =   360
      Top             =   240
      Width           =   4680
   End
   Begin VB.Label lblUserId
      Caption         =   "ユーザーID"
      Height          =   288
      Left            =   360
      Top             =   960
      Width           =   1400
   End
   Begin VB.TextBox txtUserId
      Height          =   315
      Left            =   1800
      TabIndex        =   0
      Top             =   900
      Width           =   3200
   End
   Begin VB.Label lblPassword
      Caption         =   "パスワード"
      Height          =   288
      Left            =   360
      Top             =   1560
      Width           =   1400
   End
   Begin VB.TextBox txtPassword
      Height          =   315
      IMEMode         =   3
      Left            =   1800
      PasswordChar    =   "*"
      TabIndex        =   1
      Top             =   1500
      Width           =   3200
   End
   Begin VB.CommandButton cmdLogin
      Caption         =   "ログイン"
      Default         =   -1  'True
      Height          =   372
      Left            =   1800
      TabIndex        =   2
      Top             =   2400
      Width           =   1500
   End
   Begin VB.CommandButton cmdCancel
      Cancel          =   -1  'True
      Caption         =   "キャンセル"
      Height          =   372
      Left            =   3500
      TabIndex        =   3
      Top             =   2400
      Width           =   1500
   End
End
Attribute VB_Name = "frmLogin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub cmdLogin_Click()
    Unload Me
    frmMain.Show vbModal
End Sub
