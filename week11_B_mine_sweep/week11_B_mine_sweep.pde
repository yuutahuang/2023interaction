/** 踩地雷 **/
int [][]mine = new int[9][9];
void setup(){
  size(450, 450);
  for (int i=0; i<9; i++) mine[i][0]=9;
  for (int k=0; k<1000; k++){
    int i = int(random(9)), j = int(random(9));
    int i2 = int(random(9)), j2 = int(random(9));
    int tmp = mine[i][j];
    mine[i][j] = mine[i2][j2];
    mine[i2][j2] = tmp;
  }
  for (int i=0; i<9; i++){
    for (int j=0; j<9; j++){ // 遇到紅色的地雷附近要+1
      if (mine[i][j]==9){
        addNumber(i-1, j-1);
        addNumber(i-1, j);
        addNumber(i-1, j+1);
        addNumber(i, j-1);
        addNumber(i, j); // 自己本身
        addNumber(i, j+1);
        addNumber(i+1, j-1);
        addNumber(i+1, j);
        addNumber(i+1, j+1);
      }
    }
  }
}
void addNumber(int i, int j){
  if (i<0 || j<0 || i>=9 || j>=9) return; // 超過範圍不做事
  if (mine[i][j]!=9) mine[i][j]++; // 不是地雷就可以+1
}
void draw(){
  for (int i=0; i<9; i++){
    for (int j=0; j<9; j++){
      if (mine[i][j]==9) fill(255, 128, 128);
      else fill(255);
      rect(j*50, i*50, 45, 45);
      
      if (mine[i][j]!=0){
        fill(0); text(" "+mine[i][j], j*50+23, i*50+23, 45, 45);
      }
    }
  }
}
