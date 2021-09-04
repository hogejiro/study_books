## 1 章
* Lisp は Common Lisp / Scheme が主流となる方言である
* Common Lisp はマルチパラダイム言語である

## 実装メモ
### コード規約
* 基本的に `-` 繋ぎで大文字は使わない
* グローバル変数は `*global-variable*`

### VSCode を利用
* エディタは [VSCode](https://marketplace.visualstudio.com/items?itemName=ailisp.commonlisp-vscode) を利用
```bash
# roswell をインストールしパスを通す (省略)

# prepl インストールのためバージョンを固定する
ros install sbcl-bin/2.1.3

# cl-lsp と必要となるパッケージをインストール
ros install ailisp/linedit
ros install ailisp/prepl
ros install ailisp/cl-lsp
```
* VSCode 上でクイックオープンを開いて `ext install ailisp.commonlisp-vscode`

## 参照
* [Google Common Lisp スタイルガイド 日本語訳](https://lisphub.jp/doc/google-common-lisp-style-guide/lispguide.xml)
* [Tutorial on Good Lisp Programming Style](http://norvig.com/luv-slides.ps)
