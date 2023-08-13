/**
 * 押したキーの文字をキャンパスに太字で表示
 */
PFont f;
void setup() {
    size(400, 400);
    background(0);
    // テキストの表示に使うフォントを読み込む
    // 事前に processing でフォントファイルを作成し data ディレクトリに保存しておくこと
    f = loadFont("HiraginoSans-W0-48.vlw");
}

void draw() {}
void keyPressed() {
    background(0);
    fill(255);
    // テキスト表示のオプションを設定
    textFont(f, 250);
    textSize(250);
    // 文字の表示幅を測る
    float charWidth = textWidth(key);
    // 中央に文字を描く
    text(key, (width - charWidth) / 2., 300);
}