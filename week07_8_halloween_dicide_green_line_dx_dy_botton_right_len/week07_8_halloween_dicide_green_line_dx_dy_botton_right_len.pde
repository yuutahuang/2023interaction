ArrayList<PVector> pt = new ArrayList<PVector>();
void setup()
{
  size(400, 400);
  background(255);
}
float ghostX=400, ghostY=20;
void mouseDragged(){ 
  pt.add(new PVector(mouseX, mouseY));
}
void draw()
{
  background(255);
  strokeWeight(1);
  stroke(0); ellipse(200, 200, 15, 15);
  stroke(0); ellipse(ghostX, ghostY, 15, 15); // 搬上來才不會影響
  // if (mousePressed) line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(4);
  float dpx=0, dpy=0; // 要看p.x p2.x的差距, p.y p2.y 的差距
  float botton_right=0; // 往右下
  for (int i=0; i<pt.size()-1; i++){ // -1下面要加回來
    PVector p = pt.get(i), p2 = pt.get(i+1); // +1對消
    line(p.x, p.y, p2.x, p2.y); // ellipse(p.x, p.y, 3, 3);
    dpx += abs(p2.x - p.x); // 累積x的移動量
    dpy += abs(p2.y - p.y); // 累積y的移動量
    if (p2.x - p.x > 0 && p2.y - p.y > 0) botton_right+=sqrt(dpx*dpx+dpy+dpy);
  }
  
  if (dpx>100 && dpy<40) stroke(255, 41, 98); // horizonal line (red)
  else if (dpx<40 && dpy>100) stroke(41, 171, 255); // vertical line (blue)
  else if (botton_right>150) stroke(44, 255, 41); // botton_right (green)
  else stroke(0); // (black)
  for (int i=0; i<pt.size()-1; i++){ // -1下面要加回來
    PVector p = pt.get(i), p2 = pt.get(i+1); // +1對消
    line(p.x, p.y, p2.x, p2.y); // ellipse(p.x, p.y, 3, 3);
  }
  
  float dx = 200-ghostX, dy = 200-ghostY, len=sqrt(dx*dx+dy*dy);
  ghostX+=dx/len/3;
  ghostY+=dy/len/3;
}
void mouseReleased()
{
  // background(255);
  for (int i=pt.size()-1; i>=0; i--){
    pt.remove(i);
  }
}
