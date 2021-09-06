## 1 章
* Lisp の主流な方言は Common Lisp / Scheme
* Common Lisp はマルチパラダイム言語

## 2 章
* グローバル変数定義は `defparameter`
* ローカル変数定義は `let`
* グローバル関数定義は `defun`
* ローカル関数定義は `flet` か `labels`
  * 再起、相互参照がしたいなら `labels`

## 3 章
* 基本構成要素はシンボル、数値、文字列
* Common Lisp の基本的なデータ構造ははコンスセル

## 4 章
* Common Lisp では `nil = 'nil = () = '()`
* Common Lisp では nil 以外は真
* シンボルの比較は `eq`、それ以外の比較は `equal`

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
