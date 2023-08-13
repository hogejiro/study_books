/**
 * Ex_2_composinglayers_2 を、マウスの位置でレイヤーの可視性を制御可能に
 */
 int pnum = 4000;
// 各パーティクルの位置 
Particle[] particles = new Particle[pnum];

void setup() {
    size(600, 400, P3D);
    smooth();
    noStroke();

    // 初期化
    for (int i = 0; i < pnum; i++) {
        particles[i] = new Particle();
    }
}

void draw() {
    // 濃い青の背景
    background(35, 27, 107);
    noStroke();
    // キャンパスを指定位置に移動
    translate(width/2, height/2, -400);
    rotateY(radians(frameCount));
    // パーティクルクラウドを描く
    for (Particle p : particles) {
        p.move(250);
        // size 属性を拡大縮小したパーティクルのレイヤーがマウスの水平位置より小さければ表示
        if (map(p.size, 0.5, 2, 0, width) < mouseX) {
            p.show();
        }
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
        // 個々の色を設定する
        fill(238, 120, 138, this.size * 100);
        pushMatrix();
        // 平行移動
        translate(0, 0, this.size * 200);
        // パーティクルの図形を描く
        ellipse(this.x, this.y, this.size, this.size);
        // 半透明のパーティクルのハロー (かさ) を描く
        fill(238, 120, 138, this.size * 20);
        ellipse(this.x, this.y, this.size * 20, this.size * 20);
        popMatrix();
    }
}