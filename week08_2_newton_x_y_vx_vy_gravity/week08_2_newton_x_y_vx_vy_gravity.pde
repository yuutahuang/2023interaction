// 碰撞偵測: Mario v.s. Pikachu
// 牛頓力學 (1)靜者恆靜、動者恆動
void setup()
{
  size(400, 400);
}
float x=200, y=200, vx=1, vy=1;
void draw()
{
  ellipse(x, y, 10, 10);
  x += vx;
  y += vy;
}
