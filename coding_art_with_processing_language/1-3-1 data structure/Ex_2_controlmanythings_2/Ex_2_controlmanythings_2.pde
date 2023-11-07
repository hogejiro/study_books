/**
 * 大量のパーティクルをマウスで制御
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
        p.move(abs(width/2 - mouseX));
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
    public void move(int radius) {
        // 中心位置からパーティクルまでの距離を計算
        if (dist(this.x, this.y, 0, 0) > radius) {
            // 位置と新しいランダムな目標位置を作る
            PVector position = new PVector(this.x, this.y);
            PVector target = new PVector(random(-radius, radius), random(-radius, radius));
            // 現在位置と目標位置間のベクトルを計算する
            PVector direction = PVector.sub(target, position);
            // direction を小さなステップに刻む
            direction.div(600);
            directionX = direction.x;
            directionY = direction.y;
        }
        this.x += this.directionX;
        this.y += this.directionY;
    }
    public void show() {
        fill(238, 120, 138, this.size * 30);
        ellipse(this.x, this.y, this.size, this.size);
    }
}