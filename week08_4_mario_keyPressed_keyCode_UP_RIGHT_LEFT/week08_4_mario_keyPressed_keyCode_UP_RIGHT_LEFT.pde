// 碰撞偵測: Mario v.s. Pikachu
// 牛頓力學 (1)靜者恆靜、動者恆動
//          (2)f=m*a 位置、速度、加速度
void setup()
{
  size(400, 400);
}
float x=50, y=250, vx=2, vy=-20;
void draw()
{
  x += vx;
  y += vy;
  vy += 0.98; // 重力加速度
  if (y>350){ // 利用if判斷, 看有沒有碰到地板y=350的位置
    y=350;
    vy = -vy * 0.5; // 會耗損、速度變慢
    vx = vx * 0.8;
  }
  ellipse(x, y, 10, 10);
}
