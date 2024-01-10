/********* VARIABLES *********/
// 0: Initial Screen
// 1: Game Screen
// 2: Game-over Screen 
// 3: GameSuccess()
int gameScreen = 0;

// map SETTING
int[][] map = { // 20x10格
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
  {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1},
  {1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1,  0, 0, 0, 0, 0, 1},
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1},
  {1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1},
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1},
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};
// PAC-MAN SETTING
int pacmanI=2, pacmanJ=3;
// Blinky SETTING
int ghostI=1, ghostJ=22;
// Pinky SETTING
// int pinkGhostI=1, pinkGhostJ=10;

// POINTS SETTING
int tileSize = 33;
ArrayList<PVector> scorePoints = new ArrayList<PVector>(); 
ArrayList<PVector> bigScorePoints = new ArrayList<PVector>();
boolean bigScoreVisible = false; // 控制大顆分數點閃爍的變數
int blinkFrame = 0; // 控制閃爍頻率的計數器

// GAME STATE CHECK
boolean gameCompleted = false; // 遊戲是否通關

// BFS SETTING
ArrayList<Integer> queueI = new ArrayList<Integer>();
ArrayList<Integer> queueJ = new ArrayList<Integer>();
ArrayList<Integer> queueD = new ArrayList<Integer>();
int M, N;
int [][]yuutaDist;
boolean [][] visited;

int collisionCount = 0; // 追蹤碰撞次數
int lives = 3; // 玩家生命數

/********* SETUP BLOCK *********/
void setup(){
  size(793, 450);
  M = map.length;
  N = map[0].length;
  yuutaDist = new int[M][N];
  visited = new boolean[M][N];
  generatesmallscorePoints();
  generateBigScorePoints();
}

/********* DRAW BLOCK *********/
void draw() {
  if (gameScreen == 0) { 
    initScreen();
  } else if (gameScreen == 1) { 
    gameScreen();
  } else if (gameScreen == 2) { 
    gameOverScreen();
  } else if (gameScreen == 3){
    gameSuccess();
  }
}
/********* SCREEN CONTENTS *********/
void initScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(70);
  text("PAC-MAN", width/2, height/2);
  textSize(15); 
  text("Click to start", width/2, height-30);
}
void gameScreen() {
  background(0);
  displayMap(); // 顯示地圖
  displayPlayer(); // 顯示玩家
  displayBlinky(); // 顯示紅鬼魂
  // displayPinky();
  if(frameCount%15==0) ghostMove();
  displayScorePoints(); // 顯示小顆分數點
  displayBigScorePoints();  // 顯示大顆分數點
  manageBigScoreBlinking(); // 大顆分數點閃爍
  checkState();
  displayLives();
}

void gameOverScreen() {
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(100);
  text("TRY AGAIN?", width/2, height/2);
//  textSize(130);
//  text(score, width/2, height/2);
  textSize(25);
  text("Click to Restart", width/2, height-30);
}
void gameSuccess(){
  background(44, 62, 80);
  textAlign(CENTER);
  fill(236, 240, 241);
  textSize(100);
  text("GOOD JOB!", width/2, height/2);
//  textSize(130);
//  text(score, width/2, height/2);
  textSize(25);
  text("Click to Restart", width/2, height-30);
}
/********* INPUTS *********/
void keyPressed() {
  int nextI = pacmanI;
  int nextJ = pacmanJ;
  
  if (keyCode == UP) nextI--;
  else if (keyCode == DOWN) nextI++;
  else if (keyCode == LEFT) nextJ--;
  else if (keyCode == RIGHT) nextJ++;

  // 碰撞偵測，檢查下一個位置是否是可通行的區域
  if (isValidMove(nextI, nextJ)) {
    pacmanI = nextI;
    pacmanJ = nextJ;
  }
}

public void mousePressed() {
  if (gameScreen==0) { 
    startGame();
  }
  if (gameScreen==2) {
    restart();
  }
  if (gameScreen == 3){
    restart();
  }
}
/********* OTHER FUNCTIONS *********/
void startGame() {
  gameScreen=1;
}
void gameOver() {
  gameScreen=2;
}
void restart()
{
  pacmanI=2;
  pacmanJ=3;
  ghostI=1;
  ghostJ=20;
  gameCompleted = false;
  generatesmallscorePoints();
  bigScorePoints.clear();
  generateBigScorePoints();
  // isRainbowMode = false;
  gameScreen=1;
  lives=3; // 玩家生命數
  collisionCount=0;
}

void displayMap(){
  for(int i=0; i<M; i++){
      for(int j=0; j<N; j++){
        if(map[i][j]==1) {
          fill(128,0,128); rect(j*33, i*33, 33, 33);
        }
        //fill(255,0,0);
        //text(yuutaDist[i][j]+" ", 10+j*33, 10+i*33);
      }
  }
}

// 繪製PAC-MAN
void displayPlayer() {
  fill(255, 255, 0);
  ellipse(18 + pacmanJ * 33, 18 + pacmanI * 33, 20, 20);
  
  if (dist(ghostJ * tileSize + tileSize / 2, ghostI * tileSize + tileSize / 2, pacmanJ * tileSize + tileSize / 2, pacmanI * tileSize + tileSize / 2) < 20) {
    collisionCount++;
    
    if (collisionCount >= 3) {
      gameOver();
    } else {
      pacmanI = 2;
      pacmanJ = 3;
      lives--; // 碰撞時減少一個生命
    }
  }
}


