/**
 * 10px ごとに刻んだ正方形を noise() に基づいて色と大きさを変えながら描画。陽炎のように揺らめく
 */

void setup() {
    size(400, 400);
    background(0);
    noStroke();
}

void draw() {
    filter(BLUR, 1);
    // 1 つ目 (random)
    for (int i = 0; i < width; i += 10) {
        // 色の最大値 255 にあわせる
        fill(noise(i/10. + frameCount/100.) * 255);
        // 正方形の最大サイズを 15px とする
        float size = noise(0.3 + frameCount/1000.) * 15;
        rect(i, frameCount%height, size, size);
    }
}