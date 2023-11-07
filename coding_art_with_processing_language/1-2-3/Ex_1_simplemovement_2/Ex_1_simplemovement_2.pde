void setup() {
    size(400, 400);
    rectMode(CENTER);
}

void draw() {
    background(160);
    // 正方形を frameCount 分動かす
    translate(frameCount, 30);
    // 正方形を回転させる
    rotate(radians(frameCount * (360 / (2 * PI * 10))));
    rect(0, 0, 20, 20);
}