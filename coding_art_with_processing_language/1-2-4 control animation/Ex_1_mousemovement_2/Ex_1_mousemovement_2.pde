void setup() {
    size(600, 600);
}

void draw() {
    // 白い背景に黒い線
    background(255);
    stroke(0);

    // マウスが押されていたら線を描く
    if (mousePressed) {
        line(mouseX, 150, 150, mouseY);
    }
}