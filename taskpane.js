/*
ソース名: taskpane.js
Lang: JavaScript
Function: ダミー投稿の描画、デモ用ボタン、Office.onReady で起動
Note: 認証・API・シート操作なし。DUMMY_POSTS は固定配列。
Author:Takashi Oikawa
Date:2026/04/04
LastUp:2026/04/04
*/

(function () {
  "use strict";

  var DUMMY_POSTS = [
    {
      author: "山田太郎",
      postedAt: "2026-04-01 09:15",
      body: "今日の授業、Office アドインの構成がよく分かった。"
    },
    {
      author: "佐藤花子",
      postedAt: "2026-04-02 14:02",
      body: "HTML / CSS / JS で画面を作るのは小さな Web アプリと同じ感覚。"
    },
    {
      author: "鈴木一郎",
      postedAt: "2026-04-03 11:40",
      body: "タスクペインだけで完結するデモは説明の切り分けがしやすい。"
    },
    {
      author: "高橋みゆき",
      postedAt: "2026-04-03 16:55",
      body: "まずは一覧 UI とデータの形を決めるのが良さそう。"
    },
    {
      author: "伊藤健",
      postedAt: "2026-04-04 08:30",
      body: "ボタンはデモ用。ここに本番処理を足す想定で説明できる。"
    }
  ];

  function escapeHtml(text) {
    var div = document.createElement("div");
    div.textContent = text;
    return div.innerHTML;
  }

  function buildPostCardHtml(post) {
    var author = escapeHtml(post.author);
    var postedAt = escapeHtml(post.postedAt);
    var body = escapeHtml(post.body);
    return (
      '<article class="post-card">' +
        '<div class="post-meta">' +
          '<p class="post-author">' + author + "</p>" +
          '<p class="post-time">' + postedAt + "</p>" +
        "</div>" +
        '<p class="post-body">' + body + "</p>" +
      "</article>"
    );
  }

  function renderPosts(posts) {
    var feed = document.getElementById("feed");
    var placeholder = document.getElementById("feed-placeholder");
    if (placeholder) {
      placeholder.remove();
    }
    var html = "";
    for (var i = 0; i < posts.length; i++) {
      html += buildPostCardHtml(posts[i]);
    }
    feed.innerHTML = html;
  }

  function onPostClick() {
    window.alert("デモ用: 投稿保存・API は未実装です。");
  }

  function onRefreshClick() {
    renderPosts(DUMMY_POSTS);
    window.alert("デモ用: 同じダミーを再描画しました（通信なし）。");
  }

  function wireButtons() {
    var btnPost = document.getElementById("btn-post");
    var btnRefresh = document.getElementById("btn-refresh");
    if (btnPost) {
      btnPost.addEventListener("click", onPostClick);
    }
    if (btnRefresh) {
      btnRefresh.addEventListener("click", onRefreshClick);
    }
  }

  function startApp() {
    wireButtons();
    renderPosts(DUMMY_POSTS);
  }

  if (typeof Office !== "undefined" && Office.onReady) {
    Office.onReady(function () {
      startApp();
    });
  } else {
    document.addEventListener("DOMContentLoaded", startApp);
  }
})();
