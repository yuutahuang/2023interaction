ArrayList<PVector> pt;
void setup(){
  size(400, 400, P3D);
  pt = new ArrayList<PVector>();
}
void draw(){
  background(#FFFFF2);
  for(PVector p: pt){
    ellipse(p.x, p.y, 10, 10);
  }
}
void mousePressed(){
  pt.add(new PVector(mouseX, mouseY));
}
