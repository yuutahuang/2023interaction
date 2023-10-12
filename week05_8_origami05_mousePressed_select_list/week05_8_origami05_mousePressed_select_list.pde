ArrayList<PVector> pt;
void setup(){
  size(400, 400, P3D);
  pt = new ArrayList<PVector>();
  for (int i=0; i<20; i++){
    pt.add(new PVector(i*20, 20)); // 假設已經畫好20個圓點
  }
}
void draw(){
  background(255);
  for (PVector p: pt) ellipse(p.x, p.y, 10, 10);
  if (ans!=null) ellipse(ans.x, ans.y, 15, 15); // 若選到其中一點, 則畫出15*15的圓
}
PVector ans = null; // 尚未選擇任一圓
void mousePressed(){
  for (PVector p: pt){
    if (dist(p.x, p.y, mouseX, mouseY)<5) ans=p; // 如果距離小於半徑5, ans代表選定某一個圓 
  }
}
