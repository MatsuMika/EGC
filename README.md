# E.G.C.

## サイト概要
* ポートフォリオ投稿サイトです。
* いいね！やコメント、返信でユーザー間の交流ができます。<br>
[E.G.C.]の由来(頭文字)<br>
1.ENJOY：成長を「楽しむ」<br>
2.GROW：インスピレーションや技術向上等 「成長」に繋げる<br>
3.COMMUNICATION：楽しんで成長するために、質問や回答等「コミュニケーション」をとる<br>

### サイトテーマ
「E.G.C.」は開発エンジニアの卵が、自他共に楽しみながら成長していくことを応援するサイトです。<br>

### テーマを選んだ理由
1.現在〜未来の社会に向けての人材確保<br>
開発エンジニア不足が問題視されています。このサイトをきっかけに、より多くの開発エンジニアを目指す人が挫折せずに、エンジニアとして羽ばたくことができればと考えました。<br>

2.開発エンジニアへの夢を持つ人を応援<br>
エンジニアを目指す人が、気軽に質問し交流ができる場を作リたいと考えました。<br>
また、制作物について、<br>
「レイアウトや実装のアイディアが思いつかない」「頑張って制作して、GitHubにのせたは良いが、やっぱり人からの反応が欲しい」<br>
このような悩みを解決します。<br>
他人からの反応を知り、インスピレーションや技術改善に繋げる等、<br>
独りでなはく人と繋がりを持つことで、開発をより楽しみながら成長を続けられる場があればと考えました。<br>

### ターゲットユーザ
開発エンジニアを目指して頑張る人〜駆け出しエンジニアを優しく応援したい開発エンジニア

### 主な利用シーン
以下のような悩みや思いに応えます。
##### 投稿
* 自制作物を、他の人にも見てもらいたい（「制作しただけ」にはしたくない）
* 気軽にコメントや質問をもらい、作品について語り合いたい
* 「いいね！」より自作品への反応を知り、自信や改善につなげたい<br>
##### 閲覧
* 投稿作品を見て自制作のインスピレーションのきっかけにしたい
* 投稿作品で気になった機能の実装方法について、制作者に質問をして技術力を高めたい<br>
##### 投稿＋質問
* いいね！やコメント/返信で交流を可能とし、双方の学びに繋げるような場がほしい
* 同じ境遇の人や先輩エンジニア等の「横のつながり」を作りたい

## 詳細設計書
<https://docs.google.com/spreadsheets/d/1uWNtvqXGsqurMvLXls4weXRsNKQ9kWCwBnojAJm8PTQ/edit#gid=737361775>

## AWS構成図
<https://app.diagrams.net/#G1Q1tSG7WD1F0LARBP3kWhrv_LCU53cKGi>

## 動作環境
- デプロイ：AWS,EC2,S3,AMI,Cloud Watch,RDS(MySQL),Route53
- Web server: Nginx
- 言語：HTML,CSS,JavaScript,Ruby
- JSライブラリ：jQuery
- フレームワーク：Ruby on Rails 5.2.4
- Capistrano

## 開発環境
- 仮想マシン：Vagrant,VirtualBox

## 機能一覧
- ユーザー登録、ログイン機能(devise)
- 投稿機能
  - 画像アップロード機能(carrierwave,mini-magick,fog-aws)
  - バリデーションテスト(RSpec)
- 検索機能
- いいね機能
  - 非同期通信(Ajax)
- コメント機能
  - 非同期通信(Ajax)
  - コメントの通知機能(ActionMailer)
- 返信機能
  - 非同期通信(Ajax)
  - 返信の通知機能(ActionMailer)
- 画面トップへスクロールする機能(jQuery)
- ページネーション機能(kaminari)

## 使用素材
o-dan：<https://o-dan.net/ja/>
