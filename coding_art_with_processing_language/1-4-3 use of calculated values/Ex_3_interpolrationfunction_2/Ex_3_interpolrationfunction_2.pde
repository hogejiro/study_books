/*
 * 2 色のボールの間で位置と色を補完。中間ステップも表示
 */
PVector left, right;
void setup() {
    size(400, 200);
    noStroke();
    colorMode(HSB);
    left = new PVector(50, 0, color(0, 255, 255));
    right = new PVector(350, 0, color(0, 255, 255));
}

void draw() {
    background(0);
    // 中間ステップの一人サイズを設定
    float steps = 50;
    float stepSize = 20;
    left.y = getBallYPosotion(frameCount);
    right.y = getBallYPosotion(frameCount - 1000);
    // 左と右のボールを描く
    drawBal(0, 20);
    drawBal(1, 20);
    // 現在の補間点を計算
    float ip = (frameCount % 500) / 500.0;
    if (ip == 0) {
        left.z = color(random(160), 255, 255);
        right.z = color(random(120, 255), 255, 255);
    }
    for (int i = 0; i < steps; i++) {
        right.y = getBallYPosotion(frameCount - stepSize * i);
        drawBal(i/steps, 5);
    }
    // 真ん中のボールを描く
    right.y = getBallYPosotion(frameCount - stepSize * steps * ip);
    drawBal(ip, 20);
}

float getBallYPosotion(float time) {
    return map(sin(time/200.), -1, 1, 20, height-20);
}

void drawBal(float ip, int size) {
    // 左と右の位置の間を補完
    PVector position = PVector.lerp(left, right, ip);
    // 左と右の色の間を補完
    fill(lerpColor((color) left.z, (color) right.z, ip));
    // 真ん中のボールを描く
    ellipse(position.x, position.y, size, size);
}