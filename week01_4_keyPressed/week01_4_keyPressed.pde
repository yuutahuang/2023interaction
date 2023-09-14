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
void keyPressed() // 按下鍵盤
{
  if (key == '1') stroke(255, 0, 0); // 如果按下數字1, 色筆就改成紅色
  if (key == '2') stroke(0, 255, 0); // 如果按下數字2, 色筆就改成綠色
  if (key == '3') stroke(0, 0, 255); // 如果按下數字3, 色筆就改成藍色
  if (key == 's' || key == 'S') save("output.png"); 
}
