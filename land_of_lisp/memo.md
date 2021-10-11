## 実行環境
* SBCL 2.1.3

## 1 章
* Lisp の主流な方言は Common Lisp / Scheme
* Common Lisp はマルチパラダイム言語

## 2 章
* グローバル変数定義は `defparameter`
* ローカル変数定義は `let`
* グローバル関数定義は `defun`
* ローカル関数定義は `flet` か `labels`
  * 再起、参照がしたいなら `labels`

## 3 章
* 基本構成要素はシンボル、数値、文字列
* Common Lisp の基本的なデータ構造ははコンスセル

## 4 章
* Common Lisp では `nil = 'nil = () = '()`
* Common Lisp では `nil` 以外は真
* シンボルの比較は `eq`、それ以外の比較は `equal`
* Common Lisp にはコードモードとデータモードがある
* デフォルトはコードモード
* コードモードからデータモードの切替に ' (シングルクオート) を使う

## 5 章
* 準クオートを使うときに ` (バッククオート) を使う
* 準クオートにおいては、一部をコードモードに戻すこと (アンクオート) ができる
* 関数を値として使うときは function オペレータを明示する。略記の `#'` を使うと便利
* Common Lisp では変数と関数の名前空間を別々に管理する
* 標準関数と同名の関数を定義すべきでない
* 関数が nil か真の値を返す場合、関数の名前の最後に p (predicate) をつける慣習がある
* キーワード引数 (`:` から始まる名前と、値) を渡すことで多くの関数の挙動が変わる
* `push` と `assoc` を使って以前の値を残したまま連想リストの値を変更したかのように見せられる
  * `assoc` が最初に見つかったエントリを返すため

## 6 章
* Lisp でリテラル文字を表すには文字の前に `#\` を置く
* Lisp はプログラムコードとデータを同じデータ構造を使って扱う (homoiconic)
* `'foo = (quote foo)`

## 6.5 章
* `(lambda (x) x)` は lambda マクロ
* lambda 自体は式であり関数ではない。lambda が返すものは関数
* Lisp では関数を値として渡すことを多用する

## 7 章
* `nil` で終わってないリストをドットリストと呼ぶ
* 対の簡潔な表現として長さ 2 のドットリストを使うことが多い
* 循環リストを表示したいときは `*print-circle*` を真にする
* 連想リストはデータ取り出しの効率の問題から他のデータ型に置換されることが多い
* コンスセルの変更処理は Lisp のコンパイラにおいて最適化されている
* `setf` で変更するリストは `list` コマンドで作るべき (= リテラルリストで作るべきでない)
* `-not` で終わっている Lisp 関数は非推奨
* `mapc` は `mapcar` の仲間で、結果のリストを返さないが若干高速 (≒ 副作用のある処理で使う)
* 遅延評価したい計算を受け取るのに使う無引数関数をサンク (`thunk`) またはサスペンション (`suspension`) と呼ぶ
  * 標準出力してた関数をストリームオブジェクトへのデータ出力に切り替えたり出来る

## 8 章
* `load` を使うとファイル中のコードを全て評価できる
* `loop` コマンド中で `repeat` を使ってループ数を指定。`collect` で個々の対象を指定する
* ローカル変数定義 `let*` を使うと同時に定義される変数が参照可能
* `intersection`, `remove-duplicates` を使えば複数のリストの共通要素や重複要素が取れる
* `mapcan` は `mapcar` の仲間で、リストを返す関数を受け取り、関数の結果のリスト達を自動的に `append` して返す

## 9 章
* Common Lisp には配列、ハッシュテーブル、構造体といったデータ構造が存在する
* Common Lisp はジェネリックなセッターをサポートしている
  * データ構造から値を取り出すコードと、データ構造に値を入れるコードが同じ形で書けることを意味する
* `setf` の最初の引数は汎変数 (general variable) と呼ばれる特別なミニ言語となっている
* 配列はリストよりも高速。ハッシュテーブルは連想リストよりも高速
* 関数で複数の値を返すようにするには `values` を使う
  * 代わりにリストを返しても良い。Arc や Clojure では複数の値をサポートしてない
* ハッシュテーブルは高性能だがデバッグしづらい (REPL で自然に中身が出力されない、直接リテラルをタイプ出来ない)
  * Clojure など最近の Lisp 言語ではリテラルのハッシュテーブル (マップ) をサポートしている
* 構造体 (属性を持つオブジェクト) を作るには `defstruct` コマンドを使う。
  * このコマンドは構造体のインスタンスを作る関数や属性へのアクセス関数を自動的に作る
* シーケンス関数はリスト、配列、文字列を統一的に扱えるジェネリックな関数である
  * `length`, `find-if`, `count`, `position`, `some`, `every`, `reduce`, `map`, `subseq`, `sort`
  * 詳しくは [Common Lisp Hyperspec](http://www.lispworks.com/documentation/lw51/CLHS/Body/c_sequen.htm) を参照
* 型述語を使えば型判定が出来るので色々な方の引数を受け取るジェネリックな関数が自作できる
  * `arrayp`, `characterp`, `consp`, `functionp`, `hash-table-p`, `listp`, `stringp`, `symbolp`
  * 性能やコード視認性、保守性の問題があり型述語を使ってジェネリックな関数を作ることはあまり無い
* 一つの関数を引数の型に応じて処理を切り替えたいときは `defmethod` を使うほうが良い

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
* [Common Lisp Hyperspec](http://www.lispworks.com/documentation/common-lisp.html)