/*
 * 2 色のボールの間で位置と色を補完
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
    left.y = map(sin(frameCount/100.), -1, 1, 20, height-20);
    right.y = map(cos(frameCount/200.), -1, 1, 20, height-20);
    // 2 つのボールを描く
    fill((color)left.z);
    ellipse(left.x, left.y, 20, 20);
    fill((color)right.z);
    ellipse(right.x, right.y, 20, 20);
    // 現在の補間点を計算
    float ip = (frameCount % 500) / 500.0;
    if (ip == 0) {
        left.z = color(random(160), 255, 255);
        right.z = color(random(120, 255), 255, 255);
    }
    // 左と右の位置の間を補完
    PVector currentPosition = PVector.lerp(left, right, ip);
    // 左と右の色の間を補完
    fill(lerpColor((color) left.z, (color) right.z, ip));
    // 真ん中のボールを描く
    ellipse(currentPosition.x, currentPosition.y, 20, 20);
}