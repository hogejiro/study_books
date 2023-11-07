void setup() {
    size(400, 400);
    rectMode(CENTER);
}

void draw() {
    background(160);

    // 1 つ目の線は静的
    ellipse(50, 75 , 50, 50);
    // 2 つ目の円は動的
    ellipse(mouseX, mouseY, 50, 50);
}