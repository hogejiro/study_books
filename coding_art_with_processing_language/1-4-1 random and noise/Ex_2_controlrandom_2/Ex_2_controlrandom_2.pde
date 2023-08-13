/**
 * Ex_2_controlrandom_1 を修正し色相とマウスの移動方向を連動
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
        PVector center = new PVector(width/2, height/2);
        PVector mouse = new PVector(mouseX, mouseY);
        // 中心点からマウス位置までの角度をラジアン単位で計算
        float angle = PVector.sub(mouse, center).heading();
        // ラジアンを [-180, 180] の範囲の度数に変換
        float degree = degrees(angle);
        // マウスの移動方向に応じて色相を変化
        float hue = map(angle, -PI/2, PI/2, 0, 255);
        translate(mouseX, mouseY);
        for (int i = 0; i < 5; i++) {
            // HSB なので 色相、彩度、明度が設定される。色相だけランダムにする
            fill(random(hue - 20, hue + 20) % 255, 255, 255);
            // マウス位置の周りのランダムな位置を生成
            PVector pos = new PVector(random(-20, 20), random(-20, 20));
            // マウス位置からの距離によってしずくのサイズを計算
            float size = 20 - dist(0, 0, pos.x, pos.y);
            // しずくを描く
            ellipse(pos.x, pos.y, size, size);
        }
    }
}