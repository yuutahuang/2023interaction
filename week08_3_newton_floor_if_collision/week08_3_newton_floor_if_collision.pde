// 碰撞偵測: Mario v.s. Pikachu
// 牛頓力學 (1)靜者恆靜、動者恆動
//          (2)f=m*a 位置、速度、加速度
void setup()
{
  size(400, 400);
}
float x=50, y=250, vx=2, vy=-10;
void draw()
{
  ellipse(x, y, 10, 10);
  x += vx;
  y += vy;
  vy += 0.98; // 重力加速度
}
