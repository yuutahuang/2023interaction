void setup()
{
  size(600, 500);  
  for (int i=0; i<4; i++){
    for (int j=0; j<6; j++){
      value[i][j] = i*6+j+10; // 從10開始, 數字不重複
    }
  }
  for (int k=0; k<2; k++){
    int i = int(random(4)), j = int(random(6));
    int i2 = int(random(4)), j2 = int(random(6));
    int tmp = value[i][j];
    value[i][j] = value[i2][j2];
    value[i2][j2] = tmp;
  }
}
int [][]value = new int[4][6];
void draw()
{
  background(255);
  for (int i=0; i<4; i++){
    for (int j=0; j<6; j++){
      fill(#FFEA9D); rect(j*100, i*100, 100, 100);
      fill(0); text(value[i][j], j*100+25, i*100+50);
    }
  }
}
