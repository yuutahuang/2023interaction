/** 貪吃蛇 **/
void setup(){
  size(600, 400);
}
float x = 300, y = 200, dir = 0;
void draw(){
 // background(0);
  joker(x, y, dir);
  x += cos(dir);
  y += sin(dir);
}
void joker(float x, float y, float dir){
  ellipse(x, y, 50, 50);
  line(x, y, x+25*cos(dir), y+25*sin(dir)); 
}

void keyPressed(){
  if (keyCode == RIGHT) dir += 0.1;
  if (keyCode == LEFT) dir -= 0.1;
}
