PImage img, imgBox;
void setup()
{
  size(600, 600);
  img = loadImage("cookie.png");
  imgBox = loadImage("box.png");
}
void draw()
{
  imageMode(CENTER); // 放在滑鼠中心
  if (mousePressed){
    image(imgBox, mouseX, mouseY);
  }else{
    image(img, 300, 300, 220, 300);
  }
}
