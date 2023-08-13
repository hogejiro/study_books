/**
 * Ex_1_mouseinteraction_1.pde と基本は同じ。マウスの押下で色を変える際、左と右とで色を変える
 */
 void setup() {
    size(400, 400);
    background(0);
    noStroke();
    colorMode(HSB);
}

void draw() {
    // マウスを押してない場合だけキャンパスをぼかす
    filter(BLUR, mousePressed ? 0 : 1);
    translate(mouseX, mouseY);
    // このフレームにおけるマウスの移動距離を計算
    float size = 5 + dist(pmouseX, pmouseY, mouseX, mouseY);
    // きらめきを生成
    for (int i = 0; i < 5; i++) {
        if (mousePressed && mouseButton == LEFT) {
            fill(240 + random(-20, 20), 255, 255, 180);
        } else if (mousePressed && mouseButton == RIGHT) {
            fill(160 + random(-20, 20), 255, 255, 180);
        } else {
            fill(255, 180);
        }
        ellipse(size * random(-1, 1), size * random(-1, 1), 2, 2);
    }
}