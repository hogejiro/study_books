// キャンパスのサイズを設定し、3D キャンパスにする
size(640, 640, P3D);

// 白い背景で図形に輪郭線をつけない
background(255);
noStroke();

// テクスチャ画像を読み込む
PImage img = loadImage("earth.jpg");

// 形状を作り、テクスチャとしてこの画像を指定する
Pshape globe = createShape(SPHERE, 100);
globe.setTexture(img);

// 左から右へ 1 つ目の 3D 球体を描く
translate(width/5, height/5, -50);
shape(globe);
// 左から右へ 2 つ目の 3D 球体を描く
translate(width/5, height/5, 0);
shape(globe);
// 左から右へ 3 つ目の 3D 球体を描く
translate(width/5, height/5, -50);
shape(globe);