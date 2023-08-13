size(1000, 1000);

// 青、赤、黄を定義
color blue = color(9, 37, 87);
color red = color(135, 3, 17);
color yellow = color(211, 179, 15);

// 色を指定し、線を描く
stroke(blue);
line(0, 980, width, 980);
stroke(red);
line(0, 10, width, 10);
stroke(blue);
line(0, 90, width, 90);
stroke(yellow);
line(100, 0, 100, height);
stroke(yellow);
line(0, 650, width, 650);