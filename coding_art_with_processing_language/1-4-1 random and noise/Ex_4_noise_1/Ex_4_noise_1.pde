/**
 * パーリンノイズを使ってランダムよりのなめらかな遷移を描画
 */

void setup() {
    size(400, 400);
    background(255);
    noStroke();
}

void draw() {
    // 1 つ目 (random)
    fill(255, 0, 255, 100);
    rect(frameCount, random(0, height), 5, 5);
    // 2 つ目 (noise)
    fill(255, 0, 0, 100);
    ellipse(frameCount, map(noise(frameCount/100.), 0, 1, 0, height), 5, 5);
}