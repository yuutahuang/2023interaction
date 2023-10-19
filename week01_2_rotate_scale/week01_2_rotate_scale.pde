void setup(){
  size(400, 400, P3D); // Processing的3D功能
}
void draw(){
  background(#FFFFF2); // yellow
  pushMatrix();
   translate(mouseX, mouseY);
    rotateY(radians(mouseX)); // 對Y軸轉動
    fill(0, 255, 0); // 面填成綠色
    box(100); // 3D box
    
    noFill(); // 面不要填色
    scale(2); // 放大2倍
    box(100); // 第二個box
   popMatrix(); // 還原矩陣
}
