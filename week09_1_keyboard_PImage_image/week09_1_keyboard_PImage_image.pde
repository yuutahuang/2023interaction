PImage img;
void setup(){
  size(800, 600); // 圖片大小為800x266
  img = loadImage("keyboard.png");
}
void draw(){
  image(img, 0, 600-266); // 鍵盤放在底部
}
