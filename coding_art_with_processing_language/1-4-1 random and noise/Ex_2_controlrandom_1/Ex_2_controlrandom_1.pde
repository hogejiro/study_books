/**
 * マウスでカラフルなしずくを描く絵筆
 */

void setup() {
    size(400, 400);
    background(0);
    noStroke();
    // カラーモードを RGB -> HSB へ
    colorMode(HSB);
}

void draw() {
    filter(BLUR, 1);
    if (mousePressed) {
        translate(mouseX, mouseY);
        for (int i = 0; i < 5; i++) {
            // HSB なので 色相、彩度、明度が設定される。色相だけランダムにする
            fill(random(0, 255), 255, 255);
            // マウス位置の周りのランダムな位置を生成
            PVector pos = new PVector(random(-20, 20), random(-20, 20));
            // マウス位置からの距離によってしずくのサイズを計算
            float size = 20 - dist(0, 0, pos.x, pos.y);
            // しずくを描く
            ellipse(pos.x, pos.y, size, size);
        }
    }
}