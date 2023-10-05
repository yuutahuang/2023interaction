// UNO抽牌
void setup(){
  size(400, 400);
  myShuffle();
}
void myShuffle(){
  for (int i=0; i<8; i++){
    for (int j=0; j<11; j++){
      cardN[i*11+j] = j;
      cardC[i*11+j] = C[i%4];
    }
  }
  // random()會取浮點數, 需要加上int
  for (int i=0; i<10000; i++){ // 洗牌 10000 次
    int r1 = int(random(88)), r2 = int(random(88)); 
    int tmp = cardN[r1];
    cardN[r1] = cardN[r2];
    cardN[r2] = tmp;
    tmp = cardC[r1];
    cardC[r1] = cardC[r2];
    cardC[r2] = tmp;
  }
}
// int [][] card = new int[8][11];
int [] cardN = new int[88]; // card number
int [] cardC = new int[88]; // card color
color [] C = {#FF5555, #FFAA00, #55AA55, #5555FF};
void draw(){
  background(255);
  for (int i=0; i<8; i++){
    for (int j=0; j<11; j++){
      // drawCard(j*32, i*50, C[i%4], j);
      drawCard(j*32, i*50, cardC[i*11+j], cardN[i*11+j]);  
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
