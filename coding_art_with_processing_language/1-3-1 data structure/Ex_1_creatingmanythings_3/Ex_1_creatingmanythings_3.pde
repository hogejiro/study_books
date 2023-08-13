void setup() {
    size(400, 400);
    background(35, 27, 107);
    noStroke();
}

void draw() {
    fill(238, 120, 138, 250);
    float x = random(0, width);
    float y = random(0, height);
    // (x,y) とキャンパスの中心との間の距離をチェックし、150 より小さい場合だけ円を描画
    if (dist(x, y, width/2, height/2) < 150) {
        ellipse(x, y, 15, 15);
    }
    filter(BLUR, 1);
}