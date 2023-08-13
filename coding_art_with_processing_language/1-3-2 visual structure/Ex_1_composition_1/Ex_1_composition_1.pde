/**
 * パーティクルクラウドを描画
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
    // 1 列目
    drawParticleCloud(100, 100);
    drawParticleCloud(300, 100);
    drawParticleCloud(500, 100);
    // 2 列目
    drawParticleCloud(100, 300);
    drawParticleCloud(300, 300);
    drawParticleCloud(500, 300);
}

void drawParticleCloud(int x, int y) {
    pushMatrix();
    // パーティクルクラウドの中心点に平行移動
    translate(x, y);
    for (Particle p : particle) {
        // パーティクルの位置を更新して描く
        p.move(abs(width/2 - mouseX));
        p.show();
    }
    popMatrix();
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