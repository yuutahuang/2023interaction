PImage img;
int [][]pos = {{92,491},{246,525},{179,524},{162,490},{152,457},{194,490},{229,490},{264,490},{323,456},{298,491},{333,490},{367,491},{315,525},{281,523},{356,457},{390,457},{85,456},{185,456},{127,490},{220,456},{289,457},{212,525},{117,457},{143,524},{254,457},{109,524}};
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
  fill(0, 255, 0, 128);
  for (int i=0; i<26; i++){
    if (typing.charAt(0)-'a'==i) rect(pos[i][0], pos[i][1], 28, 30, 5);
    if (pressed[i]) rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
  fill(0); // 黑色的字
  textSize(50);
  text(typing, 50, 50);
  text(typing.charAt(0), 50, 100); // 現在要打的字是typing.charAt(0)
}
String typing = "printf";
boolean [] pressed = new boolean[26]; // java預設false
void keyPressed(){
  if (key >= 'a' && key <= 'z') pressed[key-'a'] = true;
}
void keyReleased(){
  if (key >= 'a' && key <= 'z') pressed[key-'a'] = false;
}
void mousePressed(){
  println(mouseX, mouseY); // 定位, 印出mouse座標
}
