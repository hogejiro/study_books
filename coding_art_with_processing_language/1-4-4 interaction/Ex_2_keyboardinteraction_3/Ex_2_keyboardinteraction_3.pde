/**
 * 押したキーの文字をランダムな点描の文字として表示
 */
PFont f;
PGraphics textCanvas;
void setup() {
    size(400, 400);
    background(0);
    // テキストの表示に使うフォントを読み込む
    // 事前に processing でフォントファイルを作成し data ディレクトリに保存しておくこと
    f = loadFont("HiraginoSans-W0-48.vlw");
    textCanvas = createGraphics(400, 400);
}

void draw() {}
void keyPressed() {
    // オフスクリーンのキャンバスに文字を描く
    textCanvas.beginDraw();
    textCanvas.textFont(f, 250);
    textCanvas.background(0);
    textCanvas.fill(255);
    textCanvas.textSize(250);
    // 文字の表示幅を削る
    float charWidth = textCanvas.textWidth(key);
    // 中央に文字を描く
    textCanvas.text(key, (width - charWidth) / 2, 300);
    textCanvas.endDraw();
    // 新しい文字を描く
    background(0);
    noStroke();
    // ドットの再帰的描画を 2000 回繰り返す
    for (int i = 0; i < 2000; i++) {
        drawDot(random(0, width), random(0, height), 10);
    }
}
void drawDot(float x, float y, int depth) {
    if (depth == 0) {
        return;
    }
    // textCanvas の現在座標 (文字を描いた位置) の明度を調べる
    if (brightness(textCanvas.get((int)x, (int)y)) > 0) {
        // 文字の内側であれば再起の深さに応じた透明度のドットを描く
        fill(255, map(depth, 0, 10, 80, 180));
        ellipse(x, y, depth/2, depth/2);
    }
    // 次の座標を設定
    float nextX = x + random(-20, 20);
    float nextY = y + random(-20, 20);
    drawDot(nextX, nextY, depth - 1);
}