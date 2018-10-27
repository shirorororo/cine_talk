# シネトーク − CINE TALK −


# 概要
映画を見る時、何となく手に取ったり、ネットで話題だから、とチョイスしてなんか違う・・・ってことが良くある。  
気に入ったセリフやシーンの目の付け所が一緒だったら、その人が好きな映画は自分も気にいる可能性が高いし、ハズレないのでは？  
好きな映画のセリフを投稿し合い、自分が気になるセリフを投稿した人のページを覗いて見ましょう。  
まだ見ていない素敵な映画に出会えるかもしれません。  

# コンセプト
映画のセリフ・レビューを共有する

# バージョン
ruby 2.4.0 rails -v 5.1.1

# 機能一覧
* ログイン機能
* ユーザー登録機能
 メールアドレス、名前、パスワードは必須
* マイページ表示機能
　プロフィール、マイセリフ一覧、お気に入りセリフ、レビューの投稿、 レビュー一覧、フォロー一覧、フォロワー一覧
* セリフ一覧表示機能
* セリフ投稿機能
* セリフ編集機能
　  投稿者のみ実行可能
* セリフ削除機能
　  投稿者のみ実行可能
* セリフお気に入り機能
　  自分自身のブログにはお気に入りできない
* セリフコメント機能
* レビュー一覧表示機能
* レビュー投稿機能
* レビュー編集機能
  　投稿者のみ実行可能
* レビュー削除機能
　  投稿者のみ実行可能
* フォロー機能
* ウォッチリスト機能
* キーワード検索機能


# カタログ設計
<https://docs.google.com/spreadsheets/d/1CLppHmq0w894lrOoGizIxv1ztk5aF0ifmAB0soxYDuo/edit?usp=sharing>

# テーブル定義
<https://docs.google.com/spreadsheets/d/1QyOk_2sN-jYM_-c35RiMCU8WzR68YtK9yhgqXfbF7VQ/edit?usp=sharing>

# 画面遷移図
<https://docs.google.com/spreadsheets/d/1fpft3fLiNCORKf701EIljR4Scafq87Gi0jHu0-K190I/edit?usp=sharing>

# 画面ワイヤーフレーム
<https://docs.google.com/spreadsheets/d/1V3ezER7jBTBMeHd_7cBUFU9xtgAS8OB40_vjxTK1kgE/edit?usp=sharing>


# 使用予定Gem
* carrierwave
* mini_magick
* devise
* bootstrap-sass
* ransack
* simple_form
