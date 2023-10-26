ArrayList<PVector> pt = new ArrayList<PVector>();
void setup(){
  size(400,400);
  background(255);
}
float ghostX=40, ghostY=20;
void mouseDragged(){
  pt.add(new PVector(mouseX,mouseY));
}
void draw(){
  background(255);
  strokeWeight(1);
  stroke(0);ellipse(200,200,15,15);
  stroke(0);ellipse(ghostX,ghostY,15,15);
  
  strokeWeight(4);
  float dpx=0, dpy=0; //要看p.x p2.x的差距, p.y p2.y的差距
  float rightdown = 0, green_rightup =0; //往右下,往右上
  float rightup = 0, yellow_rightdown =0;
  boolean green_part1 = false,green_ok=false;
  boolean yellow_part1 = false,yellow_ok=false;
  for (int i=0; i<pt.size()-1; i++){ //累積移動量
    PVector p=pt.get(i) , p2 = pt.get(i
+1);
    dpx += abs(p2.x - p.x); //累積x的移動量
    dpy += abs(p2.y - p.y); //累積y的移動量
    if(p2.x - p.x>0 && p2.y-p.y>0) rightdown+=sqrt(dpx*dpx+dpy*dpy);
    if(green_part1 && p2.x - p.x>0 && p2.y-p.y<0) green_rightup+=sqrt(dpx*dpx+dpy*dpy);
    if(p2.x - p.x>0 && p2.y-p.y<0) rightup+=sqrt(dpx*dpx+dpy*dpy);
    if(yellow_part1 && p2.x - p.x>0 && p2.y-p.y>0) yellow_rightdown+=sqrt(dpx*dpx+dpy*dpy);
    
    if(green_part1==false && rightdown>150) green_part1 = true;
    else if(green_part1==true && green_rightup>150) green_ok=true;
    if(yellow_part1==false && rightup>150) yellow_part1 = true;
    else if(yellow_part1==true && yellow_rightdown>150) yellow_ok=true;
  }
  if( dpx>100 &&  dpy<40) stroke(255,0,0); //red horizonal line
  else if( dpx<40 && dpy>100) stroke(0,0,255); // blue vertical line
  else if(green_ok) stroke(0,255,0); // green line
  else if(yellow_ok)stroke(255,255,0);/// yellow line
  else stroke(0);// black
  for (int i=0; i<pt.size()-1; i++){ //畫線
    PVector p=pt.get(i) , p2 = pt.get(i+1);
    line( p.x, p.y, p2.x, p2.y);
  }
  
  float dx = 200-ghostX, dy = 200-ghostY, len=sqrt(dx*dx+dy*dy);
  ghostX += dx/ len/ 3;
  ghostY += dy/ len/ 3;
}
void mouseReleased(){
  for(int i=pt.size()-1;i>=0;i--){
    pt.remove(i);
  }
}
