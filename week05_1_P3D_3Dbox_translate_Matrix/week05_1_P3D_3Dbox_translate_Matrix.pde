void setup(){
  size(400, 400, P3D); // Processing的3D功能
}
void draw(){
  background(#FFFFF2); // yellow
  pushMatrix();
   translate(mouseX, mouseY);
    box(100); // 3D box
   popMatrix(); // 還原矩陣
}
