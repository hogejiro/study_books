/**
 * 矢印キーを使ってビジュアル要素の位置を決める
 */
PVector pos;
void setup() {
    size(400, 400);
    noStroke();
    rectMode(CENTER);
    // スタート位置: キャンパスの中心点
    pos = new PVector(width / 2, height / 2);
}

void draw() {
    background(0);
    fill(200, 200, 255);
    rect(pos.x, pos.y, 40, 40);
}

void keyPressed() {
    if (key == CODED) {
        if (keyCode == UP) {pos.y--;}
        else if (keyCode == DOWN) {pos.y++;}
        else if (keyCode == LEFT) {pos.x--;}
        else if (keyCode == RIGHT) {pos.x++;}
    } else {
        // それ以外なら位置をリセット
        pos.set(width / 2, height / 2);
    }
}