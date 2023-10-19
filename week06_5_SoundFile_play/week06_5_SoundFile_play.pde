import processing.sound.*;
// https://processing.org/reference/libraries/sound/SoundFile.html
SoundFile file;

void setup() {
  size(640, 360);
  background(255);

  file = new SoundFile(this, "Happiness.mp3");
  file.play();
}      

void draw() {
}
