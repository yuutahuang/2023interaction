// Interactive Mode (Active Mode) 互動模式
void setup() // 設定
{
  size(500, 500);
  background(219, 205, 201);
}
void draw() // 畫圖, 一秒畫60次
{ // 如果有按下mouse就畫線, 滑鼠座標mouseX, mouseY, 
  // 到上一個滑鼠座標pmouseX, pmouseY
  if (mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
}
