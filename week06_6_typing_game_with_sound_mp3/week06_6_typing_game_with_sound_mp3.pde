import processing.sound.*;
SoundFile correct_voice, typing_voice, Happiness;

void setup() {
  size(640, 360);
  background(255);
  correct_voice = new SoundFile(this, "correct_voice.mp3");
  typing_voice = new SoundFile(this, "typing_voice.mp3");
  Happiness = new SoundFile(this, "Happiness.mp3");
}      

void draw()
{
  text("press 1, 2, 3", 100, 100);
}
void keyPressed()
{
  if (key=='1') correct_voice.play();
  if (key=='2') typing_voice.play();
  if (key=='3') Happiness.play();
}
