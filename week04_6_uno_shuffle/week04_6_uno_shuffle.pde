// UNO抽牌
void setup(){
  size(400, 400);
}

int [][] card = new int[8][11];
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF}; // red, yellow, green, blue
void draw(){
  background(255);
  for (int i=0; i<8; i++){
    for (int j=0; j<11; j++){
      drawCard(j*32, i*50, C[i%4], j);
    }
  }
}
void drawCard(int x, int y, color c, int n){
  stroke(128); // gray stroke
  fill(255); // white
  rect(x, y, 32, 50, 7);
  noStroke();
  fill(c);
  rect(x+2, y+3, 32-5, 50-5, 4);
  
  pushMatrix();
  fill(255); // white
  translate(x+16, y+25); // 移動, 加上卡片中心的一半
  rotate(radians(45)); // 轉動45度
  ellipse(0, 0, 20, 30);
  popMatrix();
  
  
  textAlign(CENTER, CENTER); // 放中心才不會偏
  textSize(10);
  text(""+n, x+7, y+6);
  
  textSize(20);
  fill(c);
  text(""+n, x+16, y+22);
}
