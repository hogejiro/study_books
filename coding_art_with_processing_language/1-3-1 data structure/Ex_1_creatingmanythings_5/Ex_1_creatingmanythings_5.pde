/**
 * 4000 個のパーティクルの動きを描く
 */
 int pnum = 4000;
// 各パーティクルの位置 
PVector[] particle = new PVector[pnum];
// 各パーティクルの向き
PVector[] direction = new PVector[pnum];

void setup() {
    size(600, 600);
    smooth();
    noStroke();

    // 初期化
    for (int i = 0; i < pnum; i++) {
        particle[i] = new PVector(0, 0, random(0.5, 4));
        // ランダムな向きで初期化
        direction[i] = new PVector(random(-1, 1), random(-1, 1));
    }
}

void draw() {
    // 濃い青の背景
    background(35, 27, 107);
    // キャンパスの中心を基準に描く
    translate(width / 2, height / 2);

    // すべてのパーティクルをループ
    for (int i = 0; i < pnum; i++) {        
        // 位置を更新
        PVector p = particle[i].add(direction[i]);
        // 個々の色を設定
        fill(238, 120, 138, p.z * 30);
        // パーティクルの図形を描く
        ellipse(p.x, p.y, p.z, p.z);
    }
}