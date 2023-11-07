/**
 * 3D でレイヤーを組み合わせる
 */
 int pnum = 4000;
// 各パーティクルの位置 
Particle[] particle = new Particle[pnum];

void setup() {
    size(600, 400, P3D);
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
    noStroke();
    // 1 列目
    drawParticleCloud(100, 100);
    // クラウドを画像としてコピー
    PImage cloud = get(0, 0, 200, 200);
    background(25, 17, 87);
    // キャンパスの中心に移動する
    translate(width/2, height/2, 100 - frameCount/100.);
    // ゆっくりと回転させて全体を見せる
    rotateX(frameCount/300.);
    for (int i = 0; i < 100; i++) {
        // 徐々にサイズを小さくする
        scale(0.95, 0.95, 0.95);
        // x 軸上で回転
        rotateY(radians(sin(frameCount/300.)) * 8);
        // 正方形を描く
        beginShape();
        // cloud をテクスチャとして設定
        texture(cloud);
        // ほとんど見えない線
        stroke(255, 20);
        vertex(-100, -100, i * -100, 0, 0);
        vertex(100, -100, i * -100, 200, 0);
        vertex(100, 100, i * -100, 200, 200);
        vertex(-100, 100, i * -100, 0, 200);
        endShape();
    }
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