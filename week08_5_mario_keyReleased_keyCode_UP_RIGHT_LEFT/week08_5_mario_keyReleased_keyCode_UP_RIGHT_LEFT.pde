// 碰撞偵測: Mario v.s. Pikachu
// 牛頓力學 (1)靜者恆靜、動者恆動
//          (2)f=m*a 位置、速度、加速度
void setup()
{
  size(400, 400);
}
float MarioX=50, MarioY=250, vx=0, vy=0;
void draw()
{
  background(108, 137, 255); // blue
  MarioX += vx; 
  fill(255, 0, 0); ellipse(MarioX, MarioY, 15, 25);
  fill(229, 119, 42); rect(0, 260, 400, 150);
}
void keyPressed()
{
  if (keyCode == RIGHT) vx=2;
  if (keyCode == LEFT) vx=-2;
}
void keyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT) vx = 0;
}
