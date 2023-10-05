// UNO抽牌
void setup(){
  size(850, 850);
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
  if (mousePressed && mouseButton==RIGHT){ // 點右鍵才可以顯示出所有牌
    for (int i=0; i<8; i++){
      for (int j=0; j<11; j++){
        // drawCard(j*32, i*50, C[i%4], j);
        drawCard(j*32, i*50, cardC[i*11+j], cardN[i*11+j], 32); // 32小卡片  
      }
    }
  }else drawCard(50, 50, #000000, 99, 128); // deck
  
  for (int i=0; i<myCard; i++){
     if (i%4==0) drawCard(430 +40*i/4, 50, cardC[i], cardN[i], 128);
     if (i%4==1) drawCard(630 +40*i/4, 350, cardC[i], cardN[i], 128);
     if (i%4==2) drawCard(430 +40*i/4, 650, cardC[i], cardN[i], 128);
     if (i%4==3) drawCard(230 +40*i/4, 350, cardC[i], cardN[i], 128);
  }
}
int  myCard = 0; // 一開始0張牌
void mousePressed(){
  if (mouseButton==LEFT) myCard++;
}
void drawCard(int x, int y, color c, int n, int w){ // w 寬度代表小卡片
  float s = w/32.0; // scale size
  stroke(128); // gray stroke
  fill(255); // white
  rect(x, y, 32*s, 50*s, 7*s);
  noStroke();
  fill(c);
  rect(x+2.5*s, y+2.5*s, 32*s-5*s, 50*s-5*s, 4*s);
  
  pushMatrix();
  fill(255); // white
  translate(x+16*s, y+25*s); // 移動, 加上卡片中心的一半
  rotate(radians(45)); // 轉動45度
  ellipse(0, 0, 20*s, 30*s);
  popMatrix();
  
  
  textAlign(CENTER, CENTER); // 放中心才不會偏
  textSize(10*s);
  text(""+n, x+7*s, y+6*s);
  textSize(20*s);
  fill(c);
  text(""+n, x+16*s, y+22*s);
}
