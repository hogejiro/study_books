// キャンパスを設定する
size(200, 200);
background(0);
rectMode(CENTER);

// 白いキャンバスを描く
fill(255);
rect(width/2, height/2, 200, 200);

// 中央の座標へ平行移動させる
translate(width/2, height/2);

// 10 度回転させる
rotate(radians(10));

// 新しい原点 (0, 0) を基準に黒い正方形を描く
fill(0);
rect(0, 0, 40, 40);