/**
 * パーティクルを定義するデータ構造を使う
 * Ex_1_creatingmanythings_5 と挙動は同じ
 */
 int pnum = 4000;
// 各パーティクルの位置 
Particle[] particle = new Particle[pnum];

void setup() {
    size(600, 600);
    smooth();
    noStroke();

    // 初期化
    for (int i = 0; i < pnum; i++) {
        particle[i] = new Particle();
    }
}

void draw() {
    // 濃い青の背景
    background(35, 27, 107);
    // キャンパスの中心を基準に描く
    translate(width / 2, height / 2);

    // すべてのパーティクルをループ
    for (Particle p : particle) {
        // パーティクルの位置を更新して描く
        p.move();
        p.show();
    }
}

class Particle {
    float x, y, size, directionX, directionY;
    // コンストラクタ
    public Particle() {
        this.size = random(0.5, 4);
        this.directionX = random(-1, 1);
        this.directionY = random(-1, 1);
    }
    public void move() {
        this.x += this.directionX;
        this.y += this.directionY;
    }
    public void show() {
        fill(238, 120, 138, this.size * 30);
        ellipse(this.x, this.y, this.size, this.size);
    }
}