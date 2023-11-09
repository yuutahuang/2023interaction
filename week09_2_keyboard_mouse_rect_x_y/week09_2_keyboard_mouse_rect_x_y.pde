PImage img;
void setup(){
  size(800, 600); // 圖片大小為800x266
  img = loadImage("keyboard.png");
  rectMode(CENTER); // 滑鼠在正中心
}
void draw(){
  background(#FFFFF2); // 有背景色才不會重疊
  image(img, 0, 600-266); // 鍵盤放在底部
  fill(255, 0, 0, 128); // 改顏色(半透明紅)
  rect(mouseX, mouseY, 28, 30, 5); // 滑鼠座標畫方形, 圓滑邊(原白)
}
void mousePressed(){
  println(mouseX, mouseY); // 定位, 印出mouse座標
}
