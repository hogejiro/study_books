// キャンパスのサイズを設定し、3D キャンパスにする
size(640, 640, P3D);
background(208, 180, 208);
noStroke();
fill(113, 70, 132);

// 3D 空間で平行光源を使う
directionalLight(255, 220, 255, 1, 0, -1);

// カメラを移動する
translate(width/2, height/2, -30);

// 半径 180 px の球体を描く
sphere(180);