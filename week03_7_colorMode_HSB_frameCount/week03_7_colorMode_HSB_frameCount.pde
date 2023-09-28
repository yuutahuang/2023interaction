void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100); 
  // H: 0-360%. S:0-100%, B:0-100%
  
}
void draw()
{
  background(frameCount%360, 48, 93);
}
