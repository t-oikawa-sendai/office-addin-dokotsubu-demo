VERSION 5.00
Begin {C62A69F0-16DC-11CE-9E98-00AA00574A4F} frmMain 
   Caption         =   "DokoTsubu - メイン"
   ClientHeight    =   5400
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6000
   StartUpPosition =   1
   Begin VB.Label lblList
      Caption         =   "つぶやき一覧"
      Height          =   288
      Left            =   360
      Top             =   240
      Width           =   5000
   End
   Begin VB.ListBox lstTweets
      Height          =   2400
      Left            =   360
      TabIndex        =   0
      Top             =   600
      Width           =   5200
   End
   Begin VB.Label lblPost
      Caption         =   "つぶやきを入力"
      Height          =   288
      Left            =   360
      Top             =   3180
      Width           =   5000
   End
   Begin VB.TextBox txtPost
      Height          =   900
      Left            =   360
      MultiLine       =   -1  'True
      ScrollBars      =   2
      TabIndex        =   1
      Top             =   3540
      Width           =   5200
   End
   Begin VB.CommandButton cmdPost
      Caption         =   "投稿"
      Height          =   372
      Left            =   360
      TabIndex        =   2
      Top             =   4620
      Width           =   1500
   End
   Begin VB.CommandButton cmdLogout
      Caption         =   "ログアウト"
      Height          =   372
      Left            =   4060
      TabIndex        =   3
      Top             =   4620
      Width           =   1500
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub UserForm_Initialize()
    TweetRefreshListBox Me.lstTweets
End Sub

Private Sub cmdPost_Click()
    Dim t As String
    t = Trim$(txtPost.Text)
    If Len(t) = 0 Then
        MsgBox "つぶやきを入力してください。", vbExclamation, "DokoTsubu"
        Exit Sub
    End If
    TweetAdd t
    txtPost.Text = vbNullString
    TweetRefreshListBox Me.lstTweets
End Sub

Private Sub cmdLogout_Click()
    Unload Me
    frmLogin.Show vbModal
End Sub
