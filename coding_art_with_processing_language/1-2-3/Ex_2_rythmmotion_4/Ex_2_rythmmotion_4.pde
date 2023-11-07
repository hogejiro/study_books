void setup() {
    size(400, 400);
    rectMode(CENTER);
}

void draw() {
    background(160);
    translate(0, height/2);
    float frameColor = (frameCount % (20 * PI)) * 4;

    // frameCount と連動したグレースケールの色に変更
    fill(frameColor);

    // 飛び跳ねる正方形 (前と同じ)
    rect(frameCount, -abs(sin(frameCount/20.0)) * 60, 20, 20);

    // frameCount と連動したグレースケールの色に変更 (先ほどの色とは反転させる)
    fill(255 - frameColor);

    // 直線的な動きの正方形にスナップバックの動きをつける
    translate(frameCount-20, 0);
    rotate(radians(60 - frameColor * 4));
    rect(20, 20, 20, 20);
}