// 繪製紅鬼魂
void displayBlinky(){
  fill(255, 0, 0);
  ellipse(18+ghostJ*33, 18+ghostI*33, 20, 20);
}
/* Pinky
void displayPinky(){
  fill(255, 192, 203);
  ellipse(18+pinkGhostI*33, 18+pinkGhostJ*33, 20, 20);
}
*/
boolean isValidMove(int i, int j) {
  if (i < 0 || j < 0 || i >= M || j >= N) return false;
  return map[i][j] == 0; // 判斷下一個位置是否是可通行的區域
}

void ghostMove(){
  buildBFS(pacmanI, pacmanJ, 1);
  if(ghostMoveIJ(ghostI+1,ghostJ, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI-1,ghostJ, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI,ghostJ+1, yuutaDist[ghostI][ghostJ])) return;
  if(ghostMoveIJ(ghostI,ghostJ-1, yuutaDist[ghostI][ghostJ])) return;
}

boolean ghostMoveIJ(int i, int j, int oldValue){
  if(i<0 || j<0 || i>=M || j>=N) return false;
  if(yuutaDist[i][j]==0) return false;
  if(yuutaDist[i][j] ==oldValue-1){
    ghostI = i;
    ghostJ = j;
    return true;
  }
  return false;
}

void clearAll(){
  for(int i=0; i<M; i++){
    for(int j=0; j<N; j++){
      visited[i][j] = false;
      yuutaDist[i][j] = 0;
    }
  }
}

void buildBFS(int I, int J, int D){
  clearAll();
  queueI.add(I);
  queueJ.add(J);
  queueD.add(D);
  yuutaDist[I][J] = D;
  visited[I][J] = true;
  while( queueI.size()>0 ){
    int i = queueI.remove(queueI.size()-1);
    int j = queueJ.remove(queueJ.size()-1);
    int d = queueD.remove(queueD.size()-1);
    yuutaDist[i][j] = d;
    testAndPush(i+1, j, d+1);
    testAndPush(i-1, j, d+1);
    testAndPush(i, j+1, d+1);
    testAndPush(i, j-1, d+1);
  }
}

void testAndPush(int i, int j, int d){
  if(i<0 || j<0 || i>=M || j>=N) return;
  if(visited[i][j]) return;
  visited[i][j] = true;
  if(map[i][j]==1) return;
  queueI.add(i);
  queueJ.add(j);
  queueD.add(d);
}

// 顯示小顆分數點
void displayScorePoints() {
  fill(255); // 白色
  for (int i = scorePoints.size() - 1; i >= 0; i--) {
    PVector point = scorePoints.get(i);
    ellipse(point.x, point.y, 8, 8);
    
    // 檢查Pacman是否碰到分數點
    if (dist(pacmanJ * tileSize + tileSize / 2, pacmanI * tileSize + tileSize / 2, point.x, point.y) < 10) {
      scorePoints.remove(i); // 碰到分數點後移除分數點
      // 增加其他操作
    }
  }
}


// 生成小顆分數點
void generatesmallscorePoints()
{
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[i].length; j++) {
      if (map[i][j] == 0) { // 如果是可通行的地板（0），則放置分數點
      //  if (random(1) < 1) { // 隨機決定是否放置分數點，用 0.1 作為放置機率（可以調整）
          scorePoints.add(new PVector(j * tileSize + tileSize / 2, i * tileSize + tileSize / 2)); // 將分數點的位置添加到 ArrayList 中
      //  }
      }
    }
  }
}

// 生成大顆分數點
void generateBigScorePoints() {
  int bigScoreCount = 0;
  while (bigScoreCount < 5) {
    int randomX = int(random(map[0].length));
    int randomY = int(random(map.length));
    if (map[randomY][randomX] == 0) {
      bigScorePoints.add(new PVector(randomX * tileSize + tileSize / 2, randomY * tileSize + tileSize / 2));
      bigScoreCount++;
    }
  }
}
// 顯示大顆分數點
void displayBigScorePoints() {
  fill(255);
  for (int i = bigScorePoints.size() - 1; i >= 0; i--) {
    PVector point = bigScorePoints.get(i);
    if (bigScoreVisible) {
      ellipse(point.x, point.y, 16, 16); // 大顆分數點閃爍
    }

    // 檢查Pacman是否碰到大顆分數點
    if (dist(pacmanJ * tileSize + tileSize / 2, pacmanI * tileSize + tileSize / 2, point.x, point.y) < 20) {
      bigScorePoints.remove(i); // 碰到大顆分數點後移除分數點
    }
  }
}

// 控制大顆分數點的閃爍效果
void manageBigScoreBlinking() {
  if (bigScoreVisible) {
    blinkFrame++;
    if (blinkFrame > 20) { // 控制閃爍頻率
      bigScoreVisible = false;
      blinkFrame = 0;
    }
  } else {
    blinkFrame++;
    if (blinkFrame > 10) { // 控制閃爍頻率
      bigScoreVisible = true;
      blinkFrame = 0;
    }
  }
}
void checkState(){
  if (scorePoints.size() == 0 && bigScorePoints.size() == 0 && !gameCompleted) {
    println("恭喜通關！"); // 在控制台印出通關訊息
    gameCompleted = true;
    gameScreen = 3;
  }
}
void displayLives() {
  fill(0); // 黑色背景
  rect(0, height - 50, width, 50); // 生命數顯示區域
  
  fill(255, 255, 0); // 黃色生命圓形
  for (int i = 0; i < lives; i++) {
    ellipse((i * 40) + 40, height - 25, 30, 30); // 每個生命圓形的位置
  }
}
