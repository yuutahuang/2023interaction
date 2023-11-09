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
    // if (typing.charAt(0)-'a'==i) rect(pos[i][0], pos[i][1], 28, 30, 5);
    if (pressed[i]) rect(pos[i][0], pos[i][1], 28, 30, 5);
  }
  textSize(50);
  fill(0); // 黑色的字
  text(typing, 50, 50); // 要打的字
  
  fill(255, 0, 0); // red 現在要打的字
  text(typed+typing.charAt(ID), 50, 100); // 現在要打的字是typing.charAt(0)
  
  fill(0); // 再用黑色秀出打好的字
  text(typed, 50, 100); //已經打好的字
}
  
String typing = "printfprintfprintf"; 
String typed = ""; // 一開始打了0個字
int ID = 0; // 第幾個字要被打
boolean [] pressed = new boolean[26]; // java預設false
void keyPressed(){
  if (key >= 'a' && key <= 'z') {
    if (key == typing.charAt(ID)){
      pressed[key-'a'] = true;
      typed += key;
      ID ++;
    }else{
      background(255, 0, 0, 128);
    }
  }
}
void keyReleased(){
  if (key >= 'a' && key <= 'z') pressed[key-'a'] = false;
}
void mousePressed(){
  println(mouseX, mouseY); // 定位, 印出mouse座標
}
