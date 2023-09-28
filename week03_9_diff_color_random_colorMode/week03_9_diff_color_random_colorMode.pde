void setup()
{
  size(300, 300); // 視窗大小
  colorMode(HSB, 360, 100, 100); // 色彩範圍
  chooseColor();
}
void mousePressed()
{
  chooseColor(); // 當按下滑鼠就選一個顏色
}
int I, J;
float h, s, b, dh, ds, db;
void chooseColor() // 隨機選取一個顏色
{
  h = random(360);
  s = random(50, 100);
  b = random(50, 100); // 50以上的亮度比較亮
  dh = random(-10, +10);
  ds = random(-10, +10);
  db = random(-10, +10);
}
void draw()
{
  background(226, 69, 73); 
  for (int i=0; i<5; i++){
    for (int j=0; j<5; j++){
      fill(h, s, b); // 填色
      fill(h+dh, s+ds, b+db);
      if (i==I && j==J) fill(h+dh, s+ds, b+db);
      else fill (h, s, b);
      ellipse(30+j*60, 30+i*60, 60, 60);  // +30修正偏差位置
    }
  }
}
