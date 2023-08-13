/**
 * インタラクティブなマウスの軌跡を描画
 */
PVector[] ellipses = new PVector[60];

void setup() {
    size(400, 400);
    background(35, 27, 107);
    noStroke();

    // 配列 ellipses を初期化
    for (int i = 0; i < ellipses.length; i++) {
        ellipses[i] = new PVector();
    }
}

void draw() {
    filter(BLUR, 1);

    // 配列から位置を 1 つずつ取り出す
    PVector p = ellipses[frameCount % ellipses.length];

    // マウスが押されていたらマウスの位置をセット
    if (mousePressed) {
        p.set(mouseX, mouseY);
    }

    // その位置に描画
    fill(238, 120, 138, 250);
    ellipse(p.x, p.y, 15, 15);
}