Attribute VB_Name = "modEntry"
Option Explicit

Private tweetCol As Collection

Private Sub EnsureTweets()
    If tweetCol Is Nothing Then
        Set tweetCol = New Collection
        tweetCol.Add "（サンプル）ようこそ DokoTsubu へ"
    End If
End Sub

Public Sub TweetAdd(ByVal text As String)
    Dim s As String
    s = Trim$(text)
    If Len(s) = 0 Then Exit Sub
    EnsureTweets
    tweetCol.Add s
End Sub

Public Sub TweetRefreshListBox(ByVal lb As Object)
    Dim i As Long
    EnsureTweets
    lb.Clear
    For i = 1 To tweetCol.Count
        lb.AddItem tweetCol(i)
    Next i
End Sub

' マクロ一覧から実行するか、シートの図形にこのマクロを割り当てる。
Public Sub ShowLogin()
    frmLogin.Show vbModal
End Sub
