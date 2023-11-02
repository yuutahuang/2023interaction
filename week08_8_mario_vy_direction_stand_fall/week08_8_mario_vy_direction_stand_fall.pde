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
  if (flying){ // 如果跳起來
    MarioY += vy; // 上下位置會改變
    vy += 0.98; // 重力加速度往下
    if (MarioY>=250){ // 如果接觸到地面
      MarioY = 250;
      flying = false; // 不再飛行
    }
  }
  fill(255, 0, 0); ellipse(MarioX, MarioY, 15, 25);
  fill(229, 119, 42); rect(0, 260, 400, 150);
  fill(229, 119, 42); rect(200, 150, 20, 20);
  if (hitBlock(200, 150, 20, 20)){
    vy=0;
    MarioY = 150+20;
  }
}
boolean hitBlock(int x, int y, int w, int h){
  if (x<MarioX && MarioX<x+w && y<MarioY && MarioY<y+h) return true;
  else return false;
}
boolean flying = false;
void keyPressed()
{
  if (keyCode == RIGHT) vx=2;
  if (keyCode == LEFT) vx=-2;
  if (keyCode == UP && flying==false) { // 按下UP
    vy = -20; 
    flying = true; // 開始跳
  }
}
void keyReleased()
{
  if (keyCode == LEFT || keyCode == RIGHT) vx = 0;
}
