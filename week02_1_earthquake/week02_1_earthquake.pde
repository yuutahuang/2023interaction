float[] HLE = {-1.042, -3.4979, 1.0037, -1.6694, -1.6396, -14.219, -3.6551, -4.917, 9.3632, -4.2718, -0.02445};
float[] HLN = {-17.09, -13.711, -22.888, -19.631, -23.818, -18.573, -19.636, -15,648, -18.256, -15.721, -17.776};
int N = 11; // 有11個數字
void setup()
{
  size(500, 500);
  frameRate(10);
}
void draw()
{
  background(#FFFFF2);
  float dx = HLE[frameCount%N];
  float dy = HLN[frameCount%N]/10;
  rect(200+dx, 200+dy, 100, 100); 
}
