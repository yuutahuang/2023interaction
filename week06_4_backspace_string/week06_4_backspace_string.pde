void setup()
{
 size(800, 400);
 textSize(64);
}
String line = "";
void draw()
{
  background(0); // black background
  text("Input: "+line, 50, 100);
}
void keyPressed()
{
  if (key>='A' && key<='Z') line += key;
  if (key>='a' && key<='z') line += key;
  if (key==BACKSPACE && line.length()>0) 
    line = line.substring(0, line.length()-1);
}
