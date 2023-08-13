void setup() {
    size(400, 400);
}

void draw() {
    // 背景を消す (= キャンパスをキレイにする)
    background(160);
    // X 座標を frameCount に指定し、正方形を描く
    rect(frameCount, 30, 10, 10);
}